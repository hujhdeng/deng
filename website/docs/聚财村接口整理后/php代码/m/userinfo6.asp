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
if act="addtguang" then
u_id=session("u_id")
tg_tel=session("u_tel")
tg_name=session("u_name")
bx_tracker=u_id
u_name=request.Form("username")
bx_tel=request.Form("tel")
'bx_money=request.Form("money")
isshow=request.Form("isshow")
bx_note=request.Form("note")
nowtime=now()
hasuser=0
u_ip = Request.ServerVariables("HTTP_X_FORWARDED_FOR") 
If u_ip = "" Then u_ip = Request.ServerVariables("REMOTE_ADDR")
'lei=request.Form("lei")

u_table="dk"
rs.open "select * from "&u_table&" where u_tel='"&bx_tel&"'",conn,1,3
If Not rs.EOF Or Not rs.BOF Then
response.write"<script>alert('对不起，用户已经添加过');</script>"
hasuser=1
else
rs.addnew
rs("u_tracker")=bx_tracker
rs("u_name")=u_name
rs("u_tel")=bx_tel
rs("u_money")=""
rs("isshow")=isshow
rs("u_note")=bx_note
rs("u_ip")=u_ip
rs("u_time")=nowtime
rs("tg_fangshi")="直接推广"
rs("tg_name")=tg_name
rs("tg_tel")=tg_tel
rs("log_lei")="1"
rs.update
rs.close
end if
if hasuser=0 then
u_table="lc"
rs.open "select * from "&u_table&" where u_tel='"&bx_tel&"'",conn,1,3
If Not rs.EOF Or Not rs.BOF Then
response.write"<script>alert('对不起，用户已经添加过');</script>"
else
rs.addnew
rs("u_tracker")=bx_tracker
rs("u_name")=u_name
rs("u_tel")=bx_tel
rs("u_money")=bx_money
rs("isshow")=isshow
rs("u_note")=bx_note
rs("u_ip")=u_ip
rs("u_time")=nowtime
rs("tg_fangshi")="直接推广"
rs("tg_name")=tg_name
rs("tg_tel")=tg_tel
rs("log_lei")="1"
rs.update
response.write"<script>alert('恭喜，添加推广成功！');</script>"
end if
rs.close
end if

u_table="dklc_tg"
sql="select * from "&u_table&" where u_tel='"&bx_tel&"'"
rs.open sql ,conn,1,3
If Not rs.EOF Or Not rs.BOF Then
rs("u_tracker")=bx_tracker
else
rs.addnew
rs("u_tracker")=bx_tracker
rs("u_name")=u_name
rs("u_tel")=bx_tel
rs("u_money")="0"
rs("tg_money")="0"
rs("tj_money")="0"
end if
rs.update
rs.close

