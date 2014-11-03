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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>聚财村</title>
</head>
<!--#include file="renren_conn.asp" -->
<%
act=request.Form("act")
if act="lc_log" then

'session("lc_tracker")=request.QueryString("tracker_u")
session("lc_u_name")=request.Form("username")
session("lc_tel")=request.Form("tel")
session("lc_money")=request.Form("money")

tg_name=""
tg_tel=""
if session("tracker_l")<>"" then
tg_id=session("tracker_l")
tg_fangshi="链接式"
u_table="lmuser"
rs.open "select * from "&u_table&" where id="&tg_id ,conn,1,3
If Not rs.EOF Or Not rs.BOF Then
tg_name=trim(rs("u_name"))
tg_tel=trim(rs("u_tel"))
end if
rs.close
else
tg_fangshi=""
end if

nowtime=now()
u_ip = Request.ServerVariables("HTTP_X_FORWARDED_FOR") 
If u_ip = "" Then u_ip = Request.ServerVariables("REMOTE_ADDR")
u_table="lc"
rs.open "select * from "&u_table&" where u_tel='"&session("lc_tel")&"'" ,conn,1,3
If Not rs.EOF Or Not rs.BOF Then
else
rs.addnew
end if
if session("tracker_l")<>"" and isnull(session("tracker_l"))<>1 then
rs("tg_fangshi")="链接推广"
rs("tg_name")=tg_name
rs("tg_tel")=tg_tel
end if
rs("u_tracker")=session("tracker_l")
rs("u_name")=session("lc_u_name")
rs("u_tel")=session("lc_tel")
rs("lc_money")=session("lc_money")
rs("u_money")="0"
rs("u_time")=nowtime
rs("u_ip")=u_ip
rs("log_lei")="1"
rs.update
rs.close
u_table="dk"
rs.open "select * from "&u_table&" where u_tel='"&session("lc_tel")&"'" ,conn,1,3
If Not rs.EOF Or Not rs.BOF Then
else
rs.addnew
end if
if session("tracker_l")<>"" and isnull(session("tracker_l"))<>1 then
rs("tg_fangshi")="链接推广"
rs("tg_name")=tg_name
rs("tg_tel")=tg_tel
end if
rs("u_tracker")=session("tracker_l")
rs("u_name")=session("lc_u_name")
rs("u_tel")=session("lc_tel")
rs("u_money")="0"
rs("u_time")=nowtime
rs("u_ip")=u_ip

rs.update
rs.close

u_table="dklc_tg"
sql="select * from "&u_table&" where u_tel='"&session("lc_tel")&"'"
rs.open sql ,conn,1,3
If Not rs.EOF Or Not rs.BOF Then
rs("u_tracker")=session("tracker_l")
else
rs.addnew
rs("u_tracker")=session("tracker_l")
rs("u_name")=session("lc_u_name")
rs("u_tel")=session("lc_tel")
rs("u_money")="0"
rs("tg_money")="0"
rs("tj_money")="0"
end if
rs.update
rs.close

