<?php
/**
 * Copyright Pieter Smets (c)  2018
 */

/**
 * Created by PhpStorm.
 * User: smets
 * Date: 7/08/2018
 * Time: 16:56
 */


$servername = "localhost";
$username = "root";
$password = "";
$dbname = "sportslab";

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
    echo 'connection failed';
}
else {echo 'connection succes';};
?>

