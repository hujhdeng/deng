<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 

"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-

scale=1, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<style type="text/css">
body{
margin:0px;
font: normal 100% 宋体, Arial, sans-serif;
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
.middlekuang{
	 margin:auto;
	 width:94%;
	text-align:center;
		}
.pic{
	float:left;
	 width:30%;
		}
.pic img{
	 width:100%;
	 float:left;
		}
.txtkuang{
	 width:67%;
	 float:right;
	 text-align:left;
		}
.ttitle{
	font-size:0.9em;
	font-weight:bold;
	color:#111111;
		}
.ttxt{
	font-size:0.7em;
	line-height : 1.2em;
	padding-top:0.5em;
	padding-bottom:0.5em;
	 color:#333333;
		}	
.ttime{
	font-size:0.7em;
  color:#888888;
		}
		#showtable table        { border-collapse: collapse;border-style: none;text-align:center; }
#showtable td {
 padding: 1em;
 border: solid #dadada;
border-top-width:0px; 
border-left-width:0px; 
border-right-width:0px; 
border-bottom-width:1px; 
color:#797979;
font-size:0.7em;

}
#showtable tr { cursor:pointer;}	
.num { 
background-color:#3392e2;
padding:0.4em;
color:#FFF;
font-weight:bold;
float:left;
}															
</style>
</head>

<body>
<div id="aa" style="width:100%;  background-color:#990; ">
<div style="width:100%; float:left;">
  <img src="images/jccmlogo.jpg" width="100%" border="0"  /></div>
</div>
<span style=" width:100%; float:left;"><img src="images/link7.jpg" width="100%" border="0"  /></span>
<div style=" width:100%; height:1em; float:left; clear:both;"></div>
<div class="middlekuang">
<span style=" width:33.33333333333333%; float:left;"><img src="images/topan1a.jpg" width="100%" border="0"  /></span>
<span style=" width:33.33333333333333%; float:left;"><img src="images/topan2.jpg" width="100%" border="0"  /></span>
<span style=" width:33.33333333333333%; float:left;"><img src="images/topan3.jpg" width="100%" border="0"  /></span>
</div>
<div class="middlekuang">
<div id="showtable" style=" width:100%; float:left;">
<table width="100%" border="0">
    <tr style="color:#797979">
    <td ><span class="num" style="background-color:#f66e00">01</span></td>
    <td >1234</td>
    <td>2225.00</td>
    <td style="color:#ed5911">3332.00</td>
  </tr>
  <tr style="color:#797979">
    <td ><span class="num" style="background-color:#f9933f">02</span></td>
    <td >1234</td>
    <td>2225.00</td>
    <td style="color:#ed5911">3332.00</td>
  </tr>
  <tr style="color:#797979">
    <td ><span class="num" style="background-color:#01518e">03</span></td>
    <td >1234</td>
    <td>2225.00</td>
    <td style="color:#ed5911">3332.00</td>
  </tr>  
    <tr style="color:#797979">
    <td ><span class="num" >04</span></td>
    <td >1234</td>
    <td>2225.00</td>
    <td style="color:#ed5911">3332.00</td>
  </tr> 
      <tr style="color:#797979">
    <td ><span class="num" >05</span></td>
    <td >1234</td>
    <td>2225.00</td>
    <td style="color:#ed5911">3332.00</td>
  </tr> 
      <tr style="color:#797979">
    <td ><span class="num" >06</span></td>
    <td >1234</td>
    <td>2225.00</td>
   <td style="color:#ed5911">3332.00</td>
  </tr>   
        <tr style="color:#797979">
    <td ><span class="num" >07</span></td>
    <td >1234</td>
    <td>2225.00</td>
   <td style="color:#ed5911">3332.00</td>
  </tr>  
          <tr style="color:#797979">
    <td ><span class="num" >08</span></td>
    <td >1234</td>
    <td>2225.00</td>
    <td style="color:#ed5911">3332.00</td>
  </tr> 
      <tr style="color:#797979">
    <td ><span class="num" >09</span></td>
    <td >1234</td>
    <td>2225.00</td>
    <td style="color:#ed5911">3332.00</td>
  </tr> 
        <tr style="color:#797979">
    <td ><span class="num" >10</span></td>
    <td >1234</td>
    <td>2225.00</td>
    <td style="color:#ed5911">3332.00</td>
  </tr> 
