<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="../include/taglib.jsp"%>
<!doctype html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta content="telephone=no" name="format-detection" />
<meta name="viewport" content="minimum-scale=0.67, maximum-scale=2, initial-scale=1, user-scalable=no, width=device-width" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate" />
<meta http-equiv="expires" content="Wed, 26 Feb 1997 08:21:57 GMT" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>聚财村</title>
<%@include file="../include/commonVar.jsp"%>
<style type="text/css">
<!--
body {
	width:100%;
	background-color: #e5e5e5;
	margin: 0;
	padding: 0;
}
ul, ol, dl { 
	padding: 0;
	margin: 0;
}
h1, h2, h3, h4, h5, h6, p {
	margin-top: 0;	 
	padding-right: 15px;
	padding-left: 15px; /* 向块内的元素侧边（而不是块元素自身）添加填充可避免使用任何方框模型数学。此外，也可将具有侧边填充的嵌套块用作替代方法。 */
}
a img { /* 此选择器将删除某些浏览器中显示在图像周围的默认蓝色边框（当该图像包含在链接中时） */
	border: none;
}
/* ~~ 站点链接的样式必须保持此顺序，包括用于创建悬停效果的选择器组在内。 ~~ */
a:link {
	color: #42413C;
	text-decoration: underline; /* 除非将链接设置成极为独特的外观样式，否则最好提供下划线，以便可从视觉上快速识别 */
}
a:visited {
	color: #6E6C64;
	text-decoration: underline;
}
a:hover, a:active, a:focus { /* 此组选择器将为键盘导航者提供与鼠标使用者相同的悬停体验。 */

	text-decoration: none;
}
/* ~~ 此固定宽度容器包含所有其它块 ~~ */
.container {
	width: 100%;
	/*background-color: #e5e5e5;*/
	margin: 0 auto; /* 侧边的自动值与宽度结合使用，可以将布局居中对齐 */
}

.sidebar1 {
	float: right;
	width: 180px;
	background-color: #EADCAE;
	padding-bottom: 10px;
}
.content {
	padding: 10px 0;
	width: 100%;
	float: right;
}

/* ~~ 此分组的选择器为 .content 区域中的列表提供了空间 ~~ */
.content ul, .content ol {
	padding: 0 15px 15px 40px; /* 此填充反映上述标题和段落规则中的右填充。填充放置于下方可用于间隔列表中其它元素，置于左侧可用于创建缩进。您可以根据需要进行调整。 */
}

/* ~~ 导航列表样式（如果选择使用预先创建的 Spry 等弹出菜单，则可以删除此样式） ~~ */
ul.nav {
	list-style: none; /* 这将删除列表标记 */
	border-top: 1px solid #666; /* 这将为链接创建上边框 – 使用下边框将所有其它项放置在 LI 中 */
	margin-bottom: 15px; /* 这将在下面内容的导航之间创建间距 */
}
ul.nav li {
	border-bottom: 1px solid #666; /* 这将创建按钮间隔 */
}
ul.nav a, ul.nav a:visited { /* 对这些选择器进行分组可确保链接即使在访问之后也能保持其按钮外观 */
	padding: 5px 5px 5px 15px;
	display: block; /* 这将为链接赋予块属性，使其填满包含它的整个 LI。这样，整个区域都可以响应鼠标单击操作。 */
	width: 160px;  /*此宽度使整个按钮在 IE6 中可单击。如果您不需要支持 IE6，可以删除它。请用侧栏容器的宽度减去此链接的填充来计算正确的宽度。 */
	text-decoration: none;
	background-color: #C6D580;
}
ul.nav a:hover, ul.nav a:active, ul.nav a:focus { /* 这将更改鼠标和键盘导航的背景和文本颜色 */
	background-color: #ADB96E;
	color: #FFF;
}

/* ~~ 脚注 ~~ */
footer {
	padding: 10px 0;
	background-color: #CCC49F;
	position: relative;/* 这可以使 IE6 hasLayout 以正确方式进行清除 */
	clear: both; /* 此清除属性强制 .container 了解列的结束位置以及包含列的位置 */
}

