<?php
include_once('./models/ProductsModel.php');

if(!isset($_SESSION["user"])){
    header('location: login');
}elseif($_SESSION['level']<4){
    header('location: nopermission');
}

$productmodel = new ProductsModel();
if(!empty($_GET["product"])) {
$result = $productmodel->deleteProductbyID($_GET["product"]);
if($result){
    echo "done";
    header('location: dashboard');
}else{
    echo "Something went wrong";
}
 } 


?>