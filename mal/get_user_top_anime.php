<?php
session_start();

if (isset($_SESSION['user_id'])) {
    $conn = mysqli_connect('localhost', 'root', '', 'mal');
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }

    $user_id = $_SESSION['user_id'];

    $topAnimeQuery = "
        SELECT a.id, a.image_url, a.title, uap.score 
        FROM user_anime_progress uap
        JOIN anime a ON uap.anime_id = a.id
        WHERE user_id = '$user_id'
        ORDER BY uap.score DESC
        LIMIT 3
    ";
    $topAnimeResult = mysqli_query($conn, $topAnimeQuery);
    $topAnime = [];
    while ($row = mysqli_fetch_assoc($topAnimeResult)) {
        $topAnime[] = $row;
    }

    $recentAnimeQuery = "
        SELECT a.id, a.image_url, a.title, uap.score 
        FROM user_anime_progress uap
        JOIN anime a ON uap.anime_id = a.id
        WHERE user_id = '$user_id'
        ORDER BY uap.updated_at DESC
        LIMIT 3
    ";
    $recentAnimeResult = mysqli_query($conn, $recentAnimeQuery);
    $recentAnime = [];
    while ($row = mysqli_fetch_assoc($recentAnimeResult)) {
        $recentAnime[] = $row;
    }

    echo json_encode([
        "topAnime" => $topAnime,
        "recentAnime" => $recentAnime
    ]);

    mysqli_close($conn);
} else {
    echo json_encode(["error" => "not_logged_in"]);
}
?>
