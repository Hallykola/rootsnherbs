<?php
include_once('./models/UsersModel.php');
require 'vendor/autoload.php';




    function getchildren($a){
        return $a->getChildren();
    }
        

    function show($a){
        echo "<ul>";
        echo '<li>';
        echo "<a href = '/profile?id=".$a->get('id')."'>".$a->get('id')." ".$a->get('name')."</a>";
        

        $b = getChildren($a);
        if ($a->hasChildren()){
            echo "<ul>";
        
    foreach ($b as $item){
            echo '<li>';
            echo "<a href = '/profile?id=".$item->get('id')."'>".$item->get('id')." ".$item->get('name')."</a>";
            
            if ($item->hasChildren()){
                //echo "<ul>";
            foreach (getChildren($item) as $childy){
                //echo "i am here";
               
                show($childy);
                
            } 
           // echo '</ul>';
        }  
        echo '</li>';
    }
    
     echo "</ul>";
}
   
   
    echo '</li>';
    echo "</ul>";
}

function display($id){
    $usermodel = new UsersModel();

    $userid =$id; // $_POST["id"];
    $play1 = new UsersModel();
    $allusers = $play1->getAllUsers();
    $tree = new BlueM\Tree($allusers);
    $node = $tree->getNodeById($userid);
    show($node);
}



?>