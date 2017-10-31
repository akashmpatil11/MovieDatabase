<?php
  ini_set('error_reporting', E_ALL);
  ini_set('display_errors', 1);
  $server = "localhost";
  $USER = "root";
  $pw = "root";
  $dbname = "imdb";
  $conn = mysqli_connect($server, $USER, $pw);
  if(!$conn) {
    die("Connection failed: ".mysqli_connect_error());
  }
  mysqli_select_db($conn, $dbname);
?>
