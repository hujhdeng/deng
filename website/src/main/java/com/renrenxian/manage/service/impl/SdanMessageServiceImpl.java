package com.renrenxian.manage.service.impl;

import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.renrenxian.common.util.Page;
import com.renrenxian.manage.dao.SdanMessageDao;
import com.renrenxian.manage.model.SdanMessage;
import com.renrenxian.manage.model.User;
import com.renrenxian.manage.mybatis.EntityDao;
import com.renrenxian.manage.service.SdanMessageService;
import com.renrenxian.manage.service.base.impl.BaseServiceMybatisImpl;
import com.renrenxian.util.result.MapResult;


@Service("sdanMessageService")
@Transactional
public class SdanMessageServiceImpl extends BaseServiceMybatisImpl<SdanMessage,Integer> implements SdanMessageService{

	private static Logger logger = LoggerFactory.getLogger(SdanMessageServiceImpl.class);

	@Resource
	private SdanMessageDao sdanMessageDao;

	@Override
	protected EntityDao<SdanMessage, Integer> getEntityDao() {
		return sdanMessageDao;
	}

	@Override
	public Map<String, Object> create(Integer sid, User user ,String message) {
		if(user==null){//uid对应的用户不存在，直接返回，无法创建party
			return MapResult.initMap(1002, "异常的登陆用户");
		}
		
		SdanMessage sm = new SdanMessage();
		sm.setSdanid(sid+"");
		
		sm.setUid(user.getId()+"");
		sm.setuName(user.getuName());
		sm.setAvatar(user.getAvatar());
		sm.setKpno(user.getKpno()+"");
		
		sm.setMessage(message);
		
		sm.setRegtime(new Date());
		
		this.save(sm);
		
		Map<String, Object> map = MapResult.initMap();
		map.put("data", sm);
		return map;
	}

	
	
	public Map<String, Object> getBySid(Integer sid, int pageNo, int pagesize){
		
		if(sid == null) {
			return MapResult.failMap();
		}
		
	
		Page<SdanMessage> page = sdanMessageDao.getBySid(sid, pageNo, pagesize);
		if(page != null && page.getResult() != null) {
			Map<String, Object> map = MapResult.initMap();
			map.put("data", page.getResult());
			return map;
		} else {
			return MapResult.failMap();
		}
	}
	
	public SdanMessage getBySidAndUid(String sid, String uid) {
		return this.getBySidAndUid(sid, uid);
		
	}
	
}
