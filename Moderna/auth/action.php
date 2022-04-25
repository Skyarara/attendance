<?php

$username = $_POST['username'];
$pass = $_POST['password'];

if($username == "worker"){
    header("Location: ../employee/index.html");
}else{
    header("Location: ../manager/index.html");
}