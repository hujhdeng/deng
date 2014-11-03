<?php
$liststr='id,u_name,regtime,phone,company,kpno,address,sex,old,area,keyword,industy,business,dan_count,year,cont,lnglat,followcount,followmecount,followbothcount,follow_list,avatar,logtime,lng,lat';
$u_table='user';
$uid = $_POST["uid"];//手机
$lng=$_POST["lng"];
$lat=$_POST["lat"];


$minlng=$lng-0.03;
$maxlng=$lng+0.03;
$minlat=$lat-0.03;
$maxlat=$lat+0.03;

//$minlng = $_POST["minlng"];//小经度
//$minlat = $_POST["minlat"];//小维度
//$maxlng = $_POST["maxlng"];     //大经度
//$maxlat = $_POST["maxlat"]; //大纬度

 //设定每一页显示的记录数
 $pagesize=$_POST['pagesize'];
if($pagesize==''){ $pagesize=20;}

//-----------------------要获取的数据列表以上
$liststr2=explode(',',$liststr);
$callback = $_POST["callback"];
$conn = mysql_connect("localhost","root","sanrenxing");
mysql_query("set names 'utf8'");

 mysql_select_db("jcc",$conn);
 //取得记录总数$rs，计算总页数用
 $rs=mysql_query("select * from $u_table where lng>".$minlng." and lng<".$maxlng." and lat>".$minlat." and lat<".$maxlat,$conn);
 $myrow = mysql_fetch_array($rs);
 $numrows=$myrow[0];
 //计算总页数

 $pages=intval($numrows/$pagesize);
 if ($numrows%$pagesize)
  $pages++;
 //设置页数
 if (isset($_POST['page'])){
  $page=intval($_POST['page']);
  if($page>$pages||$page<1){
	$page=1;  
	  }
 }
 else{
  //设置为第一页 
  $page=1;
 }
 //计算记录偏移量
 $offset=$pagesize*($page - 1);
 //读取指定记录数
 $jsontxt=array();

 $rs=mysql_query("select * from $u_table where lng>".$minlng." and lng<".$maxlng." and lat>".$minlat." and lat<".$maxlat." order by kpno desc limit $offset,$pagesize",$conn);
 if ($myrow = mysql_fetch_array($rs))
 {
  $i=0;
   $allarray=array();
   do {
    $i++;
 	 
	  $arraytmp=array(); 
 for($n=0;$n<count($liststr2);$n++){
	 
// array_push($arraytmp,'message':urlencode('ok！'));
if($liststr2[$n]=='avatar'){
$url='http://'.$_SERVER['SERVER_NAME'].$_SERVER["REQUEST_URI"]; 
$arraytmp[$liststr2[$n]]=urlencode(dirname($url)."/file/".$myrow[$liststr2[$n]]);
	}else{
	$arraytmp[$liststr2[$n]]=urlencode($myrow[$liststr2[$n]]);
	}

 	}		
//		
  array_push($allarray,$arraytmp);

//echo json_encode($arraytmp);
   }
   
   while ($myrow = mysql_fetch_array($rs));
// echo json_encode($allarray);  
//$jsontxt2=(json_encode($jsontxt));
$arr = array ('apicode'=>10000,'data'=>$allarray);	
  }else{
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('数据空！')));	
	  }
echo urldecode(json_encode($arr));	 
   ?>
