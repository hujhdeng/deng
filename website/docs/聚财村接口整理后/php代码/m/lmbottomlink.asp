  <table width="100%" height="70px" border="0" align="center">
    <tr>
      <td  onclick="chack1('userinfo5.asp')"  style="border-left:0"><img src="images/lman1.jpg" width="50" height="42" /></td>
      <td  onclick="chack1('userinfo6.asp')" ><img src="images/lman2.jpg" width="50" height="42" /></td>
      <td  onclick="chack1('userinfo1.asp')"><img src="images/lman3.jpg" width="50" height="42" /></td>
      <td  onclick="chack1('userinfo9.asp')"><img src="images/lman4.jpg" width="50" height="42" /></td>
      <td  onclick="chack1('userinfo8.asp')"><img src="images/lman5.jpg" width="50" height="42" /></td>
    </tr>
  </table>
  <% u_name=session("u_name")%>
  <SCRIPT  LANGUAGE="JavaScript" >
function chack1(tmp){
	u_name="<%=u_name%>"
if(u_name==""){
	location.href='jcc_log2.asp'
	}else{
	location.href=tmp	
		}
}
</SCRIPT>