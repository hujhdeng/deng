package com.renrenxian.manage.dao;

import org.springframework.stereotype.Repository;

import com.renrenxian.manage.model.Suggest;
import com.renrenxian.manage.mybatis.BaseMybatisDao;

@Repository("suggestDao")
public class SuggestDao extends BaseMybatisDao<Suggest, Integer>{

	@Override
	public String getMybatisMapperNamesapce() {
		return "com.renrenxian.manage.persistence.SuggestMapper";
	}

	
}
