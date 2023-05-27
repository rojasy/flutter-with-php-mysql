<?php 

include("connection.php");

$ownerID=$_POST["ownerID"];
$sql="DELETE FROM owners WHERE ownerID='{$ownerID}'";
$run=mysqli_query($conn,$sql);


?>