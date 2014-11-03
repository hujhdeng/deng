package com.renrenxian.manage.dao;

import org.springframework.stereotype.Repository;

import com.renrenxian.manage.model.SdanMessage;
import com.renrenxian.manage.mybatis.BaseMybatisDao;

@Repository("sdanMessageDao")
public class SdanMessageDao extends BaseMybatisDao<SdanMessage, Integer>{

	@Override
	public String getMybatisMapperNamesapce() {
		return "com.renrenxian.manage.persistence.SdanMessageMapper";
	}

}
