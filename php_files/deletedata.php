<?php 

include("connection.php");

$rentID=$_POST["rentID"];
$sql="DELETE FROM rent WHERE rentID='{$rentID}'";
$run=mysqli_query($conn,$sql);


?>