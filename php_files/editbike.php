<?php 
include("connection.php");

$bikeID=$_POST["bikeID"];
$name=$_POST["name"];


$sql="UPDATE bikes SET bikeID='{$bikeID}',name='{$name}' WHERE bikeID='{$bikeID}'";

$run=mysqli_query($conn,$sql);

?>