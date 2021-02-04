<?php
//session_start();
include_once('./models/PensionsModel.php');
include_once('./models/ConstantsModel.php');



if(!isset($_SESSION["user"])){
    header('location: login');
}elseif($_SESSION['level']<3){
    header('location: nopermission');
}

if (!isset($_POST['page'])){
    $page = 1;  
} else {  
    $page = $_POST['page'];  
}  

$results_per_page = 10;  
$page_first_result = ($page-1) * $results_per_page;  

$page_first_result = ($page-1) * $results_per_page;
$pensions = new PensionsModel();
$result = $pensions-> getAllPensions();
$number_of_result = mysqli_num_rows($result);  
$somepensions = $pensions->getSomePensions($page_first_result,$results_per_page);
//determine the total number of pages available  
$number_of_page = ceil ($number_of_result / $results_per_page);

include_once('header.php');
$constants = new ConstantsModel();
  $myconstantspv = $constants->getConstant ('pensionvalue')->fetch_assoc()['value'];
?>
            <div class="container-fluid">
                <h3 class="text-dark mb-4">Pensions</h3>
                <div class="card shadow">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Pension Statistics</h4>
                            <h6 class="text-muted card-subtitle mb-2">Users pensions list</h6>
                        </div>
                        <div class="card-header py-3">
                            <p class="text-primary m-0 font-weight-bold">Pension List</p>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6 text-nowrap">
                                <div id="dataTable_length" class="dataTables_length" aria-controls="dataTable"><label>Show&nbsp;<select class="form-control form-control-sm custom-select custom-select-sm"><option value="10" selected="">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select>&nbsp;</label></div>
                            </div>
                            <div class="col-md-6">
                                <div class="text-md-right dataTables_filter" id="dataTable_filter"><label><input type="search" class="form-control form-control-sm" aria-controls="dataTable" placeholder="Search"></label></div>
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
                                        <th>Description</th>
                                        <th>Date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <?php
                                        while ($row = mysqli_fetch_array($somepensions)) { 
        echo "<tr><td>".$row['id']."</td>";
        echo "<td><a class='nav-item' href = 'profile?id=".$row['userid']."'>".$row['name']."</a></td>"; 
        echo "<td>".$row['pensionvalue']."</td>";  
        echo "<td> &#x20A6;".$row['pensionvalue']*$myconstantspv."</td>";  
        echo "<td>".$row['description']."</td>";  
        echo "<td>".$row['time']."</td>";  

          
        
           }  
            ?>
                                   
                                </tbody>
                                   
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-md-6 align-self-center">
                               <!-- <p id="dataTable_info" class="dataTables_info" role="status" aria-live="polite">Showing 1 to 10 of 27</p> -->
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
<?php
include_once('footer.php');
?>