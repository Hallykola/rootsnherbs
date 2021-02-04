<?php
//session_start();
include_once('./models/PensionsModel.php');
include_once('./models/UsersModel.php');
include_once('./models/ConstantsModel.php');


if(!isset($_SESSION["user"])){
    header('location: login');
}elseif($_SESSION['level']<3){
    header('location: nopermission');
}


if(isset($_REQUEST['limit'])){

$entitledusers = new UsersModel();
$result = $entitledusers->getAllPensionsAbove($_REQUEST['limit']);
}


include_once('header.php');

$constants = new ConstantsModel();
  $myconstantspv = $constants->getConstant('pensionvalue')->fetch_assoc()['value'];
?>

            <div class="container-fluid">
                <h3 class="text-dark mb-4">Pay Pensions</h3>
                <div class="card shadow">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Pay Pensions <?php if(isset($_REQUEST['limit'])){echo "above ".$_REQUEST['limit']. " Pension Value";}?></h4>
                            <h6 class="text-muted card-subtitle mb-2">Pay users and display list</h6>
                        </div>
                        <div class="card-header py-3">
                            <p class="text-primary m-0 font-weight-bold">Pensions Payment List</p>
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
                                        <th>Pension Value</th>
                                        <th>Naira Value</th>
                                       
                                        <th>Status</th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                <?php
                                        while ($row = mysqli_fetch_array($result)) { 
                                            $paid = FALSE;
                                            $userModel = new UsersModel();
                                            $user = $userModel->getUserbyrealID($row['id']);
                                            $userdetail = $user->fetch_assoc();
                                            if(isset($_REQUEST['amount'])&& $_REQUEST['amount']!=0){
                                                $amount = $_REQUEST['amount'];
                                            }else{
                                                $amount = $userdetail['pensionvalue'];
                                            }
                                            if(isset($_REQUEST['pay'])){
                                                
                                                $pensionmaker = new PensionsModel();
                                                
                                                $transactionid  = 10;
                                                if($pensionmaker->addPension($userdetail['name'],$userdetail['id'],-$amount, date('M,Y'),date('M,Y'). ", Pension Payment of ". $amount,'Pension Paid '.$_SESSION['user'])==TRUE){
                                                    $userModel->updateUserItembyID ('pensionvalue','si',$userdetail['pensionvalue']-$amount,$row['id']);
                                                   
                                                    $paid = TRUE;
                                                }else{
                                                    $paid = FALSE;
                                                }
                                            }
        echo "<tr><td>".$row['id']."</td>";
        echo "<td><a class='nav-item' href = 'profile?id=".$row['id']."'>".$row['name']."</a></td>"; 
        echo "<td>".$row['pensionvalue']."</td>"; 
        echo "<td> &#x20A6;".$row['pensionvalue']*$myconstantspv."</td>";  
        
        if ($paid){
            echo "<td>PAID</td></tr>"; 
        }else{
            echo "<td>NOT PAID</td></tr>"; 

        } 

          
        
           }  
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
?>