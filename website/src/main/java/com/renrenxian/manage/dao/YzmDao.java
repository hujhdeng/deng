package com.renrenxian.manage.dao;

import org.springframework.stereotype.Repository;

import com.renrenxian.manage.model.Yzm;
import com.renrenxian.manage.mybatis.BaseMybatisDao;

@Repository("yzmDao")
public class YzmDao extends BaseMybatisDao<Yzm, Integer>{

	@Override
	public String getMybatisMapperNamesapce() {
		return "com.renrenxian.manage.persistence.YzmMapper";
	}

	public Yzm getByPhoneLast(String phone) {
		return (Yzm) this.getSqlSession().selectOne(this.getMybatisMapperNamesapce() + ".getByPhone", phone);
	}
}
