﻿<?php
$liststr='id,u_name,regtime,phone,company,kpno,address,sex,old,area,keyword,industy,business,dan_count,year,cont,lnglat,followcount,followmecount,followbothcount,follow_list,avatar,logtime,lng,lat';
$u_table='sdan';
$id=$_GET["id"];//
$uid=$_GET["uid"];//
$phone = $_GET["phone"];//手机
$u_name = $_GET["username"];//用户名
$industy = $_GET["industy"];//行业
$area = $_GET["area"];     //区域
$business = $_GET["business"]; //业务种类
	 
 //设定每一页显示的记录数
 $pagesize=$_GET['pagesize'];
if($pagesize==''){ $pagesize=20;}

$where='';
if($phone!=''){$where=' where phone="'.$phone.'" ';}
if($u_name!=''){
	if($where==''){
	$where=' where u_name like "%'.$u_name.'%" ';	
		}else{
	$where=$where.' and u_name like "%'.$u_name.'%" ';		
		}
	}
if($industy!=''){
	if($where==''){
	$where=' where industy like "%'.$industy.'%" ';	
		}else{
	$where=$where.' and industy like "%'.$industy.'%" ';		
		}
	}
if($area!=''){
	if($where==''){
	$where=' where area like "%'.$area.'%" ';	
		}else{
	$where=$where.' and area like "%'.$area.'%" ';		
		}
	}
if($business!=''){
	if($where==''){
	$where=' where business like "%'.$business.'%" ';	
		}else{
	$where=$where.' and business like "%'.$business.'%" ';		
		}
	}	

//-----------------------要获取的数据列表以上
$liststr2=explode(',',$liststr);
$callback = $_GET["callback"];
$conn = mysql_connect("localhost","root","sanrenxing");
mysql_query("set names 'utf8'");

 mysql_select_db("jcc",$conn);
 //-----------甩单
  $rs=mysql_query("select * from sdan where id=".$id,$conn);
 $myrow = mysql_fetch_array($rs);
  if(empty($myrow)){
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('id错误！')));	
echo urldecode(json_encode($arr));	
exit();
	  }else{
 if(strstr($myrow['joinlist'],'|')!=true){
	$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('数据空！')));	
echo urldecode(json_encode($arr));	
exit(); 
	 }else{
	$idlist=explode('|',$myrow['joinlist']) ;
		 }

	  }
	  $allarray=array();
 for($i=1;$i<count($idlist);$i++){
	$uid= $idlist[$i];
	 $rs=mysql_query("select * from user where id=".$uid,$conn);
 $myrow = mysql_fetch_array($rs);
  if(empty($myrow)){
	  }else{
	  
	    $arraytmp=array(); 
 for($n=0;$n<count($liststr2);$n++){
if($liststr2[$n]=='avatar'){
$url='http://'.$_SERVER['SERVER_NAME'].$_SERVER["REQUEST_URI"]; 
$arraytmp[$liststr2[$n]]=urlencode(dirname($url)."/file/".$myrow[$liststr2[$n]]);
	}else{
	$arraytmp[$liststr2[$n]]=urlencode($myrow[$liststr2[$n]]);
	}
	
 }
 		
 	if(strstr($myfollowlist,'|'.$myrow['phone'])==true){
	$arraytmp['hasfollow']=1;	
		}else{
		$arraytmp['hasfollow']=0;	
			}
  array_push($allarray,$arraytmp);
 }
 $arr = array ('apicode'=>10000,'data'=>$allarray);	
	 }
	echo urldecode(json_encode($arr));	  
 exit(); 
 //-------获取我关注的列表
 $rs=mysql_query("select * from $u_table where id=".$uid,$conn);
 $myrow = mysql_fetch_array($rs);
  if(empty($myrow)){
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('用户错误！')));	
echo urldecode(json_encode($arr));	
exit();
	  }else{
	$myfollowlist=$myrow['follow_list'];	  
	  }
 //取得记录总数$rs，计算总页数用
  $rs=mysql_query("select * from $u_table ".$where,$conn);
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

 $rs=mysql_query("select * from $u_table ".$where." order by kpno desc limit $offset,$pagesize",$conn);
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
		
 	if(strstr($myfollowlist,'|'.$myrow['phone'])==true){
	$arraytmp['hasfollow']=1;	
		}else{
		$arraytmp['hasfollow']=0;	
			}
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
