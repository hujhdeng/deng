package com.renrenxian.manage.dao;

import org.springframework.stereotype.Repository;

import com.renrenxian.manage.model.Sdan;
import com.renrenxian.manage.mybatis.BaseMybatisDao;

@Repository("sdanDao")
public class SdanDao extends BaseMybatisDao<Sdan, Integer> {

	@Override
	public String getMybatisMapperNamesapce() {
		return "com.renrenxian.manage.persistence.SdanMapper";
	}

}
