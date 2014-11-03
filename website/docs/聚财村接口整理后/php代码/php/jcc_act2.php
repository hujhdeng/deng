
<?php 
$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());} 
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");
//-----------------------以上为公共数据库连接
$act=$_GET['act'];
switch ($act)
{
case 'updatepwd':
  updatepwd();
  break;	
case 'get_userinfo':
  get_userinfo();
  break;	
case 'add_userinfo':
  add_userinfo();
  break;	
case 'getver':
  getver();
  break;	
case 'suggest':
  suggest();
  break;	
case 'user_log':
  user_log();
  break;	
case 'user_reg':
  user_reg();
  break;		
  }
?>

 

<?php
//------------------------------------------------------- 创建表参考
function creattable(){

$sql = "CREATE TABLE Persons 
(
personID int NOT NULL AUTO_INCREMENT, 
PRIMARY KEY(personID),
FirstName varchar(15),
LastName varchar(15),
Age int
)";

mysql_query($sql,$con);

mysql_close($con);
}
?>

<?php
//------------------------------------------------------- jcc

function user_log(){
$u_table='user';
$liststr='u_name,phone,u_pwd,logtime';

//----------定义表名和键列表两个后面为标准的

$u_name=$_GET['u_name'];
$phone=$_GET['phone'];
$u_pwd=$_GET['password'];
$logtime=date('Y-m-d H:i:s',time());


$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());}
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");
 $rs=mysql_query("select * from $u_table where phone='$phone' ",$con);

  $myrow = mysql_fetch_row($rs);
 
 if(empty($myrow)){
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('用户名错误！')));
 }else{
if($myrow[2]==$u_pwd){
$arr = array ('apicode'=>10000,
'data'=>array (
'uid'=>$myrow[0],
'u_name'=>urlencode($myrow[1]),
'regtime'=>urlencode($myrow[3]),
'phone'=>urlencode($myrow[4]),
'company'=>urlencode($myrow[5]),
'kpno'=>urlencode($myrow[6]),
'address'=>urlencode($myrow[7]),
'sex'=>urlencode($myrow[8]),
'old'=>urlencode($myrow[9]),
'area'=>urlencode($myrow[10]),
'keyword'=>urlencode($myrow[11]),
'industy'=>urlencode($myrow[12]),
'business'=>urlencode($myrow[13]),
'dan_count'=>urlencode($myrow[14]),
'year'=>urlencode($myrow[15]),
'cont'=>urlencode($myrow[16]),
'lnglat'=>urlencode($myrow[17]),
'followcount'=>urlencode($myrow[18]),
'followmecount'=>urlencode($myrow[19]),
'followbothcount'=>urlencode($myrow[20]),
'follow_list'=>urlencode($myrow[21]),
'picpath'=>urlencode($myrow[22]),
'logtime'=>urlencode($myrow[23])
)
);	
	}else{
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('密码错误！')));		
		}	
	 
	 }

echo urldecode(json_encode($arr));


//echo "<script>alert('添加成功！');</ script>";		
}

 function user_reg(){
$u_table='user';
$liststr='u_name,phone,u_pwd,regtime,kpno,dan_count,followcount,followmecount,followbothcount,follow_list';

//----------定义表名和键列表两个后面为标准的

$u_name=$_GET['u_name'];
$phone=$_GET['phone'];
$u_pwd=$_GET['password'];
$yzm=$_GET['yzm'];
$regtime=date('Y-m-d H:i:s',time());


$kpno=50;
$dan_count=0;
$followcount=0;
$followmecount=0;
$followbothcount=0;
$follow_list='|';
//--------------------------------以上值和liststr对应
$liststr2=explode(',',$liststr);
$liststr4=" ";
for($i=0;$i<count($liststr2);$i++){if($i==0){$liststr4=$liststr4.' "'.${$liststr2[$i]}.'"';}else{$liststr4=$liststr4.',"'.${$liststr2[$i]}.'"';}}	
$liststr3='('.$liststr.') VALUES ('.$liststr4.')';

$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());}
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");
 $yzmerror=0; 
 $rs=mysql_query("select * from yzm where phone='$phone' ",$con);
  $myrow = mysql_fetch_row($rs);
 if(empty($myrow)){
	$yzmerror=1; 
 }else{
	if($myrow[2]!=$yzm){
		$yzmerror=1;
		} 
	 }
	if($yzmerror==1){
	$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('验证码错误！')));	
		}else{
	 
 $rs=mysql_query("select * from $u_table where phone='$phone' ",$con);
  $myrow = mysql_fetch_row($rs);
 
 if(empty($myrow)){
	 
 
$sqlstr="INSERT INTO ".$u_table.$liststr3;
mysql_query($sqlstr);
$uid=mysql_insert_id();
$arr = array ('apicode'=>10000,'data'=>array ('uid'=>$uid));
	  }else{
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('电话已经注册过！')));	
	  
		  }
