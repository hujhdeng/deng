<?php
$u_table='user';
$uid=$_POST['uid'];
$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());}
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");
 $rs=mysql_query("select * from $u_table where id='$uid' ",$con);
  $myrow = mysql_fetch_row($rs);
 if(empty($myrow)){
	 $arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('用户错误！')));echo urldecode(json_encode($arr));exit();
	 }

$url='http://'.$_SERVER['SERVER_NAME'].$_SERVER["REQUEST_URI"]; 
//echo dirname($url);
  if ($_FILES["file"]["error"] > 0)
    {
   $arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('文件错误！')));
    }
  else
    {
  //echo "Upload: " . $_FILES["file"]["name"] . "<br />";
  // echo "Type: " . $_FILES["file"]["type"] . "<br />";
  //echo "Size: " . ($_FILES["file"]["size"] / 1024) . " Kb<br />";
  //echo "Temp file: " . $_FILES["file"]["tmp_name"] . "<br />";

     $f_name=$_FILES["file"]["name"];//获取上传源文件名 
	 $tmp_type=substr(strrchr($f_name,"."),1);//获取文件扩展名
    if (file_exists("upload/" . $_FILES["file"]["name"]))
      {
      $arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('文件已存在！')));
      }
    else
      {
	  $rand .= substr($string,mt_rand(0,strlen($string)-1),1);
	  $t=date("ymdHis").substr($gettime[0],2,6).$rand;
	  $attdir="./file/"; 
	  $uploadfile=$attdir.$t.".".$tmp_type; 
      move_uploaded_file($_FILES["file"]["tmp_name"],
      $uploadfile);
     //echo "Stored in: " .$t.".".$tmp_type;
	  $avatar=dirname($url)."/file/".$t.".".$tmp_type;
	   $arr = array ('apicode'=>10000,'data'=>array ('avatar'=>urlencode($avatar)));
	   
	   $sql="update $u_table set avatar='".$t.".".$tmp_type."' where id=".$uid;
	mysql_query($sql);	
      }
	  echo urldecode(json_encode($arr));	
    }

?>
