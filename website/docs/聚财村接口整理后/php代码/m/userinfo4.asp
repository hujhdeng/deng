<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/m.css" rel="stylesheet" type="text/css" />
<title>聚财村</title>
</head>
<!--#include file="renren_conn.asp" -->
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
<!--#include file="userinfo_top.asp" -->
  <%
'act request.form("act")
u_table="xfei"
if request.form("button")="查询" then
monthtmp2=request.Form("select_month2")
if len(monthtmp2)=1 then monthtmp2="0"&monthtmp2
daytmp2=request.Form("select_day2")
if len(daytmp2)=1 then daytmp2="0"&daytmp2
monthtmp=request.Form("select_month")
if len(monthtmp)=1 then monthtmp="0"&monthtmp
daytmp=request.Form("select_day")
if len(daytmp)=1 then daytmp="0"&daytmp
starttime=request.Form("select_year2")&monthtmp2&daytmp2
endtime=request.Form("select_year")&monthtmp&daytmp
'if starttime<>"" then
'if endtime<>"" then
'sql="select * from "&u_table&" where (tg_tel='"&session("u_tel")&"' or tj_tel='"&session("u_tel")&"') and c_lei='3' and  (u_addtime between '"&starttime&"' and '"&endtime&"') order by id desc"
'
'else
'sql="select * from "&u_table&" where (tg_tel='"&session("u_tel")&"' or tj_tel='"&session("u_tel")&"') and c_lei='3'  and  u_addtime >'"&starttime&"' order by id desc"
'end if
'else
'if endtime<>"" then
'sql="select * from "&u_table&" where (tg_tel='"&session("u_tel")&"' or tj_tel='"&session("u_tel")&"') and c_lei='3'  and  u_addtime<'"&endtime&"' order by id desc"
'else
'sql="select * from "&u_table&" where tg_tel='"&session("u_tel")&"' or tj_tel='"&session("u_tel")&"' and c_lei='3'   order by id desc"
'end if
'end if
'sql="select * from "&u_table&" where tg_tel='"&session("u_tel")&"' or tj_tel='"&session("u_tel")&"' and c_lei='3' where u_time>='"&starttime&"' and u_time<='"&endtime&"'  order by id desc"
sql="select * from "&u_table&" where   c_lei='3' and (convert(int,u_time)>="&starttime&" and convert(int,u_time)<="&endtime&") and (tg_tel='"&session("u_tel")&"' or tj_tel='"&session("u_tel")&"')   order by id desc"
else
sql="select * from "&u_table&" where tg_tel='"&session("u_tel")&"' or tj_tel='"&session("u_tel")&"' and c_lei='3'   order by id desc"
end if
'response.Write("select * from "&u_table&" where tg_tel='"&session("u_tel")&"' or tj_tel='"&session("u_tel")&"' and c_lei='3' where u_time>='"&starttime&"' and u_time<='"&endtime&"'  order by id desc")
rs.open sql ,conn,1,3
alltgmoney=0
alltjmoney=0
If rs.recordcount>0 Then
for n=1 to rs.recordcount
if trim(rs("tg_tel"))=session("u_tel") then
tgmoneytmp=trim(rs("tg_money"))
if isnull(tgmoneytmp) then tgmoneytmp=0
alltgmoney=alltgmoney+cdbl(tgmoneytmp)
end if

if trim(rs("tj_tel"))=session("u_tel") then
tjmoneytmp=trim(rs("tj_money"))
if isnull(tjmoneytmp) then tjmoneytmp=0
alltjmoney=alltjmoney+cdbl(tjmoneytmp)
end if
rs.movenext
next
if instr(alltgmoney,".") then
alltgmoney=split(alltgmoney,".")(0)
end if
if instr(alltjmoney,".") then
alltjmoney=split(alltjmoney,".")(0)
end if
allmoney=alltgmoney+alltjmoney
rs.movefirst
end if
%>
</div>
<div class="middlekuang2">
<div style=" width:100%; float:left;background-color:#3e7cb7;color:#FFF; text-align:left;font-size:0.7em;">

