<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="function.asp" -->
<%
'------------手机跳转
if getmobi()=1 then
trtmp=request.QueryString("tr")
if trtmp<>"" then
response.Redirect("../index.asp?tr="&trtmp)
else
response.Redirect("../lm_index.asp")
end if
end if
%>
<script type="text/javascript" charset="utf-8" src="js/m.js"></script>
<script language="javascript">
settracktop()
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 

"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-

scale=1, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/m.css" rel="stylesheet" type="text/css" />
<title>聚财村</title>
<!--#include file="renren_conn.asp" -->
<%
'--来自微信的
openid=session("openid")
if openid <>"" then
act=request.Form("act")
if act="reguser" then
u_name=request.Form("u_name")
u_tel=request.Form("u_tel")
u_pwd=request.Form("u_pwd1")
u_table="lmuser"
if u_name<>"" and u_tel<>"" and u_pwd<>"" then
rs.open "select * from "&u_table&" where u_tel='"&u_tel&"'" ,conn,1,3
If Not rs.EOF Or Not rs.BOF Then
response.write"<script>alert('该号码已经注册过,请返回点击 忘记密码？');</script>"
else
nowtime=now()
u_ip = Request.ServerVariables("HTTP_X_FORWARDED_FOR") 
If u_ip = "" Then u_ip = Request.ServerVariables("REMOTE_ADDR")
rs.addnew
if session("tracker_l")<>"" then
rs("tj_fangshi")="链接推广"
end if
rs("u_tracker")=session("tracker_l")
rs("u_name")=u_name
rs("u_tel")=u_tel
rs("u_pwd")=u_pwd
rs("u_jb")=0
rs("u_regip")=u_ip
rs("u_logip")=u_ip
rs("u_regtime")=nowtime
rs("u_logtime")=nowtime
rs("u_logcount")=1
rs("u_truename")=u_name
rs("u_sfz")=0
rs("u_qq")=0
rs("u_prv")=""
rs("u_city")=""
rs("u_qu")=""
rs("u_adr")=""
rs("u_email")=""
rs("openid")=openid
rs.update
rs.movelast
session("u_id")=rs("id")
mytr=session("u_id")
rs.close
session("u_name")=u_name
session("u_tel")=u_tel
session("u_jb")=0
session("u_truename")=u_name
session("u_sfz")=0
session("u_qq")=0
session("u_prv")=""
session("u_city")=""
session("u_qu")=""
session("u_adr")=""
session("u_email")=""
session("haslog")=1
session("u_banknum")=""
session("u_bankuser")=""
session("u_zfbnum")=""
session("u_zfbuser")=""
session("u_cftnum")=""
session("u_cftuser")=""
response.Cookies("mltel")=u_tel
response.Cookies("mlpwd")=u_pwd 
response.write"<script>window.localStorage.setItem('mytr', '"&mytr&"');alert('恭喜您已成功注册！请继续完善您的个人资料');location.href='userinfo1.asp';</script>"
'response.Redirect("index.asp")
end if
end if
end if
else
response.Redirect("dk_index.asp")
end if
%>
<style type="text/css">
body{
margin:0px;
font: normal 100% 宋体, Arial, sans-serif;

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
			background-color:#ddd;
	}			
</style>
</head>

<body>


<div style="clear:both; width:100%; "></div>
<form id="myform" name="myform" method="post" action="">
<div class="middlekuang4">
<div style="width:100%; ">
<div style=" width:90%; margin:auto;  clear:both;"><input  style="margin-top:1em; background-color:#ddd;"   name="u_name" type="text" id="u_name" onfocus="closewin(this.id)" onblur="showwin(this.id)" value="请输入姓名" /></div>
<div style=" width:90%; margin:auto;  clear:both;"><input style=" background-color:#ddd;" name="u_tel" type="text" id="u_tel" onfocus="closewin(this.id)" onblur="showwin(this.id)" value="请输入手机号" /></div>
<div style=" width:90%; margin:auto;  clear:both;"><input style=" background-color:#ddd;" name="u_pwd1" type="text" id="u_pwd1" onfocus="closewin(this.id)" onblur="showwin(this.id)" value="请输入密码" /></div>
<div style=" width:95%; margin:auto;  clear:both; text-align:left; font-size:0.8em;"><input style="width:10%" name="" type="checkbox" value="" checked />我已阅读并同意推广联盟<a href="xy.asp">"使用协议"</a></div>
<div style=" width:95%; margin:auto;  clear:both;"><input name="提交" type="button" style=" background-image:url(images/anbk1.jpg);font-weight:bold; color:#FFF; font-size:1em" onclick="chackreg()" value="注册并关联账户" /></div>
<div style=" width:80%;margin:auto;margin-top:1.5em;">
  <div style=" width:100%;margin:auto; color:#FFF; padding-top:0.5em;padding-bottom:0.5em; text-align:left" ></div>
</div>
</div>
</div>
<input name="act" type="hidden" value="reguser" />
</form>
<div style="clear:both; width:100%; height:80px;"></div>

<div id="pop_window">

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
	if(tmp=="u_tel"){
		if(document.getElementById("u_tel").value=="请输入手机号"){
			document.getElementById("u_tel").value=""
			}
		}else if(tmp=="u_pwd1"){
		if(document.getElementById("u_pwd1").value=="请输入密码"){
			document.getElementById("u_pwd1").value=""
			document.getElementById("u_pwd1").type="password"
			}
		} else if(tmp=="u_name"){
		if(document.getElementById("u_name").value=="请输入姓名"){
			document.getElementById("u_name").value=""
			}
		} 
}
function showwin(tmp){

		document.getElementById("pop_window").style.display="block"
	if(tmp=="u_tel"){
		if(document.getElementById("u_tel").value==""){
			document.getElementById("u_tel").value="请输入手机号"
			}
		}else if(tmp=="u_pwd1"){
		if(document.getElementById("u_pwd1").value==""){
			document.getElementById("u_pwd1").type="text"
			document.getElementById("u_pwd1").value="请输入密码"
			}
		} else if(tmp=="u_name"){
		if(document.getElementById("u_name").value==""){
			document.getElementById("u_name").value="请输入姓名"
			}
		}
	}
function chackreg(){
	var u_name=document.getElementById("u_name").value
	  var sMobile = document.getElementById("u_tel").value
	  
   if(u_name==""){ 
        alert("请输姓名"); 
       document.getElementById("u_name").focus(); 
        }else if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(sMobile))){ 
        alert("请输入正确的手机号"); 
    } else if(document.getElementById("u_pwd1").value.length<4 ||document.getElementById("u_pwd1").value.length>12)  { 
		alert ("请输入4~12位登录密码")	;

		}else{
				var form = document.getElementById("myform"); 
               form.submit();
				 }

	}
</SCRIPT>