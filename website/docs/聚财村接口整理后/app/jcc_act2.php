<?php 
date_default_timezone_set(PRC); 
$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());} 
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");

//-----------------------以上为公共数据库连接
$act=$_GET['act'];
switch ($act)
{
case 'wx_userlog':
  wx_userlog("wx");
  break;	
case 'wx_joinparty':
  wx_joinparty("wx");
  break;	
case 'wx_userreg':
  wx_userreg("wx");
  break;	
case 'wx_resetpwd':
  wx_resetpwd();
  break;	
case 'wx_joinsdan':
  wx_joinsdan();
  break;	
case 'update_lnglat':
  update_lnglat();
  break;	
case 'setinfo':
  setinfo();
  break;		
case 'getabout':
  getabout();
  break;		
case 'tousu':
  tousu();
  break;	
case 'delete_follow':
  delete_follow();
  break;	
case 'add_follow':
  add_follow('','','');
  break;	
case 'add_chat':
  add_chat();
  break;	
case 'delete_party':
  delete_party();
  break;
case 'sdan_assess':
  sdan_assess();
  break;		
case 'sdan_addchat':
  sdan_addchat();
  break;	
case 'sdan_deleteconnect':
  sdan_deleteconnect();
  break;	
case 'sdan_connect':
  sdan_connect();
  break;	
case 'join_sdan':
  join_sdan("","");
  break;	
case 'get_sdaninfo':
  get_sdaninfo();
  break;	
case 'add_sdan':
  add_sdan();
  break;	
case 'deletejoin_party':
  deletejoin_party();
  break;	
case 'join_party':
  join_party();
  break;	
case 'get_partyinfo':
  get_partyinfo();
  break;	
case 'add_party':
  add_party();
  break;		
case 'updatepwd':
  updatepwd('');
  break;	
case 'get_userinfo':
  get_userinfo();
  break;	
case 'add_userinfo':
  add_userinfo();
  break;	
case 'getver':
  getver();
  break;	
case 'suggest':
  suggest();
  break;	
case 'user_log':
  user_log();
  break;	
case 'user_reg':
  user_reg("");
  break;		
  }
?>
<?php
function wx_userlog(){
$u_table='user';
$liststr='u_name,phone,u_pwd,logtime';
$lng=$_GET['lng'];
$lat=$_GET['lat'];

//----------定义表名和键列表两个后面为标准的

$u_name=$_GET['u_name'];
$phone=$_GET['phone'];
$u_pwd=$_GET['u_pwd'];
$logtime=date('Y-m-d H:i:s',time());


$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());}
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");
 $rs=mysql_query("select * from $u_table where phone='$phone' ",$con);

  $myrow = mysql_fetch_array($rs);
 
 if(empty($myrow)){
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('用户名错误！')));
 }else{
if($myrow[2]==$u_pwd){
	$wxuid=$myrow[0];
	$uid=$_GET['uid'];
 $rs=mysql_query("select * from $u_table where id='$uid' ",$con);
 $wxfollowphone=$myrow[4];
//$url='http://'.$_SERVER['SERVER_NAME'].$_SERVER["REQUEST_URI"]; 
//$avatar=urlencode(dirname($url)."/file/".$myrow[22]);
//$arr = array ('apicode'=>10000,
//'data'=>array (
//'uid'=>$myrow[0],
//'u_name'=>urlencode($myrow[1]),
//'regtime'=>urlencode($myrow[3]),
//'phone'=>urlencode($myrow[4]),
//'company'=>urlencode($myrow[5]),
//'kpno'=>urlencode($myrow[6]),
//'address'=>urlencode($myrow[7]),
//'sex'=>urlencode($myrow[8]),
//'old'=>urlencode($myrow[9]),
//'area'=>urlencode($myrow[10]),
//'keyword'=>urlencode($myrow[11]),
//'industy'=>urlencode($myrow[12]),
//'business'=>urlencode($myrow[13]),
//'dan_count'=>urlencode($myrow[14]),
//'year'=>urlencode($myrow[15]),
//'cont'=>urlencode($myrow[16]),
//'lnglat'=>urlencode($myrow[17]),
//'followcount'=>urlencode($myrow[18]),
//'followmecount'=>urlencode($myrow[19]),
//'followbothcount'=>urlencode($myrow[20]),
//'follow_list'=>urlencode($myrow[21]),
//'avatar'=>$avatar,
//'lng'=>$lng,
//'lat'=>$lat,
//'user_joinnum'=>$myrow[0],
//)
//);
//$rs=mysql_query("select COUNT(*) from user where id<".$myrow[0],$con);
//$myrow = mysql_fetch_array($rs);
//$user_joinnum=$myrow[0];
//$arr['data']['user_joinnum']=$user_joinnum;
//if($lng>0&&$lng!=''){
// $sql="update $u_table set lng='".$lng."',lat='".$lat."',logtime='".$logtime."' where phone='$phone'";
//mysql_query($sql);
//	}	

add_follow("wx",$wxuid,$wxfollowphone);
	}else{
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('密码错误！')));
$callback=$_GET['callback'];
echo  $callback."(".urldecode(json_encode($arr)).")";	
exit();		
		}	
	 
	 }


}

function wx_joinparty(){
	$u_table='user';
$liststr='u_name,phone,u_pwd,logtime';
$arr="";

//----------定义表名和键列表两个后面为标准的
$callback=$_GET['callback'];
$u_name=$_GET['u_name'];
$phone=$_GET['phone'];
$u_pwd=$_GET['u_pwd'];
$logtime=date('Y-m-d H:i:s',time());

$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());}
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");
 $rs=mysql_query("select * from $u_table where phone='$phone' ",$con);

  $myrow = mysql_fetch_array($rs);
 
 if(empty($myrow)){
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('用户名错误！')));
 }else{
if($myrow[2]==$u_pwd){
	$uid=$myrow[0];

	}else{
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('密码错误！').$myrow[2]."|".$u_pwd));	
		}	
	 
	 }
if($arr!=""){
echo  $callback."(".urldecode(json_encode($arr)).")";	
exit();
	}else{
join_party("wx",$uid);		
		}


}

function wx_userreg(){
	user_reg("wx");
}
function wx_resetpwd(){
	updatepwd("wx");
}
function wx_joinsdan(){
$u_table='user';
$liststr='u_name,phone,u_pwd,logtime';
$arr="";

//----------定义表名和键列表两个后面为标准的
$callback=$_GET['callback'];
$u_name=$_GET['u_name'];
$phone=$_GET['phone'];
$u_pwd=$_GET['u_pwd'];
$logtime=date('Y-m-d H:i:s',time());


$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());}
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");
 $rs=mysql_query("select * from $u_table where phone='$phone' ",$con);

  $myrow = mysql_fetch_array($rs);
 
 if(empty($myrow)){
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('用户名错误！')));
 }else{
if($myrow[2]==$u_pwd){
	$uid=$myrow[0];


	}else{
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('密码错误！')));	
	
		}	
	 
	 }
if($arr!=""){
echo  $callback."(".urldecode(json_encode($arr)).")";	
exit();
	}else{
join_sdan("wx",$uid);		
		}


}
//wx_joinsdan&id=<?php echo $id; ? >&message=<?php echo $content; ? >&phone='+phone+'&u_pwd='+u_pwd+
//------------------------------------------------------- jcc
//更新经纬度
function update_lnglat(){
$lng=$_GET['lng'];
$lat=$_GET['lat'];
$uid=$_GET['uid'];
$u_table='user';
$logtime=date('Y-m-d H:i:s',time());
$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());} 
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");

