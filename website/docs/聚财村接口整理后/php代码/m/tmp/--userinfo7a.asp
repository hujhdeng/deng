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
#showtable table        { border-collapse: collapse;border-style: none;text-align:left; }
#showtable td {
 padding: 1em;
 border: solid #dadada;
border-top-width:0px; 
border-left-width:0px; 
border-right-width:0px; 
border-bottom-width:1px; 
color:#797979;
font-size:1em;
}
#showtable tr { cursor:pointer;}		
</style>
<body>
<div id="aa" style="width:100%;  background-color:#990; ">
<div id="tt" style="width:100%; float:left;">
  <img src="images/jcclmlogo.jpg" width="100%" border="0"  /></div>
</div>
<div class="middlekuang2">
<span style=" width:50%; float:left;"><img  src="images/link3.jpg" width="100%" border="0"  /></span><span style=" width:50%; float:left;"><a href="userinfo7.asp"><img  src="images/link4a.jpg" width="100%" border="0"  /></a></span>
<div style=" width:100%; float:left;"><img  src="images/u11.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left;"><img  src="images/u11.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left; font-size:1.2em; font-weight:bold; padding-top:0.5em;">人人险简介</div>
<div style=" width:100%; float:left;font-size:0.8em;color:#797979; ">2014.人人险</div>
<div style=" width:100%; float:left;"><img  src="images/u11.jpg" width="100%" border="0"  /></div>
<div style=" width:90%;margin:auto; "><hr /></div>
<div style=" width:90%;  text-align:left; margin:auto; color:#363636;line-height:2em; ">

    ·如果您有理财或贷款需求的朋友，可直接将其个人处添加。如果您的朋友通过本平台发生了有效金融消费，平台将以推广收入的形式向您支付高额返点佣
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
