<?php
$sinfo=$_SERVER["HTTP_USER_AGENT"];
$sinfo1=(explode('MicroMessenger/',$sinfo));
$wxbanben=substr($sinfo1[1], 0,1);
if(strstr($sinfo,'Android')){
$wxphone='android';
}else{
$wxphone='iphone';
};
//echo $wxphone;
/*if ( strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger') !== false ) {
//if($wxbanben<6){
	//$pp="images/p13.jpg";
	//}else{
	if($wxphone=='iphone')	{
	$pp="images/p13i.jpg";	
	$durl="http://a.myapp.com/o/simple.jsp?pkgname=com.jucaicun";
		}else{
	$pp="images/p13a.jpg";	
	$durl="http://a.myapp.com/o/simple.jsp?pkgname=com.jucaicun";	
			}
	//	}
}else{*/
$pp="images/p13.jpg";
$durl="http://a.myapp.com/o/simple.jsp?pkgname=com.jucaicun";
//}
?>
<!DOCTYPE html>
<!--HTML5 doctype-->
<html>
<head>
</head>

<body style="margin:0px;">


    <!--panel-1-->
    <div id="home" title="首页"  data-header="none" data-nav="none"  data-footer="none"  style="width:100%"  >
<img id="pp" onClick="showshow()" src="<?php echo $pp;?>" width="100%;">
<div>
<!--

<a href="http://www.jucaicun.com/app/apk/jucaicun.apk" target="_blank"><img src="images/p18.jpg" width="49%;"></a>
<a href="http://itunes.apple.com/cn/app/id909188985" target="_blank"><img src="images/p19.jpg" width="49%;"></a>
-->
<a onClick="window.location.href='<?php echo $durl; ?>'"><img src="images/p18.jpg" width="49%;"></a>
<a onClick="window.location.href='<?php echo $durl; ?>'"><img src="images/p19.jpg" width="49%;"></a>

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