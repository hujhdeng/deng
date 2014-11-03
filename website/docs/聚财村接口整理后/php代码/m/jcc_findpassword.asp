<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 

"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-

scale=1, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>聚财村</title>
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
	a {
		text-decoration:none;
		color:#666;
		}		
</style>
</head>
<%
act=request.Form("act")
if act="sendjym" then
jym=request.Form("yzm")
if cstr(session("passcode"))<>jym then

if session("errornum")="" then
session("errornum")=1
else
session("errornum")=session("errornum")+1
end if
if session("errornum")>5 then
response.write"<script>alert('验证码错误！');location.href='index.asp';</script>"
else
response.write"<script>alert('验证码错误');</script>"
end if
else
session("passcode")=""
session("resetpassword")="ok"
response.Redirect("jcc_findpassword2.asp")
end if
end if
%>
<body>

<div style="width:80%;  clear:both; padding:1em; margin:auto; ">
 <span style="float:left;"><a href="index.asp">&lt;首页</a></span><span style="float:right;"><a href="jcc_log.asp">登录</a></span>
</div>
<div style="clear:both; width:100%"></div>
<hr />
<div style="clear:both; width:100%; "></div>
<div class="middlekuang4">
<form id="myform" name="myform" method="post" action="">
<div style="width:100%; ">
<%
TheInfo = UCase(Request.ServerVariables("HTTP_USER_AGENT")) 
if instr(TheInfo,UCase("android")) then
stxt=" width:95%; margin:auto;  clear:both;"
else
stxt=" width:90%; margin:auto;  clear:both;"
end if
%>
<div style=" <%=stxt%>"><input  style="margin-top:1em; background-color:#eee;"   name="tel" type="text" id="tel" onfocus="closewin(this.id)" onblur="showwin(this.id)" value="输入手机号" /></div>

<div style=" width:90%; margin:auto;  clear:both;">

<div style=" margin:auto;width:95%; text-align:left;"><input style=" width:35%; background-color:#eee;" name="yzm" type="text" id="yzm" onfocus="closewin(this.id)" onblur="showwin(this.id)" value="验证码" /> 
<span style="color:#ff6304; font-size:0.8em;" onclick="getcode()">【点击获取验证码】</span></div></div>

<div style=" width:96%; margin:auto;  clear:both;"><input name="提交" type="button" style=" background-image:url(images/anbk1.jpg);font-weight:bold; color:#FFF; font-size:1em" onclick="subyzm()" value="提交" /></div>

<div style=" width:80%;margin:auto;margin-top:1.5em;">
  <div style=" width:100%;margin:auto; color:#FFF; padding-top:0.5em;padding-bottom:0.5em; text-align:left" ></div>
</div>
</div>
<input name="act" type="hidden" value="sendjym" />
</form>
</div>
<div style="clear:both; width:100%; height:80px;"></div>

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
	//document.getElementById("pop_window").style.display="none"
	if(tmp=="tel"){
		if(document.getElementById("tel").value=="输入手机号"){
			document.getElementById("tel").value=""
			}
		}else if(tmp=="yzm"){
		if(document.getElementById("yzm").value=="验证码"){
			document.getElementById("yzm").value=""
			}
		}
}
function showwin(tmp){

		//document.getElementById("pop_window").style.display="block"
	if(tmp=="tel"){
		if(document.getElementById("tel").value==""){
			document.getElementById("tel").value="输入手机号"
			}
		}else if(tmp=="yzm"){
		if(document.getElementById("yzm").value==""){
			document.getElementById("yzm").value="验证码"
			}
		} 
	}

var req
function getcode(){

 var telnum=document.getElementById("tel").value
 //setCookie("mltel",telnum,7)
 if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(telnum))){ 
        alert("请输入正确的手机号"); 
    } else{
	 req =new XMLHttpRequest();
          
                req.open("GET", "findpassword_an.asp?telnum=" + telnum, "false"); 
	
      req.onreadystatechange = resavecode; 
     
                req.send(null); 
    
	}
	function resavecode(){
		if (req.readyState == 4) { 
		var ret = req.responseText;
		//alert (ret)
		yn=ret.split(":")[0]
		yntxt=ret.split(":")[1]
	
		if(yn=="error2"){
			alert(yntxt)
			}else if(yn=="error"){
			alert("验证码发送失败，请与管理员联系！")	
			}else{
				
			alert("验证码已经发送到你的手机，请注意查收")	
			//document.getElementById("jymsend").style.display="block"
				}
		}
	}
}
	function subyzm(){
	 var yzm=document.getElementById("yzm").value
	 if(yzm==""){
		 alert("请输入验证码！")
		 }else{
				var form = document.getElementById("myform"); 
               form.submit(); 
			 }
		}
</SCRIPT>