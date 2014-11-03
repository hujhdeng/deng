<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/m.css" rel="stylesheet" type="text/css" />
<title>聚财村</title>
</head>
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
<style type="text/css">
	a{ color:#343434;}	
</style>
<body>
<div id="aa" style="width:100%;  background-color:#990; ">
<!--#include file="userinfo_top.asp" -->
</div>
<span style=" width:50%; float:left;"><a href="userinfo10.asp"><img  src="images/link5a.jpg" width="100%" border="0"  /></a></span><span style=" width:50%; float:left;"><a href="userinfo10b.asp"><img  src="images/link6.jpg" width="100%" border="0"  /></a></span>
<div style=" width:100%; float:left;"><img  src="images/u11.jpg" width="100%" border="0"  /></div>
<div class="middlekuang">




<div id="showtable" style=" width:100%; float:left; text-align:left; ">
<table width="100%" border="0">

    <tr >
    <td ><a href="lm_index.asp?tr=<%=session("u_id")%>">·点击分享</a></td>
  </tr>

  

</table>
</div>



<div style=" width:100%; height:1em; float:left; clear:both;"></div>




</div>

<div style="clear:both; width:100%; height:180px;"></div>
<div id="pop_window">
 <!--#include file="lmbottomlink.asp" -->
</div>
</body>
</html>

