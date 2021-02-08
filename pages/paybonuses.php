
<?php
ob_start();
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



$constants = new ConstantsModel();
  $myconstantsbv = $constants->getConstant('bonusvalue')->fetch_assoc()['value'];

?>
<!DOCTYPE html>
<html>

<head>
<style>
table {
	margin-top: 15pt;
	width:95%;
	color:#FFFFFF;
	overflow: visible;
	empty-cells: hide;
	border:1px solid #000000;
	font-family: dejavusanscondensed;
	font-size: 10pt;
	background-gradient: linear #c7cddr#f8f32b 0 1 0 0.5;
}
td, th {
	border:1px solid #000000;
	text-align: left;
	color :#1E1E1E;
	font-weight: normal;
}
td.markedcell {
	text-decoration: line-through;
	color: #CC0000;
}
td.underlinedcell {
	text-decoration: underline;
	color: #CC0000;
}
td.rotatedcell {
	text-decoration: line-through;
	color: #CC0000;
	text-rotate: 45;
}
td.cost { text-align: right; }
caption.tablecaption {
	font-family: sans-serif;
	font-weight: bold;
	border: none;
	caption-side: top;
	margin-bottom: 0;
	text-align: center;
}
u.doubleu {
	text-decoration: none;
	border-bottom: 3px double #000088;
}
a.reddashed {
	text-decoration: none;
	border: 1px dashed #880000;
}
table.zebra tbody tr:nth-child(2n+1) td { background-color: rgba(141,243,45,0.6); }
table.zebra tbody tr:nth-child(2n+1) th { background-color: rgba(252,255,59,0.6); }
table.zebra tbody tr:nth-child(2n-1) td { background-color: rgba(141,243,45,0.6); }
table.zebra tbody tr:nth-child(2n-1) th { background-color: rgba(252,255,59,0.6); }
table.zebra thead tr { background-color:#338438; }
table.zebra tfoot tr { font-size:32pt; color: brown; background-color: #BDECB6;}
	.body{
		height: 100%;
	}
	.header{
		height:auto;
		width:100%;
	}
	.logo{
		float:left;
		width:25%;
		height:188;
	}
	.heading{
		float:left;
		width:75%;
		height:188;
		
	}
	h1,p  {
		text-align: center;
	
	}
	.customer {
		border:solid thin dotted black;
		width:40%;
		height:auto;
		float:left;
	
	}
	.customer p {
		text-align: left;
		
	}
	

caption.tablecaption {	font-family: sans-serif;
	font-weight: bold;
	border: none;
	caption-side: top;
	margin-bottom: 0;
	text-align: center;
}
caption.tablecaption {	font-family: sans-serif;
	font-weight: bold;
	border: none;
	caption-side: top;
	margin-bottom: 0;
	text-align: center;
}
td.cost {text-align: right; }
td.cost {text-align: right; }
</style> </head>
<body>
    
            <div class="container-fluid">
            <div style="float:left">
            <img src="assets/img/dogs/logo.jpg" width="150" height="150" alt=""/>
            </div>
            <div style="float:right">
                <h1 class="text-dark mb-4">Pay Bonuses</h1>
                </div>
                <div class="card shadow">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Pay Bonuses <?php if(isset($_REQUEST['limit'])){echo "above ".$_REQUEST['limit']. " Bonus Value";}?></h4>
                            <h6 class="text-muted card-subtitle mb-2">Generated on  <?php echo date('h:i:s D,M d Y'); ?> </h6>
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
                            <table class="zebra" align ="center">
                                <thead>
                                    <tr>
                                    <th>S/N</th>
            <th>Name</th>
            <th>ID</th>
            <th>Bonus Value</th>
            <th>Naira Value</th>
            <th>Account Number</th>
            <th>Status</th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                <?php
                                $i = 0;
                                        while ($row = mysqli_fetch_array($result)) { 
                                            $paid = FALSE;
                                            $i +=1;
                                            $userModel = new UsersModel();
                                                $bonusmaker = new BonusesModel();
                                                $user = $userModel->getUserbyrealID($row['id']);
                                                $userdetail = $user->fetch_assoc();
                                                $transactionid  = 10;
                                            if(isset($_REQUEST['pay'])){
                                                
                                                if($bonusmaker->addBonus($userdetail['name'],$userdetail['id'],-$userdetail['bonusvalue'], $transactionid,date('M,Y'),'Bonus Paid')==TRUE){
                                                    $userModel->updateUserItembyID ('bonusvalue','si',$userdetail['bonusvalue']-$userdetail['bonusvalue'],$row['id']);
                                                   
                                                    $paid = TRUE;
                                                }else{
                                                    $paid = FALSE;
                                                }
                                            }
                                            
        echo "<tr><td>".$i."</td>";
        echo "<td><a class='nav-item' href = 'profile?id=".$row['id']."'>".$row['name']."</a></td>"; 
        echo "<td>".$row['id']."</td>";
        echo "<td>".$row['bonusvalue']."</td>"; 
        echo "<td> &#x20A6;".$row['bonusvalue']*$myconstantsbv."</td>";  
        echo "<td>".$userdetail['bankaccount']."</td>"; 

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
            </body>
            </html>
<?php
 
$html=ob_get_clean();
$mpdf = new \Mpdf\Mpdf();
$mpdf->WriteHTML($html);

if(!isset($_REQUEST['pay'])){
    $mpdf->Output();
     }else{
        $mpdf->Output('Bonuses '.date('M, Y').'.pdf', 'D'); 
     }
?>