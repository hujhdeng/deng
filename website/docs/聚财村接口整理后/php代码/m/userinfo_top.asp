<!--#include file="function.asp" -->
<%
'------------手机跳转
if getmobi()=1 then
trtmp=request.QueryString("tr")
if trtmp<>"" then
response.Redirect("../index.asp?tr="&trtmp)
else
response.Redirect("../index.asp")
end if
end if
%>
<script type="text/javascript" charset="utf-8" src="js/m.js"></script>
<script language="javascript">
settracktop()
</script>

<div id="tt" style="width:100%; float:left;"><a href="lm_index.asp"> <img src="images/jcclmlogo.jpg" width="100%" border="0"  /></a></div>

