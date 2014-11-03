package com.renrenxian.manage.dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.renrenxian.common.util.Page;
import com.renrenxian.manage.model.Chat;
import com.renrenxian.manage.model.ChatUser;
import com.renrenxian.manage.mybatis.BaseMybatisDao;

@Repository("chatUserDao")
public class ChatUserDao  extends BaseMybatisDao<ChatUser, Integer>{

	@Override
	public String getMybatisMapperNamesapce() {
		return "com.renrenxian.manage.persistence.ChatUserMapper";
	}

	public ChatUser findBySeidAndReid(Integer seid, Integer reid) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("seid", seid);
		map.put("reid", reid);
		return this.getSqlSession().selectOne(this.getMybatisMapperNamesapce() + ".findBySeidAndReid", map);
	}

	
	public void updateByReid(Integer reid) {
		this.getSqlSession().update(this.getMybatisMapperNamesapce() + ".updateByReid", reid);
	}
	
	public void updateByReid2(Integer reid) {
		this.getSqlSession().update(this.getMybatisMapperNamesapce() + ".updateByReid2", reid);
	}
	
	
	public Page<ChatUser> findBySeid(Integer seid, int pageNo, int pageSize) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("seid", seid);
		Page<ChatUser> page = new Page<ChatUser>(pageNo,pageSize);
		 return this.selectPage(page, this.getMybatisMapperNamesapce()+".findBySeid", map);
	}
	
}
