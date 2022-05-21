<?php

require_once '../DB/conn.php';

$username = $_POST['username'];
$pass = $_POST['password'];


$sql = "SELECT * FROM user JOIN role ON role.id_role = user.id_role 
        WHERE username='$username' AND password='$pass'";
$query = mysqli_query($conn,$sql);

$data = mysqli_fetch_assoc($query);


switch ($data['role_id']) {
    case 1:
        # code...
        break;
    case 2:
        # code...
    break;
    case 3:
        
    break;
    default:
        # code...
    break;
}

if($data){
    header("Location: ../employee/index.html");
}else{
    echo 'gk masuk';
}