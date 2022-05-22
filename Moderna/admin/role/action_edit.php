<?php

include '../../DB/conn.php';

$role = $_POST['role'];

$sql = "UPDATE role SET role_name='$role'";

$query = mysqli_query($conn, $sql);

if($query){
    header("Location: index.php");
    exit;
}