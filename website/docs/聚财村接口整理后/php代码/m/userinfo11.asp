<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/m.css" rel="stylesheet" type="text/css" />
<title>聚财村</title>
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
		
</style>
<body>
<div id="aa" style="width:100%;  background-color:#990; ">
<!--#include file="userinfo_top.asp" -->
</div>
<span style=" width:100%; float:left;"><img src="images/link15.jpg" width="100%" border="0"  /></span>
<div class="middlekuang">




<div id="showtable" style=" width:100%; float:left; text-align:left; ">
<table width="100%" border="0">
<!--#include file="renren_conn.asp" -->
<%
lan=request.QueryString("lan")
if lan="" then lan="1"
u_table="wzhang"

rs.open "select * from "&u_table&" where web_lei='m2' and lei='5' and tui_lei='1'  order by id desc",conn,1,3

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
    <td style="color:#333; font-weight:bold;"><a href="userinfo11a.asp?id=<%=rs("id")%>">·<%=trim(rs("title"))%></a></td>
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

<div style="clear:both; width:100%; height:180px;"></div>
<div id="pop_window">
 <!--#include file="lmbottomlink.asp" -->
</div>
</body>
</html>

