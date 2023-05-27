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
// $status=$_POST["status"];

$sql="UPDATE owners SET ownerID='{$ownerID}',firstname='{$firstname}',lastname='{$lastname}',gender='{$gender}', phone='{$phone}',address='{$address}',nationality='{$nationality}',password='{$password}' WHERE ownerID='{$ownerID}'";
$run=mysqli_query($conn,$sql);

?>