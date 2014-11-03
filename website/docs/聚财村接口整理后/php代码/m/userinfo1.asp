<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="function.asp" -->
<%
'------------手机跳转
if getmobi()=1 then
trtmp=request.QueryString("tr")
if trtmp<>"" then
response.Redirect("../index.asp?tr="&trtmp)
else
response.Redirect("../index.asp")
end if
end if
%>
<script type="text/javascript" charset="utf-8" src="js/m.js"></script>
<script language="javascript">
settracktop()
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/m.css" rel="stylesheet" type="text/css" />
<!--#include file="renren_conn.asp" -->
<title>聚财村</title>
</head>
<%
act=request.QueryString("act")
if session("u_name")="" then
 response.Cookies("mltel")=""
 response.Cookies("mlpwd")=""
response.Redirect("index.asp")
elseif act="abort" then

openid=session("openid")
if openid <>"" then
u_table="lmuser"
rs.open "select * from "&u_table&" where openid='"&openid&"'" ,conn,1,3
If Not rs.EOF Or Not rs.BOF Then
rs("openid")=""
rs.update
end if
rs.close
end if
session("tracker_l")=""
session("haslog")=0
 response.Cookies("mltel")=""
 response.Cookies("mlpwd")=""
 session("u_name")=""
response.Redirect("index.asp")
end if

mobtmp=Request.ServerVariables("Http_User_Agent")
if instr(mobtmp,"iPhone") then
txtsize="90%"
elseif instr(mobtmp,"Android") then
txtsize="1em"
else
txtsize="1em"
end if
%>
<style type="text/css">
body{
margin:0px;
font: normal 100% 宋体, Arial, sans-serif;
background-color:#f0f0f0;
}
body,td,th {
	color: #00F;
}

.middlekuang2{
	 margin:auto;
	 width:100%;
	text-align:center;
		}
		input{
			width:100%;
			border:0;
			font-size:<%=txtsize%>;
	}		
</style>
<body>
<%
all_money=session("all_money")
if all_money="" then all_money=0
if InStr(all_money,".") then
all_money=split(all_money,".")(0)
end if
%>
<div id="aa" style="width:100%;  background-color:#990; ">
<!--#include file="userinfo_top.asp" -->
</div>
<div class="middlekuang2">
<div style=" width:100%; float:left;background-color:#3e7cb7;color:#FFF; text-align:left;font-size:0.7em;">

<div style=" float:left; padding:1em;">
<span id="name" style="font-size:1.2em; font-weight:bold;color:#feef00; "> <%=cstr(session("u_name"))%></span><span>你好！ 你目前的累计收入为：</span><span id="money" style="font-size:1.2em; font-weight:bold;color:#feef00; "><%=cstr(all_money)%></span><span> 元</span>
</div>
</div>
<div style=" width:100%; float:left;background-color:#f0f0f0;">
<div style=" width:33.90092879256966%; float:left;background-color:#f0f0f0;"><a href="userinfo2.asp"><img  src="images/u1.jpg" width="100%" border="0"  /></a></div>
<div style=" width:32.19814241486068%; float:left;background-color:#f0f0f0;"><a href="userinfo3.asp"><img  src="images/u2.jpg" width="100%" border="0"  /></a></div>
<div style=" width:33.90092879256966%; float:left;background-color:#f0f0f0;"><a href="userinfo4.asp"><img  src="images/u3.jpg" width="100%" border="0"  /></a></div>
</div>
<div style=" width:100%; float:left;background-color:#f0f0f0;">
<div style=" width:33.90092879256966%; float:left;background-color:#f0f0f0;"><a href="userinfo5.asp"><img  src="images/u4.jpg" width="100%" border="0"  /></a></div>
<div style=" width:32.19814241486068%; float:left;background-color:#f0f0f0;"><a href="userinfo6.asp"><img  src="images/u5.jpg" width="100%" border="0"  /></a></div>
<div style=" width:33.90092879256966%; float:left;background-color:#f0f0f0;"><a href="userinfo7.asp"><img  src="images/u6.jpg" width="100%" border="0"  /></a></div>
</div>
<div style=" width:100%; float:left;background-color:#f0f0f0;">
<div style=" width:33.90092879256966%; float:left;"><a href="userinfo8.asp"><img  src="images/u7.jpg" width="100%" border="0"  /></a></div>
<div style=" width:32.19814241486068%; float:left;"><a href="userinfo9.asp"><img  src="images/u8.jpg" width="100%" border="0"  /></a></div>
<div style=" width:33.90092879256966%; float:left;"><a href="userinfo10.asp"><img  src="images/u9.jpg" width="100%" border="0"  /></a></div>
</div>
</div>
<div style="clear:both; width:100%; height:30px;"></div>
<div style=" width:100%; float:left;background-color:#f0f0f0;">
<div style=" width:100%; float:left;" onclick="window.localStorage.removeItem('mytr');"><a href="userinfo1.asp?act=abort"><img  src="images/quituser.jpg" width="100%" border="0"  /></a></div>
</div>

<div style="clear:both; width:100%; height:72px;"></div>
</body>
<div id="pop_window">
 <!--#include file="lmbottomlink.asp" -->
</div>
</body>
</html>
<script type="text/javascript">
//if (window.innerWidth>window.innerHeight){
//document.getElementById("name").innerHTML=document.getElementById("tt").height;
//}else{
//document.getElementById("name").innerHTML=document.getElementById("tt").height
//}
//$(window).on("orientationchange",function(){
//  document.getElementById("name").innerHTML=window.innerWidth;
//});
</script>
