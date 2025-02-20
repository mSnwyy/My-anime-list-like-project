<?php
require 'index.php'; 
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
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            margin: 0;
            padding: 0;
        }

        .anime-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 20px;
        }

        .anime-block {
            width: 30%;
            min-width: 300px;
            background: white;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 10px;
        }

        .anime-header {
            width: 100%;
            text-align: center;
            padding-bottom: 5px;
            border-bottom: 1px solid #ddd;
        }

        .anime-header h2 {
            margin: 5px 0;
            font-size: 18px;
            font-weight: bold;
        }

        .anime-header h2 a {
            text-decoration: none;
            color: #333;
        }

        .anime-header h2 a:hover {
            color: #0073e6;
        }

        .anime-genres {
            font-size: 14px;
            font-weight: bold;
            margin-bottom: 8px;
        }

        .anime-content {
            display: flex;
            width: 100%;
            padding: 10px;
            align-items: stretch; 
        }

        .anime-image {
            width: 50%;
            height: 220px; 
            object-fit: cover;
        }

        .anime-synopsis {
            width: 50%;
            height: 220px; 
            max-height: 220px; 
            overflow-y: auto; 
            background: #f9f9f9;
            padding: 10px;
            font-size: 14px;
            line-height: 1.4;
            text-align: left;
            border-left: 1px solid #ddd;
        }

        .anime-footer {
            display: flex;
            width: 100%;
            justify-content: space-around;
            padding-top: 10px;
            border-top: 1px solid #ddd;
            background: #f5f5f5;
        }

        .anime-footer-item {
            width: 23%;
            padding: 8px;
            text-align: center;
            font-size: 14px;
            font-weight: bold;
        }

        @media screen and (max-width: 1024px) {
            .anime-block {
                width: 45%;
            }
        }

        @media screen and (max-width: 768px) {
            .anime-block {
                width: 90%;
            }
        }

    </style>
</head>
<body>
    <h1>All Anime</h1>
    <div class="anime-container">
        <?php while ($row = mysqli_fetch_assoc($result)): ?>
            <div class="anime-block">
                <div class="anime-header">
                    <h2><a href="anime_details.php?id=<?= $row['id'] ?>"><?= htmlspecialchars($row['title']) ?></a></h2>
                    <p class="anime-genres"><?= htmlspecialchars($row['genres']) ?></p>
                </div>
                <div class="anime-content">
                    <img src="<?= htmlspecialchars($row['image_url']) ?>" alt="<?= htmlspecialchars($row['title']) ?>" class="anime-image">
                    <div class="anime-synopsis">
                        <p><?= nl2br(htmlspecialchars($row['synopsis'])) ?></p>
                    </div>
                </div>
                <div class="anime-footer">
                    <div class="anime-footer-item"><strong>Score:</strong> <?= number_format($row['avg_score'], 2) ?></div>
                    <div class="anime-footer-item"><strong>Members:</strong> <?= number_format($row['members']) ?></div>
                    <div class="anime-footer-item"><strong>Release:</strong> <?= htmlspecialchars($row['release_date']) ?></div>
                    <div class="anime-footer-item"><strong>Status:</strong> <?= htmlspecialchars($row['status']) ?></div>
                </div>
            </div>
        <?php endwhile; ?>
    </div>
</body>
</html>
