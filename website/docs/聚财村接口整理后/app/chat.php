<?php
$liststr='id,lei,title,picpath,eara,money,huxing,dir,zhuang,fdate,step,txt,tel,adr,lnglat';
$u_table='house';
$lei = $_GET["lei"];
$where='';
if($lei==1){$where=' where lei=1 ';}
if($lei==2){$where=' where lei=2 ';}
//-----------------------要获取的数据列表以上
$liststr2=explode(',',$liststr);
$callback = $_GET["callback"];
$conn = mysql_connect("localhost","root","sanrenxing");
mysql_query("set names 'utf8'");
 //设定每一页显示的记录数
 $pagesize=3;
 mysql_select_db("nanxi",$conn);
 //取得记录总数$rs，计算总页数用
 $rs=mysql_query("select count(*) from travel",$conn);
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
 $rs=mysql_query("select * from $u_table $where order by id desc limit $offset,$pagesize",$conn);
 if ($myrow = mysql_fetch_array($rs))
 {
  $i=0;
   do {
    $i++;
	 $arraytmp=array();
for($n=0;$n<count($liststr2);$n++){
	 array_push($arraytmp,urlencode($myrow[$liststr2[$n]]));
	}		
		
	 array_push($jsontxt,$arraytmp);
    }
   while ($myrow = mysql_fetch_array($rs));
$jsontxt2=(json_encode($jsontxt));
echo "$callback($jsontxt2)";
  }
   ?>
