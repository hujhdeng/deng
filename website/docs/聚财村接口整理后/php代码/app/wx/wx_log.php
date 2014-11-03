<?php 
$uid=$_GET['uid'];
$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());} 
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");
//-----------------------以上为公共数据库连接

$rs=mysql_query("select * from user where id=".$uid,$con);
  $myrow = mysql_fetch_array($rs);
 if(empty($myrow)){
	 }else{
		$sdavatar=$myrow["avatar"];
$url='http://'.$_SERVER['SERVER_NAME'].$_SERVER["REQUEST_URI"];
$sdavatar=(dirname($url)."/file/".$sdavatar);

	 }
$rs=mysql_query("select user_joinnum from info",$con);
  $myrow = mysql_fetch_array($rs);
  $user_joinnum=$myrow['user_joinnum']+1;
$sql="update info set user_joinnum='".$user_joinnum."'";
mysql_query($sql); 
 
?>
<!DOCTYPE html>
<!--HTML5 doctype-->
<html>
<head>

		<title>聚财村</title>
        <meta http-equiv="Expires" CONTENT="0">
        <meta http-equiv="Cache-Control" CONTENT="no-cache">
        <meta http-equiv="Pragma" CONTENT="no-cache">
        
		<meta http-equiv="Content-type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0">
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
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
<!--            <script type="text/javascript" charset="utf-8" src="plugins/af.touchEvents.js"></script>-->
          
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
</style>
</head>

<body style="margin:0px;">
<div id="afui" style="width:100%;">
  <div id="content" style="width:100%;"> 
    <!--panel-1-->
    <div id="home" title="首页" class="panel" selected="true"  data-header="none" data-nav="none"  data-footer="none"  style="background-color:#fff; -moz-background-size:100% 100%;background-size:100% 100%; padding:0px; margin:0px;" >

<img src="images/p1.jpg" width="100%">
<div style="width:85%; margin:auto;">
<div style="width:100%; clear:both; height:2em;"></div>
<div style="width:100%; margin:auto; border-bottom:#dddddd solid 1px; overflow:auto;">
 <div style="float:left; width:20px; padding-top:0.7em; " ><img src="images/p2.jpg" width="18px" ></div> <div style="float:left"><input id="phone" style="border:0px" class="" type="text" placeholder="请输入注册手机号"></input></div>
 </div>
<div style="width:100%; clear:both; height:1em;"></div> 
<div style="width:100%; margin:auto; border-bottom:#dddddd solid 1px; overflow:auto;">
 <div style="float:left; width:20px; padding-top:0.7em; " ><img src="images/p3.jpg" width="18px" ></div> <div style="float:left"><input id="u_pwd" style="border:0px" class="" type="password" placeholder="请输入密码"></input></div>
 </div>

<div style="margin-top:2em;" onClick="userlog()"> <img src="images/p4.jpg" width="100%"></div>

<table style="margin-top:1.5em;">
<tr>
<td onClick="findpwd()">
<img src="images/p5.jpg" width="96%">
</td>
<td align="right"  onClick="reg()">
<img src="images/p6.jpg" width="96%">
</td>
</tr>
</table>


  </div> 
      <div style="width:100%; height:200px;"></div>     
</div>
  
  <!--panel-找回密码-->
  <div id="t2" title="首页2" class="panel"   data-header="header2" data-footer="none" style="float:left;" >
<div style="width:85%; margin:auto;">
<div style="width:100%; clear:both; height:2em;"></div>
<div style="width:100%; margin:auto; border-bottom:#dddddd solid 1px; overflow:auto;">
 <div style="float:left; width:20px; padding-top:0.7em; " ><img src="images/p9.jpg" width="18px" ></div> <div style="float:left"><input id="findphone" style="border:0px" class="" type="text" placeholder="请输入手机号码"></input></div>
 </div>
<div style="margin-top:1em;" onClick="sendfindyzm()"> <img src="images/p7.jpg" width="100%"></div>
<div style="margin-top:1.5em;">  
<div style="width:100%; margin:auto; border-bottom:#dddddd solid 1px; overflow:auto;">
 <div style="float:left; width:20px; padding-top:0.7em; " ><img src="images/p10.jpg" width="18px" ></div> <div style="float:left; width:80%"><input id="findyzm" style="border:0px" class="" type="text" placeholder="请输入手机收到的验证码" width="100%"></input></div>
 </div>
