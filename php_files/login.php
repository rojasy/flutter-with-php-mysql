<?php 

include("connection.php");

$username=$_POST['username'];
$password=$_POST['password'];

$sql="SELECT * FROM owners WHERE ownerID='{$username}' and password='{$password}'";
$run=mysqli_query($conn,$sql);
$row=mysqli_num_rows($run);
	if($row>=1){
		echo json_encode("success");
	}else{
		echo json_encode("error");
	}


?>