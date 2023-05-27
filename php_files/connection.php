<?php 

header("Access-Control-Allow-Origin:*");
//header("Access-Control-Allow-Methods: GET,PUT,PATCH,POST,DELETE");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept, X-Auth-Token");
header("Content-Type: application/json");
header("Accept:application/json");


$conn=mysqli_connect("localhost","root","","bikes_db");
	if($conn){
		
	}else{
		echo "Database connection failed";
	}

?>