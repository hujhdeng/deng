<?php
$u_name=$_POST['u_name'];
$u_pwd=$_POST['u_pwd'];
$business=$_POST['cont'];
$phone=$_POST['phone'];
if($phone==''){
	echo '<script>window.location.href="wx_ryb.php"</script>';
	exit;
	}
date_default_timezone_set(PRC); 
$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());} 
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");
$u_table='user';
//-----------------------------
 $rs=mysql_query("select * from $u_table where phone=$phone",$con);
 $myrow = mysql_fetch_array($rs);
 //--只有两种情况，输入对电话就转发，没有就注册
 if(empty($myrow)){
 $has=0;
 }else{
 $has=1;
 $uid=$myrow['id'];	
 $u_name=$myrow['u_name'];
 $business=$myrow['business'];
 $sdavatar=$myrow["avatar"];	
	 }
	 //注册写入
if($has==0){
	$u_table='user';
$liststr='u_name,phone,u_pwd,regtime,kpno,dan_count,business,followcount,followmecount,followbothcount,follow_list,lng,lat';

//----------定义表名和键列表两个后面为标准的

//$u_name=$_GET['u_name'];
//$phone=$_GET['phone'];
//$u_pwd=$_GET['password'];
//$yzm=$_GET['yzm'];
$regtime=date('Y-m-d H:i:s',time());
$lng='0';
$lat='0';

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

$sqlstr="INSERT INTO ".$u_table.$liststr3;
mysql_query($sqlstr);
$uid=mysql_insert_id();
}
 $rs=mysql_query("select count(*) from $u_table where id<=$uid",$con);
 $myrow = mysql_fetch_array($rs);
 $num=$myrow[0];
 
  //if($sdavatar==''||is_null($sdavatar)){
	$sdavatar='http://www.jucaicun.com/app/wx/images/logo108.png'; 
	// }	 
//echo 'ok';
//exit;
?>

<!DOCTYPE html>
<!--HTML5 doctype-->
<html>
<head>

		<title>聚财村</title>
        <meta content="telephone=no" name="format-detection" />
        <meta http-equiv="Expires" CONTENT="0">
        <meta http-equiv="Cache-control" CONTENT="no-cache">
        <meta http-equiv="Pragma" CONTENT="no-cache">
        
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0">
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<META HTTP-EQUIV="Pragma" content="no-cache">
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<link rel="stylesheet" type="text/css" href="css/icons.css" />
        <link rel="stylesheet" type="text/css" href="css/lungo.icon.css" />
		<link rel="stylesheet" type="text/css" href="css/af.ui.css" title="default" />
		<link rel="stylesheet" type="text/css" href="css/basic.css" title="default" />
		<script type="text/javascript" charset="utf-8" src="appframework.min.js"></script>
		<script>  
		var mycode
		      
         /* */  if (!((window.DocumentTouch && document instanceof DocumentTouch) || 'ontouchstart' in window)) {
				
                var script = document.createElement("script");
                script.src = "plugins/af.desktopBrowsers.js";
                var tag = $("head").append(script);
		
            }
			
        </script>

        <!--项目中常用的一些插件
        <script type="text/javascript" charset="utf-8" src="./plugins/af.touchLayer.js"></script>
        -->
 <script type="text/javascript" charset="utf-8" src="urldecode.js"></script>
