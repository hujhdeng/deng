package com.renrenxian.manage.dao;

import org.springframework.stereotype.Repository;

import com.renrenxian.manage.model.Info;
import com.renrenxian.manage.mybatis.BaseMybatisDao;

@Repository("infoDao")
public class InfoDao  extends BaseMybatisDao<Info, Integer>{

	@Override
	public String getMybatisMapperNamesapce() {
		return "com.renrenxian.manage.persistence.InfoMapper";
	}

}
