<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="js/m.js"></script>
<link href="css/m.css" rel="stylesheet" type="text/css" />
<title>无标题文档</title>
</head>
<!--#include file="renren_conn.asp" -->
<%
act=request.Form("act")
if act="addtguang" then
u_id=session("u_id")
u_tracker=u_id
u_name=request.Form("username")
u_tel=request.Form("tel")
isshow=request.Form("isshow")
u_note=request.Form("note")
nowtime=now()
u_ip = Request.ServerVariables("HTTP_X_FORWARDED_FOR") 
If u_ip = "" Then u_ip = Request.ServerVariables("REMOTE_ADDR")
u_table="lmuser"
tj_tel=response.Cookies("mltel")
rs.open "select * from "&u_table&" where u_tel='"&u_tel&"' or id='"&u_tracker&"'",conn,1,3

hasnew=0
for n=1 to rs.recordcount
if trim(rs("u_tel"))=u_tel then
hasnew=1
tj_name=""
exit for
end if
if rs("id")=u_tracker then
tj_tel=trim(rs("u_tel"))
tj_name=trim(rs("u_name"))
end if
rs.movenext
next
if hasnew=1 then
response.write"<script>alert('手机号已经注册！');</script>"
else
rs.addnew
rs("u_tracker")=u_tracker
rs("u_truename")=u_name
rs("u_name")=u_name
rs("u_tel")=u_tel
rs("u_pwd")=right(u_tel,6)
rs("isshow")=isshow
rs("u_note")=u_note
rs("u_regtime")=nowtime
rs("u_logtime")=nowtime
rs("u_regip")=u_ip
rs("u_logip")=u_ip
rs("u_logcount")="1"
rs("u_jb")="0"
rs("u_remoney")="0"
rs("tj_tel")=tj_tel
rs("tj_name")=tj_name
rs("tj_fangshi")="直接推荐"
rs.update
rs.close
response.write"<script>alert('恭喜，添加推荐成功！');</script>"
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
			border:0 #999;
			padding-top:0.5em;
			padding-bottom:0.5em;
			font-size:90%;
	}
	textarea {
			width:95%;
			border:0 #999;
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
<div style=" width:100%; float:left;background-color:#3e7cb7;color:#FFF; text-align:center;font-size:0.7em;">

<div style=" margin:auto; padding:1em;">
<span id="name" style="font-size:1.8em; font-weight:bold;">添加推荐</span>
</div>
</div>
<div id="tt" style="width:100%; float:left;"><img src="images/u14a.jpg" width="100%" border="0"  /></div>
  
<form action="" method="post" name="myform" id="myform">
<div style=" width:100%; float:left;background-color:#f0f0f0;">
<div style="width:30%; float:left; color:#000; text-align:right; padding:0.6em;"> 真实姓名</div>
<div style=" width:40%; float:left; "><input name="username" type="text" id="username"   onfocus="closewin(this.id)" onblur="showwin(this.id)"/></div><div style=" float:left; color:#fd3b00;  padding:0.6em; ">*(必填)</div>
</div>
<div style=" width:100%; float:left;"><img  src="images/u11.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left;background-color:#f0f0f0;">
<div style="width:30%; float:left; color:#000; text-align:right; padding:0.6em;"> 手机号码</div>
<div style=" width:40%; float:left; "><input name="tel" type="text" id="tel"  onfocus="closewin(this.id)" onblur="showwin(this.id)" /></div><div style=" float:left; color:#fd3b00;  padding:0.6em; ">*(必填)</div>
</div>
<div style=" width:100%; float:left;"><img  src="images/u11.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left;background-color:#f0f0f0;">
<div style="width:30%; float:left; color:#000; text-align:right; padding:0.6em; ">是否透露你的推荐</div>
<div style=" width:40%; float:left;text-align:left ;"><select name="isshow" id="isshow">
  <option value="1">是</option>
  <option value="0">否</option>
</select></div><div style=" float:left; color:#fd3b00;  padding:0.6em; "></div>
</div>
<div style=" width:100%; float:left;"><img  src="images/u11.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left;background-color:#f0f0f0;">
<div style="width:30%; float:left; color:#000; text-align:right; padding:0.6em; ">备注</div>
<div style=" width:40%; float:left;text-align:left ;">
</select><textarea name="note" cols="" rows="3" id="note"  onfocus="closewin(this.id)" onblur="showwin(this.id)"></textarea></div><div style=" float:left; color:#fd3b00;  padding:0.6em; "></div>
</div>
<div style=" width:100%; float:left;"><img  src="images/u11.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left;"><img  src="images/u11.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left;background-color:#f0f0f0;">
<div style="width:30%; float:left; color:#000; text-align:right; padding:0.6em;"></div>
<div style=" width:40%; float:left; background-color:#00b9ce; color:#FFF; font-weight:bold; padding-top:0.5em;padding-bottom:0.5em; font-size:1.2em;" onclick="addtuiguang()">提交</div>
</div>
<div style=" width:100%; float:left;"><img  src="images/u11.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left;"><img  src="images/u11.jpg" width="100%" border="0"  /></div>
<input name="act" type="hidden" value="addtguang" />
</form>
<div style="width:90%; margin:auto">
<div style="padding-top:0.5em; font-size:1.2em; text-align:left;color:#fd3b00; font-weight:bold;">填写注意事项：</div>
<div style="text-align:left;">
<p>1.如果您有理财或贷款需求的朋友，可直接将其个人信息在此处添加。如果您的朋友通过本平台发生了有效金融消费，平台将以推荐收入的形式向您支付高额返点佣金。</p>
<p>2.我们支持匿名添加有潜在理财或贷款需求的朋友，实现方式为在上面的“是否透露你的推荐”栏填写“否”，此情况建议在备注中详细介绍朋友情况。</p>
<p>3.我们更建议您主动添加朋友并告知通过聚财村平台享受金融服务的高性价比，经验证明这样可让您的推荐收入提升数倍。</p>
</div>
</div>




</div>

<div style="clear:both; width:100%; height:70px;"></div>

<div id="pop_window">
 <!--#include file="lmbottomlink.asp" -->
</div>
</body>
</html>
<script type="text/javascript">
function addtuiguang(){
	  var sMobile = document.getElementById("tel").value
    if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(sMobile))){ 
        alert("请输入正确的手机号"); 
		}else if(document.getElementById("username").value==""){
          alert("请输入真实姓名"); 
			}else{
				var form = document.getElementById("myform"); 
               form.submit();
			}
}

</script>
