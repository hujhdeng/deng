package com.renrenxian.manage.service.impl;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.renrenxian.manage.dao.SdanChatDao;
import com.renrenxian.manage.model.SdanChat;
import com.renrenxian.manage.mybatis.EntityDao;
import com.renrenxian.manage.service.SdanChatService;
import com.renrenxian.manage.service.base.impl.BaseServiceMybatisImpl;


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

	
}
