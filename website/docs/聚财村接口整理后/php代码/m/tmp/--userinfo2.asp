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
#pop_window {
	font-size:12px;
	width:100%;
	height:70px;
	position:fixed;
	
	
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
			border:0 #eee;
			padding:0.5em;
			font-size:90%;
			
	}		
</style>
<body >
<div id="aa" style="width:100%;  background-color:#990; ">
<div id="tt" style="width:100%; float:left;">
  <img src="images/jcclmlogo.jpg" width="100%" border="0"  /></div>
</div>
<div class="middlekuang2">
<div style=" width:100%; float:left;background-color:#3e7cb7;color:#FFF; text-align:left;font-size:0.7em;">

<div style=" float:left; padding:1em;">
<span id="name" style="font-size:1.2em; font-weight:bold; ">完善资料</span>
</div>
</div>
<div style=" width:100%; float:left;"><img  src="images/u10.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left;background-color:#f0f0f0;">
<div style="width:26%; float:left; color:#000; text-align:right; padding:0.6em;">会员姓名</div>
<div style=" width:54%; float:left;"><input name="truename" type="text" id="truename" onfocus="showwin(1)" onblur="showwin(0)" /></div>
</div>
<div style=" width:100%; float:left;"><img  src="images/u11.jpg" width="100%" border="0"  /></div>

<div style=" width:100%; float:left;background-color:#f0f0f0;">
<div style="width:26%; float:left; color:#000; text-align:right; padding:0.6em;">联系手机</div>
<div style=" width:54%; float:left;"><input name="truename" type="text" id="tel" onfocus="showwin(1)" onblur="showwin(0)" /></div>
</div>
<div style=" width:100%; float:left;"><img  src="images/u11.jpg" width="100%" border="0"  /></div>

<div style=" width:100%; float:left;background-color:#f0f0f0;">
<div style="width:26%; float:left; color:#000; text-align:right; padding:0.6em;">工作单位</div>
<div style=" width:54%; float:left;"><input name="truename" type="text" id="office" onfocus="showwin(1)" onblur="showwin(0)" /></div>
</div>
<div style=" width:100%; float:left;"><img  src="images/u11.jpg" width="100%" border="0"  /></div>

<div style=" width:100%; float:left;background-color:#f0f0f0;">
<div style="width:26%; float:left; color:#000; text-align:right; padding:0.6em;">联系地址</div>
<div style=" width:54%; float:left; "><input name="truename" type="text" id="adr"  onfocus="showwin(1)" onblur="showwin(0)" /></div>
</div>
<div style=" width:100%; float:left;"><img  src="images/u11.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left;"><img  src="images/u11.jpg" width="100%" border="0"  /></div>
<div style=" width:100%; float:left;background-color:#f0f0f0;">
<div style="width:26%; float:left; color:#000; text-align:right; padding:0.6em;"></div>
<div style=" width:57%; float:left; background-color:#00b9ce; color:#FFF; font-weight:bold; padding-top:0.5em;padding-bottom:0.5em;" >提交</div>
</div>
</div>

<div style="clear:both; width:100%; height:180px;"></div>
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
var winh=screen.availHeight
 document.getElementById("pop_window").style.bottom="0px"  
strCookie=document.cookie
var arrCookie=strCookie.split("; "); 
var userId; 
//遍历cookie数组，处理每个cookie对 
for(var i=0;i<arrCookie.length;i++){ 
         var arr=arrCookie[i].split("="); 
         //找到名称为userId的cookie，并返回它的值 
         if("phonelei"==arr[0]){ 
                phonelei=arr[1]; 
                break; 
         } 
} 
window.attachEvent('onresize',function(){
	document.getElementById("truename").value=screen.availHeight
      if (screen.availHeight>winh){
		document.getElementById("pop_window").style.bottom="-70px"  
	  }else{
		  document.getElementById("pop_window").style.bottom="0px"  
		  }
        })
function showwin(tmp){
	if(tmp==1){
		document.getElementById("pop_window").style.display="none"
	}else{
		document.getElementById("pop_window").style.display="block"
		}
	document.getElementById("truename").value=document.getElementById("pop_window").style.bottom

	}
	
		    WeixinJSBridge.invoke('sendAppMessage', {
	                            "appid": '',
	                            "img_url": "http://888.888.888.888/resources/image/aa.png",
	                            "img_width": "128",
	                            "img_height": "128",
	                            "link": location.href,
	                            "desc": '文字内容',
	                            "title": '标题'
	                            }, function(res) {
	                            });

</script>

