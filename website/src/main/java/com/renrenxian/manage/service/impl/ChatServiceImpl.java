package com.renrenxian.manage.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.renrenxian.common.util.HttpClientUtils;
import com.renrenxian.common.util.Page;
import com.renrenxian.manage.dao.ChatDao;
import com.renrenxian.manage.model.Chat;
import com.renrenxian.manage.model.ChatUser;
import com.renrenxian.manage.model.User;
import com.renrenxian.manage.mybatis.EntityDao;
import com.renrenxian.manage.service.ChatService;
import com.renrenxian.manage.service.ChatUserService;
import com.renrenxian.manage.service.UserService;
import com.renrenxian.manage.service.base.impl.BaseServiceMybatisImpl;
import com.renrenxian.util.result.MapResult;


@Service("chatService")
@Transactional
public class ChatServiceImpl extends BaseServiceMybatisImpl<Chat,Integer> implements ChatService{

	private static Logger logger = LoggerFactory.getLogger(ChatServiceImpl.class);

	@Resource
	private ChatDao chatDao;
	@Resource
	private UserService userService;
	@Resource
	private ChatUserService chatUserService;
	
	@Override
	protected EntityDao<Chat, Integer> getEntityDao() {
		return chatDao;
	}

	
	/**  原代码
	 * 
	 * //-------------------------添加聊天记录
function add_chat(){
$u_table='chat';
$liststr='seid,reid,content,regtime,u_name,kpno,avatar';
$seid=$_GET['seid'];
$reid=$_GET['reid'];
$content=$_GET['content'];
$regtime=$regtime=date('Y-m-d H:i:s',time());

$uname=$_GET['uname'];
$avatar=$_GET['avatar'];
//---------------------------百度云推送
//        $ch = curl_init();
//
//
//
//	$sinfo='{"type":"1","message":{"uid":"'.$seid.'","uname":"'.$uname.'","avatar":"'.$avatar.'","content":"'.$content.'","sdid":"","sduid":""}}';
//
//        // 2. 设置请求选项, 包括具体的url
//        curl_setopt($ch, CURLOPT_URL, "http://jucaicun.com:8080/jcc/push?act=push&uid=".$reid."&msg=".$sinfo);
//        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
//        curl_setopt($ch, CURLOPT_HEADER, 0);
//
//        // 3. 执行一个cURL会话并且获取相关回复
//        $response = curl_exec($ch);
//        // 4. 释放cURL句柄,关闭一个cURL会话
//        curl_close($ch);	
//-----------------------------
$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());}
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");
$rs=mysql_query("select * from user where id=".$seid,$con);
$myrow = mysql_fetch_array($rs);
if(empty($myrow)){}else{
	$seu_name=$myrow[1];
	$sekpno=$myrow[6];
	$seavatar=$myrow[22];
	}
$rs=mysql_query("select * from user where id=".$reid,$con);
$myrow = mysql_fetch_array($rs);
if(empty($myrow)){}else{
	$reu_name=$myrow[1];
	$rekpno=$myrow[6];
	$reavatar=$myrow[22];
	}	
//----------定义表名和键列表两个后面为标准的
$liststr2=explode(',',$liststr);
$liststr4=" ";
for($i=0;$i<count($liststr2);$i++){
	if($i==0){
			$liststr4=$liststr4.' "'.${$liststr2[$i]}.'"';
		}else{
			$liststr4=$liststr4.',"'.${$liststr2[$i]}.'"';
		}
	}
$liststr3='('.$liststr.') VALUES ('.$liststr4.')';	
$sqlstr="INSERT INTO ".$u_table.$liststr3;
mysql_query($sqlstr);
$danid=mysql_insert_id();
//写入
$u_table='chat_user';
$rs=mysql_query("select * from $u_table where seid=".$seid." and reid=".$reid,$con);
$myrow = mysql_fetch_array($rs);
if(empty($myrow)){
$sql="INSERT INTO ".$u_table.' (seid,reid,regtime,lastcontent,u_name,kpno,avatar) 
	VALUES ("'.$seid.'","'.$reid.'","'.$regtime.'","'.$content.'","'.$seu_name.'","'.$sekpno.'","'.$seavatar.'")';	
	}else{
$sql="update $u_table set regtime='".$regtime."',lastcontent='".$content."',u_name='".$seu_name."',kpno='".$sekpno."',avatar='".$seavatar."' where seid=".$seid." and reid=".$reid;
		}
mysql_query($sql);


$rs=mysql_query("select * from $u_table where seid=".$reid." and reid=".$seid,$con);
$myrow = mysql_fetch_array($rs);
if(empty($myrow)){
$sql="INSERT INTO ".$u_table.' (seid,reid,regtime,lastcontent,u_name,kpno,avatar,hasread) 
	VALUES ("'.$reid.'","'.$seid.'","'.$regtime.'","'.$content.'","'.$reu_name.'","'.$rekpno.'","'.$reavatar.'","0")';	
	}else{
$sql="update $u_table set regtime='".$regtime."',lastcontent='".$content."',u_name='".$ren_name."',
			kpno='".$rekpno."',avatar='".$reavatar."',hasread='0' where seid=".$reid." and reid=".$seid;
		}
mysql_query($sql);

$u_table='chat';
$sql="INSERT INTO ".$u_table.' (seid,reid,regtime,content) VALUES ("'.$seid.'","'.$reid.'","'.$regtime.'","'.$content.'")';
mysql_query($sql);
//---------------------------百度云推送
        $ch = curl_init();

	$sinfo='{"type":"1",
	"message":
		{"uid":"'.$seid.'",
		  "uname":"'.$uname.'",
		  "avatar":"'.$avatar.'",
		  "content":"'.$content.'",
		  "sdid":"","sduid":""}}';

        // 2. 设置请求选项, 包括具体的url
        curl_setopt($ch, CURLOPT_URL, "http://jucaicun.com:8080/jcc/push?act=push&uid=".$reid."&msg=".$sinfo);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_HEADER, 0);

        // 3. 执行一个cURL会话并且获取相关回复
        $response = curl_exec($ch);
        // 4. 释放cURL句柄,关闭一个cURL会话
        curl_close($ch);	
//-----------------------------
$arr = array ('apicode'=>10000); 


echo urldecode(json_encode($arr));

		
}
	 * 
	 */
	@Override
	public Map<String, Object> send(int seid, int reid, String content){
		// 发送人
		User seUser = userService.getById(seid);
		if(seUser == null) {
			return MapResult.initMap(1001, "发送用户不存在");
		}
		
		User reUser = userService.getById(reid);
		if(reUser == null) {
			return MapResult.initMap(1001, "接收用户不存在");
		}
		
		String seu_name=seUser.getuName();
		int sekpno=seUser.getKpno();
		String seavatar=seUser.getAvatar();
		
		String reu_name=reUser.getuName();
		int rekpno=reUser.getKpno();
		String reavatar=reUser.getAvatar();
		
		Chat chat = new Chat();
		chat.setReid(reid);
		chat.setSeid(seid);
		chat.setContent(content);
		chat.setRegtime(new Date());
		// 入库处理
		chatDao.save(chat);
		
		// 更新 $u_table='chat_user';
		ChatUser chatUser = chatUserService.findBySeidAndReid(seid, reid);
		if(null == chatUser) {
			//入库chatUser
			chatUser = new ChatUser();
			chatUser.setSeid(seid);
			chatUser.setReid(reid);
			chatUser.setRegtime(new Date());
			chatUser.setLastcontent(content);
			chatUser.setuName(seu_name);
			chatUser.setKpno(sekpno + "");
			chatUser.setAvatar(seavatar);
			chatUser.setHasread("1"); 
			chatUser.setHehasread("0"); 
			chatUserService.save(chatUser);
		}else {
			// 更新库
			chatUser.setRegtime(new Date());
			chatUser.setLastcontent(content);
			chatUser.setuName(seu_name);
			chatUser.setKpno(sekpno + "");
			chatUser.setAvatar(seavatar);
			chatUser.setHasread("1"); 
			chatUser.setHehasread("0"); 
			chatUserService.update(chatUser);
		}
		
		// 反入库一条
		/**
		 * 
		 * $hasread=0;
$hehasread=1;
$rs=mysql_query("select * from $u_table where seid=".$reid." and reid=".$seid,$con);
$myrow = mysql_fetch_array($rs);
if(empty($myrow)){
$sql="INSERT INTO ".$u_table.' 
(seid,reid,regtime,lastcontent,u_name,kpno,avatar,hasread,hehasread) 
VALUES ("'.$reid.'","'.$seid.'","'.$regtime.'","'.$content.'","'.$reu_name.'",
"'.$rekpno.'","'.$reavatar.'","0","1")';	
	}else{
$sql="update $u_table set regtime='".$regtime."',lastcontent='".$content."',
u_name='".$ren_name."',kpno='".$rekpno."',avatar='".$reavatar."',hasread='0',
hehasread='1' where seid=".$reid." and reid=".$seid;

		}
		**/
		chatUser = chatUserService.findBySeidAndReid(reid, seid);
		if(null == chatUser) {
			//入库chatUser
			chatUser = new ChatUser();
			chatUser.setSeid(reid);
			chatUser.setReid(seid);
			chatUser.setRegtime(new Date());
			chatUser.setLastcontent(content);
			chatUser.setuName(reu_name);
			chatUser.setKpno(rekpno + "");
			chatUser.setAvatar(reavatar);
			chatUser.setHasread("0"); 
			chatUser.setHehasread("1"); 
			chatUserService.save(chatUser);
		}else {
			// 更新库
			chatUser.setRegtime(new Date());
			chatUser.setLastcontent(content);
			chatUser.setuName(reu_name);
			chatUser.setKpno(rekpno + "");
			chatUser.setAvatar(reavatar);
			chatUser.setHasread("0"); 
			chatUser.setHehasread("1"); 
			chatUserService.update(chatUser);
		}
		
		// 推送
		/**
		 * $sinfo='{"type":"1",
	"message":
		{"uid":"'.$seid.'",
		  "uname":"'.$uname.'",
		  "avatar":"'.$avatar.'",
		  "content":"'.$content.'",
		  "sdid":"","sduid":""}}';
		 */
		try{
			JSONObject message = new JSONObject();
			message.put("uid", seid);
			message.put("uname", ""); // TODO  原码为接收的参数
			message.put("avatar", ""); // TODO 原码为接收的参数
			message.put("content", content);
			message.put("sdid", "");
			message.put("sduid", "");
			
			JSONObject json = new JSONObject();
			json.put("type", 1);
			json.put("message", message);
			
			// http://jucaicun.com:8080/jcc/push?act=push&uid=".$reid."&msg=".$sinfo);
			// String url = "http://jucaicun.com:8080/jcc/push?act=push&uid=" + reid + "&msg="+json.toString();
			String url = "http://jucaicun.com:8080/jcc/push?act=push";
			Map<String, String> map = new HashMap<String, String>();
			// map.put("act", "push");
			map.put("uid", reid+"");
			map.put("msg", json.toString());
			logger.info(url);
			String response = HttpClientUtils.getInstance().postResponse(url, map);
			logger.info("response:" + response);
		}catch(Exception ex) {
			logger.error("", ex);
			
		}
		
		return MapResult.initMap();
	}
	
	
	@Override
	public Page<Chat> list(Integer seid, Integer reid, int pageNo, int pagesize){
		/**
		 *    while ($myrow = mysql_fetch_array($rs));
$sql="update chat_user set hehasread='1'  where seid='$reid'";
mysql_query($sql);	
$sql="update chat_user set hasread='1'  where reid='$reid'";
mysql_query($sql);	
		 */
		
		chatUserService.updateByReid(reid);
		chatUserService.updateByReid2(reid);
		
		return this.chatDao.findlist(seid, reid, pageNo, pagesize);
	}
	
	
	
	
	
	
	
	
	
}
