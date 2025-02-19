<?php
session_start();

function db_connect() {
    $conn = mysqli_connect('localhost', 'root', '', 'mal');
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }
    return $conn;
}

function sign_up() {
    $conn = db_connect();
    $username = mysqli_real_escape_string($conn, $_POST['username']);
    $pass = mysqli_real_escape_string($conn, $_POST['pass']);
    $email = mysqli_real_escape_string($conn, $_POST['email']);

    $check_query = "SELECT * FROM users WHERE username = '$username' LIMIT 1";
    $result = mysqli_query($conn, $check_query);
    if (mysqli_num_rows($result) > 0) {
        echo "Username already exists.";
    } else {
        if (!empty($username) && !empty($pass) && !empty($email)) {
            $hashed_pass = password_hash($pass, PASSWORD_DEFAULT);
            $insert_query = "INSERT INTO users (username, email, password_hash, created_at) VALUES ('$username', '$email', '$hashed_pass', NOW())";
            if (mysqli_query($conn, $insert_query)) {
                echo "User created successfully.";
            } else {
                echo "Error saving user: " . mysqli_error($conn);
            }
        } else {
            echo "Please fill in all fields.";
        }
    }
    mysqli_close($conn);
}

function login() {
    $conn = db_connect();
    $username = mysqli_real_escape_string($conn, $_POST['username']);
    $pass = mysqli_real_escape_string($conn, $_POST['pass']);

    if (!empty($username) && !empty($pass)) {
        $query = "SELECT id, password_hash FROM users WHERE username = '$username' LIMIT 1";
        $result = mysqli_query($conn, $query);
        if (mysqli_num_rows($result) == 1) {
            $row = mysqli_fetch_assoc($result);
            if (password_verify($pass, $row['password_hash'])) {
                $_SESSION['user_id'] = $row['id'];
                echo "Login successful.";
            } else {
                echo "Invalid password.";
            }
        } else {
            echo "Username not found.";
        }
    } else {
        echo "Please enter both username and password.";
    }
    mysqli_close($conn);
}

function update_anime() {
    if (!isset($_SESSION['user_id'])) {
        die("You must be logged in.");
    }
    
    $conn = db_connect();
    $user_id = $_SESSION['user_id'];
    $anime_id = mysqli_real_escape_string($conn, $_POST['anime_id']);
    $status = mysqli_real_escape_string($conn, $_POST['status']);
    $episodes_watched = isset($_POST['episodes_watched']) ? (int) $_POST['episodes_watched'] : 0;
    $score = isset($_POST['score']) && $_POST['score'] !== "" ? (int) $_POST['score'] : "NULL";

    if ($status === "Completed") {
        $get_total_query = "SELECT episodes FROM anime WHERE id = '$anime_id'";
        $total_result = mysqli_query($conn, $get_total_query);
        if ($total_result) {
            $row = mysqli_fetch_assoc($total_result);
            $episodes_watched = (int) $row['episodes'];
        }
    }
    
    $check_query = "SELECT anime_id FROM user_anime_progress WHERE user_id = '$user_id' AND anime_id = '$anime_id'";
    $check_result = mysqli_query($conn, $check_query);
    if (mysqli_num_rows($check_result) === 0) {
        die("Error: Anime not found in your list.");
    }
    
    $query = "UPDATE user_anime_progress SET status = '$status', episodes_watched = '$episodes_watched', score = $score WHERE user_id = '$user_id' AND anime_id = '$anime_id'";
    if (mysqli_query($conn, $query)) {
        header("Location: anime_list.php");
        exit;
    } else {
        echo "Error updating record: " . mysqli_error($conn);
    }
    mysqli_close($conn);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['submit_signup'])) {
        sign_up();
    } elseif (isset($_POST['submit_login'])) {
        login();
    } elseif (isset($_POST['anime_id'])) {
        update_anime();
    }
}
?>