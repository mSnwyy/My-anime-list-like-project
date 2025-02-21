<?php
session_start();

if (isset($_SESSION['user_id'])) {
    $conn = mysqli_connect('localhost', 'root', '', 'mal');
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }

    $user_id = $_SESSION['user_id'];
    $query = "SELECT username, created_at FROM users WHERE id = '$user_id' LIMIT 1";
    $result = mysqli_query($conn, $query);
    if (mysqli_num_rows($result) == 1) {
        $row = mysqli_fetch_assoc($result);
        echo json_encode(array('username' => $row['username'], 'created_at' => $row['created_at']));  
    } else {
        echo "not_logged_in";  
    }
    
    mysqli_close($conn);
} else {
    echo "not_logged_in";  
}
?>
