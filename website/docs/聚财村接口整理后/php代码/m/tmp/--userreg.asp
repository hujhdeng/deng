<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 

"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-

scale=1, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<style type="text/css">
body{
margin:0px;
font: normal 100% 宋体, Arial, sans-serif;

}

#pop_window {
	font-size:12px;
	width:100%;
	height:70px;
	position:fixed;
	bottom:0px;
	left:0px;
	background-color:#292929;
            }
				#pop_window td{
				border-top: 1px solid #373737;
        border-left: 1px solid #373737;
		text-align:center;
		}
.middlekuang4{
	 margin:auto;
	 width:90%;
	text-align:center;
	margin-top:1.5em;
		}
				input{
			width:90%;
			border:0 #eee;
			padding-top:0.8em;
			padding-bottom:0.8em;
			font-size:90%;
			margin-top:1.5em;
			color:#909090;
	}			
</style>
</head>

<body>

<div style="width:80%;  clear:both; padding:1em; margin:auto; ">
 <span style="float:left;">&lt;首页</span><span style="float:right;">登录</span>
</div>
<div style="clear:both; width:100%"></div>
<hr />
<div style="clear:both; width:100%; "></div>
<div class="middlekuang4">
<div style="width:100%; ">
<div style=" width:90%; margin:auto;  clear:both;"><input  style="margin-top:1em; background-color:#eee;"   name="username" type="text" id="username" onfocus="closewin(this.id)" onblur="showwin(this.id)" value="请输入姓名" /></div>
<div style=" width:90%; margin:auto;  clear:both;"><input style=" background-color:#eee;" name="tel" type="text" id="tel" onfocus="closewin(this.id)" onblur="showwin(this.id)" value="请输入手机号" /></div>
<div style=" width:90%; margin:auto;  clear:both;"><input style=" background-color:#eee;" name="password" type="text" id="password" onfocus="closewin(this.id)" onblur="showwin(this.id)" value="请输入密码" /></div>
<div style=" width:95%; margin:auto;  clear:both; text-align:left; font-size:0.8em;"><input style="width:10%" name="" type="checkbox" value="" checked />我已阅读并同意推广联盟“使用协议”</div>
<div style=" width:95%; margin:auto;  clear:both;"><input name="提交" type="button" style=" background-image:url(images/anbk1.jpg);font-weight:bold; color:#FFF; font-size:1em" value="立即注册" /></div>
<div style=" width:80%;margin:auto;margin-top:1.5em;">
  <div style=" width:100%;margin:auto; color:#FFF; padding-top:0.5em;padding-bottom:0.5em; text-align:left" ></div>
</div>
</div>
</div>
<div style="clear:both; width:100%; height:80px;"></div>
</body>
<div id="pop_window">
  <table width="100%" height="70px" border="0" align="center">
    <tr>
      <td style="border-left:0"><img src="images/lman1.jpg" width="50" height="42" 

/></td>
      <td><img src="images/lman2.jpg" width="50" height="42" /></td>
      <td><img src="images/lman3.jpg" width="50" height="42" /></td>
      <td><img src="images/lman4.jpg" width="50" height="42" /></td>
      <td><img src="images/lman5.jpg" width="50" height="42" /></td>
    </tr>
  </table>
</div>
</body>
</html>
    <script type="text/javascript"  >

     ww=screen.width-20;
     hh= screen.availHeight-window.screenTop-10-70;
		 //document.getElementById('aa').style.width=String(ww)+'px'
		 //document.getElementById('aa').style.height=String(hh)+'px'
		//document.write(document.getElementById('aa').style.width)
//document.write("屏幕尺寸："+screen.width+"*"+screen.height)
//alert (hh+"--"+window.screenTop+"--"+screen.availHeight)
    </script>
<script type="text/javascript">
var browser={
versions:function(){
var u = navigator.userAgent, app = navigator.appVersion;
return { //移动终端浏览器版本信息
trident: u.indexOf('Trident') > -1, //IE内核
presto: u.indexOf('Presto') > -1, //opera内核
webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核
mobile: !!u.match(/AppleWebKit.*Mobile.*/), //是否为移动终端
ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或uc浏览器
iPhone: u.indexOf('iPhone') > -1 , //是否为iPhone或者QQHD浏览器
iPad: u.indexOf('iPad') > -1, //是否iPad
webApp: u.indexOf('Safari') == -1 //是否web应该程序，没有头部与底部
};
}(),
language:(navigator.browserLanguage || navigator.language).toLowerCase()
}
//document.writeln("语言版本: "+browser.language);
//document.writeln(" 是否为移动终端: "+browser.versions.mobile);
//document.writeln(" ios终端: "+browser.versions.ios);
//document.writeln(" android终端: "+browser.versions.android);
//document.writeln(" 是否为iPhone: "+browser.versions.iPhone);
//document.writeln(" 是否iPad: "+browser.versions.iPad);
//document.writeln(navigator.userAgent);
 var images= ["images/lmad1.jpg", "images/lmad2.jpg"];
    var index = 0;
    function switch_background(){    
    if(index ==images.length-1)
    {        
         index = 0;  
    }else{   
         index++;      
    }   

   document.getElementById("div1").src=images[index];
}
window.onload = function()
{
    setInterval(switch_background, 4000);
} 
</script>
<SCRIPT  LANGUAGE="JavaScript" >
function closewin(tmp){
	document.getElementById("pop_window").style.display="none"
	if(tmp=="tel"){
		if(document.getElementById("tel").value=="请输入手机号"){
			document.getElementById("tel").value=""
			}
		}else if(tmp=="password"){
		if(document.getElementById("password").value=="请输入密码"){
			document.getElementById("password").value=""
			}
		} else if(tmp=="username"){
		if(document.getElementById("username").value=="请输入姓名"){
			document.getElementById("username").value=""
			}
		} 
}
function showwin(tmp){

		document.getElementById("pop_window").style.display="block"
	if(tmp=="tel"){
		if(document.getElementById("tel").value==""){
			document.getElementById("tel").value="请输入手机号"
			}
		}else if(tmp=="password"){
		if(document.getElementById("password").value==""){
			document.getElementById("password").value="请输入密码"
			}
		} else if(tmp=="username"){
		if(document.getElementById("username").value==""){
			document.getElementById("username").value="请输入姓名"
			}
		}
	}
	
//var    s  ="网页可见区域宽："+  document.body.clientWidth;
//s+="<br/>网页可见区域高："+  document.body.clientHeight;
//s  +=  "<br/>网页正文全文宽："+  document.body.scrollWidth;
//s  +=  "<br/>网页正文全文高："+  document.body.scrollHeight;
//s  +=  "<br/>网页正文部分上："+  window.screenTop;
//s  +=  "<br/>网页正文部分左："+  window.screenLeft;
//s  +=  "<br/>屏幕分辨率的高："+  window.screen.height;
//s  +=  "<br/>屏幕分辨率的宽："+  window.screen.width;
//s  +="<br/>屏幕可用工作区高度："+  window.screen.availHeight;
//s  +="<br/>屏幕可用工作区宽度："+  window.screen.availWidth;
//document.write(s);
</SCRIPT>