//$jsontxt2=urldecode(json_encode($jsontxt));  
// $jsontxt["callback"]=1;   
}
 
echo urldecode(json_encode($arr));


//echo "<script>alert('添加成功！');</ script>";		
} 
 function updatepwd(){
$u_table='user';
//----------定义表名和键列表两个后面为标准的
$phone=$_GET['phone'];
$u_pwd=$_GET['password'];
$yzm=$_GET['yzm'];
$regtime=date('Y-m-d H:i:s',time());

//--------------------------------以上值和liststr对应

$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());}
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");
 $yzmerror=0; 
 $rs=mysql_query("select * from yzm where phone='$phone' ",$con);
  $myrow = mysql_fetch_row($rs);
 if(empty($myrow)){
	$yzmerror=1; 
 }else{
	if($myrow[2]!=$yzm){
		$yzmerror=1;
		} 
	 }
	if($yzmerror==1){
	$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('验证码错误！')));	
		}else{
	 
 $rs=mysql_query("select * from $u_table where phone='$phone' ",$con);
 $myrow = mysql_fetch_row($rs);
 
 if(empty($myrow)){
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('电话号码不存在！')));	

	  }else{

$sql="update $u_table set u_pwd='".$u_pwd."' where phone='$phone'";
mysql_query($sql);	
$arr = array ('apicode'=>10000);	  
		  }  
}
 
echo urldecode(json_encode($arr));

//echo "<script>alert('添加成功！');</ script>";		
} 

function suggest(){
$u_table='user';
$liststr='txt,regtime';
//----------定义表名和键列表两个后面为标准的

$uid=$_GET['uid'];
$txt=$_GET['txt'];

$date=date('Y-m-d H:i:s',time());
$tmp=(explode(' ',$date));
$regtime=$tmp[0];
//--------------------------------以上值和liststr对应
$liststr2=explode(',',$liststr);
$liststr4=" ";
for($i=0;$i<count($liststr2);$i++){if($i==0){$liststr4=$liststr4.' "'.${$liststr2[$i]}.'"';}else{$liststr4=$liststr4.',"'.${$liststr2[$i]}.'"';}}	
$liststr3='('.$liststr.') VALUES ('.$liststr4.')';

$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());}
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");
 $rs=mysql_query("select * from $u_table where id='$uid' ",$con);
  $i=0;
  $myrow = mysql_fetch_row($rs);
 
 if(empty($myrow)){
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('用户名错误！')));
 }else{
 $jsontxt=array();
 $u_table='suggest';

 $sqlstr="INSERT INTO ".$u_table.$liststr3;
mysql_query($sqlstr);
$uid=mysql_insert_id();
$arr =array ('apicode'=>10000,'data'=>array ('uid'=>$uid)); 
	 }
echo urldecode(json_encode($arr));		
}
function getver(){
$u_table='info';
//----------定义表名和键列表两个后面为标准的
$ver=$_GET['ver'];

//--------------------------------以上值和liststr对应

$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());}
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");
 $rs=mysql_query("select * from $u_table",$con);
  $i=0;
  $myrow = mysql_fetch_row($rs);
 
 if( $myrow[1]!=$ver){
$arr = array ('apicode'=>10001,'data'=>array ('appurl'=>urlencode('http://bbs.cd360.com/')));
 }else{
$arr = array ('apicode'=>10000); 
	 }
