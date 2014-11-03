<?php
$liststr='id,u_name,regtime,phone,company,kpno,address,sex,old,area,keyword,industy,business,dan_count,year,cont,lnglat,followcount,followmecount,followbothcount,follow_list,avatar,logtime,lng,lat';
$u_table='user';
$uid = $_GET["uid"];
$phonelist = $_GET["phonelist"];//手机
 $is=0;
$phonelist2=explode(',',$phonelist);
//-----------------------要获取的数据列表以上
$liststr2=explode(',',$liststr);
$callback = $_GET["callback"];
$conn = mysql_connect("localhost","root","sanrenxing");
mysql_query("set names 'utf8'");
 mysql_select_db("jcc",$conn);
 $rs=mysql_query("select * from $u_table  where id=".$uid,$conn);
  if ($myrow = mysql_fetch_array($rs)){
	 $follow_list=$myrow['follow_list'];  
	  }else{
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('用户错误！')));
echo urldecode(json_encode($arr));exit();   
		  }
 $allarray=array();
for($i=0;$i<count($phonelist2);$i++){
	$phonetmp=$phonelist2[$i];
	//echo $phonetmp.'--';

 $rs=mysql_query("select * from $u_table  where phone='".$phonetmp."'",$conn);
 if ($myrow = mysql_fetch_array($rs))
 {
 $is=1;
   
//   do {
//    $i++;

 	if(strstr($follow_list,'|'.$myrow['phone'])==false){

	  $arraytmp=array(); 
 for($n=0;$n<count($liststr2);$n++){
	 
if($liststr2[$n]=='avatar'){
$url='http://'.$_SERVER['SERVER_NAME'].$_SERVER["REQUEST_URI"]; 
$arraytmp[$liststr2[$n]]=urlencode(dirname($url)."/file/".$myrow[$liststr2[$n]]);
	}else{
	$arraytmp[$liststr2[$n]]=urlencode($myrow[$liststr2[$n]]);
	}


 // $arraytmp[$liststr2[$n]]=urlencode($myrow[$liststr2[$n]]);
 	}		
//		
  array_push($allarray,$arraytmp);
	}
//	echo $allarray;
//	echo "hh";
//echo json_encode($arraytmp);
//   }
//   
//   while ($myrow = mysql_fetch_array($rs));
// echo json_encode($allarray);  
//$jsontxt2=(json_encode($jsontxt));
$arr = array ('apicode'=>10000,'data'=>$allarray);	
  }else{

//$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('数据空！')));	
	  }
	}  
if($is==0){
	$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('数据空！')));
	}	
echo urldecode(json_encode($arr));	 
   ?>
