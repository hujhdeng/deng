<?php 
$wxuid=$_GET['uid'];
$sat=$_GET['sat'];
$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());} 
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");
//-----------------------以上为公共数据库连接

$rs=mysql_query("select * from user where id=".$wxuid,$con);
  $myrow = mysql_fetch_array($rs);
 if(empty($myrow)){
	 }else{
$sdavatar2=$myrow["avatar"];
$url='http://'.$_SERVER['SERVER_NAME'].$_SERVER["REQUEST_URI"];
$sdavatar2=(dirname($url)."/file/".$sdavatar2);
$myid=$myrow["id"];
$u_name=$myrow["u_name"];
$area=$myrow["area"];
$kpno=$myrow["kpno"];
$company=$myrow["company"];
$address=$myrow["address"];
$phone=$myrow["phone"];
if($myrow["sex"]=='1'){
	$sex='男';
	}else{
	$sex='女';	
		}
$old=$myrow["old"];		
$business=$myrow["business"];				
$keyword=$myrow["keyword"];		
$industy=$myrow["industy"];	
$dan_count=$myrow["dan_count"];	
$year=$myrow["year"];	
$cont=$myrow["cont"];
	 }
$rs=mysql_query("SELECT COUNT(*) FROM user WHERE id<=$myid",$con);	
$myrow = mysql_fetch_array($rs); 
$user_joinnum=$myrow[0];
//$rs=mysql_query("select user_joinnum from info",$con);
//  $myrow = mysql_fetch_array($rs);
//  $user_joinnum=$myrow['user_joinnum']+1;
//$sql="update info set user_joinnum='".$user_joinnum."'";
//mysql_query($sql); 	 
?>

<?php 
$id=$_GET['id'];
//$con = mysql_connect("localhost","root","sanrenxing");
//if (!$con){die('Could not connect: ' . mysql_error());} 
//mysql_select_db("jcc", $con);
//mysql_query("set names 'utf8'");
//-----------------------以上为公共数据库连接
$u_table='party';
$rs=mysql_query("select * from $u_table where id=$id",$con);
$myrow = mysql_fetch_array($rs);
if(empty($myrow)){
//$arr = array ('apicode'=>10001,'data'=>array ('message'=>urlencode('聚会id错误！')));
 }else{
$id=urlencode($myrow[0]);	 
$uid=urlencode($myrow[1]);
$u_name=urldecode($myrow[2]);
$phone=urlencode($myrow[3]);
//$regtime=date('yy-mm-dd h:i',$myrow[4]);
$regtime=date("Y-m-d H:i:s",strtotime(urlencode($myrow[4])));
$state=urlencode($myrow[5]);
$type=urlencode($myrow[6]);
$partytime=($myrow[7]);
$city=urlencode($myrow[8]);
$area=($myrow[9]);
$adr=urlencode($myrow[10]);
$membernum=urlencode($myrow[11]);
$joinnum=($myrow[12]);
$title=($myrow[13]);
$content=($myrow[14]);
$joinlist=($myrow[15]);
 }
?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<link rel="shortcut icon" href="favicon.ico" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0">
<title>聚财村</title>
<style type="text/css">
<!--
body {
	width:100%;
	background-color: #e5e5e5;
	margin: 0;
	padding: 0;
}
ul, ol, dl { 
	padding: 0;
	margin: 0;
}
h1, h2, h3, h4, h5, h6, p {
	margin-top: 0;	 
	padding-right: 15px;
	padding-left: 15px; /* 向块内的元素侧边（而不是块元素自身）添加填充可避免使用任何方框模型数学。此外，也可将具有侧边填充的嵌套块用作替代方法。 */
}
a img { /* 此选择器将删除某些浏览器中显示在图像周围的默认蓝色边框（当该图像包含在链接中时） */
	border: none;
}
/* ~~ 站点链接的样式必须保持此顺序，包括用于创建悬停效果的选择器组在内。 ~~ */
a:link {
	color: #42413C;
	text-decoration: underline; /* 除非将链接设置成极为独特的外观样式，否则最好提供下划线，以便可从视觉上快速识别 */
}
a:visited {
	color: #6E6C64;
	text-decoration: underline;
}
a:hover, a:active, a:focus { /* 此组选择器将为键盘导航者提供与鼠标使用者相同的悬停体验。 */
	text-decoration: none;
}
/* ~~ 此固定宽度容器包含所有其它块 ~~ */
.container {
	width: 100%;
	/*background-color: #e5e5e5;*/
	margin: 0 auto; /* 侧边的自动值与宽度结合使用，可以将布局居中对齐 */
}

