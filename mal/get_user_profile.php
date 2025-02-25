<?php
session_start();

if (isset($_SESSION['user_id'])) {
    $conn = mysqli_connect('localhost', 'root', '', 'mal');
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }

    $user_id = $_SESSION['user_id'];

    $query = "SELECT user_desc, user_avatar FROM users WHERE id = '$user_id' LIMIT 1";
    $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) == 1) {
        $row = mysqli_fetch_assoc($result);
        
        echo json_encode([
            'user_desc' => $row['user_desc'] ?? "User doesn't have a description yet.",
            'user_avatar' => $row['user_avatar'] ?? "../img/placeholder.png"
        ]);
    } else {
        echo json_encode(["error" => "User not found"]);
    }

    mysqli_close($conn);
} else {
    echo json_encode(["error" => "not_logged_in"]);
}
?>
