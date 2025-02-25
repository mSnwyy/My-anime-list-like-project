<?php
require '../mal/index.php';
$conn = mysqli_connect('localhost', 'root', '', 'mal');
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
$query = "SELECT 
    a.id, 
    a.title, 
    a.image_url, 
    a.episodes, 
    a.status, 
    a.synopsis, 
    a.release_date, 
    GROUP_CONCAT(DISTINCT g.name SEPARATOR ', ') AS genres, 
    COALESCE(AVG(up.score), 0) AS avg_score, 
    COUNT(DISTINCT up.user_id) AS members 
FROM anime a 
LEFT JOIN anime_genres ag ON a.id = ag.anime_id 
LEFT JOIN genres g ON ag.genre_id = g.id 
LEFT JOIN user_anime_progress up ON a.id = up.anime_id 
GROUP BY a.id 
ORDER BY a.title ASC;";

$result = mysqli_query($conn, $query);
if (!$result) {
    die("Error fetching anime list: " . mysqli_error($conn));
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/standard.css">
    <title>All Anime</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/10e02d8f72.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../css/standard.css" />
    <link rel="stylesheet" href="../css/all_anime_list.css" />
</head>

<body>
    <header>
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
                    <div class="header-left-button" onclick="goToWholeList()">List</div>
                    <div class="header-left-button" onclick="goToReviews()">Reviews</div>
                </div>
                <div class="header-searchbar">
                    <form>
                        <input type="text" class="searchbar" id="searchbar" name="searchbar" placeholder="Search for an anime" />
                        <input type="submit" class="searchbar-button" value="Search" />
                    </form>
                </div>
            </section>
        </header>
        <h1>All Anime</h1>
        <div class="anime-container">
            <?php while ($row = mysqli_fetch_assoc($result)): ?>
                <div class="anime-block">
                    <div class="anime-header">
                        <h2><a href="../mal/anime_details.php?id=<?= $row['id'] ?>"><?= htmlspecialchars($row['title']) ?></a></h2>
                        <p class="anime-genres"><?= htmlspecialchars($row['genres']) ?></p>
                    </div>
                    <div class="anime-content">
                        <img src="<?= htmlspecialchars($row['image_url']) ?>" alt="<?= htmlspecialchars($row['title']) ?>" class="anime-image">
                        <div class="anime-synopsis">
                            <p><?= nl2br(htmlspecialchars($row['synopsis'])) ?></p>
                        </div>
                    </div>
                    <div class="anime-footer">
                        <div class="anime-footer-item"><strong><i class="fa-solid fa-star"></i></strong> <?= number_format($row['avg_score'], 2) ?></div>
                        <div class="anime-footer-item"><strong><i class="fa-solid fa-users"></i></strong> <?= number_format($row['members']) ?></div>
                        <div class="anime-footer-item"><strong><i class="fa-solid fa-calendar-days"></i></strong> <?= htmlspecialchars($row['release_date']) ?></div>
                        <div class="anime-footer-item"><strong><i class="fa-solid fa-bars-progress"></i></strong> <?= htmlspecialchars($row['status']) ?></div>
                    </div>
                </div>
            <?php endwhile; ?>
        </div>
</body>
<script src="../js/standard.js"></script>

</html>