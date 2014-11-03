<?php
$liststr='id,uid,u_name,phone,regtime,state,type,partytime,city,area,adr,membernum,joinnum,title,content,joinlist,myjoin';
$u_table='party';
$uid=$_GET['uid'];
$mysendid=$_GET['mysendid'];
$myjoinid=$_GET['myjoinid'];
$type=$_GET['type'];
$city=$_GET['city'];
$area=$_GET['area'];
$nowtime=date('Y-m-d H:i:s',time());
 //设定每一页显示的记录数
$pagesize=$_GET['pagesize']; 
if($pagesize==''){$pagesize=20;}
$where='';
if($mysendid!=''){
	$where=$where." where uid='".$mysendid."'";
   }else if($myjoinid!=''){
	$where=$where." where joinlist like '%|".$myjoinid."%' ";
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
if($city!=''){
	if($where==''){
	$where=$where." where city like '%".$city."%'";	
		}else{
	$where=$where." and city like '%".$city."%'";
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
// echo "select * from $u_table ".$where." order by id desc";
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
// echo "select * from $u_table ".$where." order by id desc limit $offset,$pagesize";
 $rs=mysql_query("select * from $u_table ".$where." order by id desc limit $offset,$pagesize",$con);
 if ($myrow = mysql_fetch_array($rs))
 {
  $i=0;
   $allarray=array();
   $timeoutidlist='';
   do {
    $i++;
 	if(strstr($myrow[15],'|'.$uid)==true){
		$myjoin=1;
		}else{
		$myjoin=0;
		} 
	  $arraytmp=array(); 
	  $overtime='0' ;
 for($n=0;$n<count($liststr2);$n++){
	 
// array_push($arraytmp,'message':urlencode('ok！'));
 if($liststr2[$n]=='u_name'){
	$arraytmp[$liststr2[$n]]=($myrow[$liststr2[$n]]); 
 }else if($liststr2[$n]=='myjoin'){
	 $arraytmp[$liststr2[$n]]=$myjoin; 
	 
	 }else{
		 if($liststr2[$n]=='partytime'){
			$partytime=($myrow[$liststr2[$n]]);
			 if(strtotime($partytime)<strtotime($nowtime)){
				
			 $timeoutidlist=$timeoutidlist.'|'.$myrow[0];
			 	$overtime='1' ;
				 }
			 }
  $arraytmp[$liststr2[$n]]=urlencode($myrow[$liststr2[$n]]);	 
	 }

 	}		
	if($overtime=='1'){$arraytmp['state']=0;}	
  array_push($allarray,$arraytmp);
$overtime='0' ;
//echo json_encode($arraytmp);
   }
   
   while ($myrow = mysql_fetch_array($rs));
//过期的
if($timeoutidlist!=''){
	$idlist=explode('|',$timeoutidlist);
	for($i=1;$i<=count($idlist);$i++){
	$idtmp=$idlist[$i];	
	$sql="update $u_table set state='0' where id='".$idtmp."'";
mysql_query($sql);
		
		}
	}

$arr = array ('apicode'=>10000,'data'=>$allarray);	
  }else{
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('数据空！')));	
	  }
echo urldecode(json_encode($arr));	  
   ?>
