<?php
require 'index.php';

if (!isset($_GET['id'])) {
    die("Anime ID is missing.");
}

$conn = new mysqli('localhost', 'root', '', 'mal');
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$anime_id = $conn->real_escape_string($_GET['id']);
$user_id = $_SESSION['user_id'] ?? null;

$query = "SELECT 
            a.id, a.title, a.image_url, a.episodes, a.status, a.synopsis, 
            a.studio, 
            GROUP_CONCAT(DISTINCT g.name SEPARATOR ', ') AS genres,
            COALESCE(AVG(up.score), 0) AS avg_score,
            COUNT(DISTINCT up.user_id) AS members
          FROM anime a
          LEFT JOIN anime_genres ag ON a.id = ag.anime_id
          LEFT JOIN genres g ON ag.genre_id = g.id
          LEFT JOIN user_anime_progress up ON a.id = up.anime_id
          WHERE a.id = '$anime_id'
          GROUP BY a.id";

$result = $conn->query($query);
if (!$result || $result->num_rows === 0) {
    die("Anime not found.");
}

$anime = $result->fetch_assoc();
$on_user_list = false;
$user_score = $user_progress = $user_status = null;

if ($user_id) {
    $user_query = "SELECT score, episodes_watched, status FROM user_anime_progress WHERE user_id = '$user_id' AND anime_id = '$anime_id'";
    $user_result = $conn->query($user_query);
    if ($user_result && $user_result->num_rows > 0) {
        $user_data = $user_result->fetch_assoc();
        $on_user_list = true;
        $user_score = $user_data['score'];
        $user_progress = $user_data['episodes_watched'];
        $user_status = $user_data['status'];
    }
}

if (isset($_POST['submit_review'])) {
    $review_text = $conn->real_escape_string($_POST['review']);  

    if (!empty($review_text)) {
        $insert_query = "INSERT INTO reviews (user_id, anime_id, review_text) 
                         VALUES ('$user_id', '$anime_id', '$review_text')";  

        if ($conn->query($insert_query)) {
            echo "<script>alert('Review submitted successfully!');</script>";
        } else {
            echo "<script>alert('Error submitting review: " . $conn->error . "');</script>";
        }
    } else {
        echo "<script>alert('Please write a review before submitting.');</script>";
    }
}



if (isset($_GET['update_anime'])) {
    $status = $conn->real_escape_string($_GET['status']);
    $episodes_watched = (int) $_GET['episodes_watched'];
    $score = $_GET['score'] !== '' ? (int) $_GET['score'] : NULL;
    $total_episodes = (int) $anime['episodes'];

    if ($episodes_watched > $total_episodes) {
        $error_message = "You cannot watch more episodes than the total episodes available ($total_episodes).";
    } else {
        if ($on_user_list) {
            $update_query = "UPDATE user_anime_progress SET status = '$status', episodes_watched = $episodes_watched, score = " . ($score !== NULL ? $score : "NULL") . " WHERE user_id = '$user_id' AND anime_id = '$anime_id'";
        } else {
            $update_query = "INSERT INTO user_anime_progress (user_id, anime_id, status, episodes_watched, score) VALUES ('$user_id', '$anime_id', '$status', $episodes_watched, " . ($score !== NULL ? $score : "NULL") . ")";
        }

        if ($conn->query($update_query)) {
            header("Location: anime_details.php?id=$anime_id");
            exit();
        } else {
            echo "Error updating record: " . $conn->error;
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
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="../css/standard.css" />
    <link rel="stylesheet" href="../css/anime_details.css" />


</head>

<body>
    <header>
        <section class="header-logo">
            <div class="header-logo-image">
                <img src="../img/logo.png">
            </div>
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
                <div class="header-left-button" onclick="goToList()">List</div>
                <div class="header-left-button" onclick="goToReviews()">Reviews</div>
            </div>
            <div class="header-searchbar">
                <form>
                    <input type="text" class="searchbar" id="searchbar" name="searchbar" placeholder="Search for anime" />
                    <input type="submit" class="searchbar-button" value="Search" />
                </form>
            </div>
        </section>
    </header>
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
                    <div class="user-info">
                        <div><b>Your Score:</b> <?php echo htmlspecialchars($user_score ?: "N/A"); ?></div>
                        <div><b>Your Progress:</b> <?php echo htmlspecialchars($user_progress) . " / " . htmlspecialchars($anime['episodes'] ?: "Unknown"); ?></div>
                        <button class="button edit-btn" onclick="openModal(
            '<?php echo addslashes($anime['id']); ?>',
            '<?php echo addslashes($anime['title']); ?>',
            '<?php echo addslashes($user_status); ?>',
            '<?php echo (int) $user_progress; ?>',
            '<?php echo (int) $user_score; ?>'
        )">Edit</button>
                    </div>
                <?php endif; ?>

            </div>
        </div>

        <div class="synopsis">
            <h3>Synopsis</h3>
            <p><?php echo nl2br(htmlspecialchars($anime['synopsis'] ?: "No synopsis available.")); ?></p>
        </div>
    </div>

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
    <section id="user-review">
    <h2>Write your review</h2>
    <form action="../mal/anime_details.php?id=<?php echo $anime_id;?>" method="POST">
        <textarea id="review" name="review"></textarea>
        <button type="submit" name="submit_review">Post review</button>
    </form>
</section>

    <footer></footer>
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
    <script src="../js/standard.js"></script>
</body>

</html>