response.Redirect("lc_logok.asp")
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
}
body,td,th {
	color: #00F;
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
.middlekuang2{
	 margin:auto;
	 width:100%;
	text-align:center;
		}
		input{
			width:100%;
			border:0;
			font-size:90%;
	}		
</style>
<body>
<div class="middlekuang2">
<form id="myform" name="myform" method="post" action="">
<span style=" width:50%; float:left;"><img  src="images/link1.jpg" width="100%" border="0"  /></span><span style=" width:50%; float:left;"><a href="dk_log.asp"><img  src="images/link2a.jpg" width="100%" border="0"  /></a></span>
<div style="clear:both; width:100%; height:20px;"></div>
<div style="width:100%; float:left;">
 <!--#include file="jcctop.asp" -->
 
</div>
<div style=" width:100%; float:left;"><img  src="images/pic1.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left;"><img  src="images/pic2.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left;">
<div style=" width:34%; float:left;"><img  src="images/pic4.jpg" width="100%" border="0"  /></div>
<div style=" width:54%; float:left;">
<input id="username" name="username" type="text" onFocus="closewin(this.id)" onBlur="showwin(this.id)"/>
</div>
<div style=" width:10%; float:right;"><img  src="images/pic5.jpg" width="100%" border="0"  /></div>
</div>
<div style=" width:100%; float:left;"><img  src="images/pic3.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left;"><img  src="images/pic7.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left;"><img  src="images/pic2.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left;">
<div style=" width:34%; float:left;"><img  src="images/pic6.jpg" width="100%" border="0"  /></div>
<div  style=" width:54%; float:left;">
<input id="tel"  name="tel" type="text"   onfocus="closewin(this.id)" onBlur="showwin(this.id)"/>
</div>
<div style=" width:10%; float:right;"><img  src="images/pic5.jpg" width="100%" border="0"  /></div>
</div>
<div style=" width:100%; float:left;"><img  src="images/pic3.jpg" width="100%" border="0"  /></div>

<div style=" width:100%; float:left;"><img  src="images/pic7.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left;"><img  src="images/pic2.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left;">
<div style=" width:34%; float:left;"><img  src="images/pic8.jpg" width="100%" border="0"  /></div>
<div style=" width:54%; float:left;">
<input id="money"  name="money" type="text"  onfocus="closewin(this.id)" onBlur="showwin(this.id)"/>
</div>
<div style=" width:10%; float:right;"><img  src="images/pic5.jpg" width="100%" border="0"  /></div>
</div>
<div style=" width:100%; float:left;"><img  src="images/pic3.jpg" width="100%" border="0"  /></div>

<div style=" width:100%; float:left;"><img  src="images/pic7.jpg" width="100%" border="0"  /></div>
<span style=" width:100%; float:left;"><img  src="images/pic9.jpg" width="100%" border="0" onClick="chackuser()"/></span>
<div style=" width:100%; float:left;"></div>


<div style="clear:both; width:100%; height:80px;"></div>
<input name="act" type="hidden" id="act" value="lc_log" />
</form>
</div>

<div id="pop_window">
 <!--#include file="bottomlink.asp" -->
</div>


</body>
</html>

<script type="text/javascript" defer>

phonelei="<%=phonelei%>"

	if(phonelei=="Android"){
 document.getElementById("username").blur()
 document.getElementById("tel").blur()
 document.getElementById("money").blur() 
  win_wh=window.screen.availWidth/480*120
   document.getElementById("username").style.fontSize="120%";
   document.getElementById("tel").style.fontSize="120%";
   document.getElementById("money").style.fontSize="120%";
}else {
  win_wh=window.innerWidth/320*90
}
      for(i=1;i<=3;i++){
	document.getElementById("txt"+i).style.fontSize=win_wh+"%"
     // document.getElementById("txt"+i).value=win_wh+"%"+window.screen.availWidth
}

var evt = "onorientationchange" in window ? "orientationchange" : "resize";  
    window.addEventListener(evt, function () { 
	
	if(phonelei=="Android"){
  win_wh=window.screen.availWidth/480*120
   document.getElementById("username").style.fontSize="200%";
   document.getElementById("tel").style.fontSize="200%";
   document.getElementById("money").style.fontSize="200%";
}else {
  win_wh=window.innerWidth/320*90
  
}
      for(i=1;i<=3;i++){
	document.getElementById("txt"+i).style.fontSize=win_wh+"%"
     // document.getElementById("txt"+i).value=win_wh+"%"+window.screen.availWidth
}
    }, false);
function showwin(tmp){
		document.getElementById("pop_window").style.display="block"
	}
function closewin(tmp){
		document.getElementById("pop_window").style.display="none"
	}
	function chackuser(){
	var u_name=document.getElementById("username").value
	  var sMobile = document.getElementById("tel").value
	  
   if(u_name==""){ 
        alert("请输姓名"); 
        }else if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(sMobile))){ 
        alert("请输入正确的手机号"); 
    }else{
	var form = document.getElementById("myform"); 
               form.submit();
		 }
		}
</script>