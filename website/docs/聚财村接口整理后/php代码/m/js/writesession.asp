<%
tracker_l= request.QueryString("track_u")
if tracker_l=null then tracker_l=""
session("tracker_l")= tracker_l
%>