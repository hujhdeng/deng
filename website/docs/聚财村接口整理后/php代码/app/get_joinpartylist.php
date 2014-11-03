<?php


$liststr='id,u_name,u_pwd,regtime,phone,company,kpno,address,sex,old,area,keyword,industy,business,dan_count,year,cont,lnglat,followcount,followmecount,followbothcount,follow_list,avatar,logtime';



$u_table='party';
$id=$_POST['id'];
 //设定每一页显示的记录数
 $pagesize=3;	
if($id==''){$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('id错误！')));echo urldecode(json_encode($arr));exit(); }
//-----------------------要获取的数据列表以上
$liststr2=explode(',',$liststr);
$callback = $_POST["callback"];
$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());}
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");
$rs=mysql_query("select * from $u_table where id=$id",$con);
$myrow = mysql_fetch_row($rs);
if(empty($myrow)){
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('聚会id错误！')));
echo urldecode(json_encode($arr));	
exit();
 }else{
$f_phonelist=($myrow[15]);
$joinnum=($myrow[12]);	 
	 }
if(strstr($f_phonelist,'|'.$uid)==''){
	$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('还没有人加入聚会！')));
	echo urldecode(json_encode($arr));	
    exit();
	}else{
		//echo  floor(3/2);

		}

$f_phonelist2=explode('|',$f_phonelist);
 $pagecount=count($f_phonelist2)-1;
	if($pagecount>$pagesize){
		 //计算总页数
 $pages=intval($pagecount/$pagesize);
 
 if($pagecount%$pagesize!=0){
	$pages++; 
	 }
		} else{
		 //计算总页数
 $pages=1;	
			}
$page=intval($_POST['page']);	
if($page>$pages||$page<1){
	$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('数据空！')));	
	echo urldecode(json_encode($arr));
	exit(); 
	  }	
//$offset=$pagesize*($page - 1);
$start=$pagesize*($page - 1);
$end=$pagesize*($page - 1)+$pagesize;	

if($page==$pages){
	if($pagecount%$pagesize!=0){
	$end=$pagecount;		
		}
	}
	$allarray=array();
for($i=$start+1;$i<=$end;$i++){
	$uid= $f_phonelist2[$i];
	$u_table='user';	
	$rs=mysql_query("select * from $u_table where id=".$uid,$con);	
	$myrow = mysql_fetch_row($rs);
	
//$u_name=$myrow[1];
//$u_pwd=$myrow[2];
//$regtime=$myrow[3];
//$phone=$myrow[4];
//$company=$myrow[5];
//$kpno=$myrow[6];
//$address=$myrow[7];
//$sex=$myrow[8];
//$old=$myrow[9];
//$area=$myrow[10];
//$keyword=$myrow[11];
//$industy=$myrow[12];
//$business=$myrow[13];
//$dan_count=$myrow[14];
//$year=$myrow[15];
//$cont=$myrow[16];
//$lnglat=$myrow[17];
//$followcount=$myrow[18];
//$followmecount=$myrow[19];
//$followbothcount=$myrow[20];
//$follow_list=$myrow[21];
//$avatar=$myrow[22];
//$logtime=$myrow[23];
$url='http://'.$_SERVER['SERVER_NAME'].$_SERVER["REQUEST_URI"]; 
$arraytmp=array();
 for($n=0;$n<count($liststr2);$n++){
 if($liststr2[$n]!='u_pwd'&&$liststr2[$n]!='follow_list'){
 if($liststr2[$n]=='avatar'){
	 
  $arraytmp[$liststr2[$n]]=urlencode(dirname($url)."/file/".$myrow[$n]); 
	 }else{
	 $arraytmp[$liststr2[$n]]=urlencode($myrow[$n]); 
	 }	 
 }
 	}		
 
  array_push($allarray,$arraytmp);
	}

$arr = array ('apicode'=>10000,'data'=>$allarray);	
echo urldecode(json_encode($arr));	
  
   ?>