<div style="width:100%; clear:both; height:1em;"></div> 
<div style="width:100%; margin:auto; border-bottom:#dddddd solid 1px; overflow:auto;">
 <div style="float:left; width:20px; padding-top:0.7em; " ><img src="images/p3.jpg" width="18px" ></div> <div style="float:left"><input id="findpwd" style="border:0px" class="" type="password" placeholder="请输入新密码"></input></div>
 </div>
 <div style="margin-top:1em;" onClick="wxresetpwd()" > <img src="images/p8.jpg" width="100%"></div>
 
</div>  
  </div>  
   </div>  
  <!--pane3-注册-->
  <div id="t3" title="首页2" class="panel"   data-header="header3" data-footer="none" style="float:left;" >
<div style="width:85%; margin:auto;">
<div style="width:100%; clear:both; height:2em;"></div>
<div style="width:100%; margin:auto; border-bottom:#dddddd solid 1px; overflow:auto;">
 <div style="float:left; width:20px; padding-top:0.7em; " ><img src="images/p9.jpg" width="18px" ></div> <div style="float:left"><input id="reg_phone" style="border:0px" class="" type="text" placeholder="请输入手机号码"></input></div>
 </div>
<div style="margin-top:1em;" onClick="getyzm()"> <img src="images/p7.jpg" width="100%"></div>
<div style="margin-top:1.5em;">  
<div style="width:100%; margin:auto; border-bottom:#dddddd solid 1px; overflow:auto;">
 <div style="float:left; width:20px; padding-top:0.7em; " ><img src="images/p10.jpg" width="18px" ></div> <div style="float:left; width:80%"><input id="yzm" style="border:0px" class="" type="text" placeholder="请输入手机收到的验证码" width="100%"></input></div>
 </div>
<div style="width:100%; clear:both; height:1em;"></div> 
<div style="width:100%; margin:auto; border-bottom:#dddddd solid 1px; overflow:auto;">
 <div style="float:left; width:20px; padding-top:0.7em; " ><img src="images/p3.jpg" width="18px" ></div> <div style="float:left"><input id="reg_u_pwd" style="border:0px" class="" type="password" placeholder="请输入密码"></input></div>
 </div>
 <div style="margin-top:1em;" onClick="wxreg()"> <img src="images/p12.jpg" width="100%"></div>
 </div>  
</div>  
  </div>          
  <!--panel-结束================================================================--> 
  <!--公共header-->
   
  <header id="header3" style=" background-color:#edecf1"> 
 <a class="icon chevron-left big" style="float:left; padding:0.8em;" onclick="$.ui.goBack()"></a>
<h1>注册</h1>  
</header> 
  
<header id="header2" style=" background-color:#edecf1"> 
<a class="icon chevron-left big" style="float:left; padding:0.8em;" onclick="$.ui.goBack()"></a>
<h1>找回密码</h1>  
</header> 
        
  <!--公共footer-->
  <footer id="f1" > <a  href='#home'  class='icon home' id="log_an" >主页</a> <a href='#t14' onClick="get_bmin()" class='icon picture'>上传照片</a> <a href='#t14' onClick="get_yule()" class='icon cog '>信息维护</a> </footer>

  
  <!--公共nav--> 
  
</div>
</div>
</body>
</html>

<script type="text/javascript">
var starttime='';
var reg_phone='';
var findstarttime='';
var findphone='';
function sendfindyzm(){
	findphonetmp=document.getElementById('findphone').value
	if(findphonetmp==''){
		alert('请输入手机号')
		}else{
		findmyDate = new Date();
		findnowtime=findmyDate.getMinutes()
		//alert(starttime+'-'+nowtime)
     if(Math.abs(findstarttime-findnowtime)<10&&findstarttime!=''){
		alert('验证码已发送，请稍后再试') 
		 }else{
		
			   $.jsonP({			
				url:'http://www.jucaicun.com/app/wx_sendSMS.php?phone='+findphonetmp+'&callback=?',
		success:function(data){	
		if(data["apicode"]=='10000'){
			findstarttime=findnowtime
			findphone=findphonetmp
			//alert(reg_phone)
		alert("验证码已发送到你的手机，请注意查收！")
			}else{
			//alert(data["apicode"])	
		alert("验证码发送失败，请稍后再试！")		 	

				}
		}
	});	
		 
			 }
			}
	}

