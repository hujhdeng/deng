<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="function.asp" -->
<%
'------------手机跳转
if getmobi()=1 then
trtmp=request.QueryString("tr")
if trtmp<>"" then
response.Redirect("../index.asp?tr="&trtmp)
else
response.Redirect("../lm_index.asp")
end if
end if
%>
<script type="text/javascript" charset="utf-8" src="js/m.js"></script>
<script language="javascript">
settracktop()
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 

"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-

scale=1, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>聚财村</title>
<!--#include file="renren_conn.asp" -->
<%
u_table="topbang"
rs.open "select * from "&u_table ,conn,1,3
If Not rs.EOF Or Not rs.BOF Then
uptime=trim(rs("uptime"))
if isnull(uptime) or uptime="" then
isup=0
else
isup=1
end if
else
isup=0
end if
isup=0
if isup=0 then  '-------更新排行榜
rs.close
daynum=weekday(date())
weekstart=DateAdd("d",-daynum-6,now())
weekend=DateAdd("d",-daynum,now())
dnum=day(now())
monthtmp=DateAdd("m",-1,now())
monthstart=DateAdd("d",-dnum+1,monthtmp)
monthend=DateAdd("d",31-dnum,monthtmp)
ynum=year(now())
yearstart=cstr(ynum-1)&"-1-1 01:01:01"
today=now() 
'response.Write(weekstart&"<br/>")
'response.Write(weekend&"<br/>")
'response.Write(monthstart&"<br/>")
'response.Write(monthend&"<br/>")
'------------------------------设置起始时间

u_table="xfei"
rs.open "select * from "&u_table ,conn,1,3
If Not rs.EOF Or Not rs.BOF Then
Newlist=""
Weeklist=""
Monthlist=""
Yearlist=""


for n=1 to rs.recordcount  '收集时间段的money
tg_tel=trim(rs("tg_tel"))
tg_money=trim(rs("tg_money"))
tg_name=trim(rs("tg_name"))
if tg_money="" or isnull(tg_money)=true then
tg_money=0
end if
tj_tel=trim(rs("tj_tel"))
tj_money=trim(rs("tj_money"))
tj_name=trim(rs("tj_name"))

if tj_money="" or isnull(tj_money)=true then
tj_money=0
end if
add_time=trim(rs("u_addtime"))

if tg_tel<>"" and isnull(tg_tel)<>true then
if Newlist="" then
Newlist="||"&tg_tel&"|"&tg_money&"|"&tg_name
else
if instr(Newlist,"||"&tg_tel&"|")>0 then '先加推广的钱
fentmp=split(Newlist,"||"&tg_tel&"|")
gtmp=fentmp(1)
gtmp2=split(gtmp,"|")
oldmoneytmp=cdbl(gtmp2(0))
oldnametmp=gtmp2(1)
newmoneytmp=oldmoneytmp+cdbl(tg_money)
oldtxt="||"&tg_tel&"|"&oldmoneytmp&"|"&oldnametmp
newtxt="||"&tg_tel&"|"&newmoneytmp&"|"&oldnametmp
Newlist=replace(Newlist,oldtxt,newtxt)
else
Newlist=Newlist&"||"&tg_tel&"|"&tg_money&"|"&tg_name
end if
end if
'-----------------周
if (cdate(add_time))>=(cdate(weekstart)) and (cdate(add_time))<=(cdate(weekend)) then

if Weeklist="" then '先加推广的钱
 Weeklist="||"&tg_tel&"|"&tg_money&"|"&tg_name
 else
 if instr(Weeklist,"||"&tg_tel&"|")>0 then 
 fentmp=split(Weeklist,"||"&tg_tel&"|")
gtmp=fentmp(1)
gtmp2=split(gtmp,"|")
oldmoneytmp=cdbl(gtmp2(0))
oldnametmp=gtmp2(1)
newmoneytmp=oldmoneytmp+cdbl(tg_money)
oldtxt="||"&tg_tel&"|"&oldmoneytmp&"|"&oldnametmp
newtxt="||"&tg_tel&"|"&newmoneytmp&"|"&oldnametmp
Weeklist=replace(Weeklist,oldtxt,newtxt)
 else
 Weeklist=Weeklist&"||"&tg_tel&"|"&tg_money&"|"&tg_name
 end if
 end if
end if
'--------------yue
if (cdate(add_time))>=(cdate(monthstart)) and (cdate(add_time))<=(cdate(monthend)) then
if Monthlist="" then
 Monthlist="||"&tg_tel&"|"&tg_money&"|"&tg_name
 else
 if instr(Monthlist,"||"&tg_tel&"|")>0 then '先加推广的钱
 fentmp=split(Monthlist,"||"&tg_tel&"|")
