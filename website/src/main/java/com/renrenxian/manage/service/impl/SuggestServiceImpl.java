package com.renrenxian.manage.service.impl;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.renrenxian.manage.dao.SuggestDao;
import com.renrenxian.manage.model.Suggest;
import com.renrenxian.manage.mybatis.EntityDao;
import com.renrenxian.manage.service.SuggestService;
import com.renrenxian.manage.service.base.impl.BaseServiceMybatisImpl;


@Service("suggestService")
@Transactional
public class SuggestServiceImpl extends BaseServiceMybatisImpl<Suggest,Integer> implements SuggestService{

	private static Logger logger = LoggerFactory.getLogger(SuggestServiceImpl.class);

	@Resource
	private SuggestDao suggestDao;

	@Override
	protected EntityDao<Suggest, Integer> getEntityDao() {
		return suggestDao;
	}

	
}
