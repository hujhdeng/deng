package com.renrenxian.manage.service.impl;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.renrenxian.manage.dao.PartyDao;
import com.renrenxian.manage.model.Party;
import com.renrenxian.manage.mybatis.EntityDao;
import com.renrenxian.manage.service.PartyService;
import com.renrenxian.manage.service.base.impl.BaseServiceMybatisImpl;


@Service("paytyService")
@Transactional
public class PartyServiceImpl extends BaseServiceMybatisImpl<Party,Integer> implements PartyService{

	private static Logger logger = LoggerFactory.getLogger(PartyServiceImpl.class);

	@Resource
	private PartyDao partyDao;

	@Override
	protected EntityDao<Party, Integer> getEntityDao() {
		return partyDao;
	}

	
}
