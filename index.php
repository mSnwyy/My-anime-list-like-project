<?php
session_start();

function sign_up()
{
    $conn = mysqli_connect('localhost', 'root', '', 'mal');
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }

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

function login()
{
    $conn = mysqli_connect('localhost', 'root', '', 'mal');
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }
    $username = mysqli_real_escape_string($conn, $_POST['username']);
    $pass = mysqli_real_escape_string($conn, $_POST['pass']);

    if (!empty($username) && !empty($pass)) {

        $query = "SELECT id, password_hash FROM users WHERE username = '$username' LIMIT 1";
        $result = mysqli_query($conn, $query);

        if (mysqli_num_rows($result) == 1) {
            $row = mysqli_fetch_assoc($result);
            $hashed_pass = $row['password_hash'];
            if (password_verify($pass, $hashed_pass)) {

                $_SESSION['user_id'] = $row['id']; //storing user_id
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

if (isset($_POST['submit_signup'])) {
    sign_up();
}

if (isset($_POST['submit_login'])) {
    login();
}

function current_user() //user_id selection
{
    if (isset($_SESSION['user_id'])) {
        $conn = mysqli_connect('localhost', 'root', '', 'mal');
        if (!$conn) {
            die("Connection failed: " . mysqli_connect_error());
        }
        $user_id = $_SESSION['user_id'];
        echo $user_id;
    }
}

function write_review()
{
    $conn = mysqli_connect('localhost', 'root', '', 'mal');
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }
}
