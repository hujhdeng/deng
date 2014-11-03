<?php
$error=$_GET['error'];
if($error!=''){
	echo '<script>alert("'.$error.'")</script>';
	}
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
</style>
</head>

<body style="margin:0px;">
<div id="afui" style="width:100%;">
  <div id="content" style="width:100%;"> 
    <!--panel-1-->
 <div id="home" title="首页" class="panel" selected="true"  data-header="header3" data-nav="none"  data-footer="none"  style="background-color:#e4e4e4; -moz-background-size:100% 100%;background-size:100% 100%; padding:0px; margin:0px;" >
    <div style="width:96%; margin:auto; background-color:#FFF; margin-top:0.6em;">
  <div style="width:100%; clear:both; height:2em;"></div>
  <div style="margin:auto; width:90%;">
<form id="form1" action="wx_ryb2.php" method="post" enctype="multipart/form-data">  
<div style="width:100%; margin:auto; border-bottom:#dddddd solid 1px; overflow:auto;">
 <div style="float:left; width:20px; padding-top:0.7em; " ><img src="images/p2.jpg" width="18px" ></div> <div style="float:left;width:70%;"><input name="u_name" id="u_name" style="border:0px" class="" type="text" placeholder="请输入姓名"></input></div>
 </div>
<div style="width:100%; clear:both; height:1em;"></div> 

<div style="width:100%; margin:auto; border-bottom:#dddddd solid 1px; overflow:auto;">
 <div style="float:left; width:20px; padding-top:0.7em; " ><img src="images/p27.jpg" width="18px" ></div> <div style="float:left;width:70%;"><input name="cont"  id="cont" style="border:0px" class="" type="text" placeholder="请输入特色业务"></input></div>
 </div>
<div style="width:100%; clear:both; height:3em;"></div> 
<div style="width:100%; clear:both; height:1em; background-color:#e7e7e7; margin:auto;"></div> 
<div style="width:100%; clear:both; height:2em;"></div> 
<div style="width:100%; margin:auto; border-bottom:#dddddd solid 1px; overflow:auto;">
 <div style="float:left; width:20px; padding-top:0.7em; " ><img src="images/p9.jpg" width="18px" ></div> <div style="float:left;width:75%;"><input name="phone" id="phone" style="border:0px" class="" type="text" placeholder="请输入手机号注册聚财村会员"></input></div>
 </div>
<div style="width:100%; clear:both; height:1em;"></div> 

<div style="width:100%; margin:auto; border-bottom:#dddddd solid 1px; overflow:auto;">
 <div style="float:left; width:20px; padding-top:0.7em; " ><img src="images/p3.jpg" width="18px" ></div> <div style="float:left; width:70%;"><input name="u_pwd" id="u_pwd" style="border:0px" class="" type="password" placeholder="请设置登录密码"></input></div>
 </div>
  </form>
    </div>
<div style="margin-top:4em;" onClick="logreg()"> <img src="images/p24.jpg" width="100%"></div>
 <div style="width:100%;"><a href="jccappdown.php"><img  src="images/p25.jpg" width="100%"></a></div> 


</div> 



  <div style="width:100%; height:1em; clear:both;"></div>   
</div>
       
  <!--panel-结束================================================================--> 
  <!--公共header-->
   
  <header id="header3" style=" background-color:#edecf1; "> 
<h1 style="margin-left:-50px; ">申请进驻靠谱贷款从业者荣誉榜</h1>  
</header> 
  

  
  <!--公共nav--> 
  
</div>
</div>
</body>
</html>

<script type="text/javascript">
function logreg(){
	var u_name = document.getElementById('u_name').value
	var cont = document.getElementById('cont').value
	var u_pwd = document.getElementById('u_pwd').value
	    var phone = document.getElementById('phone').value
	if(u_name==''){
		alert('请输入姓名')
		}else if(cont==''){
		alert('请输入业务特色')
		}else if(u_pwd.length<4){
		alert('请输入4位以上密码')
		}else if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(phone))){ 
	alert('请输入正确的手机号码')
	}else{
	window.form1.submit();
	}
}
		</script>
		<!--幻灯JS end-->