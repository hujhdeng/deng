<?php


$liststr='id,uid,u_name,phone,regtime,state,area,type,money,limitdate,howlong,title,assessnum,assesstxt,content,joinlist,myjoin';
$u_table='sdan';
$uid=$_GET['uid'];
$sendid=$_GET['sendid'];
$type=$_GET['type'];
$area=$_GET['area'];
$state=$_GET['state'];
 //设定每一页显示的记录数
 $pagesize=$_GET['pagesize'];
 if($pagesize==''){$pagesize=20;}
$where='';
if($sendid!=''){$where=$where." where uid='".$sendid."'";}
if($state!=''){
	if($where==''){
	$where=$where." where state='".$state."'";	
		}else{
	$where=$where." and state='".$state."'";
	}
}

if($type!=''){
	if($where==''){
	$where=$where." where type like '%".$type."%'";	
		}else{
	$where=$where." and type like '%".$type."%'";
	}
}
if($area!=''){
	if($where==''){
	$where=$where." where area like '%".$area."%'";	
		}else{
	$where=$where." and area like '%".$area."%'";
	}
}
//-----------------------要获取的数据列表以上
$liststr2=explode(',',$liststr);
$callback = $_GET["callback"];
$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());}
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");

 //取得记录总数$rs，计算总页数用
// echo "select * from $u_table where uid='$uid'".$where." order by id desc";
$rs=mysql_query("select * from $u_table ".$where." order by id desc",$con);
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
	$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('数据空！')));	
	echo urldecode(json_encode($arr));
	exit(); 
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
 
 $rs=mysql_query("select * from $u_table ".$where." order by id desc limit $offset,$pagesize",$con);
 if ($myrow = mysql_fetch_array($rs))
 {
  $i=0;
   $allarray=array();
   do {
    $i++;
 	 if(strstr($myrow[15],'|'.$uid)){
		$myjoin=1; 
		 }else{
		$myjoin=0;	 
			 }
	 
	  $arraytmp=array(); 
 for($n=0;$n<count($liststr2);$n++){
	 
// array_push($arraytmp,'message':urlencode('ok！'));
if($liststr2[$n]=='u_name'){
	$arraytmp[$liststr2[$n]]=($myrow[$liststr2[$n]]);
	}else if($liststr2[$n]=='myjoin'){
	$arraytmp[$liststr2[$n]]=$myjoin;
	
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
