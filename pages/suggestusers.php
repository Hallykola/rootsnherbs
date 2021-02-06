<?php
include_once('./models/UsersModel.php');



$usermodel = new UsersModel();
if(!empty($_POST["keyword"])) {
$result = $usermodel->suggestusers ($_POST["keyword"]);

if(!empty($result)) {
?>
<ul id="country-list" class="list-inline">
<?php
foreach($result as $user) {
?>
<li style="color:blue" onClick="selectUser('<?php echo $user["id"]; ?>');"><?php echo $user["name"]." | ".$user["username"]." | userID: ".$user["id"]." | Current BV: ".$user["bronzevalue"]." | Current Bonus: ".$user["bonusvalue"]; ?></li>
</li>
<?php } ?>
</ul>
<?php } } 


?>