$sql="update $u_table set lng='".$lng."',lat='".$lat."',logtime='".$logtime."' where id='$uid'";
mysql_query($sql);	
$arr = array ('apicode'=>10000);
echo urldecode(json_encode($arr));	
	}

//------添加关于
function setinfo(){
$u_table='user';
//----------定义表名和键列表两个后面为标准的
$uid=$_GET['uid'];
$alert=$_GET['alert'];
$locat=$_GET['locat'];
$alert2=$_GET['alert2'];
//--------------------------------以上值和liststr对应

$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());}
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");
$where='';
if($alert!=''){$where=" alert='".$alert."' "; }
if($locat!=''){
	if($where!=''){
	$where=$where.", locat='".$locat."' ";	
		}else{
	$where=" locat='".$locat."' ";		
			}
	}
if($alert2!=''){

	if($where!=''){
	$where=$where.", alert2='".$alert2."' ";	
		}else{
	$where=" alert2='".$alert2."' ";		
			}
	}	
if($where!=''){
	$sql="update $u_table set ".$where." where id=".$uid;
mysql_query($sql);
$arr = array ('apicode'=>10000);
	}else{
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('数据空！')));		
		}
echo urldecode(json_encode($arr));		
} 
function getver(){
$u_table='info';
//----------定义表名和键列表两个后面为标准的
//$ver=$_GET['ver'];

//--------------------------------以上值和liststr对应

$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());}
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");
 $rs=mysql_query("select * from $u_table",$con);
  $i=0;
  $myrow = mysql_fetch_array($rs);
 
// if( $myrow[1]!=$ver){
//$arr = array ('apicode'=>10001,'data'=>array ('appurl'=>urlencode('http://bbs.cd360.com/')));
// }else{
$arr = array ('apicode'=>10000,'data'=>array ('ver'=>$myrow[1],'androidpath'=>$myrow[7],'iospath'=>$myrow[8])); 
	// }
echo urldecode(json_encode($arr));		
} 
//------获取关于信息
function getabout(){
$u_table='info';
//----------定义表名和键列表两个后面为标准的
//$ver=$_GET['ver'];

//--------------------------------以上值和liststr对应

$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());}
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");
 $rs=mysql_query("select * from $u_table",$con);
  $myrow = mysql_fetch_array($rs);
 
// if( $myrow[1]!=$ver){
//$arr = array ('apicode'=>10001,'data'=>array ('appurl'=>urlencode('http://bbs.cd360.com/')));
// }else{

$arr = array ('apicode'=>10000,'data'=>array ('ver'=>$myrow[1],'androidpath'=>$myrow[7],'iospath'=>$myrow[8],'alert'=>$myrow[2],'locat'=>$myrow[3])); 
	// }
echo urldecode(json_encode($arr));		
} 
//--------------------------------投诉建议
 function tousu(){

$u_table='tousu';
$seid=$_GET['seid'];
$reid=$_GET['reid'];
$type=$_GET['type'];
$content=$_GET['content'];

//---------------------------

$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());}
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");

$regtime=$regtime=date('Y-m-d H:i:s',time());

$sqlstr="INSERT INTO ".$u_table.' (seid,reid,regtime,content,type) VALUES ("'.$seid.'","'.$reid.'","'.$regtime.'","'.$content.'","'.$type.'")';
mysql_query($sqlstr);
   $arr = array ('apicode'=>10000);
echo urldecode(json_encode($arr));

//echo "<script>alert('添加成功！');</ script>";		
}
//-------------------------------------------取消关注
 function delete_follow(){
$u_table='user';
//----------定义表名和键列表两个后面为标准的
$uid=$_GET['uid'];
$followphone=$_GET['followphone'];
//--------------------------------以上值和liststr对应

$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());}
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");


 $rs=mysql_query("select * from $u_table where id=$uid",$con);
 $myrow = mysql_fetch_array($rs);
 
 if(empty($myrow)){
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('用户错误！')));	

	  }else{
	  
$myphone= $myrow[4];		  
$followcount= $myrow[18];
$followmecount= $myrow[19];
$followbothcount= $myrow[20];
$follow_list= $myrow[21];
if(strstr($follow_list,'|'.$followphone)==''){
	$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('没有关注过！')));
	echo urldecode(json_encode($arr));
	exit();
	}else{
	//查询是否被对方关注过
$rs=mysql_query("select * from $u_table where phone='$followphone' ",$con);
$myrow = mysql_fetch_array($rs);
$kpno2= $myrow[6];
$followmecount2= $myrow[19];
$followbothcount2= $myrow[20];	
$follow_list2= $myrow[21];

if(strstr($follow_list2,'|'.$myphone)!=''){	
//对方的关注列表有我，即为相互关注
$followbothcount--;
$followbothcount2--;
}
$followcount--;
$follow_list=str_replace('|'.$followphone,'',$follow_list);
//$follow_list=$follow_list.'|'.$followphone;
$sql="update $u_table set followcount='".$followcount."',followbothcount='".$followbothcount."',follow_list='".$follow_list."' where id='$uid'";
mysql_query($sql);	
//写对方
$followmecount2--;
$kpno2=$kpno2-1;

$sql="update $u_table set followmecount='".$followmecount2."',followbothcount='".$followbothcount2."',kpno='".$kpno2."' where phone='$followphone'";
mysql_query($sql);	

	}

$arr = array ('apicode'=>10000);	  
		
}
 
echo urldecode(json_encode($arr));

//echo "<script>alert('添加成功！');</ script>";		
} 
//-------------------------------------------添加关注
 function add_follow($strtmp,$wxuid,$wxfollowphone){
$u_table='user';
//----------定义表名和键列表两个后面为标准的
$uid=$_GET['uid'];
$followphone=$_GET['followphone'];
if($strtmp=='wx'){
	$uid=$wxuid;
	$followphone=$wxfollowphone;
	}

//--------------------------------以上值和liststr对应

$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());}
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");

 $rs=mysql_query("select * from $u_table where id=$uid",$con);		

 $myrow = mysql_fetch_array($rs);
 
 if(empty($myrow)){
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('用户错误！')));	

	  }else{
	  
$myphone= $myrow[4];		  
$followcount= $myrow[18];
$followmecount= $myrow[19];
$followbothcount= $myrow[20];
$follow_list= $myrow[21];
if(strstr($follow_list,'|'.$followphone)!=''){
	$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('已关注过！')));
	echo urldecode(json_encode($arr));
	exit();
	}else{
	//查询是否被对方关注过
	
$rs=mysql_query("select * from $u_table where phone='$followphone' ",$con);
$myrow = mysql_fetch_array($rs);
$kpno2= $myrow[6];
$followmecount2= $myrow[19];
$followbothcount2= $myrow[20];	
$follow_list2= $myrow[21];
if(strstr($follow_list2,'|'.$myphone)!=''){	
//对方的关注列表有我，即为相互关注
$followbothcount++;
$followbothcount2++;
}
$followcount++;
$follow_list=$follow_list.'|'.$followphone;
$sql="update $u_table set followcount='".$followcount."',followbothcount='".$followbothcount."',follow_list='".$follow_list."' where id='$uid'";
mysql_query($sql);	
//写对方
$followmecount2++;
$kpno2=$kpno2+1;
$sql="update $u_table set followmecount='".$followmecount2."',followbothcount='".$followbothcount2."',kpno='".$kpno2."' where phone='$followphone'";
mysql_query($sql);	

	}

$arr = array ('apicode'=>10000);	  
		
}
 
if($strtmp=='wx'){
$callback=$_GET['callback'];
echo  $callback."(".urldecode(json_encode($arr)).")";	
exit();	}else{
echo urldecode(json_encode($arr));	
	}
