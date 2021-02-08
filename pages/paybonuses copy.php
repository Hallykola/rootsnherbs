<?php
//ob_start();
//session_start();
include_once('./models/BonusesModel.php');
include_once('./models/UsersModel.php');
include_once('./models/ConstantsModel.php');

require 'vendor/autoload.php';


if(!isset($_SESSION["user"])){
    header('location: login');
}elseif($_SESSION['level']<3){
    header('location: nopermission');
}


if(isset($_REQUEST['limit'])){

$entitledusers = new UsersModel();
$result = $entitledusers->getAllBonusesAbove($_REQUEST['limit']);
$newresult = array();
$newresult = $result;
}


include_once('header.php');

$constants = new ConstantsModel();
  $myconstantsbv = $constants->getConstant('bonusvalue')->fetch_assoc()['value'];

?>

            <div class="container-fluid">
                <h3 class="text-dark mb-4">Pay Bonuses</h3>
                <div class="card shadow">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Pay Bonuses <?php if(isset($_REQUEST['limit'])){echo "above ".$_REQUEST['limit']. " Bonus Value";}?></h4>
                            <h6 class="text-muted card-subtitle mb-2">Pay users and display list</h6>
                        </div>
                        <div class="card-header py-3">
                            <p class="text-primary m-0 font-weight-bold">Bonuses Payment List</p>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6 text-nowrap">
                            </div>
                            <div class="col-md-6">
                            </div>
                        </div>
                        <div class="table-responsive table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info">
                            <table class="table my-0" id="dataTable">
                                <thead>
                                    <tr>
                                        <th>id</th>
                                        <th>Name</th>
                                        <th>Bonus Value</th>
                                        <th>Naira Value</th>
                                       
                                        <th>Status</th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                <?php
        //                                 while ($row = mysqli_fetch_array($result)) { 
        //                                     $paid = FALSE;
        //                                     if(isset($_REQUEST['pay'])){
        //                                         $userModel = new UsersModel();
        //                                         $bonusmaker = new BonusesModel();
        //                                         $user = $userModel->getUserbyrealID($row['id']);
        //                                         $userdetail = $user->fetch_assoc();
        //                                         $transactionid  = 10;
        //                                         if($bonusmaker->addBonus($userdetail['name'],$userdetail['id'],-$userdetail['bonusvalue'], $transactionid,date('M,Y'),'Bonus Paid')==TRUE){
        //                                             $userModel->updateUserItembyID ('bonusvalue','si',$userdetail['bonusvalue']-$userdetail['bonusvalue'],$row['id']);
                                                   
        //                                             $paid = TRUE;
        //                                         }else{
        //                                             $paid = FALSE;
        //                                         }
        //                                     }
        // echo "<tr><td>".$row['id']."</td>";
        // echo "<td><a class='nav-item' href = 'profile?id=".$row['id']."'>".$row['name']."</a></td>"; 
        // echo "<td>".$row['bonusvalue']."</td>"; 
        // echo "<td> &#x20A6;".$row['bonusvalue']*$myconstantsbv."</td>";  
        
        // if ($paid){
        //     echo "<td>PAID</td></tr>"; 
        // }else{
        //     echo "<td>NOT PAID</td></tr>"; 

        // } 

          
        
        //    }  
            ?>
                                </tbody>
                                <tfoot>
                                   
                                </tfoot>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-md-6 align-self-center">
                               <!-- <p id="dataTable_info" class="dataTables_info" role="status" aria-live="polite">Showing 1 to 10 of 27</p> -->
                            </div>
                            <div class="col-md-6">
                           
                            </div>
                        </div>
                    </div>
                </div>
            </div>
<?php
include_once('footer.php');
 
//$html=ob_get_clean();
$mpdf = new \Mpdf\Mpdf();
// $mpdf->WriteHTML($html);


// $mpdf->Output();
//$mpdf->debug = true;
$test = '<div class="container-fluid">
<h3 class="text-dark mb-4">Pay Bonuses</h3>
<div class="card shadow">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Pay Bonuses';
            if(isset($_REQUEST['limit'])){
            $test .= 'above'.$_REQUEST['limit']. ' Bonus Value';
        }
        $test .= '</h4>
            <h6 class="text-muted card-subtitle mb-2">Pay users and display list</h6>
        </div>
        <div class="card-header py-3">
            <p class="text-primary m-0 font-weight-bold">Bonuses Payment List</p>
        </div>
    </div>
    <div class="card-body">
        <div class="row">
            <div class="col-md-6 text-nowrap">
            </div>
            <div class="col-md-6">
            </div>
        </div>
        <div class="table-responsive table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info">';
$test .= '<table style="border:1px solid black;background-color:#00FF00 ">
    <thead>
        <tr>
            <th>S/N</th>
            <th>Name</th>
            <th>ID</th>
            <th>Bonus Value</th>
            <th>Naira Value</th>
           
            <th>Status</th>
            
        </tr>
    </thead>
    <tbody>';
    for ($i = 0; $i < mysqli_num_rows($newresult) ; $i++) { 
        $row = $result->fetch_assoc();
        $paid = FALSE;
        if(isset($_REQUEST['pay'])){
            $userModel = new UsersModel();
            $bonusmaker = new BonusesModel();
            $user = $userModel->getUserbyrealID($row['id']);
            $userdetail = $user->fetch_assoc();
            $transactionid  = 10;
            if($bonusmaker->addBonus($userdetail['name'],$userdetail['id'],-$userdetail['bonusvalue'], $transactionid,date('M,Y'),'Bonus Paid')==TRUE){
                $userModel->updateUserItembyID ('bonusvalue','si',$userdetail['bonusvalue']-$userdetail['bonusvalue'],$row['id']);
               
                $paid = TRUE;
            }else{
                $paid = FALSE;
            }
        }
        $a =$i+1;
    $test.= "<tr><td>".$a."</td>";
    $test.= "<td><a class='nav-item' href = 'profile?id=".$row['id']."'>".$row['name']."</a></td>"; 
    $test.= "<td>".$row['id']."</td>";
    $test.= "<td>".$row['bonusvalue']."</td>"; 
    $test.= "<td> &#x20A6;".$row['bonusvalue']*$myconstantsbv."</td>";  
    
    if ($paid){
        $test.= "<td>PAID</td></tr>"; 
    }else{
        $test.= "<td>NOT PAID</td></tr>"; 
    
    } 
    
    
    
    }  
$test .= '</tbody>
<tfoot>
   
</tfoot>
</table>';

$mpdf->WriteHTML($test);
$mpdf->Output();

?>