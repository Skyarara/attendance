<?php

include '../../DB/conn.php';

$name = $_POST['name'];
$username = $_POST['username'];
$password = $_POST['password'];
$role = $_POST['role'];

$sql = "INSERT INTO user VALUES('', '$username', '$password', '$name', '$role')";
$query = mysqli_query($conn, $sql);

if($query){
    header("Location: index.php");
    exit;
}