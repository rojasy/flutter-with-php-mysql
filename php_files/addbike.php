<?php 

include("connection.php");

$bikeID=$_POST["bikeID"];
$bikeName=$_POST["bikeName"];

$sql="INSERT INTO bikes (bikeID, name) VALUES('$bikeID','$bikeName')";
$run=mysqli_query($conn,$sql);

?>