package com.renrenxian.manage.dao;

import org.springframework.stereotype.Repository;

import com.renrenxian.manage.model.Jdan;
import com.renrenxian.manage.mybatis.BaseMybatisDao;

@Repository("jdanDao")
public class JdanDao extends BaseMybatisDao<Jdan, Integer>{

	@Override
	public String getMybatisMapperNamesapce() {
		return "com.renrenxian.manage.persistence.JdanMapper";
	}

}
