<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
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
<div id="aa" style="width:100%;  background-color:#990; ">
<div style="width:100%; float:left;">
  <img src="images/jccmlogo.jpg" width="100%" border="0"  /></div>
</div>
<div class="middlekuang2">
<span style=" width:50%; float:left;"><a href="lc_log.asp"><img  src="images/link1a.jpg" width="100%" border="0"  /></a></span><span style=" width:50%; float:left;"><img  src="images/link2.jpg" width="100%" border="0"  /></span>
<div style=" width:100%; float:left;"><img  src="images/pic13.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left;"><img  src="images/pic14.jpg" width="100%" border="0"  /></div>


<div style=" width:100%; float:left;>
<img id="div1" src="images/pic1.jpg" width="100%" border="0"  />
</div>


<div style="clear:both; width:100%; height:70px;"></div>
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