gtmp=fentmp(1)
gtmp2=split(gtmp,"|")
oldmoneytmp=cdbl(gtmp2(0))
oldnametmp=gtmp2(1)
newmoneytmp=oldmoneytmp+cdbl(tg_money)
oldtxt="||"&tg_tel&"|"&oldmoneytmp&"|"&oldnametmp
newtxt="||"&tg_tel&"|"&newmoneytmp&"|"&oldnametmp
Monthlist=replace(Monthlist,oldtxt,newtxt)
 else
  Monthlist=Monthlist&"||"&tg_tel&"|"&tg_money&"|"&tg_name
 end if
 
 end if

end if
end if
'----------------------
if tj_tel<>"" and isnull(tj_tel)<>true then
if Newlist="" then
 Newlist="||"&tj_tel&"|"&tj_money&"|"&tj_name
 else
 if instr(Newlist,"||"&tj_tel&"|")>0 then '再加推荐的钱
 fentmp=split(Newlist,"||"&tj_tel&"|")
gtmp=fentmp(1)
gtmp2=split(gtmp,"|")
oldmoneytmp=cdbl(gtmp2(0))
oldnametmp=gtmp2(1)
newmoneytmp=oldmoneytmp+cdbl(tj_money)
oldtxt="||"&tj_tel&"|"&oldmoneytmp&"|"&oldnametmp
newtxt="||"&tj_tel&"|"&newmoneytmp&"|"&oldnametmp
Newlist=replace(Newlist,oldtxt,newtxt)
else
 Newlist=Newlist&"||"&tj_tel&"|"&tj_money&"|"&tj_name
 end if
end if
'--推荐周
if (cdate(add_time))>=(cdate(weekstart)) and (cdate(add_time))<=(cdate(weekend)) then
if Weeklist="" then
Weeklist="||"&tj_tel&"|"&tj_money&"|"&tj_name
else
if instr(Weeklist,"||"&tj_tel&"|")>0 then
fentmp=split(Weeklist,"||"&tj_tel&"|")
gtmp=fentmp(1)
gtmp2=split(gtmp,"|")
oldmoneytmp=cdbl(gtmp2(0))
oldnametmp=gtmp2(1)
newmoneytmp=oldmoneytmp+cdbl(tj_money)
oldtxt="||"&tj_tel&"|"&oldmoneytmp&"|"&oldnametmp
newtxt="||"&tj_tel&"|"&newmoneytmp&"|"&oldnametmp
Weeklist=replace(Weeklist,oldtxt,newtxt)
else
Weeklist=Weeklist&"||"&tj_tel&"|"&tj_money&"|"&tj_name
end if
end if
'---------------------yue
if (cdate(add_time))>=(cdate(monthstart)) and (cdate(add_time))<=(cdate(monthend)) then
if Monthlist="" then
  Monthlist="||"&tj_tel&"|"&tj_money&"|"&tj_name
  else
if instr(Monthlist,"||"&tj_tel&"|">0) then '再加推荐的
  fentmp=split(Monthlist,"||"&tj_tel&"|")
gtmp=fentmp(1)
gtmp2=split(gtmp,"|")
oldmoneytmp=cdbl(gtmp2(0))
oldnametmp=gtmp2(1)
newmoneytmp=oldmoneytmp+cdbl(tj_money)
oldtxt="||"&tj_tel&"|"&oldmoneytmp&"|"&oldnametmp
newtxt="||"&tj_tel&"|"&newmoneytmp&"|"&oldnametmp
Monthlist=replace(Monthlist,oldtxt,newtxt)
  else
   Monthlist=Monthlist&"||"&tj_tel&"|"&tj_money&"|"&tj_name
  end if
  end if
end if
end if
end if



rs.movenext
next
end if
rs.close
'response.Write(Newlist&"--a<br/>")
'response.Write(Weeklist&"--b<br/>")
'response.Write(Monthlist&"--c<br/>")


topallarray=array(0,0,0,0,0,0,0,0,0,0)
topalltel=array("","","","","","","","","","")
clist=split(Newlist,"||")
for n=1 to ubound(clist)
mtmp=split(clist(n),"|")
'response.Write(mtmp(1)&"<br/>")
oldtopallarray=topallarray
oldtopalltel=topalltel
isbig=0
for m=0 to ubound(topallarray)
if cdbl(mtmp(1))>cdbl(topallarray(m)) and isbig=0 then
topallarray(m)=mtmp(1)
topalltel(m)=clist(n)
isbig=1
end if
if isbig=1 and m<ubound(topallarray) then
topallarray(m+1)=oldtopallarray(m)
topalltel(m+1)=oldtopalltel(m)
end if
next
next