.sidebar1 {
	float: right;
	width: 180px;
	background-color: #EADCAE;
	padding-bottom: 10px;
}
.content {
	padding: 10px 0;
	width: 100%;
	float: right;
}

/* ~~ 此分组的选择器为 .content 区域中的列表提供了空间 ~~ */
.content ul, .content ol {
	padding: 0 15px 15px 40px; /* 此填充反映上述标题和段落规则中的右填充。填充放置于下方可用于间隔列表中其它元素，置于左侧可用于创建缩进。您可以根据需要进行调整。 */
}

/* ~~ 导航列表样式（如果选择使用预先创建的 Spry 等弹出菜单，则可以删除此样式） ~~ */
ul.nav {
	list-style: none; /* 这将删除列表标记 */
	border-top: 1px solid #666; /* 这将为链接创建上边框 – 使用下边框将所有其它项放置在 LI 中 */
	margin-bottom: 15px; /* 这将在下面内容的导航之间创建间距 */
}
ul.nav li {
	border-bottom: 1px solid #666; /* 这将创建按钮间隔 */
}
ul.nav a, ul.nav a:visited { /* 对这些选择器进行分组可确保链接即使在访问之后也能保持其按钮外观 */
	padding: 5px 5px 5px 15px;
	display: block; /* 这将为链接赋予块属性，使其填满包含它的整个 LI。这样，整个区域都可以响应鼠标单击操作。 */
	width: 160px;  /*此宽度使整个按钮在 IE6 中可单击。如果您不需要支持 IE6，可以删除它。请用侧栏容器的宽度减去此链接的填充来计算正确的宽度。 */
	text-decoration: none;
	background-color: #C6D580;
}
ul.nav a:hover, ul.nav a:active, ul.nav a:focus { /* 这将更改鼠标和键盘导航的背景和文本颜色 */
	background-color: #ADB96E;
	color: #FFF;
}

/* ~~ 脚注 ~~ */
footer {
	padding: 10px 0;
	background-color: #CCC49F;
	position: relative;/* 这可以使 IE6 hasLayout 以正确方式进行清除 */
	clear: both; /* 此清除属性强制 .container 了解列的结束位置以及包含列的位置 */
}

