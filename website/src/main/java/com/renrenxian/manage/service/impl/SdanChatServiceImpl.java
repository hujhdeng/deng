package com.renrenxian.manage.service.impl;

import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.renrenxian.common.util.Page;
import com.renrenxian.manage.dao.SdanChatDao;
import com.renrenxian.manage.model.SdanChat;
import com.renrenxian.manage.model.User;
import com.renrenxian.manage.mybatis.EntityDao;
import com.renrenxian.manage.service.ChatService;
import com.renrenxian.manage.service.JccpushService;
import com.renrenxian.manage.service.SdanChatService;
import com.renrenxian.manage.service.UserService;
import com.renrenxian.manage.service.base.impl.BaseServiceMybatisImpl;
import com.renrenxian.util.result.MapResult;


@Service("sdanChatService")
@Transactional
public class SdanChatServiceImpl extends BaseServiceMybatisImpl<SdanChat,Integer> implements SdanChatService{

	private static Logger logger = LoggerFactory.getLogger(SdanChatServiceImpl.class);

	@Resource
	private SdanChatDao sdanChatDao;
	
	@Resource
	private ChatService chatService;
	
	@Resource
	private UserService userService;
	
	@Resource
	private JccpushService jccpushService;

	@Override
	protected EntityDao<SdanChat, Integer> getEntityDao() {
		return sdanChatDao;
	}

	@Override
	public Map<String, Object> create(Integer sid, Integer ruid, Integer uid,String message) {
		
		User ru = userService.getById(uid);
		if(ru==null){//uid对应的用户不存在
			return MapResult.initMap(1002, "异常的登陆用户");
		}
		
		SdanChat sc = new SdanChat();
		sc.setSdanid(sid+"");
		sc.setSeid(uid+"");
		sc.setReid(ruid+"");
		sc.setMessage(message);
		
		sc.setRegtime(new Date());
		
		this.save(sc);
		
		try{
			JSONObject mesj = new JSONObject();
			mesj.put("uid", uid);
			mesj.put("uname", ru.getuName()); // TODO  原码为接收的参数
			mesj.put("avatar", ru.getAvatar()); // TODO 原码为接收的参数
			mesj.put("content", message);
			mesj.put("sdid", sid);
			mesj.put("sduid", ruid);
			
			JSONObject json = new JSONObject();
			json.put("type", 2);
			json.put("message", mesj);
			
			// chatService.send(uid, ruid, json.toString());
			logger.info("json:{}", json);
			jccpushService.sendMessage(uid, ruid, json.toString());
			
		}catch(Exception ex) {
			logger.error("", ex);
		}
		
		Map<String, Object> map = MapResult.initMap();
		map.put("data", sc);
		
		return map;
	}

	@Override
	public Page<SdanChat> list(Integer sid, Integer reid, int pageNo, int pageSize) {
		
		return sdanChatDao.list(sid, reid, pageNo, pageSize);
	}

	
	public Page<SdanChat> list(Integer sid, Integer uid, Integer reid, int pageNo, int pageSize) {
		
		return sdanChatDao.list1(sid, uid, reid, pageNo, pageSize);
	}
	
}
