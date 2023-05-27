<?php 
include("connection.php");

$rentID=$_POST["rentID"];
$firstname=$_POST["firstname"];
$lastname=$_POST["lastname"];
$gender=$_POST["gender"];
$phone=$_POST["phone"];
$address=$_POST["address"];
$bike=$_POST["bike"];
$time=$_POST["time"];
$price=$_POST["price"];
$timeout=$_POST["timeout"];
$timein=$_POST["timein"];
$status=$_POST["status"];

// $sql="UPDATE rent SET time='{$time}',price='{$price}',time_out='{$timeout}', time_in='{$timein}',status='{$status}' WHERE rentID='{$rentID}'";
$sql="UPDATE rent INNER JOIN customers ON rent.customerID = customers.customerID INNER JOIN bikes ON rent.bikeID = bikes.bikeID SET customers.firstname='{$firstname}',customers.lastname='{$lastname}',customers.gender='{$gender}',customers.phone='{$phone}',customers.address='{$address}',bikes.name='{$bike}',rent.time='{$time}',rent.price='{$price}',rent.time_out='{$timeout}',rent.time_in='{$timein}',rent.status='{$status}' WHERE rentID='{$rentID}'";
// $sql2="UPDATE customers SET firstname='{$firstname}', lastname='{$lastname}'";
// $sql=$sql1."".$sql2
$run=mysqli_query($conn,$sql);

?>