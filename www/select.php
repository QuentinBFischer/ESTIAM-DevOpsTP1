<?php
//@w3schools
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "mydb";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

$sql = "SELECT id, data1 FROM mydata";
$result = $conn->query($sql);

$i = "";

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {

    	echo "id: " . $row["id"]. " - Data: " . $row["data1"]. "<br>";
    }
} else {
    echo "0 results";
}

$conn->close();


?>