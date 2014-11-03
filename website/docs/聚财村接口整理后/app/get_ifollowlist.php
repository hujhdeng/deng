<?php
$liststr='id,u_name,regtime,phone,company,kpno,address,sex,old,area,keyword,industy,business,dan_count,year,cont,lnglat,followcount,followmecount,followbothcount,follow_list,avatar,logtime,lng,lat';
$u_table='user';
$uid = $_POST["uid"];//uid

//-----------------------要获取的数据列表以上
$liststr2=explode(',',$liststr);
$conn = mysql_connect("localhost","root","sanrenxing");
mysql_query("set names 'utf8'");

 mysql_select_db("jcc",$conn);
 //取得记录总数$rs，计算总页数用
 $rs=mysql_query("select * from $u_table where id=".$uid,$conn);
 $myrow = mysql_fetch_array($rs);
 if(empty($myrow)){
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('用户错误！')));	
	  }else{
	$ifollowlist=$myrow["follow_list"];	  
	$ifollowlist2=explode('|',$ifollowlist)	 ;
	$allarray=array();
	for($i=1;$i<=count($ifollowlist2);$i++){
		//echo $ifollowlist2[$i].'<br/>';
		$cphone=$ifollowlist2[$i];
		if($cphone!=''){
	$rs=mysql_query("select * from $u_table where phone=".$cphone,$conn);
 $myrow = mysql_fetch_array($rs);	
	 if(empty($myrow)){
		 }else{
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
 	}		
//		
  array_push($allarray,$arraytmp);

//echo json_encode($arraytmp);
   
			 
			 }
		} 
		  
$arr = array ('apicode'=>10000,'data'=>$allarray);
	  }
echo urldecode(json_encode($arr));	 
   ?>