//echo "<script>alert('添加成功！');</ script>";		
} 
//-------------------------添加聊天记录
function add_chat(){
$u_table='chat';
$liststr='seid,reid,content,regtime,u_name,kpno,avatar';
$seid=$_GET['seid'];
$reid=$_GET['reid'];
$content=$_GET['content'];
$regtime=$regtime=date('Y-m-d H:i:s',time());

$uname=$_GET['uname'];
$avatar=$_GET['avatar'];
//---------------------------百度云推送
//        $ch = curl_init();
//
//
//
//	$sinfo='{"type":"1","message":{"uid":"'.$seid.'","uname":"'.$uname.'","avatar":"'.$avatar.'","content":"'.$content.'","sdid":"","sduid":""}}';
//
//        // 2. 设置请求选项, 包括具体的url
//        curl_setopt($ch, CURLOPT_URL, "http://jucaicun.com:8080/jcc/push?act=push&uid=".$reid."&msg=".$sinfo);
//        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
//        curl_setopt($ch, CURLOPT_HEADER, 0);
//
//        // 3. 执行一个cURL会话并且获取相关回复
//        $response = curl_exec($ch);
//        // 4. 释放cURL句柄,关闭一个cURL会话
//        curl_close($ch);	
//-----------------------------
$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());}
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");
$rs=mysql_query("select * from user where id=".$seid,$con);
$myrow = mysql_fetch_array($rs);
if(empty($myrow)){}else{
	$seu_name=$myrow[1];
	$sekpno=$myrow[6];
	$seavatar=$myrow[22];
	}
$rs=mysql_query("select * from user where id=".$reid,$con);
$myrow = mysql_fetch_array($rs);
if(empty($myrow)){}else{
	$reu_name=$myrow[1];
	$rekpno=$myrow[6];
	$reavatar=$myrow[22];
	$alert=$myrow['alert'];
	}	
//----------定义表名和键列表两个后面为标准的
$liststr2=explode(',',$liststr);
$liststr4=" ";
for($i=0;$i<count($liststr2);$i++){if($i==0){$liststr4=$liststr4.' "'.${$liststr2[$i]}.'"';}else{$liststr4=$liststr4.',"'.${$liststr2[$i]}.'"';}}
$liststr3='('.$liststr.') VALUES ('.$liststr4.')';	
$sqlstr="INSERT INTO ".$u_table.$liststr3;
mysql_query($sqlstr);
$danid=mysql_insert_id();
//写入
$u_table='chat_user';
$rs=mysql_query("select * from $u_table where seid=".$seid." and reid=".$reid,$con);
$myrow = mysql_fetch_array($rs);
$hasread=1;
$hehasread=0;
if(empty($myrow)){
$sql="INSERT INTO ".$u_table.' (
seid,reid,regtime,lastcontent,u_name,kpno,avatar,hasread,hehasread) VALUES 
("'.$seid.'","'.$reid.'","'.$regtime.'","'.$content.'","'.$seu_name.'","'.$sekpno.'","'.$seavatar.'","'.$hasread.'","'.$hehasread.'")';	
	}else{
$sql="update $u_table set regtime='".$regtime."',lastcontent='".$content."',u_name='".$seu_name."',kpno='".$sekpno."',avatar='".$seavatar."',hasread='".$hasread."',hehasread='".$hehasread."' where seid=".$seid." and reid=".$reid;
		}
mysql_query($sql);

//-----对方
$hasread=0;
$hehasread=1;
$rs=mysql_query("select * from $u_table where seid=".$reid." and reid=".$seid,$con);
$myrow = mysql_fetch_array($rs);
if(empty($myrow)){
$sql="INSERT INTO ".$u_table.' (seid,reid,regtime,lastcontent,u_name,kpno,avatar,hasread,hehasread) VALUES ("'.$reid.'","'.$seid.'","'.$regtime.'","'.$content.'","'.$reu_name.'","'.$rekpno.'","'.$reavatar.'","0","1")';	
	}else{
$sql="update $u_table set regtime='".$regtime."',lastcontent='".$content."',u_name='".$ren_name."',kpno='".$rekpno."',avatar='".$reavatar."',hasread='0',hehasread='1' where seid=".$reid." and reid=".$seid;


		}
mysql_query($sql);

$u_table='chat';
$sql="INSERT INTO ".$u_table.' (seid,reid,regtime,content) VALUES ("'.$seid.'","'.$reid.'","'.$regtime.'","'.$content.'")';
mysql_query($sql);
//---------------------------百度云推送
if($alert=="1"){
        $ch = curl_init();
	$sinfo='{"type":"1","message":{"uid":"'.$seid.'","uname":"'.$uname.'","avatar":"'.$avatar.'","content":"'.$content.'","sdid":"","sduid":""}}';

        // 2. 设置请求选项, 包括具体的url
        curl_setopt($ch, CURLOPT_URL, "http://jucaicun.com:8080/jcc/push?act=push&uid=".$reid."&msg=".$sinfo);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_HEADER, 0);

        // 3. 执行一个cURL会话并且获取相关回复
        $response = curl_exec($ch);
        // 4. 释放cURL句柄,关闭一个cURL会话
        curl_close($ch);
}
//-----------------------------
$arr = array ('apicode'=>10000); 


echo urldecode(json_encode($arr));

		
}
//--------------------------------甩单人评价打分并结束甩单 靠谱指数+5
function sdan_assess(){
$u_table='sdan';
$id=$_GET['id'];
$uid=$_GET['uid'];
$assessnum=$_GET['assessnum'];
$assesstxt=$_GET['assesstxt'];
if($id==''){$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('甩单id错误！')));echo urldecode(json_encode($arr));exit(); }
//---------------------------

$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());}
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");
$rs=mysql_query("select * from $u_table where id=$id",$con);
$myrow = mysql_fetch_array($rs);
if(empty($myrow)){
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('甩单id错误！')));
 }else{
if($myrow[1]!=$uid){
	$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('非甩单人！')));
	}else if($myrow[5]==0||$myrow[5]==1){
	$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('无接洽人或已被关闭！')));
	}else{	 	 
$state=0;
$selectid=$myrow['selectid'];	 
$sql="update $u_table set assessnum='".$assessnum."',assesstxt='".$assesstxt."',state='".$state."' where id='$id'";
mysql_query($sql);
	 
$u_table='user';
$rs=mysql_query("select * from $u_table where id=$uid",$con);
$myrow = mysql_fetch_array($rs);
$kpno=$myrow[6]+5;
$sql="update $u_table set kpno='".$kpno."' where id='$uid'";
mysql_query($sql);
if($assessnum==1){
	$saddno=-5;
	}else if($assessnum==3){
	$saddno=5;	
	}else{
	$saddno=0;	
		}
	if($saddno!=0){
$u_table='user';
$rs=mysql_query("select * from $u_table where id=$selectid",$con);
$myrow = mysql_fetch_array($rs);
$kpno=$myrow[6]+$saddno;
$sql="update $u_table set kpno='".$kpno."' where id='$selectid'";
mysql_query($sql);		
		
		}
 $arr = array ('apicode'=>10000,'data'=>array ('kpno'=>$kpno));
	
}
 }
echo urldecode(json_encode($arr));

//echo "<script>alert('添加成功！');</ script>";		
} 


//--------------------------------甩单提交聊天接洽
function sdan_addchat(){
$u_table='sdan';
$id=$_GET['id'];
$seid=$_GET['seid'];
$reid=$_GET['reid'];
$message=$_GET['message'];

$uname=$_GET['uname'];
$avatar=$_GET['avatar'];
$sduid=$_GET['sduid'];
if($id==''){$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('甩单id错误！')));echo urldecode(json_encode($arr));exit(); }
//---------------------------

