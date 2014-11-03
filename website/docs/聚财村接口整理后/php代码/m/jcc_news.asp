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
.fen{
	float:left;
	width:100%;

		}															
</style>
</head>
<!--#include file="renren_conn.asp" -->
 <%
lei=request.QueryString("lei")
if lei="" then lei="11"
u_table="wzhang"
rs.open "select * from "&u_table&" where web_lei='m2' and lei='"&lei&"'  order by id desc",conn,1,3
%>
<body>


<div style="width:100%;">
<span style=" width:25%; float:left;" onclick="location.href='jcc_aboutus.asp'" ><img src="images/link10.jpg" width="100%" border="0"  /></span>
<span style=" width:25%; float:left;" onclick="location.href='jcc_news.asp'"><img src="images/link11a.jpg" width="100%" border="0"  /></span>
<span style=" width:25%; float:left;" onclick="location.href='dk_log.asp'"><img src="images/link12.jpg" width="100%" border="0"  /></span>
<span style=" width:25%; float:left;" onclick="location.href='lm_index.asp'"><img src="images/link13.jpg" width="100%" border="0"  /></span>
</div>
<div style=" width:100%; height:1em; float:left; clear:both;"></div>
<div class="middlekuang">
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
<%
m_pic=trim(rs("m_pic"))
if m_pic="" or isnull(m_pic) then
m_pic="images/news/pp1.jpg"
end if
%>
<%content=trim(rs("content"))
if instr(content,"<")  then
contenttmp=split(content,"<")
content2=""
for i=1 to ubound(contenttmp)
content2=content2&split(contenttmp(i),">")(1)
next
content2=replace(content2,"&nbsp;","")
content2=replace(content2," ","")
content2=replace(content2,"　","")
content2=replace(content2,"，","")
else
content2=content
end if
%>
<div class="fen" onclick="location.href='jcc_news2.asp?id=<%=rs("id")%>'" >
<div class="pic"><img src="<%=m_pic%>"  /></div>
<div class="txtkuang">
<div class="ttitle"><%=left(trim(rs("title")),10)%></div>
<div class="ttxt"><%=GetStringLength(content2,48)%><span style="color:#ff520d;">&gt;&gt;</span></div>
<div class="ttime"><%=trim(rs("u_time"))%></div>
</div>
</div>
<div style="clear:both; width:100%; height:1em;"></div>
 <%
  rs.movenext
  next
  end if
  rs.close
  
  %>


</div>




<div style="clear:both; width:100%; height:80px;"></div>

<div id="pop_window">
 <!--#include file="bottomlink.asp" -->
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

<%

Function GetStringLength(txt,length)
dim i
i=1
y=0

txt=trim(txt)
for i=1 to len(txt)
j=mid(txt,i,1)
if asc(j)<>AscW(j)then
if asc(j)>0 and asc(j)<=127 then 
y=y+0.25
'elseif j="“" or j="”" or j="，" or j="。" or j="；" or j="？" or j="！" or j="：" or j="、" or j="""" then
'y=y+0.25
elseif j="“" or j="”" or j="，" then
y=y+0.25
else
y=y+1
end if
else
y=y+0.25
end if
if y >= length then 
txt = left(txt,i)
exit for
end if
next
response.write txt&Y



End Function
%>