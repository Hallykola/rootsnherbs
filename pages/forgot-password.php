<?php
if(!isset($_SESSION["user"])){
    header('location: login');
}elseif($_SESSION['level']<3){
    header('location: nopermission');
}

include_once('header.php');
include_once('./models/UsersModel.php');
include_once('./models/ManagersModel.php');



if(isset($_POST['submit_password'])) {
    if(isset($_POST['password'])){
      $password = $_POST['password'];
      
      }
      if(isset($_POST['userid'])){
        $userid = $_POST['userid'];
        
        }
      if(isset($_POST['password_repeat'])){
      $passwordrepeat = $_POST['password_repeat'];
      }
      
      if(!empty($password)&&!empty($passwordrepeat)){
             $play1 = new UsersModel();
             $id = $userid;
             $hashedpassword = password_hash($password, PASSWORD_BCRYPT);
  
          if($play1->updateManagerItembyID ('password','si',$hashedpassword,$userid)==TRUE
          
          ){
              
              $mssg = "User password updated";
              header('location: profile');
              //header('location: dashboard.php');
          }else{
              $passwordmssg = " Something went wrong, could not update password";
          }
      }
    
  
  }
  
?>
        <div class="container">
        <div class="card shadow-lg o-hidden border-0 my-5">
            <div class="card-body p-0">
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-flex">
                        <div class="flex-grow-1 bg-register-image" style="background-image: url(&quot;assets/img/dogs/image2.jpeg&quot;);"></div>
                    </div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h4 class="text-dark mb-4">Change Admin User Password</h4>
                            </div>
                            <div class="card-body">
                                    <form method="POST">
                                    
                                    <?php if($_SESSION["level"]>3){
                                    echo '<div class="form-group row">
                                    <label for="userid"><strong>User ID</strong></label><input class="form-control form-control-user" type="name" id="userid" placeholder="User ID" name="userid" id = "search-box" required>
                                    </div>
                                    <div></div> <div style="clear:both;float:right" id="suggesstion-box"></div>';
                                    }else{
                                        echo '<div class="form-group row">
                                        <input class="form-control form-control-user" type="hidden" id="userid" placeholder="User ID" name="userid" value="'.$_SESSION["id"] .' " required>
                                        </div>'; 
                                    } ?>
                                        <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0"><input class="form-control form-control-user" type="password" id="password" placeholder="Password" name="password" onkeyup="checkpassword();" required></div>
                                    <div class="col-sm-6"><input class="form-control form-control-user" type="password" id="re-password" placeholder="Repeat Password" name="password_repeat" onkeyup="checkpassword();" required></div>
                                        <br/> <p class="text-center" id="password-reply"></p>
                                </div>
                                <input class="btn btn-primary btn-sm" name = "submit_password" value = "Update" type="submit">
                                </form>
                                <?php if(!empty($passwordmssg)){
                                    echo '<div class="text-center" style="color:green">'.$passwordmssg.'</div>';
                                    } ?>
                                    </div>
                           
                             </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php
include_once('footer.php');
?>