/*//---------------------------百度云推送

	$sinfo='{"type":"1","message":{"uid":"'.$seid.'","uname":"'.$uname.'","avatar":"'.$avatar.'","content":"'.$message.'","sdid":"'.$id.'","sduid":"'.$sduid.'"}}';
	
        $ch = curl_init();

        // 2. 设置请求选项, 包括具体的url
        curl_setopt($ch, CURLOPT_URL, "http://jucaicun.com:8080/jcc/push?act=push&uid=".$reid."&msg=".$message);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_HEADER, 0);

        // 3. 执行一个cURL会话并且获取相关回复
        $response = curl_exec($ch);
        // 4. 释放cURL句柄,关闭一个cURL会话
        curl_close($ch);	
//-----------------------------*/

$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());}
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");
$rs=mysql_query("select * from $u_table where id=$id",$con);
$myrow = mysql_fetch_array($rs);
if(empty($myrow)){
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('甩单id错误！')));
 }else{
$sdanid=$id;	 
$sdanuid=($myrow[1]);
$state=($myrow[5]);
$selectid=($myrow[17]);
	
if($sdanuid!=$seid&&$sdanuid!=$reid){
	$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('发起人错误！')));echo urldecode(json_encode($arr));exit();
	}
$u_table='user';	
$rs=mysql_query("select * from $u_table where id=$reid",$con);
$myrow = mysql_fetch_array($rs);
$alert2=$myrow['alert2'];

 $u_table='sdan_chat';

	  $regtime=$regtime=date('Y-m-d H:i:s',time());
	  $liststr='sdanid,seid,reid,regtime,message';
	  $liststr4='"'.$sdanid.'","'.$seid.'","'.$reid.'","'.$regtime.'","'.$message.'"';
	  $liststr3='('.$liststr.') VALUES ('.$liststr4.')';	
	  
$sqlstr="INSERT INTO ".$u_table.$liststr3;
	mysql_query($sqlstr);	
//---------------------	
$u_table='sdan_chat_user';	
$rs=mysql_query("select * from $u_table where sdanid=".$id." and reid=".$reid,$con);	
$myrow = mysql_fetch_array($rs);
if(empty($myrow)){
$sql="INSERT INTO ".$u_table.' (sdanid,reid,regtime,lastcontent) VALUES ("'.$id.'","'.$reid.'","'.$regtime.'","'.$message.'")';	
	}else{
$sql="update $u_table set regtime='".$regtime."',lastcontent='".$message."' where sdanid=".$id;	
	}
mysql_query($sql);	
   $arr = array ('apicode'=>10000,'data'=>array ('seid'=>$seid,'reid'=>$reid));
	
}
 //---------------------------百度云推送

if($alert2!="0"||$sdanuid==$seid){
	$sinfo='{"type":"2","message":{"uid":"'.$seid.'","uname":"'.$uname.'","avatar":"'.$avatar.'","content":"'.$message.'","sdid":"'.$id.'","sduid":"'.$sduid.'"}}';
	
        $ch = curl_init();

        // 2. 设置请求选项, 包括具体的url
        curl_setopt($ch, CURLOPT_URL, "http://jucaicun.com:8080/jcc/push?act=push&uid=".$reid."&msg=".$sinfo);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_HEADER, 0);

        // 3. 执行一个cURL会话并且获取相关回复
        $response = curl_exec($ch);
        // 4. 释放cURL句柄,关闭一个cURL会话
        curl_close($ch);
}
//-----------------------------
echo urldecode(json_encode($arr));

//echo "<script>alert('添加成功！');</ script>";		
} 

//--------------------------------甩单是删除所有接洽
function sdan_deleteconnect(){
$u_table='sdan';
$id=$_GET['id'];
$uid=$_GET['uid'];
if($id==''){$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('甩单id错误！')));echo urldecode(json_encode($arr));exit(); }
//---------------------------

$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());}
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");
$rs=mysql_query("select * from $u_table where id=$id",$con);
$myrow = mysql_fetch_array($rs);
if(empty($myrow)){
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('甩单id错误！')));
 }else{
$sdanuid=($myrow[1]);
$joinlist=($myrow[15]);
$joinnum=($myrow[16]);
if($sdanuid!=$uid){
	$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('非甩单发起人！')));echo urldecode(json_encode($arr));exit(); 
	}	
	$selectid='';
	$state=1;
	$sql="update $u_table set selectid='".$selectid."',state='".$state."' where id='$id'";
	mysql_query($sql);	
   $arr = array ('apicode'=>10000,'data'=>array ('id'=>$id));
	
}
 
echo urldecode(json_encode($arr));

//echo "<script>alert('添加成功！');</ script>";		
} 

//--------------------------------甩单接洽
function sdan_connect(){
$u_table='sdan';
$id=$_GET['id'];
$uid=$_GET['uid'];
$reid=$_GET['reid'];
if($id==''){$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('甩单id错误！')));echo urldecode(json_encode($arr));exit(); }
//---------------------------

$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());}
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");
$rs=mysql_query("select * from $u_table where id=$id",$con);
$myrow = mysql_fetch_array($rs);
if(empty($myrow)){
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('甩单id错误！')));
 }else{
$sdanuid=($myrow[1]);
$joinlist=($myrow[15]);
$joinnum=($myrow[16]);
if($sdanuid!=$uid){
	$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('非甩单发起人！')));echo urldecode(json_encode($arr));exit(); 
	}
if(strstr($joinlist,'|'.$reid)==''){
	$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('未申请接单！')));
	}else{
$rs=mysql_query("select * from user where id=$reid",$con);
$myrow = mysql_fetch_array($rs);
if(empty($myrow)){	
	$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('接单人错误！')));echo urldecode(json_encode($arr));exit(); 
		}else{
	$selectname=($myrow[1]);
	$selectavatar=($myrow[22]);
	}
	
	$selectid=$reid;
	$state=2;
	$sql="update $u_table set selectid='".$selectid."',state='".$state."',selectname='".$selectname."',selectavatar='".$selectavatar."' where id='$id'";
	mysql_query($sql);	
   $arr = array ('apicode'=>10000,'data'=>array ('id'=>$id,'reid'=>$reid));
		}
}
 
echo urldecode(json_encode($arr));

//echo "<script>alert('添加成功！');</ script>";		
} 

//--------------------------------申请接单
 function join_sdan($strtmp,$uidtmp){
$u_table='sdan';
$id=$_GET['id'];

if($strtmp=="wx"){$uid=$uidtmp;}else{$uid=$_GET['uid'];}
$message=$_GET['message'];
if($id==''){$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('甩单id错误！')));echo urldecode(json_encode($arr));exit(); }
//---------------------------

$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());}
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");
$rs=mysql_query("select * from $u_table where id=$id",$con);
$myrow = mysql_fetch_array($rs);
if(empty($myrow)){
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('甩单id错误！')));
 }else{
$joinlist=($myrow[15]);
$sduid=($myrow[1]);
$joinnum=($myrow[16]);
if(strstr($joinlist,'|'.$uid)!=''){
	$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('重复申请！'.$uid)));
	}else{
	$joinlist=$joinlist.'|'.$uid;
	$joinnum=$joinnum+1;
	$sql="update $u_table set joinlist='".$joinlist."',joinnum='".$joinnum."' where id='$id'";
	mysql_query($sql);
$u_table='user';	
$rs=mysql_query("select * from $u_table where id=$uid",$con);
$myrow = mysql_fetch_array($rs);		
if(empty($myrow)){
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('用户id错误！')));echo urldecode(json_encode($arr));exit();
 }else{
$u_name=$myrow[1];
$kpno=$myrow[6];
$avatar=$myrow[22];	 
 }
