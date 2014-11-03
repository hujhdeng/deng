package com.renrenxian.manage.service.impl;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.renrenxian.manage.dao.TousuDao;
import com.renrenxian.manage.model.Tousu;
import com.renrenxian.manage.mybatis.EntityDao;
import com.renrenxian.manage.service.TousuService;
import com.renrenxian.manage.service.base.impl.BaseServiceMybatisImpl;


@Service("tousuService")
@Transactional
public class TousuServiceImpl extends BaseServiceMybatisImpl<Tousu,Integer> implements TousuService{

	private static Logger logger = LoggerFactory.getLogger(TousuServiceImpl.class);

	@Resource
	private TousuDao tousuDao;

	@Override
	protected EntityDao<Tousu, Integer> getEntityDao() {
		return tousuDao;
	}

	
}
