<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="js/m.js"></script>
<link href="css/m.css" rel="stylesheet" type="text/css" />
<title>聚财村</title>
</head>
<!--#include file="renren_conn.asp" -->
<%
act=request.Form("act")
if act="changepwd" then
u_id=session("u_id")
u_oldpwd=request.Form("oldpwd")
u_newpwd=request.Form("pwd1")
u_table="lmuser"
rs.open "select * from "&u_table&" where id="&u_id ,conn,1,3
If Not rs.EOF Or Not rs.BOF Then
if trim(rs("u_pwd"))<>u_oldpwd then
response.write"<script>alert('旧密码错误！');</script>"
else
rs("u_pwd")=u_newpwd
rs.update
response.write"<script>alert('恭喜，新密码修改成功!');location.href='userinfo1.asp';</script>"

end if
end if
rs.close
end if
%>
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
background-color:#f0f0f0;
}
body,td,th {
	color: #00F;
}
.middlekuang2{
	 margin:auto;
	 width:100%;
	text-align:center;
		}
		input{
			width:100%;
			border:0 #eee;
			padding:0.5em;
			font-size:90%;
			
	}		
</style>
<body >
<div id="aa" style="width:100%;  background-color:#990; ">
<!--#include file="userinfo_top.asp" -->
</div>
<div class="middlekuang2">
 <form method="post" action=""  id="myform" name="myform">
<div style=" width:100%; float:left;background-color:#3e7cb7;color:#FFF; text-align:left;font-size:0.7em;">

<div style=" width:100%; float:left; ">
<img src="images/link18.jpg" style="width:100%" />
</div>
</div>
<div style=" width:100%; float:left;"><img  src="images/u10.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left;background-color:#f0f0f0;">
<div style="width:26%; float:left; color:#000; text-align:right; padding:0.6em;">原密码</div>
<div style=" width:54%; float:left;"><input name="oldpwd" type="password" id="oldpwd" onfocus="closewin(this.id)" onblur="showwin(this.id)" /></div>
</div>
<div style=" width:100%; float:left;"><img  src="images/u11.jpg" width="100%" border="0"  /></div>

<div style=" width:100%; float:left;background-color:#f0f0f0;">
<div style="width:26%; float:left; color:#000; text-align:right; padding:0.6em;">新密码</div>
<div style=" width:54%; float:left;"><input name="pwd1" type="password" id="pwd1" onfocus="closewin(this.id)" onblur="showwin(this.id)" /></div>
</div>
<div style=" width:100%; float:left;"><img  src="images/u11.jpg" width="100%" border="0"  /></div>

<div style=" width:100%; float:left;background-color:#f0f0f0;">
<div style="width:26%; float:left; color:#000; text-align:right; padding:0.6em;">确认新密码</div>
<div style=" width:54%; float:left;"><input name="pwd2" type="password" id="pwd2" onfocus="closewin(this.id)" onblur="showwin(this.id)" /></div>
</div>
<div style=" width:100%; float:left;"><img  src="images/u11.jpg" width="100%" border="0"  /></div>



<div style=" width:100%; float:left;"><img  src="images/u11.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left;background-color:#f0f0f0;">
<div style="width:26%; float:left; color:#000; text-align:right; padding:0.6em;"></div>
<div style=" width:57%; float:left; background-color:#00b9ce; color:#FFF; font-weight:bold; padding-top:0.5em;padding-bottom:0.5em;" onclick="chackrepear()" >提交</div>
</div>
<input name="act" type="hidden" value="changepwd" />
</form>
</div>

<div style="clear:both; width:100%; height:180px;"></div>
</body>
<div id="pop_window">
 <!--#include file="lmbottomlink.asp" -->
</div>
</body>
</html>




<script language="javascript" >
function chackrepear(){
	oldpwd=document.getElementById("oldpwd").value;
	pwd1=document.getElementById("pwd1").value;
	pwd2=document.getElementById("pwd2").value;
	if (oldpwd==""){
		alert("请输入原密码！")
		}else if(pwd1.length<4||pwd1.length>10){
		alert("请输入4~10位新密码！")	
		}else if(pwd1!=pwd2){
		alert("两次输入的新密码不一样！")	
		document.getElementById("pwd1").value="";
		document.getElementById("pwd2").value="";
		}else{
	var form = document.getElementById("myform"); 
               form.submit();
}
}
</script>