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
phonelei="iPhone"
elseif instr(mobtmp,"Android") then
phonelei="Android"
else
phonelei="other"
end if
response.Cookies("phonelei")=phonelei
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
			font-size:100%;
	}		
</style>
<body>
<div id="aa" style="width:100%;  background-color:#990; ">
<div style="width:100%; float:left;">
  <img src="images/jccmlogo.jpg" width="100%" border="0"  /></div>
</div>
<div id="name"></div>
<div class="middlekuang2">
<span style=" width:50%; float:left;"><a href="lc_log.asp"><img  src="images/link1a.jpg" width="100%" border="0"  /></a></span><span style=" width:50%; float:left;"><img  src="images/link2.jpg" width="100%" border="0"  /></span>
<div style=" width:100%; float:left;"><img  src="images/pic11.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left;"><img  src="images/pic2.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left;">
<div style=" width:34%; float:left;"><img  src="images/pic4.jpg" width="100%" border="0"  /></div>
<div style=" width:54%; float:left;">
<input id="txt1" name="username" type="text" />
</div>
<div style=" width:10%; float:right;"><img  src="images/pic5.jpg" width="100%" border="0"  /></div>
</div>
<div style=" width:100%; float:left;"><img  src="images/pic3.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left;"><img  src="images/pic7.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left;"><img  src="images/pic2.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left;">
<div style=" width:34%; float:left;"><img  src="images/pic6.jpg" width="100%" border="0"  /></div>
<div  style=" width:54%; float:left;">
<input id="txt2"  name="tel" type="text"  />
</div>
<div style=" width:10%; float:right;"><img  src="images/pic5.jpg" width="100%" border="0"  /></div>
</div>
<div style=" width:100%; float:left;"><img  src="images/pic3.jpg" width="100%" border="0"  /></div>

<div style=" width:100%; float:left;"><img  src="images/pic7.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left;"><img  src="images/pic2.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left;">
<div style=" width:34%; float:left;"><img  src="images/pic12.jpg" width="100%" border="0"  /></div>
<div style=" width:54%; float:left;">
<input id="txt3"  name="money" type="text" />
</div>
<div style=" width:10%; float:right;"><img  src="images/pic5.jpg" width="100%" border="0"  /></div>
</div>
<div style=" width:100%; float:left;"><img  src="images/pic3.jpg" width="100%" border="0"  /></div>

<div style=" width:100%; float:left;"><img  src="images/pic7.jpg" width="100%" border="0"  /></div>
<span style=" width:100%; float:left;"><img  src="images/pic10.jpg" width="100%" border="0"  /></span>
<div style=" width:100%; float:left;"></div>


<div style="clear:both; width:100%; height:80px;"></div>
</div>
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
strCookie=document.cookie
var arrCookie=strCookie.split("; "); 
var userId; 
//遍历cookie数组，处理每个cookie对 
for(var i=0;i<arrCookie.length;i++){ 
         var arr=arrCookie[i].split("="); 
         //找到名称为userId的cookie，并返回它的值 
         if("phonelei"==arr[0]){ 
                phonelei=arr[1]; 
                break; 
         } 
} 
	if(phonelei=="Android"){
		 for(i=1;i<=3;i++){
     eval("txt"+i).blur()
}
  win_wh=window.screen.availWidth/480*120
}else {
  win_wh=window.innerWidth/320*90
}
      for(i=1;i<=3;i++){
	document.getElementById("txt"+i).style.fontSize=win_wh+"%"
      document.getElementById("txt"+i).value=win_wh+"%"+window.screen.availWidth
}

var evt = "onorientationchange" in window ? "orientationchange" : "resize";  
    window.addEventListener(evt, function () { 
	
	if(phonelei=="Android"){
		 for(i=1;i<=3;i++){
     eval("txt"+i).blur()
}
  win_wh=window.screen.availWidth/480*120
}else {
  win_wh=window.innerWidth/320*90
}
      for(i=1;i<=3;i++){
	document.getElementById("txt"+i).style.fontSize=win_wh+"%"
      document.getElementById("txt"+i).value=win_wh+"%"+window.screen.availWidth
}
    }, false);
//if (window.innerWidth>window.innerHeight){
//document.getElementById("name").innerHTML=window.innerWidth+"-"+window.innerHeight;
//}else{
//document.getElementById("name").innerHTML=window.innerWidth+"-"+window.innerHeight;
//}
//$(window).on("orientationchange",function(){
//  document.getElementById("name").innerHTML=window.innerWidth+"-"+window.innerHeight;
//});

</script>