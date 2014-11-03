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
<%
u_id=session("u_id")
u_tracker=int(u_id)
u_table="lmuser"
if u_tracker<>"" then
rs.open "select * from "&u_table&" where u_tracker="&u_tracker&" order by id desc",conn,1,3
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
</div>
<div class="middlekuang2">
<div style=" width:100%; float:left;background-color:#3e7cb7;color:#FFF; text-align:left;font-size:0.7em;">

<div style=" float:left; padding:1em;">
<span id="name" style="font-size:1.8em; font-weight:bold;">我的推荐</span>
</div>
</div>
<div style=" clear:both; float:left; text-align:left; padding:1em; font-size:1.2em;">
 我的总推荐收入(元)<span style="font-size:1.4em; font-weight:bold; color:#fd5e02"> <%=session("tj_all_money")%></span>
</div>
<div id="showtable" style=" width:100%; float:left;">
<table width="100%" border="0">

  <tr style="font-weight:bold;background:#dadada">

    <td style="font-weight:bold; color:#000">真实姓名</td>
    <td style="font-weight:bold; color:#000">联系方式</td>
    <td style="font-weight:bold; color:#000">推广收入</td>
     <td style="font-weight:bold; color:#000">为我贡献的推荐收入</td>
  </tr>
  <%
 If rs.recordcount>0 Then ' 记录集不为空则处理记录
  rs.pagesize = 20 ' 设置每页显示的记录数
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
%>
    <tr style="color:#797979">

<TD><%=trim(rs("u_truename"))%></TD>
<TD><%=trim(rs("u_tel"))%></TD>
<TD><%=trim(rs("tg_all_money"))%></TD>
<TD><%=trim(rs("up_tj_money"))%></TD>
  </tr> 
  <%
rs.movenext
next
end if
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
