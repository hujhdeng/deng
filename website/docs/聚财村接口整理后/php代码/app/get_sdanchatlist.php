<?php


$liststr='id,sdanid,seid,reid,regtime,message';
$u_table='sdan';
$id=$_POST['id'];
$uid=$_POST['uid'];
$reid=$_POST['reid'];
if($id==''){$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('id错误！')));echo urldecode(json_encode($arr));exit(); }
 //设定每一页显示的记录数
 
$pagesize=$_POST['pagesize']; 
if($pagesize==''){$pagesize=20;}
 	
$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());}
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");
$rs=mysql_query("select * from $u_table where id=$id",$con);
$myrow = mysql_fetch_row($rs);
if(empty($myrow)){
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('甩单id错误！')));
echo urldecode(json_encode($arr));	
exit();
 }else{
$selectid=$myrow[17];
$sdanuid=$myrow[1];
$state=$myrow[5];
//if($state!=2){
//$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('非对话状态！')));
//echo urldecode(json_encode($arr));	
//exit();	
//	}
if($uid!=$selectid&&$uid!=$sdanuid){
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('发起人错误！')));
echo urldecode(json_encode($arr));	
exit();	
	}
 }



//-----------------------要获取的数据列表以上
$liststr2=explode(',',$liststr);
$u_table='sdan_chat';

$rs=mysql_query("select * from $u_table where (seid='".$reid."' or reid='".$reid."')and sdanid=".$id." order by id desc",$con);
$myrow = mysql_fetch_row($rs);
if(empty($myrow)){
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('222聊天数据空！')));
echo urldecode(json_encode($arr));	
exit();
 }else{
$joinlist=($myrow[15]);
$joinnum=($myrow[12]);	 
	 }

 //设定每一页显示的记录数
// $pagesize=50;

 //取得记录总数$rs，计算总页数用
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

 $rs=mysql_query("select * from $u_table where (seid='".$reid."' or reid='".$reid."')and sdanid=".$id." order by id desc limit $offset,$pagesize",$con);
 if ($myrow = mysql_fetch_array($rs))
 {
  $i=0;
  $allarray=array();
   do {
    $i++;
	 $arraytmp=array();
$arraytmp=array();
 for($n=0;$n<count($liststr2);$n++){
 if($liststr2[$n]!='sdanid'){
	 if($liststr2[$n]=='message'){
	$arraytmp['content']=urlencode($myrow[$n]);	 	 
		 }else{
	$arraytmp[$liststr2[$n]]=urlencode($myrow[$n]);	 
		 }
  
 }
 	}		
 
  array_push($allarray,$arraytmp);
	
    }
   while ($myrow = mysql_fetch_array($rs));
$arr = array ('apicode'=>10000,'data'=>$allarray);	
echo urldecode(json_encode($arr));
  }
  
   ?>
