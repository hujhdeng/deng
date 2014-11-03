package com.renrenxian.manage.service.impl;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.renrenxian.manage.dao.InfoDao;
import com.renrenxian.manage.model.Info;
import com.renrenxian.manage.mybatis.EntityDao;
import com.renrenxian.manage.service.InfoService;
import com.renrenxian.manage.service.base.impl.BaseServiceMybatisImpl;


@Service("infoService")
@Transactional
public class InfoServiceImpl extends BaseServiceMybatisImpl<Info,Integer> implements InfoService{

	private static Logger logger = LoggerFactory.getLogger(InfoServiceImpl.class);

	@Resource
	private InfoDao infoDao;

	@Override
	protected EntityDao<Info, Integer> getEntityDao() {
		return infoDao;
	}

	
}
