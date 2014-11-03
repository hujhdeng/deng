<!--#include file="renren_conn.asp" -->
<%
u_tel=request.QueryString("telnum")
if u_tel="" then
response.Write("error2:请输入手机号！")
response.End()
end if
u_table="lmuser"
rs.open "select * from "&u_table&" where u_tel='"&u_tel&"'" ,conn,1,3
If Not rs.EOF Or Not rs.BOF Then
session("u_id")=trim(rs("id")) 
lastfindtime=trim(rs("findpwdtime"))
if isnull(lastfindtime) or lastfindtime="" then
 lastfindtime="2014-2-27 17:20:50"
end if
findpwdcount=trim(rs("findpwdcount"))
if isnull(findpwdcount) then findpwdcount=0
if datediff("d",lastfindtime,now())=0 then
if cint(findpwdcount)>3 then
response.Write("error2:请不要重复提交！")
response.End()
else
if datediff("n",lastfindtime,now())<30 then
response.Write("error2:请30分钟后再试！")
response.End()
end if
end if
else
findpwdcount=0
end if
findpwdcount=findpwdcount+1
rs("findpwdcount")=findpwdcount
rs("findpwdtime")=now()
rs.update
rs.close 
Randomize 
RndNumber=int((999999-1+1)*rnd+1)
RndNumber=RndNumber
session("passcode")=RndNumber

httpsendurl="http://m.5c.com.cn/api/send/?username=jucaitianxia&password=94762623&apikey=3d0b632d15fb4f5480041d1d334f6525&mobile="&u_tel&"&content=您的验证码是"&RndNumber&"【聚财村】&startTime="

Set xmlObj = server.CreateObject("Microsoft.XMLHTTP")
xmlObj.Open "POST",httpsendurl,false
xmlObj.send()
status = xmlObj.responseText
Set xmlObj = nothing
Response.Write (status&session("passcode"))

else
response.Write("error2:手机号错误！")
rs.close 
end if


%>