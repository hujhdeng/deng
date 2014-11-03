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
<title>聚财村</title>
<style type="text/css">
body{
margin:0px;
font: normal 100% 宋体, Arial, sans-serif;

}
body,td,th {
	color: #00F;
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
.middlekuang3{
	 margin:auto;
	 width:80%;
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
	a{
	color:#FFF;
   text-decoration : none;
		}		
</style>
</head>
<!--#include file="renren_conn.asp" -->
<%
'--来自微信的
openid=session("openid")
if openid <>"" then

'tracker_l=request.QueryString("tracker_u")
'if tracker_l<>"" then
' session("tracker_l")=tracker_l
' response.Redirect("index.asp")
' end if
 
'if session("haslog")<>1 then

'u_tel=request.Cookies("mltel")
'u_pwd=request.Cookies("mlpwd")
'if u_tel<>"" and u_pwd<>"" then
'u_table="lmuser"
'rs.open "select * from "&u_table&" where u_tel='"&u_tel&"'" ,conn,1,3
'If Not rs.EOF Or Not rs.BOF Then
' if trim(rs("u_pwd"))<>u_pwd then
' response.Cookies("mltel")=""
' response.Cookies("mlpwd")="" 
' else
' nowtime=now()
'u_ip = Request.ServerVariables("HTTP_X_FORWARDED_FOR") 
'If u_ip = "" Then u_ip = Request.ServerVariables("REMOTE_ADDR")
'rs("u_logip")=u_ip
'rs("u_logtime")=nowtime
'rs("u_logcount")=rs("u_logcount")+1
'rs.update
'	 session("haslog")=1
'	 session("u_name")=trim(rs("u_name"))
'	 session("u_tel")=trim(rs("u_tel"))
'	session("u_jb")=rs("u_jb")
'	session("u_truename")=trim(rs("u_truename"))
'	session("u_sfz")=rs("u_sfz")
'	session("u_qq")=rs("u_qq")
'	session("u_prv")=trim(rs("u_prv"))
'	session("u_city")=trim(rs("u_city"))
'	session("u_qu")=trim(rs("u_qu"))
'	session("u_adr")=trim(rs("u_adr"))
'	session("u_email")=trim(rs("u_email"))
'	session("u_banknum")=trim(rs("u_banknum"))
'	session("u_bankuser")=trim(rs("u_bankuser"))
'	session("u_zfbnum")=trim(rs("u_zfbnum"))
'	session("u_zfbuser")=trim(rs("u_zfbuser"))
'	session("u_cftnum")=trim(rs("u_cftnum"))
'	session("u_cftuser")=trim(rs("u_cftuser"))
'	session("u_dw")=trim(rs("u_dw"))
'	session("u_id")=rs("id")
'	
'	all_mone=trim(rs("u_remoney"))
'	if isnull(all_mone)=true or all_mone="" then
'	all_mone="0"
'	end if
'	session("all_money")=all_mone
'	tg_all_money=trim(rs("tg_all_money"))
'	if isnull(tg_all_money)=true or tg_all_money="" then
'	tg_all_money="0"
'	end if
'	session("tg_all_money")=tg_all_money
'		tj_all_money=trim(rs("tj_all_money"))
'	if isnull(tj_all_money)=true or tj_all_money="" then
'	tj_all_money="0"
'	end if
'	session("tj_all_money")=tj_all_money
'	Response.Cookies("mltel").Expires=Date+7
'	Response.Cookies("mlpwd").Expires=Date+7
'	Response.Cookies("mlid").Expires=Date+7
'	response.Cookies("mltel")=u_tel
'    response.Cookies("mlpwd")=u_pwd 
'	response.Cookies("mlid")=session("u_id")
'	response.Redirect("userinfo1.asp")
'	 end if
'	else
' response.Cookies("mltel")=""
' response.Cookies("mlpwd")="" 
'	end if
'else '--------------

act=request.Form("act")
if act="login" then
rememberpwd="1"
u_tel=request.Form("username")
u_pwd=request.Form("password")
u_table="lmuser"
if u_tel<>"" and u_pwd<>"" then
rs.open "select * from "&u_table&" where u_tel='"&u_tel&"'" ,conn,1,3
If Not rs.EOF Or Not rs.BOF Then
 if trim(rs("u_pwd"))<>u_pwd then
 		 response.write"<script>alert('手机号或密码错误！');document.getElementById('password').value='';</script>"
 else
 nowtime=now()
u_ip = Request.ServerVariables("HTTP_X_FORWARDED_FOR") 
If u_ip = "" Then u_ip = Request.ServerVariables("REMOTE_ADDR")
rs("u_logip")=u_ip
rs("u_logtime")=nowtime
rs("u_logcount")=rs("u_logcount")+1
rs("openid")=openid
mytr=rs("id")
rs.update
	 session("haslog")=1
	 session("u_name")=trim(rs("u_name"))
	 session("u_tel")=trim(rs("u_tel"))
	session("u_jb")=rs("u_jb")
	session("u_truename")=trim(rs("u_truename"))
	session("u_sfz")=rs("u_sfz")
	session("u_qq")=rs("u_qq")
	session("u_prv")=trim(rs("u_prv"))
	session("u_city")=trim(rs("u_city"))
	session("u_qu")=trim(rs("u_qu"))
	session("u_adr")=trim(rs("u_adr"))
	session("u_email")=trim(rs("u_email"))
	session("u_banknum")=trim(rs("u_banknum"))
	session("u_bankuser")=trim(rs("u_bankuser"))
	session("u_zfbnum")=trim(rs("u_zfbnum"))
	session("u_zfbuser")=trim(rs("u_zfbuser"))
	session("u_cftnum")=trim(rs("u_cftnum"))
	session("u_cftuser")=trim(rs("u_cftuser"))
	session("u_dw")=trim(rs("u_dw"))
	session("u_id")=rs("id")
	all_mone=trim(rs("u_remoney"))
	if isnull(all_mone)=true or all_mone="" then
	all_mone="0"
	end if
	session("all_money")=all_mone
	tg_all_money=trim(rs("tg_all_money"))
	if isnull(tg_all_money)=true or tg_all_money="" then
	tg_all_money="0"
	end if
	session("tg_all_money")=tg_all_money
		tj_all_money=trim(rs("tj_all_money"))
	if isnull(tj_all_money)=true or tj_all_money="" then
	tj_all_money="0"
	end if
	session("tj_all_money")=tj_all_money
	if rememberpwd="1" then
		Response.Cookies("mltel").Expires=Date+7
	Response.Cookies("mlpwd").Expires=Date+7
	Response.Cookies("mlid").Expires=Date+7
	 response.Cookies("mltel")=u_tel
 	response.Cookies("mlpwd")=u_pwd
	response.Cookies("mlid")=session("u_id")
	end if 
	response.write"<script>window.localStorage.setItem('mytr', '"&mytr&"');location.href='userinfo1.asp';</script>"
	'response.Redirect("userinfo1.asp")
    end if
	else
	 response.write"<script>alert('手机号或密码错误！');document.getElementById('password').value='';</script>"
	end if
 end if
 
 end if
' end if
' else
' response.Redirect("userinfo1.asp")
'end if
'---没有openip
else
response.Redirect("dk_index.asp")
end if
 %>
<body>
<div id="aa" style="width:100%;  background-color:#990; ">
<div style="width:100%; float:left; clear:both;">
  <img src="images/jcclmlogo.jpg" width="100%" border="0"  /></div>
</div>
<div style="clear:both; width:100%; "></div>
<div class="middlekuang3">
 <form method="post" action=""  id="myform" name="myform">
<div style="width:100%; background-color:#14579d;">
<div style=" width:90%; margin:auto;  clear:both;"><input  style="margin-top:3em;"   name="username" type="text" id="username" onfocus="closewin(this.id)" onblur="showwin(this.id)" value="输入您的手机号" /></div>
<div style=" width:90%; margin:auto;  clear:both;"><input s name="password" type="text" id="password" onfocus="closewin(this.id)" onblur="showwin(this.id)" value="输入密码" /></div>
<div style=" width:95%; margin:auto;  clear:both;"><input name="提交" type="button" style=" background-image:url(images/anbk1.jpg);font-weight:bold; color:#FFF; font-size:1em" value="关联登录账户" onclick="chackuser()"/></div>
<div style=" width:80%;margin:auto;margin-top:1.5em;">
<div style=" width:100%;margin:auto; color:#FFF; padding-top:0.2em;padding-bottom:0.5em; text-align:left" ><a href="wb_userreg.asp">免费注册推广联盟会员</a></div>
</div>
<div style=" width:80%;margin:auto;margin-top:0.5em;">
<div style=" width:100%;margin:auto; color:#FFF; padding-top:0.5em;padding-bottom:0.5em; text-align:left" ><a href="jcc_findpassword.asp">忘记密码？</a></div>
</div>
<div style=" width:80%;margin:auto;margin-top:1.5em;">
<div style=" width:100%;margin:auto; color:#FFF; padding-top:0.5em;padding-bottom:0.5em; text-align:left" ></div>
</div>
<input name="act" type="hidden" value="login" />
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
	if(tmp=="username"){
		if(document.getElementById("username").value=="输入您的手机号"){
			document.getElementById("username").value=""
			}
		}else if(tmp=="password"){
		if(document.getElementById("password").value=="输入密码"){
			document.getElementById("password").type="password"
			document.getElementById("password").value=""
		
			}
		} 
}
function showwin(tmp){

		//document.getElementById("pop_window").style.display="block"
	if(tmp=="username"){
		if(document.getElementById("username").value==""){
			document.getElementById("username").value="输入您的手机号"
			}
		}else if(tmp=="password"){
		if(document.getElementById("password").value==""){
			document.getElementById("password").type="text"
			document.getElementById("password").value="输入密码"
			}
		} 
	}
	
function chackuser(){
	
	var password=document.getElementById("password").value
	  var sMobile = document.getElementById("username").value
	  
   if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(sMobile))){ 
        alert("请输入正确的手机号"); 
    }else  if(password==""||password=="输入密码"){ 
        alert("请输入密码"); 
        }else{
	var form = document.getElementById("myform"); 
               form.submit();
		 }
		}
</SCRIPT>