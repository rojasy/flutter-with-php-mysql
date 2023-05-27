<?php 

include("connection.php");

$bikeID=$_POST["bikeID"];
$sql="DELETE FROM bikes WHERE bikeID='{$bikeID}'";
$run=mysqli_query($conn,$sql);


?>