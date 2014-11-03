
	<%
	Set conn=Server.CreateObject("Adodb.Connection")
connstr="Provider = Sqloledb; User ID = sa; Password = 'sanrenxing'; Initial Catalog = renren; Data Source = 116.255.199.125;"
On Error Resume Next
conn.open connstr
If Err Then
response.Write("错误的s")
	    err.Clear
	    Set Conn = Nothing
		Response.End
else
Set rs=Server.CreateObject("Adodb.Recordset")
end if
	%>
	