
<%
getbrowertype()
function getbrowertype()
Dim BrowserString
BrowserString = Request.ServerVariables("HTTP_USER_AGENT")
BrowserString = Lcase(BrowserString)
Dim broFirefox,broMSIE,broOpera,broWap
broFirefox = "firefox"
broMSIE = "msie"
broOpera = "opera"
broWap = "wap"
brchrome="chrome"
'如果是MSIE
if Instr(BrowserString, broMSIE) <> 0 then
'Response.Redirect(broMSIE & ".asp")
getbrowertype=1
end if
'如果是chrome
if Instr(BrowserString, brchrome) <> 0 then
'Response.Redirect(broFirefox & ".asp"
getbrowertype=2
end if

'如果是Firefox
if Instr(BrowserString, broFirefox) <> 0 then
'Response.Redirect(broFirefox & ".asp"
getbrowertype=3
end if

'如果是Opera
if Instr(BrowserString, broOpera) <> 0 then
'Response.Redirect(broOpera & ".asp")
getbrowertype=4
end if
'如果是Wap
if Instr(BrowserString, broWap) <> 0 then
'Response.Redirect(broWap & ".asp")
getbrowertype=5
end if
'response.Write(BrowserString)
end function
%>
<% 
Function GetBrType() '获取浏览器类型(可以判断:47种浏览器;GoogLe,Grub,MSN,Yahoo!蜘蛛;十种常见IE插件) 
Dim StrType, TheInfo, Tmp1, Sysver 
GetBrType = "Other Unknown" 
TheInfo = UCase(Request.ServerVariables("HTTP_USER_AGENT")) 
if Instr(TheInfo,UCase("mozilla"))>0 then GetBrType = "Mozilla" 
if Instr(TheInfo,UCase("icab"))>0 then GetBrType = "iCab" 
if Instr(TheInfo,UCase("lynx"))>0 then GetBrType = "Lynx" 
if Instr(TheInfo,UCase("links"))>0 then GetBrType = "Links" 
if Instr(TheInfo,UCase("elinks"))>0 then GetBrType = "ELinks" 
if Instr(TheInfo,UCase("jbrowser"))>0 then GetBrType = "JBrowser" 
if Instr(TheInfo,UCase("konqueror"))>0 then GetBrType = "konqueror" 
if Instr(TheInfo,UCase("wget"))>0 then GetBrType = "wget" 
if Instr(TheInfo,UCase("ask jeeves"))>0 or Instr(TheInfo,UCase("teoma"))>0 then GetBrType = "Ask Jeeves/Teoma" 
if Instr(TheInfo,UCase("wget"))>0 then GetBrType = "wget" 
if Instr(TheInfo,UCase("opera"))>0 then GetBrType = "opera" 
if Instr(TheInfo,UCase("NOKIAN"))>0 then GetBrType = "NOKIAN(诺基亚手机)" 
if Instr(TheInfo,UCase("SPV"))>0 then GetBrType = "SPV(多普达手机)" 
if Instr(TheInfo,UCase("Jakarta Commons"))>0 then GetBrType = "Jakarta Commons-HttpClient" 
if Instr(TheInfo,UCase("Gecko"))>0 then 
StrType = "[Gecko] " 
GetBrType = "Mozilla Series" 
if Instr(TheInfo,UCase("aol"))>0 then GetBrType = "AOL" 
if Instr(TheInfo,UCase("netscape"))>0 then GetBrType = "Netscape" 
if Instr(TheInfo,UCase("firefox"))>0 then GetBrType = "FireFox" 
if Instr(TheInfo,UCase("chimera"))>0 then GetBrType = "Chimera" 
if Instr(TheInfo,UCase("camino"))>0 then GetBrType = "Camino" 
if Instr(TheInfo,UCase("galeon"))>0 then GetBrType = "Galeon" 
if Instr(TheInfo,UCase("k-meleon"))>0 then GetBrType = "K-Meleon" 
GetBrType = StrType & GetBrType 
end if 
if Instr(TheInfo,UCase("bot"))>0 or Instr(TheInfo,UCase("crawl"))>0 then 
StrType = "[Bot/Crawler]" 
if Instr(TheInfo,UCase("grub"))>0 then GetBrType = "Grub" 
if Instr(TheInfo,UCase("googlebot"))>0 then GetBrType = "GoogleBot" 
if Instr(TheInfo,UCase("msnbot"))>0 then GetBrType = "MSN Bot" 
if Instr(TheInfo,UCase("slurp"))>0 then GetBrType = "Yahoo! Slurp" 
GetBrType = StrType & GetBrType 
end if 
if Instr(TheInfo,UCase("applewebkit"))>0 then 
StrType = "[AppleWebKit]" 
GetBrType = "" 
if Instr(TheInfo,UCase("omniweb"))>0 then GetBrType = "OmniWeb" 
if Instr(TheInfo,UCase("safari"))>0 then GetBrType = "Safari" 
GetBrType = StrType & GetBrType 
end if 
if Instr(TheInfo,UCase("msie"))>0 then 
StrType = "[MSIE" 
Tmp1 = mid(TheInfo,(Instr(TheInfo,UCase("MSIE"))+4),6) 
Tmp1 = left(Tmp1,Instr(Tmp1,";")-1) 
StrTypeStrType = StrType & Tmp1 & "]" 
GetBrType = "Internet Explorer" 
GetBrType = StrType & GetBrType 
end if 
if Instr(TheInfo,UCase("msn"))>0 then GetBrType = "MSN" 
if Instr(TheInfo,UCase("aol"))>0 then GetBrType = "AOL" 
if Instr(TheInfo,UCase("webtv"))>0 then GetBrType = "WebTV" 
if Instr(TheInfo,UCase("myie2"))>0 then GetBrType = "MyIE2" 
if Instr(TheInfo,UCase("maxthon"))>0 then GetBrType = "Maxthon(傲游浏览器)" 
if Instr(TheInfo,UCase("gosurf"))>0 then GetBrType = "GoSurf(冲浪高手浏览器)" 
if Instr(TheInfo,UCase("netcaptor"))>0 then GetBrType = "NetCaptor" 
if Instr(TheInfo,UCase("sleipnir"))>0 then GetBrType = "Sleipnir" 
if Instr(TheInfo,UCase("avant browser"))>0 then GetBrType = "AvantBrowser" 
if Instr(TheInfo,UCase("greenbrowser"))>0 then GetBrType = "GreenBrowser" 
if Instr(TheInfo,UCase("slimbrowser"))>0 then GetBrType = "SlimBrowser" 
if Instr(TheInfo,UCase("360SE"))>0 then GetBrTypeGetBrType = GetBrType & "-360SE(360安全浏览器)" 
if Instr(TheInfo,UCase("QQDownload"))>0 then GetBrTypeGetBrType = GetBrType & "-QQDownload(QQ下载器)" 
if Instr(TheInfo,UCase("TheWorld"))>0 then GetBrTypeGetBrType = GetBrType & "-TheWorld(世界之窗浏览器)" 
if Instr(TheInfo,UCase("icafe8"))>0 then GetBrTypeGetBrType = GetBrType & "-icafe8(网维大师网吧管理插件)" 
if Instr(TheInfo,UCase("TencentTraveler"))>0 then GetBrTypeGetBrType = GetBrType & "-TencentTraveler(腾讯TT浏览器)" 
if Instr(TheInfo,UCase("baiduie8"))>0 then GetBrTypeGetBrType = GetBrType & "-baiduie8(百度IE8.0)" 
if Instr(TheInfo,UCase("iCafeMedia"))>0 then GetBrTypeGetBrType = GetBrType & "-iCafeMedia(网吧网媒趋势插件)" 
if Instr(TheInfo,UCase("DigExt"))>0 then GetBrTypeGetBrType = GetBrType & "-DigExt(IE5允许脱机阅读模式特殊标记)" 
if Instr(TheInfo,UCase("baiduds"))>0 then GetBrTypeGetBrType = GetBrType & "-baiduds(百度硬盘搜索)" 
if Instr(TheInfo,UCase("CNCDialer"))>0 then GetBrTypeGetBrType = GetBrType & "-CNCDialer(数控拨号)" 
if Instr(TheInfo,UCase("NOKIAN85"))>0 then GetBrTypeGetBrType = GetBrType & "-NOKIAN85(诺基亚手机)" 
if Instr(TheInfo,UCase("SPV_C600"))>0 then GetBrTypeGetBrType = GetBrType & "-SPV_C600(多普达C600)" 
if Instr(TheInfo,UCase("Smartphone"))>0 then GetBrTypeGetBrType = GetBrType & "-Smartphone(Windows Mobile for Smartphone Edition 操作系统的智能手机)" 
End Function 
 
'Response.Write GetBrType 
%> 
<%
function getmobi()
TheInfo = UCase(Request.ServerVariables("HTTP_USER_AGENT")) 
if Instr(TheInfo,UCase("Mobile"))>0 then 
getmobi=2
elseif Instr(TheInfo,UCase("iphone"))>0 then 
getmobi=2
else
getmobi=1
end if
end function
%>