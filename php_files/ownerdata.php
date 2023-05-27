<?php 

include("connection.php");
$username=$_POST['username'];
$sql="SELECT * FROM owners WHERE ownerID='{$username}'";
$run=mysqli_query($conn,$sql);

$result=array();

while ($data=$run->fetch_assoc()){
	$result[]=$data;
}


echo json_encode($result);

?>