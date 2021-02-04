<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
include_once('./scripts/config.scr.php');

class PensionsModel {

    function addPension($name,$userid,$pensionvalue,$month,$description,$type){
        global $conn;
        
        $sql_putTransactions = "INSERT INTO `pensions`(`name`, `userid`,`pensionvalue`, `month`, `description`, `type`) VALUES (?,?,?,?,?,?)";

        $statement_putTransactions = $conn->prepare($sql_putTransactions);
        echo $conn->error;
        $statement_putTransactions->bind_param("siisss",$name,$userid,$pensionvalue,$month,$description,$type);
        echo $conn->error;
        if($statement_putTransactions->execute()==TRUE){
            echo $conn->error;
            return TRUE;
        }else{
            return FALSE;
            echo $conn->error;
        }
        $statement_putTransactions->free_result();
        $statement_putTransactions->close();
        
       
        $conn->close();
    }
    function getPensionbyID ($id){
        global $conn;
        $sql_putTransactions = "SELECT * FROM `pensions` WHERE `userid` = ? ";
        $statement_putTransactions = $conn->prepare($sql_putTransactions);
        $statement_putTransactions->bind_param("i",$id);
        echo $conn->error;
        $statement_putTransactions->execute();
        $allTransactions = $statement_putTransactions->get_result();
    
        return $allTransactions;
        
        $statement_putTransactions->close();
        $conn->close();
    }
    function getAllPensions (){
        global $conn;
        $sql_getTransactions = "SELECT * FROM `pensions`";
        $statement_getTransactions = $conn->prepare($sql_getTransactions);
        $statement_getTransactions->execute();
        $allTransactions = $statement_getTransactions->get_result();
    
        return $allTransactions;
        
        $statement_getTransactions->close();
        $conn->close();
    }
    function getSomePensionsbyID ($id,$page_first_result,$results_per_page){
        global $conn;
        $sql_getTransactions = "SELECT * FROM pensions WHERE `userid` = ? ORDER BY id DESC LIMIT  ?, ?";
        $statement_getTransactions = $conn->prepare($sql_getTransactions);
        $statement_getTransactions->bind_param("iii",$id,$page_first_result,$results_per_page);
        $statement_getTransactions->execute();
        $allTransactions = $statement_getTransactions->get_result();
    
        return $allTransactions;
        
        $statement_getTransactions->close();
        $conn->close();
    }
    function getSomePensions ($page_first_result,$results_per_page){
        global $conn;
        $sql_getTransactions = "SELECT * FROM pensions ORDER BY id DESC LIMIT  ?, ?";
        $statement_getTransactions = $conn->prepare($sql_getTransactions);
        $statement_getTransactions->bind_param("ii",$page_first_result,$results_per_page);
        $statement_getTransactions->execute();
        $allTransactions = $statement_getTransactions->get_result();
    
        return $allTransactions;
        
        $statement_getTransactions->close();
        $conn->close();
    }
    
    

    function deletePensionbyID ($id){
        global $conn;
        $sql_putTransactions = "DELETE FROM `pensions` WHERE `id` = '?'";
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