<div style=" float:left; padding:1em;">
<span id="name" style="font-size:1.8em; font-weight:bold;">我的收入</span>
</div>
</div>
<%
all_money=session("all_money")
if InStr(session("all_money"),".") then
all_money=split(session("all_money"),".")(0)&"."&left(split(session("all_money"),".")(1),2)
end if
tg_all_money=session("tg_all_money")
if InStr(session("tg_all_money"),".") then
tg_all_money=split(session("tg_all_money"),".")(0)&"."&left(split(session("tg_all_money"),".")(1),2)
end if
tj_all_money=session("tj_all_money")
if InStr(session("tj_all_money"),".") then
tj_all_money=split(session("tj_all_money"),".")(0)&"."&left(split(session("tj_all_money"),".")(1),2)
end if
%>


<div id="showtable" style=" width:100%; float:left;">
<table width="100%" border="0">
  <tr>
    <td style="font-weight:bold; color:#000;border-bottom-width:0px;">全部收入(元)</td>
    <td style="font-weight:bold; color:#000;border-bottom-width:0px;">推广收入(元)</td>
    <td style="font-weight:bold; color:#000;border-bottom-width:0px;">推荐收入(元)</td>
  </tr>
  <tr >
     <td style=" font-weight:bold; color:#fd5e02; font-size:1.2em;border-bottom-width:0px;"><%=allmoney%></td>
	<td style="font-weight:bold; color:#fd5e02; font-size:1.2em;border-bottom-width:0px;"><%=alltgmoney%></td>
	<td style="font-weight:bold; color:#fd5e02; font-size:1.2em;border-bottom-width:0px; "><%=alltjmoney%></td>
  </tr>
  </table>
    <div style="clear:both; width:100%; font-weight:bold; font-size:1.2em; margin-top:0.2em; padding-bottom:0.2em; border-bottom:#386baa solid 1px; color:#004287">收入明细</div>
  <table width="100%" border="0">
  <tr style="font-weight:bold;background:#dadada">
    <td style="font-weight:bold; color:#000">&nbsp;&nbsp;&nbsp;支付时间&nbsp;&nbsp;&nbsp;</td>
    <td style="font-weight:bold; color:#000">推广收入(元)</td>
    <td style="font-weight:bold; color:#000">推荐收入(元)</td>
  </tr>
  

<%
 If rs.recordcount>0 Then ' 记录集不为空则处理记录
  rs.pagesize = 14 ' 设置每页显示的记录数
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
 for i=1 to rs.recordcount
timetmp=trim(rs("u_addtime"))
tg_money=""
tg_tel=trim(rs("tg_tel"))
tj_money=""
tj_tel=trim(rs("tj_tel"))

if tg_tel=session("u_tel") then
tg_money=trim(rs("tg_money"))
end if
if tj_tel=session("u_tel") then
tj_money=trim(rs("tj_money"))
end if
if instr(tg_money,".") then
tg_money=split(tg_money,".")(0)
end if
if instr(tj_money,".") then
tj_money=split(tj_money,".")(0)
end if
timetmp=split(timetmp," ")(0)
timetmp=split(timetmp,"-")(0)&"-"&right("0"&split(timetmp,"-")(1),2)&"-"&right("0"&split(timetmp,"-")(2),2)
%>
    <tr style="color:#797979">
    <td ><%=timetmp%></td>
    <td><%=tg_money%></td>
    <td ><%=tj_money%></td>
  </tr>
 <%
  rs.movenext
  next
  rs.close
  end if
  %>
  
</table>
</div>




</div>

<div style="clear:both; width:100%; height:180px;"></div>
</body>
<div id="pop_window">
 <!--#include file="lmbottomlink.asp" -->
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
