package com.renrenxian.manage.dao;

import org.springframework.stereotype.Repository;

import com.renrenxian.manage.model.SdanChatUser;
import com.renrenxian.manage.mybatis.BaseMybatisDao;

@Repository("sdanChatUserDao")
public class SdanChatUserDao extends BaseMybatisDao<SdanChatUser, Integer>{

	@Override
	public String getMybatisMapperNamesapce() {
		return "com.renrenxian.manage.persistence.SdanChatUserMapper";
	}
	
	

}
