<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="include/taglib.jsp"%>

<!DOCTYPE html>
<!--HTML5 doctype-->
<html>
<head>

</head>

<body style="margin:0px;">


    <!--panel-1-->
    <div id="home" title="首页"  data-header="none" data-nav="none"  data-footer="none"  style="width:100%"  >
<img id="pp" onClick="showshow()" src="images/p13.jpg" width="100%;">
<div>
<!--

<a href="http://www.jucaicun.com/app/apk/jucaicun.apk" target="_blank"><img src="images/p18.jpg" width="49%;"></a>
<a href="http://itunes.apple.com/cn/app/id909188985" target="_blank"><img src="images/p19.jpg" width="49%;"></a>
-->
<a onClick="window.location.href='http://a.myapp.com/o/simple.jsp?pkgname=com.jucaicun'"><img src="images/p18.jpg" width="49%;"></a>
<a onClick="window.location.href='http://a.myapp.com/o/simple.jsp?pkgname=com.jucaicun'"><img src="images/p19.jpg" width="49%;"></a>

</div>
<img src="images/p14.jpg" width="100%;">
<img src="images/p15.jpg" width="100%;">
<img src="images/p16.jpg" width="100%;">
<img src="images/p17.jpg" width="100%;">
  </div>  
       
  <!--panel-结束================================================================--> 
  <!--公共header-->
 
  
  <!--公共nav--> 
  


</body>
</html>

<script type="text/javascript">
function showshow(){
	document.getElementById('pp').src="images/p13.jpg"
	}
		</script>
		<!--幻灯JS end-->