function getyzm(){
	reg_phonetmp=document.getElementById('reg_phone').value
	if(reg_phonetmp==''){
		alert('请输入手机号')
		}else{
		myDate = new Date();
		nowtime=myDate.getMinutes()
		//alert(starttime+'-'+nowtime)
     if(Math.abs(starttime-nowtime)<10&&starttime!=''){
		alert('验证码已发送，请稍后再试') 
		 }else{
		
			   $.jsonP({			
				url:'http://www.jucaicun.com/app/wx_sendSMS.php?phone='+reg_phonetmp+'&callback=?',
		success:function(data){	
		if(data["apicode"]=='10000'){
			starttime=nowtime
			reg_phone=reg_phonetmp
			//alert(reg_phone)
		alert("验证码已发送到你的手机，请注意查收！")
			}else{
			//alert(data["apicode"])	
		alert("验证码发送失败，请稍后再试！")		 	

				}
		}
	});	
		 
			 }
			}
	}
function wxresetpwd(){
	//findphone
	findyzm=document.getElementById('findyzm').value;
	findpwd=document.getElementById('findpwd').value;
//alert('http://www.jucaicun.com/app/jcc_act2.php?act=wx_resetpwd&phone='+findphone+'&yzm='+findyzm+'&u_pwd='+findpwd+'+&callback=?')
	if(findphone==''){
		alert('请重新输入手机号获取验证码！')
		}else if(findyzm==''){
		alert('请输入手机收到的验证码！')	
			}else if(findpwd==''){
		alert('请输入密码！')	
			}else{
				
		   $.jsonP({			
				url:'http://www.jucaicun.com/app/jcc_act2.php?act=wx_resetpwd&phone='+findphone+'&yzm='+findyzm+'&u_pwd='+findpwd+'+&callback=?',
		success:function(data){	
		if(data["apicode"]=='10000'){
		alert("恭喜密码修改成功,请使用新密码登录！")
			findphone=''
	 document.getElementById('findyzm').value='';
	 document.getElementById('findpwd').value='';
			}else{
			alert(data["data"]["message"])	

				}
		}
	});				
				
				
				}
	}	
	
	
function wxreg(){
	//alert(reg_phone)
	yzm=document.getElementById('yzm').value;
	reg_u_pwd=document.getElementById('reg_u_pwd').value;

	if(reg_phone==''||reg_phone==null){
		alert('请重新输入手机号获取验证码！')
		}else if(yzm==''){
		alert('请输入手机收到的验证码！')	
			}else if(reg_u_pwd==''){
		alert('请输入密码！')	
			}else{
				
				
		   $.jsonP({			
				url:'http://www.jucaicun.com/app/jcc_act2.php?act=wx_userreg&phone='+reg_phone+'&yzm='+yzm+'&u_pwd='+reg_u_pwd+'+&callback=?',
		success:function(data){	
		if(data["apicode"]=='10000'){
		alert("恭喜你注册成功！")
			}else{
			alert(data["data"]["message"])	

				}
		}
	});				
				
				
				}
	}		
	
function findpwd(){
	
	$.ui.loadContent('#t2');
	}
function reg(){
	
	$.ui.loadContent('#t3');
	}	
	
function userlog(){
	phone=document.getElementById('phone').value;
	u_pwd=document.getElementById('u_pwd').value;
	if(phone==''){
		alert('请输入电话号码')
		}else if(u_pwd==''){
		alert('请输入密码')	
			}else{
			   $.jsonP({			
		url:'http://www.jucaicun.com/app/jcc_act2.php?act=wx_userlog&uid=<?php echo $uid; ?>&phone='+phone+'&u_pwd='+u_pwd+'&callback=?',
		success:function(data){	
		if(data["apicode"]=='10000'){
			alert("关注成功！")
			window.location.href='jccappdown.html'
			}else{
				
			alert(data["data"]["message"])	
				}
		}
	});		
				
				
				}
	}	
		</script>
		<!--幻灯JS end-->
        <script>

var imgUrl = '<?php echo $sdavatar; ?>';
var lineLink = 'http://www.jucaicun.com/app/wxfenxiang.php?uid=<?php echo $uid; ?>';
var descContent = "我成为第<?php echo $user_joinnum; ?>位注册的贷款从业者，赶快来关注我吧";
var shareTitle = '';
var appid = 'wx4f959a7c02abbfbd';

function shareFriend() {
    WeixinJSBridge.invoke('sendAppMessage',{
                            "appid": appid,
                            "img_url": imgUrl,
                            "img_width": "640",
                            "img_height": "640",
                            "link": lineLink,
                            "desc": descContent,
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
                            "desc": descContent,
                            "title": shareTitle
                            }, function(res) {
                            _report('timeline', res.err_msg);
                            });
}
function shareWeibo() {
    WeixinJSBridge.invoke('shareWeibo',{
                            "content": descContent,
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
</script>