'-----------------------------------------
topweekarray=array(0,0,0,0,0,0,0,0,0,0)
topweektel=array("","","","","","","","","","")
clist=split(Newlist,"||")
for n=1 to ubound(clist)
mtmp=split(clist(n),"|")
'response.Write(mtmp(1)&"<br/>")
oldtopweekarray=topweekarray
oldtopweektel=topweektel
isbig=0
for m=0 to ubound(topweekarray)
if cdbl(mtmp(1))>cdbl(topweekarray(m)) and isbig=0 then
topweekarray(m)=mtmp(1)
topweektel(m)=clist(n)
isbig=1
end if
if isbig=1 and m<ubound(topweekarray) then
topweekarray(m+1)=oldtopweekarray(m)
topweektel(m+1)=oldtopweektel(m)
end if
next
next
'-------------------------------------
topmontharray=array(0,0,0,0,0,0,0,0,0,0)
topmonthtel=array("","","","","","","","","","")
clist=split(Monthlist,"||")
for n=1 to ubound(clist)
mtmp=split(clist(n),"|")
'response.Write(mtmp(1)&"<br/>")
oldtopmontharray=topmontharray
oldtopmonthtel=topmonthtel
isbig=0
for m=0 to ubound(topmontharray)
if cdbl(mtmp(1))>cdbl(topmontharray(m)) and isbig=0 then
topmontharray(m)=mtmp(1)
topmonthtel(m)=clist(n)
isbig=1
end if
if isbig=1 and m<ubound(topmontharray) then
topmontharray(m+1)=oldtopmontharray(m)
topmonthtel(m+1)=oldtopmonthtel(m)
end if
next
next
response.Write(topmonthtel)

'-----------------写表
u_table="topbang"
rs.open "select * from "&u_table ,conn,1,3
If Not rs.EOF Or Not rs.BOF Then
else
rs.addnew
end if
rs("topy1")=topalltel(0)
rs("topy2")=topalltel(1)
rs("topy3")=topalltel(2)
rs("topy4")=topalltel(3)
rs("topy5")=topalltel(4)
rs("topy6")=topalltel(5)
rs("topy7")=topalltel(6)
rs("topy8")=topalltel(7)
rs("topy9")=topalltel(8)
rs("topy10")=topalltel(9)
rs("topm1")=topmonthtel(0)
rs("topm2")=topmonthtel(1)
rs("topm3")=topmonthtel(2)
rs("topm4")=topmonthtel(3)
rs("topm5")=topmonthtel(4)
rs("topm6")=topmonthtel(5)
rs("topm7")=topmonthtel(6)
rs("topm8")=topmonthtel(7)
rs("topm9")=topmonthtel(8)
rs("topm10")=topmonthtel(9)
rs("topw1")=topweektel(0)
rs("topw2")=topweektel(1)
rs("topw3")=topweektel(2)
rs("topw4")=topweektel(3)
rs("topw5")=topweektel(4)
rs("topw6")=topweektel(5)
rs("topw7")=topweektel(6)
rs("topw8")=topweektel(7)
rs("topw9")=topweektel(8)
rs("topw10")=topweektel(9)
rs("uptime")=now()
rs.update
rs.close

else  '------已经更新过排行榜 直接调用
u_table="topbang"
rs.open "select * from "&u_table ,conn,1,3
If Not rs.EOF Or Not rs.BOF Then
topweektel=array(trim(rs("topw1")),trim(rs("topw2")),trim(rs("topw3")),trim(rs("topw4")),trim(rs("topw5")),trim(rs("topw6")),trim(rs("topw7")),trim(rs("topw8")),trim(rs("topw9")),trim(rs("topw10")))
topmonthtel=array(trim(rs("topm1")),trim(rs("topm2")),trim(rs("topm3")),trim(rs("topm4")),trim(rs("topm5")),trim(rs("topm6")),trim(rs("topm7")),trim(rs("topm8")),trim(rs("topm9")),trim(rs("topm10")))
topalltel=array(trim(rs("topy1")),trim(rs("topy2")),trim(rs("topy3")),trim(rs("topy4")),trim(rs("topy5")),trim(rs("topy6")),trim(rs("topy7")),trim(rs("topy8")),trim(rs("topy9")),trim(rs("topy10")))
end if
rs.close
end if
%>
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

