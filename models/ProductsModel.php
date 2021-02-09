<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
include_once('./scripts/config.scr.php');

class ProductsModel {

    function addProduct($productname,$bronzevalue,$description){
        global $conn;
        
        $sql_putTransactions = "INSERT INTO `products`(`productname`, `bronzevalue`, `description`) VALUES (?,?,?)";

        $statement_putTransactions = $conn->prepare($sql_putTransactions);
        echo $conn->error;
        $statement_putTransactions->bind_param("sss",$productname,$bronzevalue,$description);
        if($statement_putTransactions->execute()==TRUE){
           
            return TRUE;
        }else{
            return FALSE;
        }
        $statement_putTransactions->free_result();
        $statement_putTransactions->close();
        
       
        $conn->close();
    }
   
    function getSomeProducts ($page_first_result,$results_per_page){
        global $conn;
        $sql_getTransactions = "SELECT * FROM products ORDER BY id DESC LIMIT  ?, ?";
        $statement_getTransactions = $conn->prepare($sql_getTransactions);
        $statement_getTransactions->bind_param("ii",$page_first_result,$results_per_page);
        $statement_getTransactions->execute();
        $allTransactions = $statement_getTransactions->get_result();
    
        return $allTransactions;
        
        $statement_getTransactions->close();
        $conn->close();
    }
    function getAllProducts (){
        global $conn;
        $sql_getTransactions = "SELECT * FROM `products`";
        $statement_getTransactions = $conn->prepare($sql_getTransactions);
        $statement_getTransactions->execute();
        $allTransactions = $statement_getTransactions->get_result();
    
        return $allTransactions;
        
        $statement_getTransactions->close();
        $conn->close();
    }

    
    function deleteProductbyID ($id){
        global $conn;
        $sql_putTransactions = "DELETE FROM `products` WHERE `id` = ?";
        $statement_putTransactions = $conn->prepare($sql_putTransactions);
        $statement_putTransactions->bind_param("i",$id);
        $statement_putTransactions->execute();
        if($statement_putTransactions->execute()==TRUE){
           return "TRUE";
       }else{
           return "FALSE";
       }
        $statement_putTransactions->close();
        $conn->close();
    }
}
