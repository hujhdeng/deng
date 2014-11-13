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
<title>聚财村</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@include file="../include/commonVar.jsp"%>
<!--[if lt IE 9]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
</head>
<body >

<div class="container" id='sdan'>
  <header>
   <div style=" font-size:0.8em">聚财村</div>
  </header>
 <div style="width:100%;"><a href="wx/jccappdown.php"><img  src="images/p20.jpg" width="100%"></a></div> 
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
  
   <a href='?sat=chat&uid=${wxuid}&id=${id}'><img  src="images/p22.jpg" width="100%"></a>
    <div style="width:100%; height:5em; clear:both;"></div> 
    </section>

       
       
  <!-- end .container --></div>
  
<div id='chat' >
  <header>
   <div style=" font-size:0.8em">聚财村</div>
  </header>
 <div style="width:100%;"><a href="wx/jccappdown.php"><img  src="images/p20.jpg" width="100%"></a></div> 
 <div style="width:100%; height:0.2em; clear:both;"></div>   
<div style="margin:auto;width:96%; background-color:#FFF; height:400px;">

<div style="margin:auto;width:84%; background-color:#FFF; font-size:1em; ">
<div style="width:100%; height:2em; clear:both;"></div> 
<form action="wx/wx_log_sdan.php?uid=<?php echo $wxuid;?>&id=<?php echo $id;?>" method="post" name="form" >
<textarea name="content" cols="" rows="5" id="content" style="width:100%; margin-left:-4px;"></textarea>
</form>
</div>
<div style="width:100%; height:1em; clear:both;"></div>
<img onClick="jiedan()"  src="images/p22.jpg" width="100%">
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