$sdanid=$id;
//$uid
$regtime=$regtime=date('Y-m-d H:i:s',time());
//$message
$u_table='sdan_message';

  $liststr='sdanid,uid,regtime,message,u_name,kpno,avatar';
  $liststr4='"'.$sdanid.'","'.$uid.'","'.$regtime.'","'.$message.'","'.$u_name.'","'.$kpno.'","'.$avatar.'"';
	$liststr3='('.$liststr.') VALUES ('.$liststr4.')';	
$sqlstr="INSERT INTO ".$u_table.$liststr3;
mysql_query($sqlstr);

$u_table='sdan_chat_user';
//echo "INSERT INTO ".$u_table.' (sdanid,seid,reid,regtime,lastcontent) VALUES ("'.$sdanid.'","","'.$uid.'","'.$regtime.'","'.$message.'")';
$sqlstr="INSERT INTO ".$u_table.' (sdanid,seid,reid,regtime,lastcontent) VALUES ("'.$sdanid.'","","'.$uid.'","'.$regtime.'","'.$message.'")';
mysql_query($sqlstr);

 $u_table='sdan_chat';
	  $liststr='sdanid,seid,reid,regtime,message';
	  $liststr4='"'.$sdanid.'","'.$uid.'","'.$sduid.'","'.$regtime.'","'.$message.'"';
	  $liststr3='('.$liststr.') VALUES ('.$liststr4.')';	
	  
$sqlstr="INSERT INTO ".$u_table.$liststr3;
	mysql_query($sqlstr);	

   $arr = array ('apicode'=>10000,'data'=>array ('joinnum'=>$joinnum));
		}
}
if($strtmp=="wx"){
$callback=$_GET['callback'];	
echo $callback."(".urldecode(json_encode($arr)).")";	
	}else{
echo urldecode(json_encode($arr));		
		} 


//echo "<script>alert('添加成功！');</ script>";		
} 

//--------------------------------获取甩单详情
function get_sdaninfo(){
$u_table='sdan';
$id=$_GET['id'];
$uid=$_GET['uid'];
if($id==''){$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('甩单id错误！')));echo urldecode(json_encode($arr));exit(); }
//---------------------------

$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());}
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");
$rs=mysql_query("select * from $u_table where id=$id",$con);
$myrow = mysql_fetch_array($rs);
if(empty($myrow)){
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('甩单id错误！')));
 }else{

$id=urlencode($myrow[0]);	 
$uid=urlencode($myrow[1]);
$u_name=($myrow[2]);
$phone=urlencode($myrow[3]);
$regtime=urlencode($myrow[4]);
$state=urlencode($myrow[5]);
$area=urlencode($myrow[6]);
$type=urlencode($myrow[7]);	 
$money=urlencode($myrow[8]);
$limitdate=urlencode($myrow[9]);
$howlong=urlencode($myrow[10]);
$title=urlencode($myrow[11]);
$assessnum=urlencode($myrow[12]);
$assesstxt=urlencode($myrow[13]);
$content=urlencode($myrow[14]);
$joinlist=urlencode($myrow[15]);
$joinnum=urlencode($myrow[16]);
$selectid=urlencode($myrow[17]);
$selectname=urlencode($myrow[18]);
$selectavatartmp=$myrow[19];
if($selectavatartmp!=''&&is_null($selectavatartmp)!=true){
$url='http://'.$_SERVER['SERVER_NAME'].$_SERVER["REQUEST_URI"];
$selectavatar=urlencode(dirname($url)."/file/".$myrow[19]);
}

if(strstr($joinlist,'|'.$uid)!=''){
	$myjoin=1;
	}else{
	$myjoin=0;	
		}
		
$rs=mysql_query("select * from user where id=$uid",$con);
$myrow = mysql_fetch_array($rs);		
	$sdavatar=$myrow[22];	
if($sdavatar!=''&&is_null($sdavatar)!=true){
$url='http://'.$_SERVER['SERVER_NAME'].$_SERVER["REQUEST_URI"];
$sdavatar=urlencode(dirname($url)."/file/".$sdavatar);
}

$arr = array ('apicode'=>10000,'data'=>array ('id'=>$id,'uid'=>$uid,'u_name'=>$u_name,'phone'=>$phone,'regtime'=>$regtime,'state'=>$state,'type'=>$type,'money'=>$money,'limitdate'=>$limitdate,'area'=>$area,'howlong'=>$howlong,'assessnum'=>$assessnum,'assesstxt'=>$assesstxt,'title'=>$title,'content'=>$content,'joinnum'=>$joinnum,'myjoin'=>$myjoin,'selectname'=>$selectname,'selectavatar'=>$selectavatar,'sdavatar'=>$sdavatar,'selectid'=>$selectid)); 
	 }

echo urldecode(json_encode($arr));
		
}
//-------------------------添加甩单
function add_sdan(){
$u_table='user';
$liststr='uid,u_name,phone,regtime,state,area,type,money,limitdate,howlong,title,assessnum,assesstxt,content,joinlist,joinnum';
$uid=$_GET['uid'];
$title=$_GET['title'];
$content=$_GET['content'];
$type=$_GET['type'];
$area=$_GET['area'];
$money=$_GET['money'];
$limitdate=$_GET['limitdate'];
$howlong=$_GET['howlong'];


//u_name
//phone
$regtime=$regtime=date('Y-m-d H:i:s',time());
$state=1;
//area
//type
//money
//limitdate
//howlong
//title
$assessnum='';
$assesstxt='';
//content
$joinlist='';
$joinnum=0;


//---------------------------

$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());}
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");
$rs=mysql_query("select * from $u_table where id='$uid' ",$con);
$myrow = mysql_fetch_array($rs);
 
if(empty($myrow)){
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('用户名错误！')));
 }else{
$u_name=urlencode($myrow[1]);
$phone=urlencode($myrow[4]);
//$avatar=urlencode($myrow[22]);
	
//----------定义表名和键列表两个后面为标准的
$liststr2=explode(',',$liststr);
$liststr4=" ";
for($i=0;$i<count($liststr2);$i++){if($i==0){$liststr4=$liststr4.' "'.${$liststr2[$i]}.'"';}else{$liststr4=$liststr4.',"'.${$liststr2[$i]}.'"';}}
$u_table='sdan';	
$liststr3='('.$liststr.') VALUES ('.$liststr4.')';	
$sqlstr="INSERT INTO ".$u_table.$liststr3;
mysql_query($sqlstr);
$danid=mysql_insert_id();
$arr = array ('apicode'=>10000,'data'=>array ('id'=>$danid)); 
	 }

echo urldecode(json_encode($arr));

		
}
//--------------------------------删除聚会
 function delete_party(){
$u_table='party';
$id=$_GET['id'];
$uid=$_GET['uid'];
if($id==''){$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('聚会id错误！')));echo urldecode(json_encode($arr));exit(); }
//---------------------------

$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());}
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");
$rs=mysql_query("select * from $u_table where id=$id",$con);
$myrow = mysql_fetch_array($rs);
if(empty($myrow)){
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('聚会id错误！')));
 }else{
$partyuid=($myrow[1]);	 
$joinlist=($myrow[15]);
$joinnum=($myrow[12]);
if($partyuid!=$uid){
	$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('非聚会发起人！')));
	}else{
	//$joinlist=$joinlist.'|'.$uid;
	$sqlstr="DELETE FROM $u_table WHERE id=".$id;;
    mysql_query($sqlstr);
   $arr = array ('apicode'=>10000,'data'=>array ('joinlist'=>$joinlist));
		}
}
 
