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
if act<>"" then
u_id=session("u_id")

u_table="lmuser"
rs.open "select * from "&u_table&" where id="&u_id ,conn,1,3
If Not rs.EOF Or Not rs.BOF Then
if act="changebank" then
session("u_banknum")=request.Form("u_banknum")
session("u_bankuser")=request.Form("u_bankuser")
session("u_bankname")=request.Form("u_bankname")
rs("u_banknum")=session("u_banknum")
rs("u_bankuser")=session("u_bankuser")
rs("u_bankname")=session("u_bankname")
elseif act="changezfb" then 
session("u_zfbnum")=request.Form("u_zfbnum")
session("u_zfbuser")=request.Form("u_zfbuser")
rs("u_zfbnum")=session("u_zfbnum")
rs("u_zfbuser")=session("u_zfbuser")
elseif act="changecft" then
session("u_cftnum")=request.Form("u_cftnum")
session("u_cftuser")=request.Form("u_cftuser")
rs("u_cftnum")=session("u_cftnum")
rs("u_cftuser")=session("u_cftuser")
end if
rs.update
rs.close
response.write"<script>alert('恭喜，账户信息修改成功！');</script>"
end if
end if

%>
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
			width:95%;
			border:1 #999;
			padding-top:0.8em;
			padding-bottom:0.8em;
			font-size:90%;
			
	}		
</style>
<body>
<div id="aa" style="width:100%;  background-color:#990; ">
<!--#include file="userinfo_top.asp" -->
</div>
<div class="middlekuang2">
<div style=" width:100%; float:left;background-color:#3e7cb7;color:#FFF; text-align:left;font-size:0.7em;">

<div style=" float:left; padding:1em;">
<span id="name" style="font-size:1.2em; font-weight:bold; ">收款账户</span>
</div>
</div>
<div style=" width:100%; height:2em; float:left;"></div>
<div style=" width:33.33333333333333%; float:left;" onclick="showan(1)"><img id="1"   src="images/u16a.jpg" width="100%" border="0"  /></div>
<div style=" width:33.33333333333333%; float:left;" onclick="showan(2)"><img id="2"   src="images/u17.jpg" width="100%" border="0"  /></div>
<div style=" width:33.33333333333333%; float:left;" onclick="showan(3)"><img id="3"  src="images/u18.jpg" width="100%" border="0"  /></div>
<div style=" width:90%;  background-color:#FFF; border:#d8d8d8 solid 1px; margin:auto; font-size:0.65em;">
<div style=" width:100%; float:left;"><img  src="images/u13.jpg" width="100%" border="0"  /></div>

<div id="s1" style="display:block;">
<form action="" method="post" name="myform1" id="myform1">
<div style=" width:100%; float:left;background-color:#fff;">
<div style="width:20%; float:left; color:#000; text-align:right; padding:0.6em;">真实姓名</div>
<div style=" width:50%; float:left; "><input name="u_zfbuser" type="text" id="u_zfbuser" value="<%=session("u_zfbuser")%>"   onfocus="closewin(this.id)" onblur="showwin(this.id)" /></div><div style=" float:left; color:#fd3b00;  padding:0.6em; ">*(必填)</div>
</div>
<div style=" width:100%; float:left;"><img  src="images/u13.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left;background-color:#fff;">
<div style="width:20%; float:left; color:#000; text-align:right; padding:0.6em;">支付宝账户</div>
<div style=" width:50%; float:left; "><input name="u_zfbnum" type="text" id="u_zfbnum" value="<%=session("u_zfbnum")%>"  onfocus="closewin(this.id)" onblur="showwin(this.id)"  /></div><div style=" float:left; color:#fd3b00;  padding:0.6em; ">*(必填)</div>
</div>
<input name="act" type="hidden" value="changezfb" />
</form>
<div style=" width:100%; float:left;"><img  src="images/u13.jpg" width="100%" border="0"  /></div>

