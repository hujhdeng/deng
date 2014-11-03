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
<div id="tt" style="width:100%; float:left;">
  <img src="images/jcclmlogo.jpg" width="100%" border="0"  /></div>
</div>
<div class="middlekuang2">
<div style=" width:100%; float:left;background-color:#3e7cb7;color:#FFF; text-align:left;font-size:0.7em;">

<div style=" float:left; padding:1em;">
<span id="name" style="font-size:1.2em; font-weight:bold;color:#feef00; ">高飞</span><span>你好！ 你目前的累计收入为：</span><span id="money" style="font-size:1.2em; font-weight:bold;color:#feef00; ">1234567.00</span><span> 元</span>
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

<div style="clear:both; width:100%; height:160px;"></div>
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