echo urldecode(json_encode($arr));

//echo "<script>alert('添加成功！');</ script>";		
} 
//--------------------------------退出聚会
 function deletejoin_party(){
$u_table='party';
$id=$_GET['id'];
$uid=$_GET['uid'];
if($id==''){$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('聚会id错误！')));echo urldecode(json_encode($arr));exit(); }
//---------------------------

$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());}
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");
$rs=mysql_query("select * from $u_table where id=$id",$con);
$myrow = mysql_fetch_array($rs);
if(empty($myrow)){
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('聚会id错误！')));
 }else{
$joinlist=($myrow[15]);
$joinnum=($myrow[12]);
$state=($myrow['state']);
if(strstr($joinlist,'|'.$uid)==''){
	$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('未加入聚会！')));
	}else{
	//$joinlist=$joinlist.'|'.$uid;
	$joinlist=str_replace('|'.$uid,'',$joinlist);
	$joinnum=$joinnum-1;
	if($state==2){
			$sql="update $u_table set joinlist='".$joinlist."',joinnum='".$joinnum."',state='1' where id='$id'";
	mysql_query($sql);	
		}else{
		$sql="update $u_table set joinlist='".$joinlist."',joinnum='".$joinnum."' where id='$id'";
	mysql_query($sql);			
			}

   $arr = array ('apicode'=>10000,'data'=>array ('joinnum'=>$joinnum));
		}
}
 
echo urldecode(json_encode($arr));

//echo "<script>alert('添加成功！');</ script>";		
} 
//--------------------------------加入聚会
 function join_party($strtmp,$uidtmp){
$u_table='party';
$id=$_GET['id'];
$uid=$_GET['uid'];
if($strtmp=="wx"){$uid=$uidtmp;}else{$uid=$_GET['uid'];}
if($id==''){$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('聚会id错误！')));echo urldecode(json_encode($arr));exit(); }
//---------------------------

$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());}
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");
$rs=mysql_query("select * from $u_table where id=$id",$con);
$myrow = mysql_fetch_array($rs);
if(empty($myrow)){
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('聚会id错误！')));
 }else{
$joinlist=($myrow[15]);
$membernum=($myrow[11]);
$joinnum=($myrow[12]);
if(strstr($joinlist,'|'.$uid)!=''){
	$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('重复加入！')));
	}else{
		
	$joinlist=$joinlist.'|'.$uid;
	$joinnum=$joinnum+1;
	if($joinnum>=$membernum){
	$sql="update $u_table set joinlist='".$joinlist."',joinnum='".$joinnum."',state=2 where id='$id'";
	mysql_query($sql);		
		}else{
	$sql="update $u_table set joinlist='".$joinlist."',joinnum='".$joinnum."' where id='$id'";
	mysql_query($sql);				
			}

   $arr = array ('apicode'=>10000,'data'=>array ('joinnum'=>$joinnum));
		}
}
 
//echo urldecode(json_encode($arr));
if($strtmp=="wx"){
$callback=$_GET['callback'];	
echo $callback."(".urldecode(json_encode($arr)).")";	
	}else{
echo urldecode(json_encode($arr));		
		} 
//echo "<script>alert('添加成功！');</ script>";		
} 


//--------------------------------获取聚会详情
function get_partyinfo(){
$u_table='party';
$id=$_GET['id'];
$myuid=$_GET['uid'];
if($id==''){$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('聚会id错误！')));echo urldecode(json_encode($arr));exit(); }
//---------------------------

$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());}
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");
$rs=mysql_query("select * from $u_table where id=$id",$con);
$myrow = mysql_fetch_array($rs);
if(empty($myrow)){
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('聚会id错误！')));
 }else{
$id=urlencode($myrow[0]);	 
$uid=urlencode($myrow[1]);
$u_name=($myrow[2]);
$phone=urlencode($myrow[3]);
$regtime=urlencode($myrow[4]);
$state=urlencode($myrow[5]);
$type=urlencode($myrow[6]);
$partytime=urlencode($myrow[7]);
$city=urlencode($myrow[8]);
$area=urlencode($myrow[9]);
$adr=urlencode($myrow[10]);
$membernum=urlencode($myrow[11]);
$joinnum=urlencode($myrow[12]);
$title=urlencode($myrow[13]);
$content=urlencode($myrow[14]);
$joinlist=($myrow[15]);
if(strstr($joinlist,'|'.$myuid)==true){
	$myjoin=1;
	}else{
	$myjoin=0;	
		}

$arr = array ('apicode'=>10000,'data'=>array ('id'=>$id,'uid'=>$uid,'u_name'=>$u_name,'phone'=>$phone,'regtime'=>$regtime,'state'=>$state,'type'=>$type,'partytime'=>$partytime,'city'=>$city,'area'=>$area,'adr'=>$adr,'membernum'=>$membernum,'joinnum'=>$joinnum,'title'=>$title,'content'=>$content,'myjoin'=>$myjoin)); 
	 }

echo urldecode(json_encode($arr));
		
}
//-------------------------添加聚会
function add_party(){
$u_table='user';
$liststr='uid,u_name,phone,regtime,state,type,partytime,city,area,adr,membernum,joinnum,title,content,joinlist';
$uid=$_GET['uid'];
//$u_name=$_GET['u_name'];
//$phone=$_GET['phone'];
$regtime=date('Y-m-d H:i:s',time());
$state='1';
$type=$_GET['type'];
$partytime=$_GET['partytime'];
$city=$_GET['city'];
$area=$_GET['area'];
$adr=$_GET['adr'];
$membernum=$_GET['membernum'];
$joinnum=0;
$title=$_GET['title'];
$content=$_GET['content'];
$joinlist='';
//---------------------------

$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());}
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");
$rs=mysql_query("select * from $u_table where id='$uid' ",$con);
$myrow = mysql_fetch_array($rs);
 
if(empty($myrow)){
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('用户名错误！')));
 }else{
$u_name=urlencode($myrow[1]);
$phone=urlencode($myrow[4]);
//$avatar=urlencode($myrow[22]);
	
//----------定义表名和键列表两个后面为标准的
$liststr2=explode(',',$liststr);
$liststr4=" ";
for($i=0;$i<count($liststr2);$i++){if($i==0){$liststr4=$liststr4.' "'.${$liststr2[$i]}.'"';}else{$liststr4=$liststr4.',"'.${$liststr2[$i]}.'"';}}
$u_table='party';	
$liststr3='('.$liststr.') VALUES ('.$liststr4.')';	
//echo "INSERT INTO ".$u_table.$liststr3;
$sqlstr="INSERT INTO ".$u_table.$liststr3;
mysql_query($sqlstr);
$danid=mysql_insert_id();
$arr = array ('apicode'=>10000,'data'=>array ('id'=>$danid)); 
	 }

echo urldecode(json_encode($arr));


