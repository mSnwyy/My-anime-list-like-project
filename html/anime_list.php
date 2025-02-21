<?php
require '../mal/index.php';

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
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="../css/standard.css" />
    <link rel="stylesheet" href="../css/anime_list.css" />
</head>

<body>
    <header>
        <header>
            <section class="header-logo">
                <div class="header-logo-image">placeholder</div>
                <div class="header-logo-right">
                    <div class="header-user">
                        <div id="header-user-avatar"></div>
                        <div id="header-user-nickname" onclick="goToUser()"></div>
                    </div>
                    <div class="login-button" id="loginButton" onclick="goToLogin()">Login</div>
                    <div class="signup-button" id="signupButton" onclick="goToSignup()">Sign Up</div>
                    <div id="dark-mode-button">Dark mode</div>
                </div>
            </section>

            <section class="header-main">
                <div class="header-main-left">
                    <div class="header-left-button" onclick="goToHome()">Home</div>
                    <div class="header-left-button" onclick="goToWholeList()">List</div>
                    <div class="header-left-button">News</div>
                </div>
                <div class="header-searchbar">
                    <form>
                        <input type="text" class="searchbar" id="searchbar" name="searchbar" placeholder="Search for anime" />
                        <input type="submit" class="searchbar-button" value="Search" />
                    </form>
                </div>
            </section>
        </header>
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
                            case 'Watching':
                                $statusClass = 'watching';
                                break;
                            case 'Completed':
                                $statusClass = 'completed';
                                break;
                            case 'Plan to watch':
                                $statusClass = 'plan-to-watch';
                                break;
                            case 'On-hold':
                                $statusClass = 'on-hold';
                                break;
                            case 'Dropped':
                                $statusClass = 'dropped';
                                break;
                        }
                        ?>
                        <tr>
                            <td class="status-bar <?= $statusClass ?>"></td>
                            <td><?php echo $counter++; ?></td>
                            <td><a href="../mal/anime_details.php?id=<?php echo $anime['anime_id']; ?>">
                                    <img src="<?php echo htmlspecialchars($anime['anime_image']); ?>" alt="Anime Image">
                                </a></td>
                            <td>
                                <a href="../mal/anime_details.php?id=<?php echo $anime['anime_id']; ?>" class="anime-title">
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
        <script src="../js/standard.js"></script>
</body>

</html>