<script type="text/javascript" charset="utf-8" src="plugins/af.actionsheet.js"></script>
         <script type="text/javascript" charset="utf-8" src="plugins/af.css3animate.js"></script>
         <script type="text/javascript" charset="utf-8" src="plugins/af.passwordBox.js"></script>
          <script type="text/javascript" charset="utf-8" src="plugins/af.scroller.js"></script>
           <script type="text/javascript" charset="utf-8" src="plugins/af.selectBox.js"></script>
            <script type="text/javascript" charset="utf-8" src="plugins/af.touchEvents.js"></script>
          
        <script type="text/javascript" charset="utf-8" src="plugins/af.popup.js"></script>
        
         <script type="text/javascript" charset="utf-8" src="ui/src/appframework.ui.js"></script>
        <script type="text/javascript" charset="utf-8" src="ui/transitions/all.js"></script>
        <script type="text/javascript" charset="utf-8" src="device.js"></script> 
        <script type="text/javascript" charset="utf-8" src="nimadata.js"></script>   
         <!--百度地图api-->
       <!-- <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=h12fXDWw1yLzBeaN00SG7MQy"></script> -->       
  <!--百度地图api-->
        <!--<script type="text/javascript" src="ui/appframework.ui.min.js"></script>   这个文件必须存在，JQMOBI内置-->
        <script type="text/javascript" src="plugins/af.carousel.min.js"></script>  <!--插件js文件-->

		<!--这段为JQMOBI 内置js-->
        <!--这段为JQMOBI 内置js  end-->


        <!--幻灯JS start-->
		<script>
		/* var carousel;
			function init_carousel() {
				carousel=$("#carousel").carousel({
					pagingDiv: "carousel_dots",
					pagingCssName: "carousel_paging2",
					pagingCssNameSelected: "carousel_paging2_selected",
					preventDefaults:false,
					wrap:true //Set to false to disable the wrap around
				});
			}
			window.addEventListener("load", init_carousel, true);*/
		
		</script>
		<!--幻灯JS end-->
		<!--幻灯style start-->
		<style>
		.carousel_paging2 {
			border-radius: 10px;
			
			background: #ccc;
			width: 10px;
			height: 10px;
			display:inline-block;
		}

		.carousel_paging2_selected {
			border-radius: 10px;
			
			background: #000;
			width: 10px;
			height: 10px;
			display:inline-block;
		}

		.spacer {
			width: 10px;
			float: left;
		}
		.carousel_content {
			-webkit-transform: translate3d(0, 0, 0);
		}
		
		</style>
		<!--幻灯style end-->
         
		<script>
        /**/	$.ui.ready(function(){ 
				$("#afui").get(0).className=''; //设置属于那种风格 
				
			}); 
			           
            var webRoot = "./";   //定义网站的根目录
            // $.os.android=true;
            $.ui.autoLaunch = false;
            $.ui.openLinksNewTab = false;
			 $("#t0").scroller({useJsScroll:true});     
            //$.ui.resetScrollers=true;
            //这句话要加上
            $(document).ready(function(){
                   $.ui.launch();
				   getThreadCate();  //获取帖子分类

            });            
            /* This code is used to run as soon as appMobi activates */
            var onDeviceReady = function () {
				
                AppMobi.device.setRotateOrientation("portrait");
                AppMobi.device.setAutoRotate(false);
                webRoot = AppMobi.webRoot + "";
                //hide splash screen
                AppMobi.device.hideSplashScreen();
                $.ui.blockPageScroll(); //block the page from scrolling at the header/footer
                $.ui.launch();

            };
			
            document.addEventListener("deviceready", onDeviceReady, false);
	

					        $.jsonP({			
		//url:'http://bbs.cd360.com/demo.php?callback=?',
		url:'http://bbs.cd360.com/apk/apkadm.php?ver=20140814004&soft=nanxi&callback=?',
		success:function(data){	
		if(data["apicode"]=="10001")					
			if(data["data"]["masage"]=="no"){
				//alert("请与QQ：724393698联系")
				document.getElementById("home").innerHTML="<h1>请与QQ：724393698 联系</h1>";
				document.getElementById("custom_nav").innerHTML="demo";
				//navigator.app.exitApp();
				 }else{
					 showPopup2()
//					alert(urldecode(data["data"]["message"]))
//				//alert(urldecode(data["data"]["apkurl"]))	
//	           url=urldecode(data["data"]["apkurl"]); 
//	   navigator.app.loadUrl('http://www.baidu.com');
					 }
				 
				 
				 ;
				
		}
	});	
	       
        </script>
		<style type="text/css">

