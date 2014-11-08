package com.renrenxian.manage.service.impl;

import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.renrenxian.common.util.Page;
import com.renrenxian.manage.dao.SdanChatDao;
import com.renrenxian.manage.model.Party;
import com.renrenxian.manage.model.SdanChat;
import com.renrenxian.manage.mybatis.EntityDao;
import com.renrenxian.manage.service.SdanChatService;
import com.renrenxian.manage.service.base.impl.BaseServiceMybatisImpl;
import com.renrenxian.util.result.MapResult;


@Service("sdanChatService")
@Transactional
public class SdanChatServiceImpl extends BaseServiceMybatisImpl<SdanChat,Integer> implements SdanChatService{

	private static Logger logger = LoggerFactory.getLogger(SdanChatServiceImpl.class);

	@Resource
	private SdanChatDao sdanChatDao;

	@Override
	protected EntityDao<SdanChat, Integer> getEntityDao() {
		return sdanChatDao;
	}

	@Override
	public Map<String, Object> create(Integer sid, Integer ruid, Integer uid,String message) {
		SdanChat sc = new SdanChat();
		sc.setSdanid(sid+"");
		sc.setSeid(uid+"");
		sc.setReid(ruid+"");
		sc.setMessage(message);
		
		sc.setRegtime(new Date());
		
		this.save(sc);
		
		Map<String, Object> map = MapResult.initMap();
		map.put("data", sc);
		
		return map;
	}

	@Override
	public Page<SdanChat> list(Integer sid, Integer reid, int pageNo, int pageSize) {
		
		return sdanChatDao.list(sid, reid, pageNo, pageSize);
	}

	
}
