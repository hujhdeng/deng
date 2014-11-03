package com.renrenxian.manage.dao;

import org.springframework.stereotype.Repository;

import com.renrenxian.manage.model.Party;
import com.renrenxian.manage.mybatis.BaseMybatisDao;

@Repository("partyDao")
public class PartyDao extends BaseMybatisDao<Party, Integer>{

	@Override
	public String getMybatisMapperNamesapce() {
		return "com.renrenxian.manage.persistence.PartyMapper";
	}

	
}
