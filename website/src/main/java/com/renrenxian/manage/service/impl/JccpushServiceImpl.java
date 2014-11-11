package com.renrenxian.manage.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.renrenxian.common.util.AndroidPushMessageSample;
import com.renrenxian.common.util.IosPushNotificationSample;
import com.renrenxian.manage.dao.JccpushDao;
import com.renrenxian.manage.model.Jccpush;
import com.renrenxian.manage.mybatis.EntityDao;
import com.renrenxian.manage.service.JccpushService;
import com.renrenxian.manage.service.base.impl.BaseServiceMybatisImpl;
import com.renrenxian.util.result.MapResult;


@Service("jccpushService")
@Transactional
public class JccpushServiceImpl extends BaseServiceMybatisImpl<Jccpush,Integer> implements JccpushService{

	private static Logger logger = LoggerFactory.getLogger(JccpushServiceImpl.class);

	@Resource
	private JccpushDao jccpushDao;

	@Override
	protected EntityDao<Jccpush, Integer> getEntityDao() {
		return jccpushDao;
	}

	@Override
	public Map<String, Object> bind(String uid, String pushid, String deviceType) {
		Jccpush jp = this.getById(Integer.valueOf(uid));
		if(jp==null){
			jp = new Jccpush();
			jp.setUid(uid);
			jp.setPushid(pushid);
			jp.setDevice(deviceType);
			this.save(jp);
		}else{
			jp.setPushid(pushid);
			jp.setDevice(deviceType);
			this.update(jp);
		}
		
		
		
		
		
		return MapResult.initMap();
	}

	@Override
	public Map<String, Object> send(Integer seid, Integer reid, String content) {
		Jccpush sjp = this.getById(seid);
		Jccpush rjp = this.getById(reid);
		String push;
		if ("3".equals(rjp.getDevice())) {
			 push = AndroidPushMessageSample.push(rjp.getPushid(), content);
		} else {
			 push = IosPushNotificationSample.push(rjp.getPushid(), content);
		}
		
		Map<String,Object> map = MapResult.initMap();
		map.put("mes", push);
		return map;
	}

	
}
