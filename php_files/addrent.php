<?php 

include("connection.php");

$ownerID=$_POST["ownerID"];
$firstname=$_POST["firstname"];
$lastname=$_POST["lastname"];
$gender=$_POST["gender"];
$phone=$_POST["phone"];
$address=$_POST["address"];
$nationality=$_POST["nationality"];
$bike=$_POST["bike"];
$time=$_POST["time"];
$price=$_POST["price"];
$timeout=$_POST["time_out"];
$timein=$_POST["time_in"];
$status=$_POST["status"];

$sql1= "INSERT INTO  customers (firstname, lastname, gender, phone, address, nationality) VALUES ('$firstname','$lastname','$gender','$phone','$address','$nationality')";
$run1 = mysqli_query($conn, $sql1);

$customerID=$conn->insert_id;
$sql2= "INSERT INTO  rent (ownerID,customerID,bikeID,time, price, status, time_out, time_in) VALUES ('$ownerID','$customerID','$bikes','$time','$price','$status','$timeout','$timein')";
$run2 = mysqli_query($conn, $sql2);


?>