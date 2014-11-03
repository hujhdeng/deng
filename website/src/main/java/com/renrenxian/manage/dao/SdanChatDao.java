package com.renrenxian.manage.dao;

import org.springframework.stereotype.Repository;

import com.renrenxian.manage.model.SdanChat;
import com.renrenxian.manage.mybatis.BaseMybatisDao;

@Repository("sdanChatDao")
public class SdanChatDao extends BaseMybatisDao<SdanChat, Integer>{

	@Override
	public String getMybatisMapperNamesapce() {
		return "com.renrenxian.manage.persistence.SdanChatMapper";
	}

}
