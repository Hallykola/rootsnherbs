<?php
// // dbconfiguration online
// $servername = "";
// $username = "";
// $password = "";
// $dbname ="";


// dbconfiguration offline
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname ="castle";
// dbconnection
$conn = new mysqli($servername, $username, $password, $dbname);