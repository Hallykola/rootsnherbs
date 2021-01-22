<?php
//session_start();
include_once('./models/TransactionsModel.php');
include_once('./models/UsersModel.php');
include_once('./models/BonusesModel.php');
include_once('./models/RanksModel.php');
include_once('./controllers/RanknBonusController.php');

require 'vendor/autoload.php';


$testy = new RanknBonusController();
$testy->grade(5,30);
$testy->paybonuses(5,400);

if (!isset($_POST['page'])){
    $page = 1;  
} else {  
    $page = $_POST['page'];  
}  

$results_per_page = 10;  
$page_first_result = ($page-1) * $results_per_page;  

$page_first_result = ($page-1) * $results_per_page;
$transactions = new TransactionsModel();
$result = $transactions-> getAllTransactions();
$number_of_result = mysqli_num_rows($result);  
$sometransactions = $transactions->getSomeTransactions($page_first_result,$results_per_page);
//determine the total number of pages available  
$number_of_page = ceil ($number_of_result / $results_per_page);


if(isset( $_POST['submit_bv']) ) {
if(isset($_POST['id'])){
    $id = $_POST['id'];
    }
    if(isset($_POST['bv'])){
    $bv = $_POST['bv'];
    }
    if(isset($_POST['description'])){
    $description = $_POST['description'];
    }
    if(!empty($id)&&!empty($bv)&&!empty($description)){
        $play = new TransactionsModel();
        $play1 = new UsersModel();
        $myuser = $play1-> getUserbyrealID($id)->fetch_assoc();
        $oldbv = $myuser['bronzevalue'] ;
        $newbv = $oldbv + $bv;
        $thisbv = $bv;
        $name = $myuser['name'];
        $issuer = $_SESSION['id'];
        $userid = $myuser['id'];
        $transactionid = $play->recordTransaction ($name,$issuer,$oldbv,$thisbv,$newbv,$description,$userid);
        if($transactionid!=FALSE){
            $play1->updateUserItembyID ($userid,'s','i','i','bronzevalue',$newbv);
            $mssg = " BV added";
            header('location: issuebv');

        }else{
            $mssg = " Something went wrong, could not add BV";
        }
    }
}

?>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>BV -  Roots & Herbs</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
</head>

