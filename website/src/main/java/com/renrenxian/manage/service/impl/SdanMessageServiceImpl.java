package com.renrenxian.manage.service.impl;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.renrenxian.manage.dao.SdanMessageDao;
import com.renrenxian.manage.model.SdanMessage;
import com.renrenxian.manage.mybatis.EntityDao;
import com.renrenxian.manage.service.SdanMessageService;
import com.renrenxian.manage.service.base.impl.BaseServiceMybatisImpl;


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

	
}
