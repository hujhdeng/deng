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
$sdavatar=$myrow["avatar"];
$url='http://'.$_SERVER['SERVER_NAME'].$_SERVER["REQUEST_URI"];
$sdavatar=(dirname($url)."/file/".$sdavatar);
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


<script>

var imgUrl = '<?php echo $sdavatar; ?>';
var lineLink = 'http://www.jucaicun.com/app/wxfenxiang.php?uid=<?php echo $uid; ?>';
var descContent = "我成为第<?php echo $user_joinnum; ?>位注册的贷款从业者，赶快来关注我吧";
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