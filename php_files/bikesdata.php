<?php 

include("connection.php");
$sql="SELECT * FROM bikes";
$run=mysqli_query($conn,$sql);

$result=array();

while ($data=$run->fetch_assoc()){
	$result[]=$data;
}


echo json_encode($result);

?>