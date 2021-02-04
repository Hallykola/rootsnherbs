<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
include_once('./scripts/config.scr.php');

class ConstantsModel {

    function addConstant($name,$value,$description){
        global $conn;
        
        $sql_putTransactions = "INSERT INTO `constants`(`name`, `value`, `description`) VALUES (?,?,?)";

        $statement_putTransactions = $conn->prepare($sql_putTransactions);
        echo $conn->error;
        $statement_putTransactions->bind_param("sss",$name,$value,$description);
        if($statement_putTransactions->execute()==TRUE){
           
            return TRUE;
        }else{
            return FALSE;
        }
        $statement_putTransactions->free_result();
        $statement_putTransactions->close();
        
       
        $conn->close();
    }
    
    function getSomeConstants ($page_first_result,$results_per_page){
        global $conn;
        $sql_getTransactions = "SELECT * FROM constants ORDER BY id DESC LIMIT  ?, ?";
        $statement_getTransactions = $conn->prepare($sql_getTransactions);
        $statement_getTransactions->bind_param("ii",$page_first_result,$results_per_page);
        $statement_getTransactions->execute();
        $allTransactions = $statement_getTransactions->get_result();
    
        return $allTransactions;
        
        $statement_getTransactions->close();
        $conn->close();
    }
    function updateConstant ($title,$type,$data){
        global $conn;
        $sql_putTransactions =
        "UPDATE `constants` SET `value` =? WHERE `name` = ?";
        $statement_putTransactions = $conn->prepare($sql_putTransactions);
        echo $conn->error;
        $statement_putTransactions->bind_param($type,$data,$title);
        $statement_putTransactions->execute();
        echo $conn->error;
        if($statement_putTransactions->execute()==TRUE){
           
            return TRUE;
        }else{
            return FALSE;
        }
        
        $statement_putTransactions->close();
        $conn->close();
    }
   
    function getAllConstants (){
        global $conn;
        $sql_getTransactions = "SELECT * FROM `constants`";
        $statement_getTransactions = $conn->prepare($sql_getTransactions);
        $statement_getTransactions->execute();
        $allTransactions = $statement_getTransactions->get_result();
    
        return $allTransactions;
        
        $statement_getTransactions->close();
        $conn->close();
    }

    function getConstant ($title){
        global $conn;
        $sql_getTransactions = "SELECT `value` FROM `constants` WHERE `name` = ?";
        $statement_getTransactions = $conn->prepare($sql_getTransactions);
        $statement_getTransactions->bind_param('s',$title);
        $statement_getTransactions->execute();
        $allTransactions = $statement_getTransactions->get_result();
    
        return $allTransactions;
        
        $statement_getTransactions->close();
        $conn->close();
    }


    function deleteConstantbyID ($id){
        global $conn;
        $sql_putTransactions = "DELETE FROM `constants` WHERE `id` = '?'";
        $statement_putTransactions = $conn->prepare($sql_putTransactions);
        $statement_putTransactions->bind_param("i",$id);
        $statement_putTransactions->execute();
        if($statement_putTransactions->execute()==TRUE){
           echo "TRUE";
       }else{
           echo "FALSE";
       }
        $statement_putTransactions->close();
        $conn->close();
    }
}
