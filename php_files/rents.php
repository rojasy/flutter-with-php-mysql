<?php 

include("connection.php");
$sql="SELECT rent.*,customers.*,bikes.name FROM ((rent 
    INNER JOIN customers ON rent.customerID=customers.customerID)
    INNER JOIN bikes ON rent.bikeID=bikes.bikeID)";
$run=mysqli_query($conn,$sql);

$result=array();

while ($data=$run->fetch_assoc()){
	$result[]=$data;
}


echo json_encode($result);

?>