//echo "<script>alert('添加成功！');</ script>";		

}
function user_log(){
$u_table='user';
$liststr='u_name,phone,u_pwd,logtime';
$lng=$_GET['lng'];
$lat=$_GET['lat'];

//----------定义表名和键列表两个后面为标准的

$u_name=$_GET['u_name'];
$phone=$_GET['phone'];
$u_pwd=$_GET['password'];
$logtime=date('Y-m-d H:i:s',time());


$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());}
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");
 $rs=mysql_query("select * from $u_table where phone='$phone' ",$con);

  $myrow = mysql_fetch_array($rs);
 
 if(empty($myrow)){
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('用户名错误！')));
 }else{
if($myrow[2]==$u_pwd){
$url='http://'.$_SERVER['SERVER_NAME'].$_SERVER["REQUEST_URI"]; 
$avatar=urlencode(dirname($url)."/file/".$myrow[22]);
$arr = array ('apicode'=>10000,
'data'=>array (
'uid'=>$myrow[0],
'u_name'=>urlencode($myrow[1]),
'regtime'=>urlencode($myrow[3]),
'phone'=>urlencode($myrow[4]),
'company'=>urlencode($myrow[5]),
'kpno'=>urlencode($myrow[6]),
'address'=>urlencode($myrow[7]),
'sex'=>urlencode($myrow[8]),
'old'=>urlencode($myrow[9]),
'area'=>urlencode($myrow[10]),
'keyword'=>urlencode($myrow[11]),
'industy'=>urlencode($myrow[12]),
'business'=>urlencode($myrow[13]),
'dan_count'=>urlencode($myrow[14]),
'year'=>urlencode($myrow[15]),
'cont'=>urlencode($myrow[16]),
'lnglat'=>urlencode($myrow[17]),
'followcount'=>urlencode($myrow[18]),
'followmecount'=>urlencode($myrow[19]),
'followbothcount'=>urlencode($myrow[20]),
'follow_list'=>urlencode($myrow[21]),
'avatar'=>$avatar,
'lng'=>$lng,
'lat'=>$lat,
'user_joinnum'=>$myrow[0],
)
);
$rs=mysql_query("select COUNT(*) from user where id<=".$myrow[0],$con);
$myrow = mysql_fetch_array($rs);
$user_joinnum=$myrow[0];
$arr['data']['user_joinnum']=$user_joinnum;
if($lng>0&&$lng!=''){
 $sql="update $u_table set lng='".$lng."',lat='".$lat."',logtime='".$logtime."' where phone='$phone'";
mysql_query($sql);
	}	
	

	}else{
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('密码错误！')));		
		}	
	 
	 }

echo  urldecode(json_encode($arr));


//echo "<script>alert('添加成功！');</ script>";		
}

function user_reg($strtmp){
$u_table='user';
$liststr='u_name,phone,u_pwd,regtime,kpno,dan_count,followcount,followmecount,followbothcount,follow_list,lng,lat';

//----------定义表名和键列表两个后面为标准的

$u_name=$_GET['u_name'];
$phone=$_GET['phone'];
if($strtmp=="wx"){
	$u_pwd=$_GET['u_pwd'];
	}else{
	$u_pwd=$_GET['password'];
	}

$yzm=$_GET['yzm'];
$regtime=date('Y-m-d H:i:s',time());
$lng=$_GET['lng'];
$lat=$_GET['lat'];

$kpno=60;
$dan_count=0;
$followcount=0;
$followmecount=0;
$followbothcount=0;
$follow_list=''; //我关注的人
//--------------------------------以上值和liststr对应
$liststr2=explode(',',$liststr);
$liststr4=" ";
for($i=0;$i<count($liststr2);$i++){if($i==0){$liststr4=$liststr4.' "'.${$liststr2[$i]}.'"';}else{$liststr4=$liststr4.',"'.${$liststr2[$i]}.'"';}}	
$liststr3='('.$liststr.') VALUES ('.$liststr4.')';

$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());}
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");
 $yzmerror=0; 
 $rs=mysql_query("select * from yzm where phone='$phone' ",$con);
  $myrow = mysql_fetch_array($rs);
 if(empty($myrow)){
	$yzmerror=1; 
 }else{
	if($myrow[2]!=$yzm){
		$yzmerror=1;
		} 
	 }
	if($yzmerror==1){
	$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('验证码错误！')));	
		}else{
	 
 $rs=mysql_query("select * from $u_table where phone='$phone' ",$con);
  $myrow = mysql_fetch_array($rs);
 
 if(empty($myrow)){
	 
 
$sqlstr="INSERT INTO ".$u_table.$liststr3;
mysql_query($sqlstr);
$uid=mysql_insert_id();
$arr = array ('apicode'=>10000,'data'=>array ('uid'=>$uid));
	  }else{
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('电话已经注册过！')));	
	  
		  }
//$jsontxt2=urldecode(json_encode($jsontxt));  
// $jsontxt["callback"]=1;   
}
 

if($strtmp=="wx"){
	$callback= $_GET['callback'];
	echo $callback."(".urldecode(json_encode($arr)).")";
	}else{
	echo urldecode(json_encode($arr));
	}

//echo "<script>alert('添加成功！');</ script>";		
} 

 function updatepwd($strtmp){
$u_table='user';
//----------定义表名和键列表两个后面为标准的
$phone=$_GET['phone'];
if($strtmp=="wx"){
$u_pwd=$_GET['u_pwd'];	
	}else{
$u_pwd=$_GET['password'];	
	}
$yzm=$_GET['yzm'];
$regtime=date('Y-m-d H:i:s',time());
$lng=$_GET['lng'];
$lat=$_GET['lat'];

//--------------------------------以上值和liststr对应

$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());}
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");
 $yzmerror=0; 
 $rs=mysql_query("select * from yzm where phone='$phone' ",$con);
  $myrow = mysql_fetch_array($rs);
 if(empty($myrow)){
	$yzmerror=1; 
 }else{
	if($myrow[2]!=$yzm){
		$yzmerror=1;
		} 

	 }
	if($yzmerror==1){
	$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('验证码错误！')));	
		}else{
 
 $rs=mysql_query("select * from $u_table where phone='$phone' ",$con);
 $myrow = mysql_fetch_array($rs);
 
 if(empty($myrow)){
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('电话号码不存在！')));	

	  }else{
//------------------------------------

$url='http://'.$_SERVER['SERVER_NAME'].$_SERVER["REQUEST_URI"]; 
$avatar=urlencode(dirname($url)."/file/".$myrow[22]);
$arr2 = array ('apicode'=>10000,
'data'=>array (
'uid'=>$myrow[0],
'u_name'=>urlencode($myrow[1]),
'regtime'=>urlencode($myrow[3]),
'phone'=>urlencode($myrow[4]),
'company'=>urlencode($myrow[5]),
'kpno'=>urlencode($myrow[6]),
'address'=>urlencode($myrow[7]),
'sex'=>urlencode($myrow[8]),
'old'=>urlencode($myrow[9]),
'area'=>urlencode($myrow[10]),
'keyword'=>urlencode($myrow[11]),
'industy'=>urlencode($myrow[12]),
'business'=>urlencode($myrow[13]),
'dan_count'=>urlencode($myrow[14]),
'year'=>urlencode($myrow[15]),
'cont'=>urlencode($myrow[16]),
'lnglat'=>urlencode($myrow[17]),
'followcount'=>urlencode($myrow[18]),
'followmecount'=>urlencode($myrow[19]),
'followbothcount'=>urlencode($myrow[20]),
'follow_list'=>urlencode($myrow[21]),
'avatar'=>$avatar,
'lng'=>$lng,
'lat'=>$lat,
'user_joinnum'=>$myrow[0],
)
);
$rs=mysql_query("select COUNT(*) from user where id<=".$myrow[0],$con);
$myrow = mysql_fetch_array($rs);
$user_joinnum=$myrow[0];
$arr2['data']['user_joinnum']=$user_joinnum; 
	

//echo  urldecode(json_encode($arr));

//------------------------------------	
$sql="update $u_table set u_pwd='".$u_pwd."',lng='".$lng."',lat='".$lat."',regtime='".$regtime."' where phone='$phone'";
mysql_query($sql);
if($strtmp=="wx"){
$arr = array ('apicode'=>10000);	
	}else{
$arr=$arr2;		
		}	
	  
		  }  
}
 if($strtmp=="wx"){
	$callback= $_GET['callback'];
echo $callback."(".urldecode(json_encode($arr)).")";		 
	 }else{
echo urldecode(json_encode($arr));	 
	 }


