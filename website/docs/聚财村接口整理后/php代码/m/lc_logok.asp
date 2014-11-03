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
body{
margin:0px;
font: normal 100% 宋体, Arial, sans-serif;
background-color:#FFF
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
		#pp {
	width:100%;
	position:fixed;
	bottom:70px;
	left:0px;
    }	
</style>
<body>

<div class="middlekuang2">
<span style=" width:50%; float:left;"><img  src="images/link1.jpg" width="100%" border="0"  /></span><span style=" width:50%; float:left;"><a href="dk_log.asp"><img  src="images/link2a.jpg" width="100%" border="0"  /></a></span>
<div style=" width:100%; float:left;"><img  src="images/pic13.jpg" width="100%" border="0"  /></div>
<div id="pp" style=" width:100%; float:left;"><img  src="images/pic14.jpg" width="100%" border="0"  /></div>

</div>



<div style="clear:both; width:100%; height:70px;"></div>
</body>
<div id="pop_window">
 <!--#include file="bottomlink.asp" -->
</div>
</body>
</html>
