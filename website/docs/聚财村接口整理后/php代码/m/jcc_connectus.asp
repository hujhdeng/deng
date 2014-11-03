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
rs.open "select * from wzhang where web_lei='m2' and lei='16' order by id desc",conn,1,3
%>

<style type="text/css">
	
</style>
<body>




<div class="middlekuang2">

<div style=" width:100%; float:left;"><img  src="images/u11.jpg" width="100%" border="0"  /></div>

<div style=" width:100%; float:left;"><img  src="images/u11.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left; margin:auto;"><img  src="images/connectus1.jpg" width="90%" border="0"  /></div>
<div style=" width:90%;margin:auto; "></div>
<div style=" width:100%; float:left;"><img  src="images/u11.jpg" width="100%" border="0"  /></div>
<div style=" width:90%;  text-align:left; margin:auto; color:#363636;line-height:2em; ">

   <%=trim(rs("content"))%>
</div>




</div>
<%rs.close%>
<div style="clear:both; width:100%; height:180px;"></div>

<div id="pop_window">
 <!--#include file="bottomlink.asp" -->
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
