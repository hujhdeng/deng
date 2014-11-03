<?php
$liststr='id,u_name,regtime,phone,company,kpno,address,sex,old,area,keyword,industy,business,dan_count,year,cont,lnglat,followcount,followmecount,followbothcount,follow_list,avatar,logtime,lng,lat';
$u_table='user';
$uid = $_GET["uid"];//手机
$lng=$_GET["lng"];
$lat=$_GET["lat"];
$starttime=date('Y-m-d H:i:s',strtotime('-20 minute'));

$minlng=$lng-0.06;
$maxlng=$lng+0.06;
$minlat=$lat-0.06;
$maxlat=$lat+0.06;
//116.441063,39.915599
//116.403694	39.914714

//$minlng = $_GET["minlng"];//小经度
//$minlat = $_GET["minlat"];//小维度
//$maxlng = $_GET["maxlng"];     //大经度
//$maxlat = $_GET["maxlat"]; //大纬度

 //设定每一页显示的记录数
 $pagesize=$_GET['pagesize'];
if($pagesize==''){ $pagesize=20;}

//-----------------------要获取的数据列表以上
$liststr2=explode(',',$liststr);
$callback = $_GET["callback"];
$conn = mysql_connect("localhost","root","sanrenxing");
mysql_query("set names 'utf8'");

 mysql_select_db("jcc",$conn);
 //取得记录总数$rs，计算总页数用
 $rs=mysql_query("select * from $u_table where lng>".$minlng." and lng<".$maxlng." and lat>".$minlat." and lat<".$maxlat." and locat='1' and logtime>'".$starttime."' and id!=".$uid ,$conn);
 $myrow = mysql_fetch_array($rs);
 $numrows=$myrow[0];
 //计算总页数

 $pages=intval($numrows/$pagesize);
 if ($numrows%$pagesize)
  $pages++;
 //设置页数
 if (isset($_GET['page'])){
  $page=intval($_GET['page']);
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

 $rs=mysql_query("select * from $u_table where lng>".$minlng." and lng<".$maxlng." and lat>".$minlat." and lat<".$maxlat." and locat='1' and logtime>'".$starttime."' and id!=".$uid." order by kpno desc limit $offset,$pagesize",$conn);
 if ($myrow = mysql_fetch_array($rs))
 {
  $i=0;
   $allarray=array();
   do {
    $i++;
 	 
	  $arraytmp=array(); 
	$lng2=$myrow[24];
	$lat2=$myrow[25];
	$lng1=$_GET["lng"];;
	$lat1=$_GET["lat"];;
//echo $lat1."-".$lng1."-".$lat2."-".$lng2."-".GetDistance($lat1,$lng1,$lat2,$lng2)."||";

	$distance= GetDistance($lat1,$lng1,$lat2,$lng2);
 for($n=0;$n<count($liststr2);$n++){
	 
// array_push($arraytmp,'message':urlencode('ok！'));
if($liststr2[$n]=='avatar'){
$url='http://'.$_SERVER['SERVER_NAME'].$_SERVER["REQUEST_URI"]; 
$arraytmp[$liststr2[$n]]=urlencode(dirname($url)."/file/".$myrow[$liststr2[$n]]);
	}else{
	$arraytmp[$liststr2[$n]]=urlencode($myrow[$liststr2[$n]]);
	}

 	}
	$arraytmp['distance']=$distance	;	
//		
  array_push($allarray,$arraytmp);

//echo json_encode($arraytmp);
   }
   
   while ($myrow = mysql_fetch_array($rs));
// echo json_encode($allarray);  
//$jsontxt2=(json_encode($jsontxt));



$allarray = array_sort($allarray,'distance');
$arr = array ('apicode'=>10000,'data'=>$allarray);	
  }else{
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('数据空！')));	
	  }
echo urldecode(json_encode($arr));	
//$lat1=40.02992;
//$lng1=116.3329;
//$lat2=39.977745;
//$lng2=116.34559;
//
//
//echo (GetDistance($lat1,$lng1,$lat2,$lng2));
//GetDistance(29.614714,106.556219, 29.502618, 106.546445)
    //计算距离，参数分别为第一点的纬度，经度；第二点的纬度，经度
 function GetDistance($lat1,$lng1,$lat2,$lng2){
        $radLat1 = $lat1 * pi() /180.0;
        $radLat2 =  $lat2 * pi() /180.0;
		
        $a = $radLat1 - $radLat2;
        $b =  ($lng1 * pi() /180.0) - ($lng2 * pi() /180.0);
        $s = 2 * asin(sqrt(pow(sin($a/2),2)+cos($radLat1)*cos($radLat2)*pow(sin($b/2),2)));
        $s = $s *6378.137 ;// EARTH_RADIUS;
		//输出为公里
		
        $s = round($s * 10000) / 10000;   
        //s=s.toFixed(4);
		//alert(s)
        return $s*1000;
    }
	 //经纬度转换成三角函数中度分表形式。
//function Rad(d){
//       return d * Math.PI / 180.0; 
//    }


 function array_sort($arr,$keys,$type='asc'){ 
	$keysvalue = $new_array = array();
	foreach ($arr as $k=>$v){
		$keysvalue[$k] = $v[$keys];
	}
	if($type == 'asc'){
		asort($keysvalue);
	}else{
		arsort($keysvalue);
	}
	reset($keysvalue);
	foreach ($keysvalue as $k=>$v){
		//$new_array[$k] = $arr[$k];
		array_push($new_array, $arr[$k]);
	}
	return $new_array; 
} 
   ?>
