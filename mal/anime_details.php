<?php
require 'index.php'; 

if (!isset($_GET['id'])) {
    die("Anime ID is missing.");
}

$conn = mysqli_connect('localhost', 'root', '', 'mal');
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

$anime_id = mysqli_real_escape_string($conn, $_GET['id']);
$user_id = isset($_SESSION['user_id']) ? $_SESSION['user_id'] : null;

// Fetch anime details
$query = "SELECT 
            a.id, a.title, a.image_url, a.episodes, a.status, a.synopsis, 
            a.studio AS studio, 
            GROUP_CONCAT(g.name SEPARATOR ', ') AS genres,
            COALESCE(AVG(up.score), 0) AS avg_score,
            COUNT(DISTINCT up.user_id) AS members
          FROM anime a
          LEFT JOIN anime_genres ag ON a.id = ag.anime_id
          LEFT JOIN genres g ON ag.genre_id = g.id
          LEFT JOIN user_anime_progress up ON a.id = up.anime_id
          WHERE a.id = '$anime_id'
          GROUP BY a.id";

$result = mysqli_query($conn, $query);
if (!$result || mysqli_num_rows($result) == 0) {
    die("Anime not found.");
}

$anime = mysqli_fetch_assoc($result);

// Check if anime is on the user's list
$on_user_list = false;
$user_score = null;
$user_progress = null;

if ($user_id) {
    $user_query = "SELECT score, episodes_watched, status FROM user_anime_progress WHERE user_id = '$user_id' AND anime_id = '$anime_id'";
    $user_result = mysqli_query($conn, $user_query);
    if ($user_result && mysqli_num_rows($user_result) > 0) {
        $user_data = mysqli_fetch_assoc($user_result);
        $on_user_list = true;
        $user_score = $user_data['score'];
        $user_progress = $user_data['episodes_watched'];
        $user_status = $user_data['status']; // Fetch user's current status
    }
}

