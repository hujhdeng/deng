<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<script type="text/javascript">
var contextPath = "${pageContext.request.contextPath}";
var apiPath = "${pageContext.request.contextPath}";

//调试信息上线后注释 
window.onerror = function(message, url, line){
	//alert(message+";"+url+";"+line);
return true;
};
</script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-1.7.1.min.js"></script>

