<?php 

include("connection.php");

$ownerID=$_POST["ownerID"];
$firstname=$_POST["firstname"];
$lastname=$_POST["lastname"];
$gender=$_POST["gender"];
$phone=$_POST["phone"];
$address=$_POST["address"];
$nationality=$_POST["nationality"];
$password=$_POST["password"];

$sql="INSERT INTO owners (ownerID, firstname, lastname, gender, phone, address, nationality, password) VALUES('$ownerID','$firstname','$lastname','$gender','$phone','$address','$nationality','$password')";
$run=mysqli_query($conn,$sql);

?>