// Handle form submission to update the anime list
if (isset($_GET['update_anime'])) {
    $status = mysqli_real_escape_string($conn, $_GET['status']);
    $episodes_watched = (int) $_GET['episodes_watched'];
    
    // Check if score is empty, if it is, set to NULL or 0 (make sure this matches your DB constraints)
    $score = isset($_GET['score']) && $_GET['score'] !== '' ? (int) $_GET['score'] : NULL; // Or use 0 if you prefer

    // Fetch the total episodes for the anime
    $total_episodes = (int) $anime['episodes'];

    // Check if the user is trying to watch more episodes than the total
    if ($episodes_watched > $total_episodes) {
        $error_message = "You cannot watch more episodes than the total episodes available ($total_episodes).";
    } else {
        // Update or insert anime progress
        if ($on_user_list) {
            $update_query = "UPDATE user_anime_progress 
                             SET status = '$status', episodes_watched = $episodes_watched, score = " . ($score !== NULL ? $score : "NULL") . " 
                             WHERE user_id = '$user_id' AND anime_id = '$anime_id'";

            if (mysqli_query($conn, $update_query)) {
                header("Location: anime_details.php?id=$anime_id"); // Redirect to refresh the page with updated data
                exit();
            } else {
                echo "Error updating record: " . mysqli_error($conn);
            }
        } else {
            // Add the anime to the list for the first time
            $insert_query = "INSERT INTO user_anime_progress (user_id, anime_id, status, episodes_watched, score) 
                             VALUES ('$user_id', '$anime_id', '$status', $episodes_watched, " . ($score !== NULL ? $score : "NULL") . ")";
            
            if (mysqli_query($conn, $insert_query)) {
                header("Location: anime_details.php?id=$anime_id"); // Redirect to refresh the page with updated data
                exit();
            } else {
                echo "Error adding record: " . mysqli_error($conn);
            }
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo htmlspecialchars($anime['title']); ?> - Anime Details</title>
    <link rel="stylesheet" href="styles.css">
    <style>
         body {
            font-family: Arial, sans-serif;
            background-color: #222;
            color: #ddd;
            margin: 20px;
        }
        .container {
            background: #333;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            max-width: 900px;
            margin: auto;
        }
        h2 {
            text-align: center;
            color: #ffcc00;
        }
        .details {
            display: flex;
            gap: 20px;
            align-items: center;
        }
        .details img {
            width: 220px;
            height: auto;
            border-radius: 10px;
        }
        .details div {
            flex: 1;
        }
        .stats {
            background: #444;
            color: #ffcc00;
            padding: 10px;
            border-radius: 5px;
            text-align: center;
            margin-bottom: 10px;
            font-weight: bold;
        }
        .button {
            display: inline-block;
            background: #ffcc00;
            color: #222;
            padding: 10px 15px;
            text-decoration: none;
            border-radius: 5px;
            text-align: center;
            font-weight: bold;
            margin-top: 10px;
        }
        .button:hover {
            background: #e6b800;
        }
        .synopsis {
            margin-top: 20px;
            background: #444;
            padding: 15px;
            border-radius: 5px;
        }
        .user-info {
            background: #555;
            padding: 10px;
            border-radius: 5px;
            margin-top: 10px;
            color: #ffcc00;
        }
        /* Modal styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0, 0, 0);
            background-color: rgba(0, 0, 0, 0.4);
        }
        .modal-content {
            background-color: #333;
            margin: 15% auto;
            padding: 20px;
            border-radius: 10px;
            width: 80%;
            max-width: 500px;
        }
        .close-btn {
            color: #ffcc00;
            float: right;
            font-size: 25px;
            font-weight: bold;
        }
        .close-btn:hover,
        .close-btn:focus {
            color: #e6b800;
            text-decoration: none;
            cursor: pointer;
        }
    </style>

</head>
<body>
    <div class="container">
        <h2><?php echo htmlspecialchars($anime['title']); ?></h2>

        <div class="details">
            <img src="<?php echo htmlspecialchars($anime['image_url']); ?>" alt="Anime Image">
            <div>
                <div><b>Episodes:</b> <?php echo htmlspecialchars($anime['episodes'] ?: "Unknown"); ?></div>
                <div><b>Status:</b> <?php echo htmlspecialchars($anime['status']); ?></div>
                <div><b>Studio:</b> <?php echo htmlspecialchars($anime['studio'] ?: "Unknown"); ?></div>
                <div><b>Genres:</b> <?php echo htmlspecialchars($anime['genres'] ?: "Unknown"); ?></div>
                <div class="stats"><b>Avg Score:</b> <?php echo number_format($anime['avg_score'], 2); ?></div>
                <div class="stats"><b>Members:</b> <?php echo htmlspecialchars($anime['members'] ?: "0"); ?></div>

                <?php if ($user_id): ?>
                    <?php if ($on_user_list): ?>
                        <div class="user-info">
                            <div><b>Your Score:</b> <?php echo htmlspecialchars($user_score ?: "N/A"); ?></div>
                            <div><b>Your Progress:</b> <?php echo htmlspecialchars($user_progress) . " / " . htmlspecialchars($anime['episodes'] ?: "Unknown"); ?></div>
                            <button class="button edit-btn" onclick="openModal(
                                '<?php echo addslashes($anime['id']); ?>',
                                '<?php echo addslashes($anime['title']); ?>',
                                '<?php echo addslashes($user_status); ?>', <!-- Use user's status here -->
                                '<?php echo (int) $user_progress; ?>',
                                '<?php echo (int) $user_score; ?>'
                            )">Edit</button>
                        </div>
                    <?php else: ?>
                        <a href="update_anime.php?anime_id=<?php echo $anime_id; ?>" class="button">Add to List</a>
                    <?php endif; ?>
                <?php endif; ?>
            </div>
        </div>

        <div class="synopsis">
            <h3>Synopsis</h3>
            <p><?php echo nl2br(htmlspecialchars($anime['synopsis'] ?: "No synopsis available.")); ?></p>
        </div>
    </div>

    <!-- Modal Structure -->
    <div id="editModal" class="modal">
        <div class="modal-content">
            <span class="close-btn" onclick="closeModal()">&times;</span>
            <h3>Edit Anime</h3>
            <form id="editForm" action="anime_details.php" method="GET">
                <input type="hidden" name="id" id="animeId">

                <label>Anime Title: </label>
                <span id="animeTitle"></span>
                <br><br>

                <label>Status:</label>
                <select name="status" id="status">
                    <option value="Watching">Watching</option>
                    <option value="Completed">Completed</option>
                    <option value="Plan to watch">Plan to Watch</option>
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

    <?php if (isset($error_message)): ?>
        <script>
            alert("<?php echo addslashes($error_message); ?>");
        </script>
    <?php endif; ?>

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