/*HTML 5 支持 - 将新 HTML 5 标签设置为 display:block，以使浏览器知道如何正确呈现标签。 */
header, section, footer, aside, article, figure {
	display: block;
}
header{ text-align:center; color:#FFF;background-color: #2a9ae4; padding-top:0.5em; padding-bottom:0.5em; font-family:微软雅黑; font-size:22px;}
section{ width:96%;  margin:auto;overflow: auto; padding-top:0.5em; background-color:#fff;   }
.mtitle{ width:36%; color:#666666; float:left; font-size:0.9em;  padding-top:0.3em;}
.mtxt{  color:#9c9c9c; float:left; font-size:0.9em; width:60%; line-height:1.5em;word-break:break-all;  }
.mkuang{ width:90%; float:left; padding-left:1.5em; color:#323232; clear:both; margin-bottom:1.2em;  }
body{ 
     width:100%;
	 /*background-image:url(bk.jpg);
     background-size:100%;*/}
-->
</style>
<!--[if lt IE 9]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
</head>
<body >

<div class="container" id='sdan'>
  <header>
   <div style=" font-size:0.8em">聚财村</div>
  </header>
 <div style="width:100%;"><a href="wx/jccappdown.php"><img  src="/images/p20.jpg" width="100%"></a></div> 
 <div style="width:100%; height:0.2em; clear:both;"></div>   
   
    <section> 
    
    <div style="width:95%;height:90px;float:left; padding-left:1em; margin-top:15px;text-align:center; ">
    <div style="font-size:1.8em;  font-family:微软雅黑; font-size:1.8em; ">${sd.title}</div>
    <div style="padding-top:0.5em; padding-top:1em; color:#7e7e7e; " >发起人：<span style="color:#2c8bc5;">${sd.uName}</span>${sd.regtime}</div>
    </div>
   </section>  

 <div style="width:100%; height:0.3em; clear:both;"></div>      
    <section>
  <div style="width:100%; height:0.2em; clear:both;"></div>     
         <div class="mkuang" >
         <div class="mtitle">业务类型</div><div class="mtxt">${sd.type}</div>
         </div>
         <div class="mkuang" >
         <div class="mtitle">贷款金额</div><div class="mtxt"><span style="color:#2c8bc5;">${sd.money}万</span></div>
         </div>   
          <div class="mkuang" >     
         <div class="mtitle">办理地点</div><div class="mtxt"><span style="color:#2c8bc5;">{sd.area}</span></div>
         </div>  
          <div class="mkuang" >     
         <div class="mtitle">放款时间</div><div class="mtxt">{sd.limitdate}天</div>
         </div>           
          <div class="mkuang" >     
         <div class="mtitle">用款周期</div><div class="mtxt">{sd.howlong}个月</div>
         </div>     
          <div class="mkuang" >     
         <div class="mtitle">甩单简介</div><div class="mtxt">{sd.$content}</div>
         </div>  
         
            

  <div style="width:100%; height:1em; clear:both;"></div>
  
   <a href='?sat=chat&uid=${wxuid}&id=${id}'><img  src="/images/p22.jpg" width="100%"></a>
    <div style="width:100%; height:5em; clear:both;"></div> 
    </section>

       
       
  <!-- end .container --></div>
  
<div id='chat' >
  <header>
   <div style=" font-size:0.8em">聚财村</div>
  </header>
 <div style="width:100%;"><a href="wx/jccappdown.php"><img  src="/images/p20.jpg" width="100%"></a></div> 
 <div style="width:100%; height:0.2em; clear:both;"></div>   
<div style="margin:auto;width:96%; background-color:#FFF; height:400px;">

<div style="margin:auto;width:84%; background-color:#FFF; font-size:1em; ">
<div style="width:100%; height:2em; clear:both;"></div> 
<form action="wx/wx_log_sdan.php?uid=<?php echo $wxuid;?>&id=<?php echo $id;?>" method="post" name="form" >
<textarea name="content" cols="" rows="5" id="content" style="width:100%; margin-left:-4px;"></textarea>
</form>
</div>
<div style="width:100%; height:1em; clear:both;"></div>
<img onClick="jiedan()"  src="/images/p22.jpg" width="100%">
</div> 

</div>    
</body>
</html>
<script>
function guanzhu(str){
	//alert(str)
	window.location.href='wx/wx_log.php?uid='+str;
	}
</script>
<script>

var imgUrl = 'http://www.jucaicun.com/app/images/logo108.png';
var lineLink = 'http://www.jucaicun.com/app//wxfx/sdan?uid=${wxuid}&id=${id}';
var descContent = "我在聚财村甩单了，大家快来接单吧。";
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
	var sat='${sat}';
	if(sat=='chat'){
		document.getElementById('sdan').style.display='none';
		document.getElementById('chat').style.display='block';
		}else{
			document.getElementById('sdan').style.display='block';
		document.getElementById('chat').style.display='none';	
			}	
			
function jiedan(){
	document.form.submit();
	}		
</script>