echo urldecode(json_encode($arr));		
} 
 function add_userinfo(){
$u_table='user';
$liststr='u_name,company,address,sex,old,area,keyword,industy,business,year,cont,lnglat';

//----------定义表名和键列表两个后面为标准的
$phone=$_GET['phone'];
$u_name=$_GET['u_name'];
//$u_pwd=$_GET['u_pwd'];
$company=$_GET['company'];
//$kpno=$_GET['kpno'];
$address=$_GET['address'];
$sex=$_GET['sex'];
$old=$_GET['old'];
$area=$_GET['area'];
$keyword=$_GET['keyword'];
$industy=$_GET['industy'];
$business=$_GET['business'];
//$dan_count=$_GET['dan_count'];
$year=$_GET['year'];
$cont=$_GET['cont'];
//$followcount=$_GET['followcount'];
//$followmecount=$_GET['followmecount'];
//$followbothcount=$_GET['followbothcount'];
//$follow_list=$_GET['follow_list'];
$lnglat=$_GET['lnglat'];

//$date=date('Y-m-d H:i:s',time());
//$tmp=(explode(' ',$date));
//$regtime=$tmp[0];
//--------------------------------以上值和liststr对应
$liststr2=explode(',',$liststr);
$liststr4=" ";
for($i=0;$i<count($liststr2);$i++){if($i==0){$liststr4=$liststr4.' "'.${$liststr2[$i]}.'"';}else{$liststr4=$liststr4.',"'.${$liststr2[$i]}.'"';}}	
$liststr3='('.$liststr.') VALUES ('.$liststr4.')';

$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());}
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");
 $rs=mysql_query("select * from $u_table where phone='$phone' ",$con);
  $i=0;
$myrow = mysql_fetch_row($rs);
 
 if(empty($myrow)){
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('电话号码不存在！')));
 }else{
	 
$pptmp="";
for($i=0;$i<count($liststr2);$i++){
${$liststr2[$i]}=$_GET[$liststr2[$i]];
if(${$liststr2[$i]}!=''){$pptmp=$pptmp.",$liststr2[$i]='${$liststr2[$i]}'";}
}

$pptmp = substr ($pptmp, 1);	 
if($pptmp!=''){
$sql="update $u_table set $pptmp where phone='$phone'";
mysql_query($sql);
}	 

$arr = array ('apicode'=>10000);
 
	 } 
echo urldecode(json_encode($arr));
		
} 
function get_userinfo(){
$u_table='user';
$phone=$_GET['phone'];
//--------------------------------以上值和liststr对应
$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());}
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");
 $rs=mysql_query("select * from $u_table where phone='$phone' ",$con);
$myrow = mysql_fetch_row($rs);
if(empty($myrow)){
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('电话号码不存在！')));	
 }else{
$arr = array (
'apicode'=>10000,
'data'=>array (
'uid'=>$myrow[0],
'u_name'=>urlencode($myrow[1]),
'regtime'=>urlencode($myrow[3]),
'phone'=>urlencode($myrow[4]),
'company'=>urlencode($myrow[5]),
'kpno'=>urlencode($myrow[6]),
'address'=>urlencode($myrow[7]),
'sex'=>urlencode($myrow[8]),
'old'=>urlencode($myrow[9]),
'area'=>urlencode($myrow[10]),
'keyword'=>urlencode($myrow[11]),
'industy'=>urlencode($myrow[12]),
'business'=>urlencode($myrow[13]),
'dan_count'=>urlencode($myrow[14]),
'year'=>urlencode($myrow[15]),
'cont'=>urlencode($myrow[16]),
'lnglat'=>urlencode($myrow[17]),
'followcount'=>urlencode($myrow[18]),
'followmecount'=>urlencode($myrow[19]),
'followbothcount'=>urlencode($myrow[20]),
'follow_list'=>urlencode($myrow[21]),
'picpath'=>urlencode($myrow[22]),
'logtime'=>urlencode($myrow[23])
)); 
	 } 
echo urldecode(json_encode($arr));
		
}     
?>