<div style=" width:100%; float:left;background-color:#fff;">
<div style="width:20%; float:left; color:#000; text-align:right; padding:0.6em;"></div>
<div style=" width:50%; float:left; background-color:#00b9ce; color:#FFF; font-weight:bold; padding-top:0.8em;padding-bottom:0.8em; font-size:1.2em;"  onclick="changezhao(1)">提交</div>
</div>
</div>

<div id="s2" style="display:none;">
<form action="" method="post" name="myform2" id="myform2">
<div style=" width:100%; float:left;background-color:#fff;">
<div style="width:20%; float:left; color:#000; text-align:right; padding:0.6em;">真实姓名</div>
<div style=" width:50%; float:left; "><input name="u_cftuser" type="text" id="u_cftuser" value="<%=session("u_cftuser")%>"  onfocus="closewin(this.id)" onblur="showwin(this.id)"  /></div><div style=" float:left; color:#fd3b00;  padding:0.6em; ">*(必填)</div>
</div>
<div style=" width:100%; float:left;"><img  src="images/u13.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left;background-color:#fff;">
<div style="width:20%; float:left; color:#000; text-align:right; padding:0.6em;">财付通账户</div>
<div style=" width:50%; float:left; "><input name="u_cftnum" type="text" id="u_cftnum" value="<%=session("u_cftnum")%>"   onfocus="closewin(this.id)" onblur="showwin(this.id)" /></div><div style=" float:left; color:#fd3b00;  padding:0.6em; ">*(必填)</div>
</div>
<input name="act" type="hidden" value="changecft" />
</form>
<div style=" width:100%; float:left;"><img  src="images/u13.jpg" width="100%" border="0"  /></div>

<div style=" width:100%; float:left;background-color:#fff;">
<div style="width:20%; float:left; color:#000; text-align:right; padding:0.6em;"></div>
<div style=" width:50%; float:left; background-color:#00b9ce; color:#FFF; font-weight:bold; padding-top:0.8em;padding-bottom:0.8em; font-size:1.2em;"  onclick="changezhao(2)">提交</div>
</div>
</div>

<div id="s3" style="display:none;">
<form action="" method="post" name="myform3" id="myform3">
<div style=" width:100%; float:left;background-color:#fff;">
<div style="width:20%; float:left; color:#000; text-align:right; padding:0.6em;">真实姓名</div>
<div style=" width:50%; float:left; "><input name="u_bankuser" type="text" id="u_bankuser" value="<%=session("u_bankuser")%>"  onfocus="closewin(this.id)" onblur="showwin(this.id)"  /></div><div style=" float:left; color:#fd3b00;  padding:0.6em; ">*(必填)</div>
</div>
<div style=" width:100%; float:left;"><img  src="images/u13.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left;background-color:#fff;">
<div style="width:20%; float:left; color:#000; text-align:right; padding:0.6em;">银行账户</div>
<%
u_banknum=session("u_banknum")
u_bankname=session("u_bankname")
colortmp="color:#333;"
if u_banknum="" or u_bankname ="" or isnull(u_banknum) or isnull(u_bankname) then
colortmp="color:#999;"
u_banknum="请输入银行账号"
u_bankname ="请精确到具体支行"
end if
%>
<div style=" width:50%; float:left; "><input name="u_banknum" type="text" id="u_banknum" style=" <%=colortmp%>" value="<%=u_banknum%>"   onfocus="closewin(this.id)" onblur="showwin(this.id)" /></div><div style=" float:left; color:#fd3b00;  padding:0.6em; ">*(必填)</div>
</div>
<div style=" width:100%; float:left;"><img  src="images/u13.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left;background-color:#fff;">
<div style="width:20%; float:left; color:#000; text-align:right; padding:0.6em;">开户银行</div>
<div style=" width:50%; float:left; "><input name="u_bankname" type="text" id="u_bankname" style=" <%=colortmp%>" value="<%=u_bankname%>"   onfocus="closewin(this.id)" onblur="showwin(this.id)" /></div><div style=" float:left; color:#fd3b00;  padding:0.6em; ">*(必填)</div>
</div>
<input name="act" type="hidden" value="changebank" />
</form>
<div style=" width:100%; float:left;"><img  src="images/u13.jpg" width="100%" border="0"  /></div>

