<?php
$conn = mysqli_connect('localhost', 'root', '', 'mal');
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

$searchTerm = isset($_GET['query']) ? mysqli_real_escape_string($conn, $_GET['query']) : '';

$anime_list = [];
if (!empty($searchTerm)) {
    $query = "SELECT id, title FROM anime WHERE title LIKE '%$searchTerm%' LIMIT 10";
    $result = mysqli_query($conn, $query);

    while ($row = mysqli_fetch_assoc($result)) {
        $anime_list[] = [
            'id' => $row['id'],
            'title' => $row['title']
        ];
    }
}

echo json_encode($anime_list); 
mysqli_close($conn);
?>
