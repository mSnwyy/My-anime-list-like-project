<?php
$conn = mysqli_connect('localhost', 'root', '', 'mal'); 
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

$reviewsQuery = "
    SELECT a.id AS anime_id, a.title, a.image_url, u.username, u.user_avatar, uap.score AS review_score, r.review_text
    FROM reviews r
    JOIN users u ON r.user_id = u.id
    JOIN anime a ON r.anime_id = a.id
    JOIN user_anime_progress uap ON uap.user_id = u.id AND uap.anime_id = a.id
";

    
$reviewsResult = mysqli_query($conn, $reviewsQuery);
$reviews = [];
while ($row = mysqli_fetch_assoc($reviewsResult)) {
    $reviews[] = $row;
}

echo json_encode(["reviews" => $reviews]); 

mysqli_close($conn);
?>