end if
%>
<%
mobtmp=Request.ServerVariables("Http_User_Agent")
if instr(mobtmp,"iPhone") then
txtsize="0.7em"
elseif instr(mobtmp,"Android") then
txtsize="0.85em"
else
txtsize="0.85em"
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
			padding-top:0.6em;
			padding-bottom:0.6em;
			font-size:90%;
	}

	textarea {
			width:90%;
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
	.ltxt { width:22%; float:left; color:#000; text-align:right; padding:0.6em;}	
	.linput { width:50%; float:left;}
	.select_style { float:left;width:50%; height:2.4em; overflow:hidden; font-size:1em; background:url(images/jt2.png) no-repeat ;  border:none; background-color:#FFF;     -moz-border-radius: 5px;      /* Gecko browsers */    -webkit-border-radius: 4px;   /* Webkit browsers */    border-radius:4px;-moz-background-size:100% 100%; background-size:100% 100%;}
	.select_style select { padding:0.4em; background:transparent; width:60%; font-size: 1em; border:none; height:2.5em;    -webkit-appearance: none; background-color:#FFF; /*for Webkit browsers*/}
</style>
<body>
<div id="aa" style="width:100%;  background-color:#990; ">
<!--#include file="userinfo_top.asp" -->
</div>
<div class="middlekuang2">
<div style=" width:100%; float:left;background-color:#3e7cb7;color:#FFF; text-align:center;font-size:0.7em;">

<div style=" margin:auto; padding:1em;">
<span id="name" style="font-size:1.8em; font-weight:bold;">添加推广</span>
</div>
</div>
<div id="tt" style="width:100%; float:left;"><img src="images/u14.jpg" width="100%" border="0"  /></div>
  
<form action="" method="post" name="myform" id="myform">
<div style=" width:100%; float:left;background-color:#f0f0f0;">
<div class="ltxt"> 姓名</div>
<div class="linput"><input name="username" type="text" id="username"  onfocus="closewin(this.id)" onblur="showwin(this.id)"  /></div><div style=" float:left; color:#fd3b00;  padding:0.6em; ">*(必填)</div>
</div>
<div style=" width:100%; float:left;"><img  src="images/u11.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left;background-color:#f0f0f0;">
<div class="ltxt"> 手机号码</div>
<div class="linput"><input name="tel" type="text" id="tel"  onfocus="closewin(this.id)" onblur="showwin(this.id)"  /></div><div style=" float:left; color:#fd3b00;  padding:0.6em; ">*(必填)</div>
</div>
<div style=" width:100%; float:left;"><img  src="images/u11.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left;background-color:#f0f0f0;">
<div class="ltxt" >匿名推广</div>
<div class="linput" style="text-align:left ; padding-left:0.6em;">
<div class="select_style" style="float:left">    <select name="isshow" id="isshow">        <option value="0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;是</option>        <option value="1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;否</option> </select></div>
</div>
</div>
<div style=" width:100%; float:left;"><img  src="images/u11.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left;background-color:#f0f0f0;">
<div class="ltxt">备注信息</div>
<div class="linput" >
</select><textarea name="note" cols="" rows="6" id="note"  onfocus="closewin(this.id)" onblur="showwin(this.id)" ></textarea></div><div style=" float:left; color:#fd3b00;  padding:0.6em; "></div>
</div>
<div style=" width:100%; float:left;"><img  src="images/u11.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left;"><img  src="images/u11.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left;background-color:#f0f0f0;">
<div class="ltxt"></div>
<div class="linput" style=" text-align:center "><div  onclick="subform()" style=" margin:auto; width:60%;background-color:#00b9ce; color:#FFF; font-weight:bold; padding-top:0.5em;padding-bottom:0.5em; font-size:1.2em;">提交</div></div>
</div>
<div style=" width:100%; float:left;"><img  src="images/u11.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left;"><img  src="images/u11.jpg" width="100%" border="0"  /></div>
<input name="act" type="hidden" value="addtguang" />


</form>
<div style="width:90%; margin:auto">
<div style="padding-top:0.5em; font-size:1.2em; text-align:left;color:#fd3b00; font-weight:bold;">填写注意事项：</div>
<div style="text-align:left;color:#5e5e5e; ">
<p>1.如您有理财或贷款需求的朋友，可直接将其个人信息在此处添加。当产生有效金融消费后，平台将以推广收入的形式向您支付高额返佣。</p>
<p>2.我们支持匿名添加有潜在理财或贷款需求的实现方式为在"是否匿名推广"中填写"是"，此情况建议在备注中详细介绍朋友情况。</p>
<p>3.我们建议您主动向朋友推广聚财村的金融服务，实践证明这样可让您的推广收入提升数倍！</p>
</div>
</div>




</div>

<div style="clear:both; width:100%; height:70px;"></div>
</body>
<div id="pop_window">
 <!--#include file="lmbottomlink.asp" -->
</div>
</body>
</html>
<script language="javascript" >
document.body.style.fontSize="<%=txtsize%>"
document.getElementById("isshow").style.fontSize="<%=txtsize%>"
function subform(){
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
