<?php
session_start();

if (isset($_SESSION['user_id'])) {
    $conn = mysqli_connect('localhost', 'root', '', 'mal');
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }

    $user_id = $_SESSION['user_id'];

    $query = "SELECT status, COUNT(*) as count FROM user_anime_progress WHERE user_id = '$user_id' GROUP BY status";
    $result = mysqli_query($conn, $query);

    $stats = [
        "Watching"      => 0,
        "Completed"     => 0,
        "Dropped"       => 0,
        "On-hold"       => 0,
        "Plan to watch" => 0,
        "Not assigned"  => 0
    ];

    while ($row = mysqli_fetch_assoc($result)) {
        $stats[$row['status']] = (int) $row['count'];
    }

    $score_query = "SELECT AVG(score) AS avg_score FROM user_anime_progress WHERE user_id = '$user_id' AND score IS NOT NULL";
    $score_result = mysqli_query($conn, $score_query);
    $score_row = mysqli_fetch_assoc($score_result);
    
    $averageScore = isset($score_row['avg_score']) && $score_row['avg_score'] !== null 
                    ? round($score_row['avg_score'], 2) 
                    : 0;

    $stats['Average Score'] = $averageScore;

    echo json_encode($stats);

    mysqli_close($conn);
} else {
    echo json_encode(["error" => "not_logged_in"]);
}
?>
