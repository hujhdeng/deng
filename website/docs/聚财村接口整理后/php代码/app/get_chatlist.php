<?php
$liststr='id,seid,reid,regtime,content';
$u_table='chat';
$seid = $_POST["seid"];//发信
$reid = $_POST["reid"];//收信


 //设定每一页显示的记录数
 $pagesize=$_POST['pagesize'];
if($pagesize==''){ $pagesize=20;}

//$where=' where seid='.$seid.' or seid='.$reid.' or reid='.$seid.' or reid='.$reid;
$where=' where (seid='.$seid.' and reid='.$reid.') or (seid='.$reid.' and reid='.$seid.')';
//-----------------------要获取的数据列表以上
$liststr2=explode(',',$liststr);
$callback = $_POST["callback"];
$conn = mysql_connect("localhost","root","sanrenxing");
mysql_query("set names 'utf8'");

 mysql_select_db("jcc",$conn);
 //取得记录总数$rs，计算总页数用
 $rs=mysql_query("select * from $u_table ".$where,$conn);
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

 $rs=mysql_query("select * from $u_table ".$where." order by id desc limit $offset,$pagesize",$conn);
 if ($myrow = mysql_fetch_array($rs))
 {
  $i=0;
   $allarray=array();
   do {
    $i++;
 	 
	  $arraytmp=array(); 
 for($n=0;$n<count($liststr2);$n++){
	 
// array_push($arraytmp,'message':urlencode('ok！'));
  $arraytmp[$liststr2[$n]]=urlencode($myrow[$liststr2[$n]]);
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
