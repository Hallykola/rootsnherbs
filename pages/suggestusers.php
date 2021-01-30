<?php
include_once('./models/UsersModel.php');



$usermodel = new UsersModel();
if(!empty($_POST["keyword"])) {
$result = $usermodel->suggestusers ($_POST["keyword"]);

if(!empty($result)) {
?>
<ul id="country-list">
<?php
foreach($result as $user) {
?>
<li style="color:blue" onClick="selectUser('<?php echo $user["id"]; ?>');"><?php echo $user["name"]." | ".$user["username"]." | ".$user["id"]; ?></li>
<?php } ?>
</ul>
<?php } } 


?>