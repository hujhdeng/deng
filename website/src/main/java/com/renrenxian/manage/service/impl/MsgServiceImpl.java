package com.renrenxian.manage.service.impl;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.renrenxian.manage.dao.MsgDao;
import com.renrenxian.manage.model.Msg;
import com.renrenxian.manage.mybatis.EntityDao;
import com.renrenxian.manage.service.MsgService;
import com.renrenxian.manage.service.base.impl.BaseServiceMybatisImpl;


@Service("msgService")
@Transactional
public class MsgServiceImpl extends BaseServiceMybatisImpl<Msg,Integer> implements MsgService{

	private static Logger logger = LoggerFactory.getLogger(MsgServiceImpl.class);

	@Resource
	private MsgDao msgDao;

	@Override
	protected EntityDao<Msg, Integer> getEntityDao() {
		return msgDao;
	}

	
}
