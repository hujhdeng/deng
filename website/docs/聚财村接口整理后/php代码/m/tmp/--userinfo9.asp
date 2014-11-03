<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>无标题文档</title>
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
body{
margin:0px;
font: normal 100% 宋体, Arial, sans-serif;
background-color:#f0f0f0;
font-size:0.7em;
}
body,td,th {
	color: #000;
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
<div id="tt" style="width:100%; float:left;">
  <img src="images/jcclmlogo.jpg" width="100%" border="0"  /></div>
</div>
<div class="middlekuang2">
<div style=" width:100%; float:left;background-color:#3e7cb7;color:#FFF; text-align:center;font-size:0.7em;">

<div style=" margin:auto; padding:1em;">
<span id="name" style="font-size:1.8em; font-weight:bold;">添加推荐</span>
</div>
</div>
<div id="tt" style="width:100%; float:left;"><img src="images/u14.jpg" width="100%" border="0"  /></div>
  

<div style=" width:100%; float:left;background-color:#f0f0f0;">
<div style="width:30%; float:left; color:#000; text-align:right; padding:0.6em;"> 真实姓名</div>
<div style=" width:40%; float:left; "><input name="truename" type="text" id="truename"  /></div><div style=" float:left; color:#fd3b00;  padding:0.6em; ">*(必填)</div>
</div>
<div style=" width:100%; float:left;"><img  src="images/u11.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left;background-color:#f0f0f0;">
<div style="width:30%; float:left; color:#000; text-align:right; padding:0.6em;"> 手机号码</div>
<div style=" width:40%; float:left; "><input name="truename" type="text" id="truename"  /></div><div style=" float:left; color:#fd3b00;  padding:0.6em; ">*(必填)</div>
</div>
<div style=" width:100%; float:left;"><img  src="images/u11.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left;background-color:#f0f0f0;">
<div style="width:30%; float:left; color:#000; text-align:right; padding:0.6em; ">是否透露你的推荐</div>
<div style=" width:40%; float:left;text-align:left ;"><select name="">
  <option value="1">是</option>
  <option value="0">否</option>
</select></div><div style=" float:left; color:#fd3b00;  padding:0.6em; "></div>
</div>
<div style=" width:100%; float:left;"><img  src="images/u11.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left;background-color:#f0f0f0;">
<div style="width:30%; float:left; color:#000; text-align:right; padding:0.6em; ">备注</div>
<div style=" width:40%; float:left;text-align:left ;">
</select><textarea name="" cols="" rows="3"></textarea></div><div style=" float:left; color:#fd3b00;  padding:0.6em; "></div>
</div>
<div style=" width:100%; float:left;"><img  src="images/u11.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left;"><img  src="images/u11.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left;background-color:#f0f0f0;">
<div style="width:30%; float:left; color:#000; text-align:right; padding:0.6em;"></div>
<div style=" width:40%; float:left; background-color:#00b9ce; color:#FFF; font-weight:bold; padding-top:0.5em;padding-bottom:0.5em; font-size:1.2em;">提交</div>
</div>
<div style=" width:100%; float:left;"><img  src="images/u11.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left;"><img  src="images/u11.jpg" width="100%" border="0"  /></div>

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
</body>
<div id="pop_window">
  <table width="100%" height="70px" border="0" align="center">
    <tr>
      <td style="border-left:0"><img src="images/lman1.jpg" width="50" height="42" 

/></td>
      <td><img src="images/lman2.jpg" width="50" height="42" /></td>
      <td><img src="images/lman3.jpg" width="50" height="42" /></td>
      <td><img src="images/lman4.jpg" width="50" height="42" /></td>
      <td><img src="images/lman5.jpg" width="50" height="42" /></td>
    </tr>
  </table>
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
