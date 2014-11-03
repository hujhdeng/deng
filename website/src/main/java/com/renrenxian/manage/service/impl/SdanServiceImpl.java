package com.renrenxian.manage.service.impl;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.renrenxian.manage.dao.SdanDao;
import com.renrenxian.manage.model.Sdan;
import com.renrenxian.manage.mybatis.EntityDao;
import com.renrenxian.manage.service.SdanService;
import com.renrenxian.manage.service.base.impl.BaseServiceMybatisImpl;


@Service("sdanService")
@Transactional
public class SdanServiceImpl extends BaseServiceMybatisImpl<Sdan,Integer> implements SdanService{

	private static Logger logger = LoggerFactory.getLogger(SdanServiceImpl.class);

	@Resource
	private SdanDao sdanDao;

	@Override
	protected EntityDao<Sdan, Integer> getEntityDao() {
		return sdanDao;
	}

	
}