/*HTML 5 支持 - 将新 HTML 5 标签设置为 display:block，以使浏览器知道如何正确呈现标签。 */
header, section, footer, aside, article, figure {
	display: block;
}
header{ text-align:center; color:#FFF;background-color: #2a9ae4; padding-top:0.5em; padding-bottom:0.5em; font-family:微软雅黑; font-size:22px;}
section{ width:96%;  margin:auto;overflow: auto; padding-top:0.5em; background-color:#fff;   }
.mtitle{ width:36%; color:#666666; float:left; font-size:0.9em;  padding-top:0.3em;}
.mtxt{  color:#9c9c9c; float:left; font-size:0.9em; width:60%; line-height:1.5em;word-break:break-all;  }
.mkuang{ width:90%; float:left; padding-left:1.5em; color:#323232; clear:both; margin-bottom:1.2em;  }
body{ 
     width:100%;
	 /*background-image:url(bk.jpg);
     background-size:100%;*/}
-->
</style><!--[if lt IE 9]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]--></head>

<body >

<div class="container">
  <header>
   <div style=" font-size:0.8em">聚财村</div>
  </header>
 <div style="width:100%;"><a href="wx/jccappdown.html"><img  src="images/p20.jpg" width="100%"></a></div> 
 <div style="width:100%; height:0.2em; clear:both;"></div>   
    <section>
    <div style="width:70px; height:58px;float:left; padding-top:15px;  overflow:auto; background-color:#2a9ae4; color:#fff; font-size:2em; font-weight:bold; text-align:center; margin-left:30px; margin-top:10px;"><?php echo $membernum;?><span style="font-size:0.4em;">人</span></div>
    
    <div style="width:62%;height:90px;float:left; padding-left:1em; margin-top:15px; ">
    <div style="font-size:1.1em;  padding-left:0.4em;font-family:微软雅黑; font-size:1.2em;"><?php echo $title;?></div>
    <div style="padding:0.5em; padding-top:1em; color:#7e7e7e; " >发起人：<span style="color:#2c8bc5;"><?php echo $u_name;?></span></div>
    </div>
    

 <div style="width:100%; height:0.2em; clear:both;"></div>      
    <section>
  <div style="width:100%; height:0.2em; clear:both;"></div>     
         <div class="mkuang" >
         <div class="mtitle">聚会时间</div><div class="mtxt"><?php echo $partytime;?></div>
         </div>
         <div class="mkuang" >
         <div class="mtitle">所在区域</div><div class="mtxt"><?php echo $area;?></div>
         </div>   
          <div class="mkuang" >     
         <div class="mtitle">人数上限</div><div class="mtxt"><?php echo $membernum;?></div>
         </div>  
          <div class="mkuang" >     
         <div class="mtitle">聚会简介</div><div class="mtxt"><?php echo $content;?></div>
         </div>           
  
  
 <div style="font-size:1.5em; padding-left:25px; color:#666;">已有<span style="color:#2c8bc5;"><?php echo $joinnum;?></span>人报名</div>
  <div style="width:100%; height:1em; clear:both;"></div>
  
   <div onClick="joinparty()"><img  src="images/p21.jpg" width="100%"></div>
    <div style="width:100%; height:5em; clear:both;"></div> 
    </section>

       
       
  <!-- end .container --></div>
</body>
</html>
<script>
function joinparty(str){
	state='<?php echo $state;?>'
	if(state==0){
		alert('本聚会已结束！')
		}else if(state==2){
		alert('人数已满')
			}else{
	window.location.href='wx/wx_log_party.php?id=<?php echo $id;?>&act=wxjoinparty';						}
	//alert(str)
	}
</script>
<script>

var imgUrl = 'http://www.jucaicun.com/app/images/logo108.png';
var lineLink = 'http://www.jucaicun.com/app/wxfenxiang_party.php?uid=<?php echo $wxuid; ?>&id=<?php echo $id; ?>';
var descContent = "我发起了同行聚会，小伙伴们快来报名参加吧！";
var shareTitle = '';
var appid = 'wx4f959a7c02abbfbd';

function shareFriend() {
    WeixinJSBridge.invoke('sendAppMessage',{
                            "appid": appid,
                            "img_url": imgUrl,
                            "img_width": "640",
                            "img_height": "640",
                            "link": lineLink,
                            "desc": descContent,
                            "title": shareTitle
                            }, function(res) {
                            _report('send_msg', res.err_msg);
                            })
}
function shareTimeline() {
    WeixinJSBridge.invoke('shareTimeline',{
                            "img_url": imgUrl,
                            "img_width": "640",
                            "img_height": "640",
                            "link": lineLink,
                            "desc": descContent,
                            "title": shareTitle
                            }, function(res) {
                            _report('timeline', res.err_msg);
                            });
}
function shareWeibo() {
    WeixinJSBridge.invoke('shareWeibo',{
                            "content": descContent,
                            "url": lineLink,
                            }, function(res) {
                            _report('weibo', res.err_msg);
                            });
}
// 当微信内置浏览器完成内部初始化后会触发WeixinJSBridgeReady事件。
document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {

        // 发送给好友
        WeixinJSBridge.on('menu:share:appmessage', function(argv){
            shareFriend();
            });

        // 分享到朋友圈
        WeixinJSBridge.on('menu:share:timeline', function(argv){
            shareTimeline();
            });

        // 分享到微博
        WeixinJSBridge.on('menu:share:weibo', function(argv){
            shareWeibo();
            });
        }, false);
</script>