</table>
</div>
</div>





<div style="clear:both; width:100%; height:80px;"></div>
</body>
<div id="pop_window">
  <table width="100%" height="70px" border="0" align="center">
    <tr>
      <td style="border-left:0"><img src="images/an1.jpg" width="50" height="42" 

/></td>
      <td><img src="images/an2.jpg" width="50" height="42" /></td>
      <td><img src="images/an3.jpg" width="50" height="42" /></td>
      <td><img src="images/an4.jpg" width="50" height="42" /></td>
      <td><img src="images/an5.jpg" width="50" height="42" /></td>
    </tr>
  </table>
</div>
</body>
</html>
    <script type="text/javascript"  >

     ww=screen.width-20;
     hh= screen.availHeight-window.screenTop-10-70;
		 //document.getElementById('aa').style.width=String(ww)+'px'
		 //document.getElementById('aa').style.height=String(hh)+'px'
		//document.write(document.getElementById('aa').style.width)
//document.write("屏幕尺寸："+screen.width+"*"+screen.height)
//alert (hh+"--"+window.screenTop+"--"+screen.availHeight)
    </script>
<script type="text/javascript">
var browser={
versions:function(){
var u = navigator.userAgent, app = navigator.appVersion;
return { //移动终端浏览器版本信息
trident: u.indexOf('Trident') > -1, //IE内核
presto: u.indexOf('Presto') > -1, //opera内核
webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核
mobile: !!u.match(/AppleWebKit.*Mobile.*/), //是否为移动终端
ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或uc浏览器
iPhone: u.indexOf('iPhone') > -1 , //是否为iPhone或者QQHD浏览器
iPad: u.indexOf('iPad') > -1, //是否iPad
webApp: u.indexOf('Safari') == -1 //是否web应该程序，没有头部与底部
};
}(),
language:(navigator.browserLanguage || navigator.language).toLowerCase()
}
//document.writeln("语言版本: "+browser.language);
//document.writeln(" 是否为移动终端: "+browser.versions.mobile);
//document.writeln(" ios终端: "+browser.versions.ios);
//document.writeln(" android终端: "+browser.versions.android);
//document.writeln(" 是否为iPhone: "+browser.versions.iPhone);
//document.writeln(" 是否iPad: "+browser.versions.iPad);
//document.writeln(navigator.userAgent);
 var images= ["images/ad1.jpg", "images/ad2.jpg"];
    var index = 0;
    function switch_background(){    
    if(index ==images.length-1)
    {        
         index = 0;  
    }else{   
         index++;      
    }   

   document.getElementById("div1").src=images[index];
}
window.onload = function()
{
    setInterval(switch_background, 4000);
} 
</script>
<SCRIPT  LANGUAGE="JavaScript" defer="defer">
//var    s  ="网页可见区域宽："+  document.body.clientWidth;
//s+="<br/>网页可见区域高："+  document.body.clientHeight;
//s  +=  "<br/>网页正文全文宽："+  document.body.scrollWidth;
//s  +=  "<br/>网页正文全文高："+  document.body.scrollHeight;
//s  +=  "<br/>网页正文部分上："+  window.screenTop;
//s  +=  "<br/>网页正文部分左："+  window.screenLeft;
//s  +=  "<br/>屏幕分辨率的高："+  window.screen.height;
//s  +=  "<br/>屏幕分辨率的宽："+  window.screen.width;
//s  +="<br/>屏幕可用工作区高度："+  window.screen.availHeight;
//s  +="<br/>屏幕可用工作区宽度："+  window.screen.availWidth;
//document.write(s);
</SCRIPT>