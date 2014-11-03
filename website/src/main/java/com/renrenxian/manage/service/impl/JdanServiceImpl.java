package com.renrenxian.manage.service.impl;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.renrenxian.manage.dao.JdanDao;
import com.renrenxian.manage.model.Jdan;
import com.renrenxian.manage.mybatis.EntityDao;
import com.renrenxian.manage.service.JdanService;
import com.renrenxian.manage.service.base.impl.BaseServiceMybatisImpl;


@Service("jdanService")
@Transactional
public class JdanServiceImpl extends BaseServiceMybatisImpl<Jdan,Integer> implements JdanService{

	private static Logger logger = LoggerFactory.getLogger(JdanServiceImpl.class);

	@Resource
	private JdanDao jdanDao;

	@Override
	protected EntityDao<Jdan, Integer> getEntityDao() {
		return jdanDao;
	}

	
}
