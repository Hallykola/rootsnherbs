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
<li class="list-inline-item border rounded" style="width: fit-content;background-color: #bec1ca; color: black;" onClick="selectUser('<?php echo $user["id"]; ?>');">
<span>Username: <?php echo($user['username']) ?></span><br><span>Full-name: <?php echo($user['name']) ?></span>
</li>
<?php } ?>
</ul>
<?php } } 


?>