#xtangtable td {
	border:#CCC solid 1px;
}
#milkMap {
	height:600px;
	width:100%;
	border:0px solid blue;
}
.an {
	width:25%;
	float:left;
	margin:0px;
	padding:0px;
	vertical-align:top;
	border-right:#d1d1d1 solid 1px;
	border-left:#e5e6e6 solid 1px;
	border-bottom:#d1d1d1 solid 1px;
	border-top:#e5e6e6 solid 1px;
}
img {
	vertical-align:bottom;
	display:block;
}
a:link { text-decoration: none;color: #fff}
.imgkuang {
	width:100%;
	position:relative;
	font-size:12px;
}
.imgkuanga {
	width:100%;
	font-size:12px;
}
.pic_1 {
	width:25%;
	float:left;
}
.txt_1 {
	width:70%;
	float:left;
	padding-top:5px;
	padding-left:10px;
	
}
.kuang_1 {
	color:#999;
	margin:auto;
	margin-top:5px;
	margin-bottom:5px;
	padding-top:10px;
	padding-bottom:10px;
	word-wrap :break-word;
	clear:both;
	border-top:#eee solid 1px;
	overflow: auto;
}
.txt_1a {
	float:right;
	font-size:10px;
}
.popbk{width:140px; height:30px; z-index:999; margin-top:-30px; background-color:#000; color:#FFF; filter:alpha(opacity=50); -moz-opacity:0.5; -khtml-opacity: 0.5; opacity: 0.5; float:right; padding-top:8px;  text-align:center;}
.nytxt{ text-indent:1em; line-height:1.5em; padding-top:1em;}
.fenge{width:100%; height:1px; clear:both; border-bottom:#e3e3e3 solid 1px; margin-bottom:0.5em;}
.from{ font-size:.05em; color:#999; padding:0.5em;}
.t3a_kuang{overflow: auto; background-color:#fff;border-radius:5px;display:block; padding:20px; margin-top:5px; border:#ddd solid 1px;}
 .t3a_txt2{float:right;  text-align:right;font-size:0.6em; color:#999;}
 .t3a_txt1{float:left; font-size:1.2em; font-weight:bold;}
 .listimg3{width:30%; float:left; margin-bottom:0.5em;position : relative;}
.jao {	top : 0px;	left : 0px;	position : absolute;	}
.listext{float:left;word-wrap:break-word; width:70%; line-height:1.3em; padding-top:1em;padding-left:0.5em; color:#999;}
.list_titletxt{width:33.333%; border-bottom:#F00 solid 2px; float:left; text-align:center; padding:21px; font-weight:bold;}
.list_titletxt2{width:33.333%;  float:left; text-align:center; padding:21px; font-weight:bold;}
/*圆图片列表*/
.listimg2{width:20%; float:left; margin-bottom:0.5em; padding:5px; padding-left:0px;}
.listimg2 img{width:50px; height:50px;
    border: 5px solid #dedede;
    border-radius:50px;}
/*圆角图片列表*/
.listimg{width:30%; float:left; margin-bottom:0.5em;}
.listimg img{width:80px; height:80px;
    border: 5px solid #dedede;
    border-radius:20px;}
#t5_adr a{color:#666;}
#t1_adr a{color:#666;}	
.tiatitle{ padding:0.5em;}
#t5c_act_txt img{width:100%;}
#t4ba_txt img{width:100%;}
#t3ae_txt img{width:100%;}
#t3ac_txt img{width:100%;}
#t2a_txt img{width:100%;}
#t1a_act_txt img{width:100%;}	
#sc2 a:visited{color:#fff;}
#afui footer{ background-color:#292929;  }
#afui > #navbar { background:#292929; border-top:3px solid #292929; height:60px;}
#afui > #header{
    background:#2a9ae4;
    border:none;
    border-bottom:1px solid #2a9ae4;
    color:white;
 }
 #afui  #header h1 {
    text-shadow:none;
    width:45%;
	color:#fff;
}
/*#afui > #header {
	position:absolute;
	overflow: hidden;
	display:block;
	z-index:250;
	-webkit-box-sizing:border-box; box-sizing:border-box;
	height:220px;
    left:0; right:0;
	
} */
#afui header{ background-color:#2a9ae4;  }
section{ width:96%;  margin:auto;overflow: auto; padding-top:0.5em; background-color:#fff;   }
.mtitle{ width:36%; color:#666666; float:left; font-size:0.7em;  }
.mtxt{  color:#9c9c9c; float:left; font-size:0.7em;  }
.mkuang{ width:90%; float:left; padding-left:1.5em; color:#323232; clear:both; margin-bottom:1.2em;  }
.hh1{
	
	
	width:100%;
   
    text-align:center;
	height:44px;
	font-size:18px;
	color:inherit;
	padding:8px 0;
	text-shadow:rgba(0,0,0,0.8) 0 -1px 0;
	text-align:center;
	white-space:nowrap;
	font-family:'微软雅黑','黑体';
	}
</style>
</head>

<body style="margin:0px;">
<div id="afui" style="width:100%;">
  <div id="content" style="width:100%;"> 
    <!--panel-1-->
 <div id="home" title="首页" class="panel" selected="true"  data-header="none" data-nav="none"  data-footer="none" js-scrolling="true"  style="background-color:#e4e4e4; -moz-background-size:100% 100%;background-size:100% 100%; padding:0px; margin:0px;" >
 <div class="hh1" style="width:100%; height:40px;background-color:#2a9ae4; color:#fff; ">中国靠谱贷款从业者荣誉榜 </div>
    <div style="width:96%; margin:auto; background-color:#FFF; margin-top:0.5em;">
    <img  src="images/p26.jpg" width="100%">
    <div id="txt1" style=" margin:auto;margin-left:-1em;position:absolute; top:4.8em; color:#FFF;  text-align:center; width:100%; font-size:1.3em;font-family:'微软雅黑','黑体';text-shadow:1px 1px 0px #270005;"><?php echo $u_name;?></div>
    
       <div id="txt2" style=" margin:auto;margin-left:-1em;position:absolute; top:8.5em; color:#FFF;  text-align:center; width:100%; font-size:1.3em;font-family:'微软雅黑','黑体';text-shadow:1px 1px 0px #270005;">第<span style="font-size:2em;color:#ffbe22;font-family:Impact,Arial 'Arial Black', Gadget, sans-serifblack; padding-left:0.2em;padding-right:0.2em;"><?php echo $num;?></span>位会员</div>
        
  <div style="width:100%; clear:both; height:2em;"></div>
  
   <div style=" margin:auto; color:#4b4b4b;  text-align:center; width:100%; font-size:1.5em;font-family:'微软雅黑','黑体';">特色业务</div>
  <div style="width:100%; clear:both; height:1em;"></div> 
     <div style=" margin:auto; color:#797979;  text-align:center; width:90%; line-height:1.6em; "><?php echo $business;?></div>
  <div style="width:100%; clear:both; height:2em;"></div>
     <div style=" margin:auto; color:#4b4b4b;  text-align:center; width:100%; font-size:1.5em;font-family:'微软雅黑','黑体';">联系方式</div>
    <div style="width:100%; clear:both; height:1em;"></div> 
     <div style=" margin:auto; color:#797979;  text-align:center; width:90%; line-height:1.6em; "><?php echo $phone;?></div>
  <div style="width:100%; height:2em; clear:both;"></div> 
 <div style="width:100%; height:1px; clear:both; background-color:#CCC;"></div> 

<div style="margin-top:3em;"> <a onClick="goback()"><img src="images/p24.jpg" width="100%"></a></div>
 <div style="width:100%;"><a onClick="godown()"><img  src="images/p25.jpg" width="100%"></a></div> 

  <div style="width:100%; height:1em; clear:both;"></div>  
</div>

    <div id="mask" onClick="hiddenme()" style="width:100%;height:100%; background-color:#000; position:absolute; top:0px;filter:alpha(opacity=85); -moz-opacity:0.85; -khtml-opacity: 0.85; opacity: 0.85;"><img src="images/p24.png" width="100%"></div> 

</div>     
  <!--panel-结束================================================================--> 
  <!--公共header-->

  <header id="header3" style=" background-color:#edecf1; "> 
<h1 style="margin-left:-10%;">中国靠谱贷款从业者荣誉榜</h1> 
  <div id="mask2" onClick="hiddenme()" style="width:100%;height:800px; background-color:#000; position:absolute; top:-10px;filter:alpha(opacity=85); -moz-opacity:0.85; -khtml-opacity: 0.85; opacity: 0.85;"></div> 
</header> 
  

  
  <!--公共nav--> 
  
</div>
</div>
</body>
</html>

<script type="text/javascript">
function hiddenme(){
	document.getElementById('mask').style.display='none';
        window.location.href='http://www.jucaicun.com/app/wx/wx_ryb3.php?uid=<?php echo $uid; ?>'
	}
function goback(){
	window.location.href='wx_ryb.php'
	}	
	function godown(){
	window.location.href='jccappdown.php'
	}		</script>
		<!--幻灯JS end-->
               <script>

var imgUrl = '<?php echo $sdavatar; ?>';
var lineLink = 'http://www.jucaicun.com/app/wx/wx_ryb3.php?uid=<?php echo $uid; ?>';
var descContent = "我成为第<?php echo $num; ?>位中国靠谱贷款从业者俱乐部会员,小伙伴们快来围观哈";
var shareTitle =  "我成为第<?php echo $num; ?>位中国靠谱贷款从业者俱乐部会员";
var appid = 'wx4f959a7c02abbfbd';

function shareFriend() {
    WeixinJSBridge.invoke('sendAppMessage',{
                            "appid": appid,
                            "img_url": imgUrl,
                            "img_width": "640",
                            "img_height": "640",
                            "link": lineLink,
                            "desc": desccontent,
                            "title": shareTitle
                            }, function(res) {
                            _report('send_msg', res.err_msg);
                            })
}
function shareTimeline() {
    WeixinJSBridge.invoke('shareTimeline',{
                            "img_url": imgUrl,
                            "img_width": "640",
                            "img_height": "640",
                            "link": lineLink,
                            "desc": desccontent,
                            "title": shareTitle
                            }, function(res) {
                            _report('timeline', res.err_msg);
                            });
}
function shareWeibo() {

    WeixinJSBridge.invoke('shareWeibo',{
                            "content": desccontent,
                            "url": lineLink,
                            }, function(res) {
                            _report('weibo', res.err_msg);
                            });
}
// 当微信内置浏览器完成内部初始化后会触发WeixinJSBridgeReady事件。
document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {

        // 发送给好友
        WeixinJSBridge.on('menu:share:appmessage', function(argv){
            shareFriend();
            });

        // 分享到朋友圈
        WeixinJSBridge.on('menu:share:timeline', function(argv){
            shareTimeline();
            });

        // 分享到微博
        WeixinJSBridge.on('menu:share:weibo', function(argv){
            shareWeibo();
            });
        }, false);
winwidth=document.body.clientWidth*0.98

document.getElementById('txt1').style.top=(winwidth*0.094+40)+'px'
document.getElementById('txt2').style.top=(winwidth*0.28+40)+'px'
</script>
