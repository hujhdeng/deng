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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 

"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-

scale=1, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>聚财村</title>
<%
'response.Write(session("tracker_l")&"--aa")
mlid=request.Cookies("mlid")
tracker_l=request.QueryString("tracker_u")
if tracker_l<>"" then
if mlid<>tracker_l then
session("tracker_l")=tracker_l
else
tracker_l=""
end if
end if

mobtmp=Request.ServerVariables("Http_User_Agent")
if instr(mobtmp,"iPhone") then
plei="iPhone"
elseif instr(mobtmp,"Android") then
plei="Android"
else
plei="other"
end if
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
.middlekuang{
	 margin:auto;
	 width:94%;
	text-align:center;
		}		
</style>
</head>
<%

%>
<body>


<div class="middlekuang">
<span style=" width:100%; float:left;"><a id="adrs" href="dk_log.asp"><img id="div1" src="images/ad1.jpg" width="100%" border="0"  /></a></span>
<div style=" width:100%; float:left;"></div>
  <div style="width:57%; background-color:#00b9ce;float:left; margin-top:10px;" onClick="location.href='lc_log.asp'">
<div style="float:right; width:33%"><img src="images/tu1.jpg" width="100%" /></div>
<div id="fen1" style="clear:both; height:20px;"></div>
<div style="float:left; width:56%"><img src="images/tu1a.jpg" width="100%" /></div>
</div>
 
      <div style="width:43%; background-color:#41ab7a; background-image:url(images/line.jpg); background-repeat:repeat-y;float:left; margin-top:10px;" onClick="location.href='jcc_aboutus.asp'">
            
        <div style="float:right; width:40%"><img src="images/tu2.jpg" width="100%" /></div>
<div id="fen2"  style="width:80%; height:20px; float:left;"></div>
<div style="float:left; width:59%; margin-left:4px;"><img src="images/tu2a.jpg" width="100%" /></div>    
      </div>
      <div style="width:57%; background-color:#d7584f;float:left; margin-top:4px;" onClick="location.href='lm_index.asp'">
<div style="float:right; width:33%; "><img src="images/tu3.jpg" width="100%" /></div>
<div id="fen3"  style="clear:both; height:20px;"></div>
<div style="float:left; width:56%"><img src="images/tu3a.jpg" width="100%" /></div>
      
  </div>
 
      
            <div style="width:43%; background-color:#0281e0; background-image:url(images/line.jpg); background-repeat:repeat-y;float:left; margin-top:4px;" onClick="location.href='jcc_news.asp'">
            
        <div style="float:right; width:40%"><img src="images/tu4.jpg" width="100%" /></div>
<div id="fen4"  style="width:80%; height:20px; float:left;"></div>
<div style="float:left; width:59%; margin-left:4px;"><img src="images/tu4a.jpg" width="100%" /></div>    
      </div>
</div>
<div style="clear:both; width:100%; height:80px;"></div>
</body>
<div id="pop_window">
 <!--#include file="bottomlink.asp" -->
</div>
</body>
</html>
    <script type="text/javascript"  >
	
	tracker_l="<%=tracker_l%>"
	
if (tracker_l!=""){
		if (document.location.href.indexOf("tracker_u")>=0){
			
			loc=document.location.href.split("?")[0]
			document.location.href=loc
		}else{
		}
	}
     ww=screen.width-20;
     hh= screen.availHeight-window.screenTop-10-70;
		 //document.getElementById('aa').style.width=String(ww)+'px'
		 //document.getElementById('aa').style.height=String(hh)+'px'
		//document.write(document.getElementById('aa').style.width)
//document.write("屏幕尺寸："+screen.width+"*"+screen.height)
//alert (hh+"--"+window.screenTop+"--"+screen.availHeight)
    </script>
<script type="text/javascript">
var browser={
versions:function(){
var u = navigator.userAgent, app = navigator.appVersion;
return { //移动终端浏览器版本信息
trident: u.indexOf('Trident') > -1, //IE内核
presto: u.indexOf('Presto') > -1, //opera内核
webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核
mobile: !!u.match(/AppleWebKit.*Mobile.*/), //是否为移动终端
ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或uc浏览器
iPhone: u.indexOf('iPhone') > -1 , //是否为iPhone或者QQHD浏览器
iPad: u.indexOf('iPad') > -1, //是否iPad
webApp: u.indexOf('Safari') == -1 //是否web应该程序，没有头部与底部
};
}(),
language:(navigator.browserLanguage || navigator.language).toLowerCase()
}
//document.writeln("语言版本: "+browser.language);
//document.writeln(" 是否为移动终端: "+browser.versions.mobile);
//document.writeln(" ios终端: "+browser.versions.ios);
//document.writeln(" android终端: "+browser.versions.android);
//document.writeln(" 是否为iPhone: "+browser.versions.iPhone);
//document.writeln(" 是否iPad: "+browser.versions.iPad);
//document.writeln(navigator.userAgent);
 var images= ["images/ad1.jpg", "images/ad2.jpg","images/lmad3.jpg"];
 var adrs=["dk_log.asp","lc_log.asp","lm_index.asp"]
    var index = 0;
    function switch_background(){    
    if(index ==images.length-1)
    {        
         index = 0;  
    }else{   
         index++;      
    }   

   document.getElementById("div1").src=images[index];
    document.getElementById("adrs").href=adrs[index];
}

window.onload = function()
{
    setInterval(switch_background, 4000);
} 
</script>
<SCRIPT  LANGUAGE="JavaScript" >
plei="<%=plei%>"
if(plei=="iPhone"){
	 document.getElementById("fen1").style.height="40px";
	  document.getElementById("fen2").style.height="40px";
	 document.getElementById("fen3").style.height="40px";
	  document.getElementById("fen4").style.height="40px";	  
	}else{
			 document.getElementById("fen1").style.height="30px";
	  document.getElementById("fen2").style.height="30px";
	 document.getElementById("fen3").style.height="30px";
	  document.getElementById("fen4").style.height="30px";
		}
	
	

</SCRIPT>