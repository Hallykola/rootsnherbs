
<?php
include_once('./models/UsersModel.php');

    if(isset($_POST['name'])){
    $name = $_POST['name'];
    }
    if(isset($_POST['username'])){
    $username = $_POST['username'];
    }
    if(isset($_POST['sponsorid'])){
    $sponsor = $_POST['sponsorid'];
    }
    if(isset($_POST['phone'])){
        $phone = $_POST['phone'];
    }
    if(isset($_POST['accountnumber'])){
        $bankaccount = $_POST['accountnumber'];
    }
    if(isset($_POST['password'])){
    $password = $_POST['password'];
    }
    if(!empty($username)&&!empty($password)&&!empty($name)&&!empty($phone)&&!empty($sponsor)&&!empty($bankaccount)){
        
        $hashedpassword = password_hash( $password, PASSWORD_BCRYPT );
        $play = new UsersModel();
        $ancestors = "";
        $descendants = "";
        $bronzevalue = 0;
        $rank = "none";
        if($play->addUser($username,$name,$hashedpassword,$sponsor,$ancestors,$descendants,$bronzevalue,$rank, $phone, $bankaccount)==TRUE){
            
            header('location: login.php');
        }else{
            $error = " Something went wrong, could not create user";
        }
    }else{
        //$error = " Fill all details";
    }
?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Register - Root & herbs</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
</head>

<body class="bg-gradient-primary">
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
                                <h4 class="text-dark mb-4">Create an Account!</h4>
                            </div>
                            <form class="user" method = "POST">
                                <div class="form-group"><input class="form-control form-control-user" type="text" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Full Name" name="name"></div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0"><input class="form-control form-control-user" type="text" id="exampleFirstName" placeholder="Username" name="username"></div>
                                    <div class="col-sm-6"><input class="form-control form-control-user" type="text" id="exampleFirstName" placeholder="Sponsor ID" name="sponsorid"></div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0"><input class="form-control form-control-user" type="text" id="exampleFirstName" placeholder="Phone number" name="phone"></div>
                                    <div class="col-sm-6"><input class="form-control form-control-user" type="text" id="exampleFirstName" placeholder="Account Number" name="accountnumber"></div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0"><input class="form-control form-control-user" type="password" id="examplePasswordInput" placeholder="Password" name="password"></div>
                                    <div class="col-sm-6"><input class="form-control form-control-user" type="password" id="exampleRepeatPasswordInput" placeholder="Repeat Password" name="password_repeat"></div>
                                </div><button class="btn btn-primary btn-block text-white btn-user" type="submit">Register Account</button>
                                <hr>
                            </form>
                            <?php
                                    if(!empty($error)){
                                    echo '<div class="text-center" style="color:red">'.$error.'</div>';
                                    }
                                   ?>
                            <div class="text-center"><a class="small" href="forgot-password.html">Forgot Password?</a></div>
                            <div class="text-center"><a class="small" href="registeradmin.php">Not an regular user? Create an Admin Account.</a></div>
                            <div class="text-center"><a class="small" href="login.php">Already have an account? Login!</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/chart.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
    <script src="assets/js/script.min.js"></script>
</body>

</html>