//echo "<script>alert('添加成功！');</ script>";		
} 

function suggest(){
$u_table='user';
$liststr='txt,regtime';
//----------定义表名和键列表两个后面为标准的

$uid=$_GET['uid'];
$txt=$_GET['txt'];

$date=date('Y-m-d H:i:s',time());
$tmp=(explode(' ',$date));
$regtime=$tmp[0];
//--------------------------------以上值和liststr对应
$liststr2=explode(',',$liststr);
$liststr4=" ";
for($i=0;$i<count($liststr2);$i++){if($i==0){$liststr4=$liststr4.' "'.${$liststr2[$i]}.'"';}else{$liststr4=$liststr4.',"'.${$liststr2[$i]}.'"';}}	
$liststr3='('.$liststr.') VALUES ('.$liststr4.')';

$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());}
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");

 $rs=mysql_query("select * from $u_table where id='$uid' ",$con);
  $i=0;
  $myrow = mysql_fetch_array($rs);
 
 if(empty($myrow)){
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('用户名错误！')));
 }else{
 $jsontxt=array();
 $u_table='suggest';

 $sqlstr="INSERT INTO ".$u_table.$liststr3;
mysql_query($sqlstr);
$uid=mysql_insert_id();
$arr =array ('apicode'=>10000,'data'=>array ('uid'=>$uid)); 
	 }
echo urldecode(json_encode($arr));		
}





 function add_userinfo(){
$u_table='user';
$liststr='u_name,company,address,sex,old,area,keyword,industy,business,year,cont,lnglat,lng,lat';

//----------定义表名和键列表两个后面为标准的
$lng=$_GET['lng'];
$lat=$_GET['lat'];
$uid=$_GET['uid'];
$u_name=$_GET['u_name'];
//$u_pwd=$_GET['u_pwd'];
$company=$_GET['company'];
//$kpno=$_GET['kpno'];
$address=$_GET['address'];
$sex=$_GET['sex'];
$old=$_GET['old'];
$area=$_GET['area'];
$keyword=$_GET['keyword'];
$industy=$_GET['industy'];
$business=$_GET['business'];
//$dan_count=$_GET['dan_count'];
$year=$_GET['year'];
$cont=$_GET['cont'];
//$followcount=$_GET['followcount'];
//$followmecount=$_GET['followmecount'];
//$followbothcount=$_GET['followbothcount'];
//$follow_list=$_GET['follow_list'];
$lnglat=$_GET['lng'].','.$_GET['lat'];

//$date=date('Y-m-d H:i:s',time());
//$tmp=(explode(' ',$date));
//$regtime=$tmp[0];
//--------------------------------以上值和liststr对应
$liststr2=explode(',',$liststr);
$liststr4=" ";
for($i=0;$i<count($liststr2);$i++){if($i==0){$liststr4=$liststr4.' "'.${$liststr2[$i]}.'"';}else{$liststr4=$liststr4.',"'.${$liststr2[$i]}.'"';}}	
$liststr3='('.$liststr.') VALUES ('.$liststr4.')';

$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());}
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");
 $rs=mysql_query("select * from $u_table where id='$uid' ",$con);
  $i=0;
$myrow = mysql_fetch_array($rs);
 
 if(empty($myrow)){
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('电话号码不存在！')));
 }else{
	 
$pptmp="";
for($i=0;$i<count($liststr2);$i++){
${$liststr2[$i]}=$_GET[$liststr2[$i]];
if(${$liststr2[$i]}!=''){$pptmp=$pptmp.",$liststr2[$i]='${$liststr2[$i]}'";}
}

$pptmp = substr ($pptmp, 1);	 
if($pptmp!=''){
$sql="update $u_table set $pptmp where id='$uid'";
mysql_query($sql);
}	 

$arr = array ('apicode'=>10000);
 
	 } 
echo urldecode(json_encode($arr));
		
} 
function get_userinfo(){
$u_table='user';
$myuid=$_GET['myid'];
$uid=$_GET['uid'];
$lng=$_GET['lng'];
$lat=$_GET['lat'];
$logtime=date('Y-m-d H:i:s',time());
//--------------------------------以上值和liststr对应
$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());}
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");

//---获取我的followlist
$rs=mysql_query("select follow_list from $u_table where id='$myuid' ",$con);
$myrow = mysql_fetch_array($rs);
$myfollowlist=$myrow[0];

$rs=mysql_query("select * from $u_table where id='$uid' ",$con);
$myrow = mysql_fetch_array($rs);
if(empty($myrow)){
$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('电话号码不存在！')));	
 }else{
if(strstr($myfollowlist,$myrow[4])!=false){
	$hasfollow='1';
	}else{
	$hasfollow='0';	
		}	 
	 
	 
$url='http://'.$_SERVER['SERVER_NAME'].$_SERVER["REQUEST_URI"]; 
$avatar=urlencode(dirname($url)."/file/".$myrow[22]);
$arr = array (
'apicode'=>10000,
'data'=>array (
'uid'=>$myrow[0],
'u_name'=>urlencode($myrow[1]),
'regtime'=>urlencode($myrow[3]),
'phone'=>urlencode($myrow[4]),
'company'=>urlencode($myrow[5]),
'kpno'=>urlencode($myrow[6]),
'address'=>urlencode($myrow[7]),
'sex'=>urlencode($myrow[8]),
'old'=>urlencode($myrow[9]),
'area'=>urlencode($myrow[10]),
'keyword'=>urlencode($myrow[11]),
'industy'=>urlencode($myrow[12]),
'business'=>urlencode($myrow[13]),
'dan_count'=>urlencode($myrow[14]),
'year'=>urlencode($myrow[15]),
'cont'=>urlencode($myrow[16]),
'lnglat'=>urlencode($myrow[17]),
'followcount'=>urlencode($myrow[18]),
'followmecount'=>urlencode($myrow[19]),
'followbothcount'=>urlencode($myrow[20]),
'follow_list'=>urlencode($myrow[21]),
'avatar'=>$avatar,
'logtime'=>urlencode($myrow[23]),
'alert'=>urlencode($myrow[26]),
'alert2'=>urlencode($myrow[28]),
'locat'=>urlencode($myrow[27]),
'lng'=>$lng,
'lat'=>$lat,
'hasfollow'=>$hasfollow,

'user_joinnum'=>$myrow[0],
));
$rs=mysql_query("select COUNT(*) from user where id<=".$myrow[0],$con);
$myrow = mysql_fetch_array($rs);
$user_joinnum=$myrow[0];
$arr['data']['user_joinnum']=$user_joinnum;

$sql="update $u_table set lng='".$lng."',lat='".$lat."',logtime='".$logtime."' where phone='$phone'";
mysql_query($sql);	 
	 } 
echo urldecode(json_encode($arr));
		
}     
?>
<?php
//------------------------------------------------------- 创建表参考
function creattable(){

$sql = "CREATE TABLE Persons 
(
personID int NOT NULL AUTO_INCREMENT, 
PRIMARY KEY(personID),
FirstName varchar(15),
LastName varchar(15),
Age int
)";

mysql_query($sql,$con);


mysql_close($con);
}
?>