<span style=" width:100%; float:left;"><img src="images/link8.jpg" width="100%" border="0"  /></span>
<div style=" width:100%; height:1em; float:left; clear:both;"></div>
<div id="week" style="display:none" >
<div class="middlekuang">
<span style=" width:50%; float:left;"><img src="images/topan2.jpg" width="100%" border="0" onClick="showtop(2)"  /></span>
<span style=" width:50%; float:left;"><img src="images/topan3.jpg" width="100%" border="0"  onclick="showtop(3)"  /></span>
</div>
<div class="middlekuang">
<div id="showtable" style=" width:100%; float:left;">
<table width="100%" border="0">
   <%
	for n=0 to ubound(topweektel)

	%>
    <tr style="color:#797979">
    <td ><span class="num"
	<%if n=0 then%>
     style="background-color:#f66e00"
     	<%elseif n=1 then%>
     style="background-color:#f9933f"
          	<%elseif n=2 then%>
     style="background-color:#01518e"
    <%end if%>
    ><%=right("0"&(1+n),2)%></span></td>
    <td ><%=left(split(topweektel(n),"|")(2),6)%></td>
    <td><%=left(split(topweektel(n),"|")(0),4)&"****"&right(split(topweektel(n),"|")(0),3)%></td>
    <td style="color:#ed5911"><%
	if instr(split(topweektel(n),"|")(1),".") then
	response.Write(split(split(topweektel(n),"|")(1),".")(0)&"元")
	else
	response.Write(split(topweektel(n),"|")(1)&"元")
	end if
	%></td>
  </tr>
	<%next%> 
</table>
</div>
</div>
</div>

<div id="month" style="display:block;">
<div class="middlekuang">
<span style=" width:50%; float:left;"><img src="images/topan2a.jpg" width="100%" border="0"  /></span>
<span style=" width:50%; float:left;"><img src="images/topan3.jpg" width="100%" border="0"  onclick="showtop(3)"  /></span>
</div>
<div class="middlekuang">
<div id="showtable" style=" width:100%; float:left;">
<table width="100%" border="0">
   <%
	for n=0 to ubound(topmonthtel)

	%>
    <tr style="color:#797979">
    <td ><span class="num"
	<%if n=0 then%>
     style="background-color:#f66e00"
     	<%elseif n=1 then%>
     style="background-color:#f9933f"
          	<%elseif n=2 then%>
     style="background-color:#01518e"
    <%end if%> 
    ><%=right("0"&(1+n),2)%></span></td>
    <td ><%=left(split(topmonthtel(n),"|")(2),6)%></td>
    <td><%=left(split(topmonthtel(n),"|")(0),4)&"****"&right(split(topmonthtel(n),"|")(0),3)%></td>
    <td style="color:#ed5911"><%
	if instr(split(topmonthtel(n),"|")(1),".") then
	response.Write(split(split(topmonthtel(n),"|")(1),".")(0)&"元")
	else
	response.Write(split(topmonthtel(n),"|")(1)&"元")
	end if
	%></td>
  </tr>
	<%next%> 
</table>
</div>
</div>
</div>

<div id="year" style="display:none;">
<div class="middlekuang">
<span style=" width:50%; float:left;"><img src="images/topan2.jpg" width="100%" border="0"   onclick="showtop(2)" /></span>
<span style=" width:50%; float:left;"><img src="images/topan3a.jpg" width="100%" border="0"  /></span>
</div>
<div class="middlekuang">
<div id="showtable" style=" width:100%; float:left;">
<table width="100%" border="0">
   <%
	for n=0 to ubound(topalltel)

	%>
    <tr style="color:#797979">
    <td ><span class="num"
	<%if n=0 then%>
     style="background-color:#f66e00"
     	<%elseif n=1 then%>
     style="background-color:#f9933f"
          	<%elseif n=2 then%>
     style="background-color:#01518e"
    <%end if%>
    ><%=right("0"&(1+n),2)%></span></td>
    <td ><%=left(split(topalltel(n),"|")(2),6)%></td>
    <td><%=left(split(topalltel(n),"|")(0),4)&"****"&right(split(topalltel(n),"|")(0),3)%></td>
    <td style="color:#ed5911"><%
	if instr(split(topalltel(n),"|")(1),".") then
	response.Write(split(split(topalltel(n),"|")(1),".")(0)&"元")
	else
	response.Write(split(topalltel(n),"|")(1)&"元")
	end if
	%></td>
  </tr>
	<%next%> 
</table>
</div>
</div>
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
<SCRIPT  LANGUAGE="JavaScript" >
function showtop(tmp){
	
	if(tmp==1){
		 document.getElementById("week").style.display="block";
		 document.getElementById("month").style.display="none";
		 document.getElementById("year").style.display="none";
		}else if(tmp==2){

		 document.getElementById("week").style.display="none";
		 document.getElementById("month").style.display="block";
		 document.getElementById("year").style.display="none";
		}else if(tmp==3){
		 document.getElementById("week").style.display="none";
		 document.getElementById("month").style.display="none";
		 document.getElementById("year").style.display="block";
		}
	}
</SCRIPT>