package com.renrenxian.manage.service.impl;

import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.renrenxian.manage.dao.SdanChatUserDao;
import com.renrenxian.manage.model.SdanChatUser;
import com.renrenxian.manage.mybatis.EntityDao;
import com.renrenxian.manage.service.SdanChatUserService;
import com.renrenxian.manage.service.base.impl.BaseServiceMybatisImpl;
import com.renrenxian.util.result.MapResult;


@Service("sdanChatUserService")
@Transactional
public class SdanChatUserServiceImpl extends BaseServiceMybatisImpl<SdanChatUser,Integer> implements SdanChatUserService{

	private static Logger logger = LoggerFactory.getLogger(SdanChatUserServiceImpl.class);

	@Resource
	private SdanChatUserDao sdanChatUserDao;

	@Override
	protected EntityDao<SdanChatUser, Integer> getEntityDao() {
		return sdanChatUserDao;
	}

	@Override
	public Map<String, Object> save(Integer sid, Integer uid, String message) {
		
		SdanChatUser scu = sdanChatUserDao.findBySdanidAndUser(sid, uid);
		
		if(scu==null){
			scu = new SdanChatUser();
			scu.setSdanid(sid+"");
			scu.setReid(uid+"");
			scu.setRegtime(new Date());
			scu.setLastcontent(message);
			this.save(scu);
		}else{
			scu.setRegtime(new Date());
			scu.setLastcontent(message);
			this.update(scu);
		}
		
		Map<String, Object> map = MapResult.initMap();
		map.put("data", scu);
		return map;
	}

	
}
