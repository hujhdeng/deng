<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/m.css" rel="stylesheet" type="text/css" />
<title>聚财村</title>
</head>
<!--#include file="renren_conn.asp" -->
<%
mobtmp=Request.ServerVariables("Http_User_Agent")
if instr(mobtmp,"iPhone") then
txtsize="90%"
elseif instr(mobtmp,"Android") then
txtsize="1em"
else
txtsize="1em"
end if
%>

 <%
id=request.QueryString("id")
u_table="wzhang"
rs.open "select * from "&u_table&" where id='"&id&"'",conn,1,3
%>

<style type="text/css">
	
</style>
<body>
<div id="aa" style="width:100%;  background-color:#990; ">
<!--#include file="userinfo_top.asp" -->
</div>
<%tui_lei=request.QueryString("tui_lei")
if tui_lei=1 then
%>
<span style=" width:50%; float:left;"><a href="userinfo10.asp"><img  src="images/link5a.jpg" width="100%" border="0"  /></a></span><span style=" width:50%; float:left;"><a href="userinfo10b.asp"><img  src="images/link6.jpg" width="100%" border="0"  /></a></span>
<%else%>
<span style=" width:50%; float:left;"><a href="userinfo10.asp"><img  src="images/link5.jpg" width="100%" border="0"  /></a></span><span style=" width:50%; float:left;"><a href="userinfo10b.asp"><img  src="images/link6a.jpg" width="100%" border="0"  /></a></span>
<%end if%>

<div class="middlekuang2">

<div style=" width:100%; float:left;"><img  src="images/u11.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left; font-size:1.2em; font-weight:bold; padding-top:0.5em;"><%=trim(rs("title"))%></div>
<div style=" width:100%; float:left;font-size:0.8em;color:#797979; ">责任编辑：xiaowei 发表时间：时间：<%=trim(rs("u_time"))%> </div>
<div style=" width:100%; float:left;"><img  src="images/u11.jpg" width="100%" border="0"  /></div>
<div style=" width:90%;margin:auto; "><hr /></div>
<div style=" width:90%;  text-align:left; margin:auto; color:#363636;line-height:2em; ">

   <%=trim(rs("content"))%>
</div>




</div>

<div style="clear:both; width:100%; height:180px;"></div>

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