<div style=" width:100%; float:left;background-color:#fff;">
<div style="width:20%; float:left; color:#000; text-align:right; padding:0.6em;"></div>
<div style=" width:50%; float:left; background-color:#00b9ce; color:#FFF; font-weight:bold; padding-top:0.8em;padding-bottom:0.8em; font-size:1.2em;"  onclick="changezhao(3)">提交</div>
</div>
</div>

<div style=" width:100%; float:left;"><img  src="images/u13.jpg" width="100%" border="0"  /></div>



</div>


</div>
<div style=" width:100%; float:left; height:2em;"></div>
<div style="width:90%; margin:auto; font-size:0.7em">
<div style="padding-top:0.5em; font-size:0.9em; text-align:left;color:#fd3b00; font-weight:bold;">注释：</div>
<div style="text-align:left;color:#5e5e5e; ">
<p>1.您只需填写一种收款账户即可；</p>
<p>2.请您务必填写真实账户信息，以确保顺利收款；</p>
<p>3.我们会对您的信息严格保密，也提醒您拒绝任何向您索要账户密码的要求。</p>
</div>
</div>
<div style="clear:both; width:100%; height:80px;"></div>
</body>
<div id="pop_window">
 <!--#include file="lmbottomlink.asp" -->
</div>
</body>
</html>
<script type="text/javascript">
function showan(tmp){
	for(i=1;i<4;i++){
		if(i==tmp){
		document.getElementById(i).src="images/u"+(15+i)+"a.jpg"	
		document.getElementById("s"+i).style.display="block"	
			}else{
		document.getElementById(i).src="images/u"+(15+i)+".jpg"
		document.getElementById("s"+i).style.display="none"				
				}
		}
	}
function changezhao(tmp){
		if (tmp==1){
			u_zfbuser=document.getElementById("u_zfbuser").value
			u_zfbnum=document.getElementById("u_zfbnum").value
			if (u_zfbuser==""||u_zfbnum==""){
				alert ("请填写收款方真实姓名和支付宝账户")
			}else{
			var form = document.getElementById("myform1"); 
               form.submit();
			}
		}else if(tmp==2){
			u_cftuser=document.getElementById("u_cftuser").value
			u_cftnum=document.getElementById("u_cftnum").value
			if (u_cftuser==""||u_cftnum==""){
				alert ("请填写收款方真实姓名和财付通账户")
			}else{
				var form = document.getElementById("myform2"); 
               form.submit();
			}
		}else if(tmp==3){
			u_bankuser=document.getElementById("u_bankuser").value
			u_banknum=document.getElementById("u_banknum").value
			u_bankname=document.getElementById("u_bankname").value
			if (u_bankuser==""||u_banknum==""||u_bankname==""||u_banknum=="请输入银行账号"||u_bankname=="请精确到具体支行"){
				alert ("请填写收款方真实姓名和银行账户")
			}else{
				var form = document.getElementById("myform3"); 
               form.submit();
			}
		}
		}
		function closewin(tmp){
			document.getElementById("pop_window").style.display="none"
			if (tmp=="u_banknum"){
				if (document.getElementById(tmp).value="请输入银行账号"){
					document.getElementById(tmp).value=""
					document.getElementById(tmp).style.color="#333"
					}
				}else if(tmp=="u_bankname"){
				if (document.getElementById(tmp).value="请精确到具体支行"){
					document.getElementById(tmp).value=""
					document.getElementById(tmp).style.color="#333"
					}					
					}
			}
		function showwin(tmp){
			document.getElementById("pop_window").style.display="block"
			if (tmp=="u_banknum"){
				if (document.getElementById(tmp).value==""){
					document.getElementById(tmp).value="请输入银行账号"
					document.getElementById(tmp).style.color="#999"
					}
				}else if(tmp=="u_bankname"){
				if (document.getElementById(tmp).value==""){
					document.getElementById(tmp).value="请精确到具体支行"
					document.getElementById(tmp).style.color="#999"
					}					
					}
			}
</script>
