<?php
//@w3schools
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "myDB";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

$sql = 'UPDATE myData SET data1='.rand(10,100).' WHERE id = 1';

mysqli_query($conn, $sql);

$sql = 'UPDATE myData SET data1='.rand(10,100).' WHERE id = 2';

mysqli_query($conn, $sql);

mysqli_close($conn);

?>