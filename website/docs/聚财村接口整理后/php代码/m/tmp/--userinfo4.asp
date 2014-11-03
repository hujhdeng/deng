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
background-color:#f0f0f0;
font-size:0.7em;
}
body,td,th {
	color: #000;
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
			width:90%;
			border:1 #999;
			padding-top:0.5em;
			padding-bottom:0.5em;
			font-size:90%;
			
	}
#showtable table        { border-collapse: collapse;border-style: none;text-align:center; }
#showtable td {
 padding: 0.5em;
 border: solid #dadada;
border-top-width:0px; 
border-left-width:0px; 
border-right-width:0px; 
border-bottom-width:1px; 
color:#797979;
}
#showtable tr { cursor:pointer;}		
</style>
<body>
<div id="aa" style="width:100%;  background-color:#990; ">
<div id="tt" style="width:100%; float:left;">
  <img src="images/jcclmlogo.jpg" width="100%" border="0"  /></div>
</div>
<div class="middlekuang2">
<div style=" width:100%; float:left;background-color:#3e7cb7;color:#FFF; text-align:left;font-size:0.7em;">

<div style=" float:left; padding:1em;">
<span id="name" style="font-size:1.8em; font-weight:bold;">我的收入</span>
</div>
</div>
<div id="showtable" style=" width:100%; float:left;">
<table width="100%" border="0">
  <tr>
    <td style="font-weight:bold; color:#000;border-bottom-width:0px;">全部收入(元)</td>
    <td style="font-weight:bold; color:#000;border-bottom-width:0px;">推广收入(元)</td>
    <td style="font-weight:bold; color:#000;border-bottom-width:0px;">推荐收入(元)</td>
  </tr>
  <tr >
    <td style="font-weight:bold; color:#fd5e02; font-size:1.2em;">5541.00</td>
	<td style="font-weight:bold; color:#fd5e02; font-size:1.2em;">5541.00</td>
	<td style="font-weight:bold; color:#fd5e02; font-size:1.2em;">5541.00</td>
  </tr>
  <tr style="font-weight:bold;background:#dadada">
    <td style="font-weight:bold; color:#000">支付时间</td>
    <td style="font-weight:bold; color:#000">推广收</td>
    <td style="font-weight:bold; color:#000">推荐收入</td>
  </tr>
    <tr style="color:#797979">
    <td >1234</td>
    <td>2225.00</td>
    <td>3332.00</td>
  </tr>
    <tr style="color:#797979">
    <td >1234</td>
    <td>2225.00</td>
    <td>3332.00</td>
  </tr>  
</table>
</div>




</div>

<div style="clear:both; width:100%; height:180px;"></div>
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
