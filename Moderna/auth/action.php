<?php

require_once '../DB/conn.php';

$username = $_POST['username'];
$pass = $_POST['password'];


$sql = "SELECT * FROM user JOIN role ON role.id_role = user.id_role 
        WHERE username='$username' AND password='$pass'";
$query = mysqli_query($conn,$sql);

$data = mysqli_fetch_assoc($query);

if($data){
    // var_dump($data['role_name']);
    // exit;
    switch ($data['role_name']) 
    {
        case "admin":
            header("Location: ../admin/index.php");
            break;
        case "owner":
            header("Location: ../owner/index.html");
            break;
        case "employee":
            header("Location: ../employee/index.html");
            break;
        case "manager":
            header("Location: ../manager/index.html");
            break;
        default:
            echo "<script>
                    alert('Login Failed, please try again!');
                    window.location.href = 'sign-in.php';
                </script>";
            break;
    }
}else{
        echo "<script>
            alert('There is no credential found');
            window.location.href = 'sign-in.php';
        </script>";
}