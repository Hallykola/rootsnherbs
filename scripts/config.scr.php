<?php
// // dbconfiguration online
// $servername = "";
// $username = "";
// $password = "";
// $dbname ="";

//request uri
    // $uri = $_SERVER["REQUEST_URI"];
    $uri = $_GET['url'];

// dbconfiguration offline
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname ="marketing";
// dbconnection
$conn = new mysqli($servername, $username, $password, $dbname);