<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 

"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-

scale=1, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>聚财村</title>
<style type="text/css">
body{
margin:0px;
font: normal 100% 宋体, Arial, sans-serif;
font-size:0.7em;
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
	 width:33.33333333%;
	 text-align:center;
		}
.pic img{
	 width:92%;
		}
.txtkuang2{
	 width:100%;
	 float:left;
	 text-align:left;
	 text-indent : 2em;
	
		}
.ttitle{
	font-size:0.9em;
	font-weight:bold;
	color:#111111;
		}
.ttxt{
	font-size:0.7em;
	line-height : 2em;
	padding-top:0.5em;
	padding-bottom:0.5em;
	 color:#333333;
		}	
.ttime{
	font-size:0.7em;
  color:#888888;
		}
			a {
		text-decoration : none;
		color:#797979;
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
 tr  {color:#797979;}														
</style>
</head>

<body>
<div id="aa" style="width:100%;  background-color:#990; ">
<div style="width:100%; float:left;">
  <!--#include file="userinfo_top.asp" -->
  </div>
</div>
<span style=" width:100%; float:left;"><img src="images/link7.jpg" width="100%" border="0"  /></span>
<div style=" width:100%; height:1em; float:left; clear:both;"></div>
<div class="middlekuang">




<div id="showtable" style=" width:100%; float:left; text-align:left; ">
<table width="100%" border="0">
<!--#include file="renren_conn.asp" -->
<%
lan=request.QueryString("lan")
if lan="" then lan="1"
u_table="wzhang"

rs.open "select * from "&u_table&" where web_lei='m2' and lei='4' and lan='"&lan&"' order by id desc",conn,1,3

%>
<%
 If rs.recordcount>0 Then ' 记录集不为空则处理记录
  rs.pagesize = 19 ' 设置每页显示的记录数
  num=rs.recordcount ' 记录总数
  pagenum=rs.pagecount ' 页总数
  page=request("page") ' 获取页码的原始信息
  ' 处理页码原始信息的开始！ 
  If page <> "" then
   page = cint(page)
  if err.number <> 0 then
   err.clear
   page = 1
  end if
  if page < 1 then
   page = 1
  end if
 else
  page = 1
 End if
 if page*rs.pagesize > num and not((page-1)*rs.pagesize < num)then
  page=1
 end if
 ' 处理页码原始信息的结束！设置当前页码
 rs.absolutepage = page
 
 if page<>pagenum then
   lablenum=rs.pagesize
  else
   lablenum=num-(page-1)*rs.pagesize
  end if
 for n=1 to rs.recordcount
%>

    <tr >
    <td ><a href="jcc_case2.asp?id=<%=rs("id")%>">·<%=trim(rs("title"))%></a></td>
  </tr>
  <%
  rs.movenext
  next
  end if
  rs.close
  
  %>
  

</table>
</div>



<div style=" width:100%; height:1em; float:left; clear:both;"></div>




</div>




<div style="clear:both; width:100%; height:80px;"></div>

<div id="pop_window">
 <!--#include file="lmbottomlink.asp" -->
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