<body id="page-top">
    <div id="wrapper">
        <nav class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0">
            <div class="container-fluid d-flex flex-column p-0">
                <a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
                    <div class="sidebar-brand-icon rotate-n-15"><i class="fas fa-laugh-wink"></i></div>
                    <div class="sidebar-brand-text mx-3"><span>roots &amp; herbs</span></div>
                </a>
                <hr class="sidebar-divider my-0">
                <ul class="nav navbar-nav text-light" id="accordionSidebar">
                    <li class="nav-item" role="presentation"><a class="nav-link" href="dashboard"><i class="fas fa-tachometer-alt"></i><span>Dashboard</span></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="profile"><i class="fas fa-user"></i><span>Profile</span></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="issuebv"><i class="fas fa-table"></i><span>Issue Bronze Value</span></a><a class="nav-link" href="rank"><i class="fas fa-table"></i><span>Rank</span></a><a class="nav-link" href="bonuses"><i class="fas fa-table"></i><span>Bonuses</span></a></li>
                    <li
                        class="nav-item" role="presentation"><a class="nav-link" href="login"><i class="far fa-user-circle"></i><span>Login</span></a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="register"><i class="fas fa-user-circle"></i><span>Register</span></a></li>
                </ul>
                <div class="text-center d-none d-md-inline"><button class="btn rounded-circle border-0" id="sidebarToggle" type="button"></button></div>
            </div>
        </nav>
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
                <nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
                    <div class="container-fluid"><button class="btn btn-link d-md-none rounded-circle mr-3" id="sidebarToggleTop" type="button"><i class="fas fa-bars"></i></button>
                        <ul class="nav navbar-nav flex-nowrap ml-auto">
                            <li class="nav-item dropdown d-sm-none no-arrow"><a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false" href="#"><i class="fas fa-search"></i></a>
                                <div class="dropdown-menu dropdown-menu-right p-3 animated--grow-in" role="menu" aria-labelledby="searchDropdown">
                                    <form class="form-inline mr-auto navbar-search w-100">
                                        <div class="input-group"><input class="bg-light form-control border-0 small" type="text" placeholder="Search for ...">
                                            <div class="input-group-append"><button class="btn btn-primary py-0" type="button"><i class="fas fa-search"></i></button></div>
                                        </div>
                                    </form>
                                </div>
                            </li>
                            <li class="nav-item dropdown no-arrow mx-1" role="presentation">
                                <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false" href="#"></a>
                                    <div class="dropdown-menu dropdown-menu-right dropdown-list dropdown-menu-right animated--grow-in" role="menu">
                                        <h6 class="dropdown-header">alerts center</h6>
                                        <a class="d-flex align-items-center dropdown-item" href="#">
                                            <div class="mr-3">
                                                <div class="bg-primary icon-circle"><i class="fas fa-file-alt text-white"></i></div>
                                            </div>
                                            <div><span class="small text-gray-500">December 12, 2019</span>
                                                <p>A new monthly report is ready to download!</p>
                                            </div>
                                        </a>
                                        <a class="d-flex align-items-center dropdown-item" href="#">
                                            <div class="mr-3">
                                                <div class="bg-success icon-circle"><i class="fas fa-donate text-white"></i></div>
                                            </div>
                                            <div><span class="small text-gray-500">December 7, 2019</span>
                                                <p>$290.29 has been deposited into your account!</p>
                                            </div>
                                        </a>
                                        <a class="d-flex align-items-center dropdown-item" href="#">
                                            <div class="mr-3">
                                                <div class="bg-warning icon-circle"><i class="fas fa-exclamation-triangle text-white"></i></div>
                                            </div>
                                            <div><span class="small text-gray-500">December 2, 2019</span>
                                                <p>Spending Alert: We've noticed unusually high spending for your account.</p>
                                            </div>
                                        </a><a class="text-center dropdown-item small text-gray-500" href="#">Show All Alerts</a></div>
                                </div>
                            </li>
                            <li class="nav-item dropdown no-arrow mx-1" role="presentation">
                                <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false" href="#"></a>
                                    <div class="dropdown-menu dropdown-menu-right dropdown-list dropdown-menu-right animated--grow-in" role="menu">
                                        <h6 class="dropdown-header">alerts center</h6>
                                        <a class="d-flex align-items-center dropdown-item" href="#">
                                            <div class="dropdown-list-image mr-3"><img class="rounded-circle" src="assets/img/avatars/avatar4.jpeg">
                                                <div class="bg-success status-indicator"></div>
                                            </div>
                                            <div class="font-weight-bold">
                                                <div class="text-truncate"><span>Hi there! I am wondering if you can help me with a problem I've been having.</span></div>
                                                <p class="small text-gray-500 mb-0">Emily Fowler - 58m</p>
                                            </div>
                                        </a>
                                        <a class="d-flex align-items-center dropdown-item" href="#">
                                            <div class="dropdown-list-image mr-3"><img class="rounded-circle" src="assets/img/avatars/avatar2.jpeg">
                                                <div class="status-indicator"></div>
                                            </div>
                                            <div class="font-weight-bold">
                                                <div class="text-truncate"><span>I have the photos that you ordered last month!</span></div>
                                                <p class="small text-gray-500 mb-0">Jae Chun - 1d</p>
                                            </div>
                                        </a>
                                        <a class="d-flex align-items-center dropdown-item" href="#">
                                            <div class="dropdown-list-image mr-3"><img class="rounded-circle" src="assets/img/avatars/avatar3.jpeg">
                                                <div class="bg-warning status-indicator"></div>
                                            </div>
                                            <div class="font-weight-bold">
                                                <div class="text-truncate"><span>Last month's report looks great, I am very happy with the progress so far, keep up the good work!</span></div>
                                                <p class="small text-gray-500 mb-0">Morgan Alvarez - 2d</p>
                                            </div>
                                        </a>
                                        <a class="d-flex align-items-center dropdown-item" href="#">
                                            <div class="dropdown-list-image mr-3"><img class="rounded-circle" src="assets/img/avatars/avatar5.jpeg">
                                                <div class="bg-success status-indicator"></div>
                                            </div>
                                            <div class="font-weight-bold">
                                                <div class="text-truncate"><span>Am I a good boy? The reason I ask is because someone told me that people say this to all dogs, even if they aren't good...</span></div>
                                                <p class="small text-gray-500 mb-0">Chicken the Dog · 2w</p>
                                            </div>
                                        </a><a class="text-center dropdown-item small text-gray-500" href="#">Show All Alerts</a></div>
                                </div>
                                <div class="shadow dropdown-list dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown"></div>
                            </li>
                            <div class="d-none d-sm-block topbar-divider"></div>
                            <li class="nav-item dropdown no-arrow" role="presentation">
                                <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false" href="#"><span class="d-none d-lg-inline mr-2 text-gray-600 small"><?php echo $_SESSION["user"]; ?></span><img class="border rounded-circle img-profile" src="assets/img/avatars/avatar1.jpeg"></a>
                                    <div
                                        class="dropdown-menu shadow dropdown-menu-right animated--grow-in" role="menu"><a class="dropdown-item" role="presentation" href="#"><i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Profile</a><a class="dropdown-item" role="presentation" href="#"><i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Settings</a>
                                        <a
                                            class="dropdown-item" role="presentation" href="#"><i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Activity log</a>
                                            <div class="dropdown-divider"></div><a class="dropdown-item" role="presentation" href="#"><i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Logout</a></div>
                    </div>
                    </li>
                    </ul>
            </div>
            </nav>
            <div class="container-fluid">
                <h3 class="text-dark mb-4">Issue Bronze Value</h3>
                <div class="card shadow">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Give Bronze value</h4>
                            <h6 class="text-muted card-subtitle mb-2">Assign BV to user</h6>
                            <form>
        <div>
        <label >Products: </label>
        <select name = "product" id = "product" class="form-control" >
        <?php
        include_once('./models/ProductsModel.php');
        $products = new ProductsModel();
        $myp = $products->getAllProducts();
        //$productlist = $myp->fetch_assoc();
        while ($row =  $myp->fetch_assoc()) { 
            echo "<option  value ='".$row['bronzevalue']."'>".$row['productname']."</option>";
       } 
        
        
        ?>
        </select>
      </div>
    	<input type="button" class="add-row" value="Add Product">
    </form>
    <table class="table my-0" id="dataTable">
        <thead>
            <tr>
                <th>Select</th>
                <th>Products</th>
                <th>BV</th>
            </tr>
        </thead>
        <tbody>
            
        </tbody>
    </table>
    <button type="button" class="delete-row">Delete Row</button>
  <button type="button" class="show">Use Products to assign value</button>
                            <form method = "POST">
                            <div class="input-group">
                                <div class="input-group-prepend"><span class="input-group-text">User ID</span></div><input class="form-control"  name = "id" type="text">
                                <div class="input-group-append"></div>
                            </div>
                            <div class="input-group">
                                <div class="input-group-prepend"><span class="input-group-text">Bronze Value</span></div><input class="form-control" id = "usebv" name = "bv"  type="text">
                                <div class="input-group-append"></div>
                            </div>
                            <div class="input-group">
                                <div class="input-group-prepend"><span class="input-group-text">Description</span></div><input class="form-control" id = "usedesc"  name = "description" type="text">

                                <div class="input-group-append"><input class="btn btn-primary" type="submit" name = "submit_bv" value = "GO!"></div>
                            </div>
                            
                            </form>
                            <?php if(!empty($mssg)){
                                    echo '<div class="text-center" style="color:green">'.$mssg.'</div>';
                                    } ?>
                        </div>
                        <div class="card-header py-3">
                            <p class="text-primary m-0 font-weight-bold">Bronze Value List</p>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6 text-nowrap">
                                <div id="dataTable_length" class="dataTables_length" aria-controls="dataTable"><label>Show&nbsp;<select class="form-control form-control-sm custom-select custom-select-sm"><option value="10" selected="">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select>&nbsp;</label></div>
                            </div>
                            <div class="col-md-6">
                                <div class="text-md-right dataTables_filter" id="dataTable_filter"><label> <a href="users"><p class="text-primary m-0 font-weight-bold">View all Users</a> </p></label></div>
                            </div>
                        </div>
                        <div class="table-responsive table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info">
                            <table class="table my-0" id="dataTable">
                                <thead>
                                    <tr>
                                        <th>id</th>
                                        <th>Name</th>
                                        <th>Description</th>
                                        <th>Old BV</th>
                                        <th>ThisBV</th>
                                        <th>NewBV</th>
                                        <th>Date</th>
                                        <th>Issuer</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <?php
                                        while ($row = mysqli_fetch_array($sometransactions)) { 
        echo "<tr><td>".$row['id']."</td>";
        echo "<td>".$row['name']."</td>"; 
        echo "<td>".$row['description']."</td>";  
        echo "<td>".$row['oldbv']."</td>";  
        echo "<td>".$row['thisbv']."</td>";  
        echo "<td>".$row['newbv']."</td>";  
        echo "<td>".$row['transactiontime']."</td>";  
        echo "<td>".$row['issuer']."</td></tr>";  

          
        
           }  
            ?>
                                    
                                </tbody>
                                
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-md-6 align-self-center">
                                <!--<p id="dataTable_info" class="dataTables_info" role="status" aria-live="polite">Showing 1 to 10 of 27</p>-->
                            </div>
                            <div class="col-md-6">
                            <nav class="d-lg-flex justify-content-lg-end dataTables_paginate paging_simple_numbers">
                                        <ul class="pagination">
                                            <form method = "POST">
                                            <select name = "page" class="form-control" >
         
         
         
                                            <?php
                                            for($page = 1; $page<= $number_of_page; $page++) {  
    echo '<option value ="'.$page.'">' . $page . ' </option>'; } 
    ?>
    </select>
    <input class="btn btn-primary" type="submit" name = "submit_1" value = "Go!">
                                                        </form>
                                            
                                    </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="bg-white sticky-footer">
            <div class="container my-auto">
                <div class="text-center my-auto copyright"><span>Copyright © Roots and Herbs 2021</span></div>
            </div>
        </footer>
    </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a></div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/chart.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
    <script src="assets/js/script.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

    <script>
    $(document).ready(function(){
        $(".add-row").click(function(){
            var name = $("#product").find('option:selected').text();
            var val = $("#product").val();
            
            var markup = "<tr><td><input type='checkbox' name='record'></td><td class = 'desc' >" + name + "</td><td class = 'bv'>" + val + "</td></tr>";
            $("table tbody:first").append(markup);
        });
        
        // Find and remove selected table rows
        $(".delete-row").click(function(){
            $("table tbody:first").find('input[name="record"]').each(function(){
            	if($(this).is(":checked")){
                    $(this).parents("tr").remove();
                }
            });
        });
    });
       $(".show").click(function(){
         var content = 0;
            $("table tbody:first").find(".bv").each(function(){
            	
                    content += Number($(this).text());
                
            });
            $("#usebv").val(content);
            var content1 = "";
            $("table tbody:first").find(".desc").each(function(){
            	
                    content1 += $(this).text()+' |';
                
            });
            $("#usedesc").val(content1);
          
        });
        
</script>
</body>

</html>