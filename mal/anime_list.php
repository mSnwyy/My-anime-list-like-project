<?php
require 'index.php';

if (!isset($_SESSION['user_id'])) {
    die("You must be logged in to view this page.");
}

$conn = mysqli_connect('localhost', 'root', '', 'mal');
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

$user_id = $_SESSION['user_id'];
$filter = isset($_GET['status']) ? mysqli_real_escape_string($conn, $_GET['status']) : 'All';

// Query based on filter
$query = "SELECT 
            uap.anime_id AS anime_id,
            uap.status, 
            uap.episodes_watched, 
            uap.score, 
            a.title AS anime_title, 
            a.image_url AS anime_image, 
            a.episodes AS total_episodes
          FROM user_anime_progress uap
          JOIN anime a ON uap.anime_id = a.id
          WHERE uap.user_id = '$user_id'";

if ($filter !== 'All') {
    $query .= " AND uap.status = '$filter'";
}

$query .= " ORDER BY FIELD(uap.status, 'Watching', 'Completed', 'Plan to Watch', 'On-Hold', 'Dropped')";

$result = mysqli_query($conn, $query);
$anime_list = [];

while ($row = mysqli_fetch_assoc($result)) {
    $anime_list[] = $row;
}

mysqli_close($conn);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Anime List</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; background-color: #f4f4f4; }
        h2 { text-align: center; }
        .tabs { text-align: center; margin-bottom: 20px; }
        .tabs a { padding: 10px 15px; text-decoration: none; background: #007bff; color: white; border-radius: 5px; margin: 0 5px; }
        .tabs a.active { background: #0056b3; }
        table { width: 100%; border-collapse: collapse; background: white; }
        th, td { padding: 10px; border: 1px solid #ddd; text-align: left; }
        th { background-color: #007bff; color: white; }
        img { width: 50px; height: auto; border-radius: 5px; }
        .edit-btn { background-color: orange; color: white; padding: 5px 10px; border: none; cursor: pointer; }

        .status-bar { width: 5px; }
        .watching { background: green; }
        .completed { background: blue; }
        .plan-to-watch { background: gray; }
        .on-hold { background: yellow; }
        .dropped { background: red; }

        .modal { display: none; position: fixed; z-index: 1; left: 0; top: 0; width: 100%; height: 100%; background-color: rgba(0,0,0,0.5); }
        .modal-content { background: white; padding: 20px; margin: 15% auto; width: 50%; border-radius: 10px; }
        .close-btn { float: right; cursor: pointer; font-size: 20px; }
        a.anime-title {
        text-decoration: none;
        color: inherit;  
        font-weight: bold;
        }

        a.anime-title:hover {
        text-decoration: underline; 
        }

    </style>
</head>
<body>

    <h2>Your Anime List</h2>

    <div class="tabs">
        <a href="anime_list.php?status=All">All Anime</a>
        <a href="anime_list.php?status=Watching">Watching</a>
        <a href="anime_list.php?status=Completed">Completed</a>
        <a href="anime_list.php?status=Plan to Watch">Plan to Watch</a>
        <a href="anime_list.php?status=On Hold">On Hold</a>
        <a href="anime_list.php?status=Dropped">Dropped</a>
    </div>

    <?php if (empty($anime_list)): ?>
        <p style="text-align: center;">No anime found in this category.</p>
    <?php else: ?>
        <table>
            <thead>
                <tr>
                    <th></th> 
                    <th>#</th>
                    <th>Image</th>
                    <th>Title</th>
                    <th>Score</th>
                    <th>Progress</th>
                    <th>Edit</th> 
                </tr>
            </thead>
            <tbody>
                <?php $counter = 1; ?>
                <?php foreach ($anime_list as $anime): ?>
                    <?php
                        $statusClass = '';
                        switch ($anime['status']) {
                            case 'Watching': $statusClass = 'watching'; break;
                            case 'Completed': $statusClass = 'completed'; break;
                            case 'Plan to watch': $statusClass = 'plan-to-watch'; break;
                            case 'On-hold': $statusClass = 'on-hold'; break;
                            case 'Dropped': $statusClass = 'dropped'; break;
                        }
                    ?>
                    <tr>
                        <td class="status-bar <?= $statusClass ?>"></td>
                        <td><?php echo $counter++; ?></td>
                        <td><a href="anime_details.php?id=<?php echo $anime['anime_id']; ?>">
                        <img src="<?php echo htmlspecialchars($anime['anime_image']); ?>" alt="Anime Image">
                        </a></td>
                        <td>
                        <a href="anime_details.php?id=<?php echo $anime['anime_id']; ?>" class="anime-title">
                        <?php echo htmlspecialchars($anime['anime_title']); ?>
                        </a>
                        </td>
                        <td><?php echo isset($anime['score']) ? htmlspecialchars($anime['score']) : "-"; ?></td>
                        <td><?php echo (int) $anime['episodes_watched']; ?> / 
                            <?php echo isset($anime['total_episodes']) ? htmlspecialchars($anime['total_episodes']) : "?"; ?></td>
                        <td>
                            <button class="edit-btn" onclick="openModal(
                                '<?php echo addslashes($anime['anime_id']); ?>',
                                '<?php echo addslashes($anime['anime_title']); ?>',
                                '<?php echo addslashes($anime['status']); ?>',
                                '<?php echo (int) $anime['episodes_watched']; ?>',
                                '<?php echo (int) $anime['score']; ?>'
                            )">Edit</button>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    <?php endif; ?>

    <div id="editModal" class="modal">
        <div class="modal-content">
            <span class="close-btn" onclick="closeModal()">&times;</span>
            <h3>Edit Anime</h3>
            <form id="editForm" action="index.php" method="POST">
                <input type="hidden" name="anime_id" id="animeId">

                <label>Anime Title: </label>
                <span id="animeTitle"></span>
                <br><br>

                <label>Status:</label>
                <select name="status" id="status">
                    <option value="Watching">Watching</option>
                    <option value="Completed">Completed</option>
                    <option value="Plan to Watch">Plan to Watch</option>
                    <option value="On-hold">On Hold</option>
                    <option value="Dropped">Dropped</option>
                </select>
                <br><br>

                <label>Episodes Watched:</label>
                <input type="number" name="episodes_watched" id="episodesWatched" min="0">
                <br><br>

                <label>Your Score:</label>
                <select name="score" id="score">
                    <option value="">Select score</option>
                    <?php for ($i = 1; $i <= 10; $i++): ?>
                        <option value="<?php echo $i; ?>"><?php echo $i; ?></option>
                    <?php endfor; ?>
                </select>
                <br><br>

                <button type="submit" name="update_anime">Save Changes</button>
            </form>
        </div>
    </div>

    <script>
        function openModal(animeId, animeTitle, status, episodesWatched, score) {
            document.getElementById("animeId").value = animeId;
            document.getElementById("animeTitle").textContent = animeTitle;
            document.getElementById("status").value = status;
            document.getElementById("episodesWatched").value = episodesWatched;
            document.getElementById("score").value = score;
            document.getElementById("editModal").style.display = "block";
        }

        function closeModal() {
            document.getElementById('editModal').style.display = 'none';
        }
    </script>
</body>
</html>
