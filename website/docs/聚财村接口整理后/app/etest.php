<?php 
$con = new mysqli('localhost','root', 'sanrenxing', 'jcc');
mysqli_set_charset ($con,'utf8');
 $query="update chat_user set hehasread='1'  where seid='70'";
 $result = $mysqli->query($query);
?>