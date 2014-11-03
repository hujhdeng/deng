package com.renrenxian.manage.dao;

import org.springframework.stereotype.Repository;

import com.renrenxian.manage.model.Jccpush;
import com.renrenxian.manage.mybatis.BaseMybatisDao;

@Repository("jccpushDao")
public class JccpushDao  extends BaseMybatisDao<Jccpush, Integer> {

	@Override
	public String getMybatisMapperNamesapce() {
		return "com.renrenxian.manage.persistence.JccpushMapper";
	}

}
