<?php 
//---------------------------百度云推送
        $ch = curl_init();

        // 2. 设置请求选项, 包括具体的url
        curl_setopt($ch, CURLOPT_URL, "http://search.zhubajie.com/t/o7.html?kw=app".$content);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_HEADER, 0);

        // 3. 执行一个cURL会话并且获取相关回复
        $response = curl_exec($ch);
        // 4. 释放cURL句柄,关闭一个cURL会话
        curl_close($ch);
   // echo $response;
   //--------------------------
   $mailtitle='微信';
   $u_table= "zhubajie";
   $regtime=date('Y-m-d',time());	
$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());}
mysql_select_db("nanxi", $con);
mysql_query("set names 'gb2312'");
$rs=mysql_query("SELECT * FROM $u_table where regtime='".$regtime."'",$con);
$myrow = mysql_fetch_row($rs);
if(empty($myrow)){
	$sat=0;
	$numlist='';
	}else{
	$sat=1;
	$numlist=$myrow[1];	
		}
//----------------------------------	
	$hlist=explode('class="list-task-reward">',$response);
	$listall='';
	$key=explode(',','推广,下载,即可,简单任务,/条,图标设计,好评,ui设计,UI设计,一元,二元,两元,赚钱');
	$num=0;
	for($i=1;$i<=count($hlist);$i++){
	$ctmp=explode('</a>',$hlist[$i]);
     $ctmp2=$ctmp[0];
	
	 $ctmp3=explode('{obj:\'main\'}">',$ctmp2); 
	 $urltmp=$ctmp3[0]; 
	$titletmp=$ctmp3[1]; 
	$moneytmp=explode('&yen;&nbsp;',$hlist[$i]);
	$moneytmp=explode('</em>',$moneytmp[1]);
	$money= $moneytmp[0];
	
	if(strstr($titletmp,'img')){}else{
	if($money>400){
 	$aa= str_replace('<hl>','',$titletmp);
	$title= str_replace('</hl>','',$aa);
	$ex=0;
	for($n=0;$n<count($key);$n++){
		$key2=$key[$n];
	if(strstr($title,$key2)){
		$ex=1;
		}
	}
	if($ex==0){
		
		$bb=explode('href="',$urltmp); 
	$urltmp=explode('" target="',$bb[1]);
	 
	$dannumtmp=explode('task.zhubajie.com/',$urltmp[0]); 
	//$dannumtmp=explode('/',$dannumtmp[1]);
	//echo $dannumtmp[1];
	if(strstr($numlist,$dannumtmp[1])){
		}else{
		$num++;	
		if($num==1){
		$mailtitle=$title;	
			}
	$numlist=$numlist.$dannumtmp[1];	
	$listall=$listall.$num.'.<a href="'.$urltmp[0].'">'.$money.'元-'.$title.'</a><br/>';	
	}
	}
		}
}
		}
		echo $num;
		if($num!=0){
		if($sat==0){
$sql="INSERT INTO ".$u_table." (numlist,regtime) VALUES ('".$numlist."','".$regtime."') ";

			}else{
$sql="update $u_table set numlist='".$numlist."' where regtime='".$regtime."'";				
		}	
mysql_query($sql);	
echo "http://www.cd360.com/mail/cjsmailget.asp?title=".$mailtitle."&body=".$listall;

	//-----------------------
	 $ch = curl_init();
        // 2. 设置请求选项, 包括具体的url
        curl_setopt($ch, CURLOPT_URL, "http://www.cd360.com/mail/cjsmailget.asp?title=".$mailtitle."&body=".$listall);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_HEADER, 0);

        // 3. 执行一个cURL会话并且获取相关回复
        $response = curl_exec($ch);
        // 4. 释放cURL句柄,关闭一个cURL会话
        curl_close($ch);		
//echo $listall;		
	}
//		
//-----------------------------   
?>

