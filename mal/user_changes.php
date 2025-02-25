<?php
session_start();

function db_connect() {
    $conn = mysqli_connect('localhost', 'root', '', 'mal');
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }
    return $conn;
}

if (!isset($_SESSION['user_id'])) {
    die("You must be logged in to edit your profile.");
}

$conn = db_connect();

$user_id = $_SESSION['user_id'];
$nickname = mysqli_real_escape_string($conn, $_POST['nickname']);
$description = mysqli_real_escape_string($conn, $_POST['description']);

$update_fields = [];
if (!empty($nickname)) {
    $update_fields[] = "username = '$nickname'";
}
if (!empty($description)) {
    $update_fields[] = "user_desc = '$description'";
}

if (!empty($update_fields)) {
    $update_query = "UPDATE users SET " . implode(', ', $update_fields) . " WHERE id = $user_id";
    if (mysqli_query($conn, $update_query)) {
        echo "Profile updated successfully.<br>";
    } else {
        echo "Error updating profile: " . mysqli_error($conn) . "<br>";
    }
} else {
    echo "No profile changes made.<br>";
}

if (!empty($_FILES['avatar']['name'])) {
    $avatar_name = basename($_FILES['avatar']['name']);
    $target_dir = "../img/";
    $target_file = $target_dir . $avatar_name;

    $allowed_types = ['jpg', 'jpeg', 'png', 'gif'];
    $file_type = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

    if (in_array($file_type, $allowed_types)) {
        if (move_uploaded_file($_FILES['avatar']['tmp_name'], $target_file)) {
            $avatar_query = "UPDATE users SET user_avatar = '$avatar_name' WHERE id = $user_id";
            if (mysqli_query($conn, $avatar_query)) {
                echo "Avatar updated successfully.<br>";
            } else {
                echo "Error updating avatar: " . mysqli_error($conn) . "<br>";
            }
        } else {
            echo "Error uploading file.<br>";
        }
    } else {
        echo "Invalid file type. Allowed: JPG, JPEG, PNG, GIF.<br>";
    }
} else {
    echo "No file uploaded.<br>";
}

mysqli_close($conn);

header("Location: ../html/user.php");
exit;
?>
