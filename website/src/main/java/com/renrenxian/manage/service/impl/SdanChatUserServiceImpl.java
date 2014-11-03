package com.renrenxian.manage.service.impl;

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

	
}
