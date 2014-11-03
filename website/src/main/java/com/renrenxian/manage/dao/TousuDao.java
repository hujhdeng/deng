package com.renrenxian.manage.dao;

import org.springframework.stereotype.Repository;

import com.renrenxian.manage.model.Tousu;
import com.renrenxian.manage.mybatis.BaseMybatisDao;

@Repository("tousuDao")
public class TousuDao extends BaseMybatisDao<Tousu, Integer>{

	@Override
	public String getMybatisMapperNamesapce() {
		return "com.renrenxian.manage.persistence.TousuMapper";
	}

}
