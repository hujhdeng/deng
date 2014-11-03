package com.renrenxian.manage.dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.renrenxian.manage.model.User;
import com.renrenxian.manage.mybatis.BaseMybatisDao;

@Repository("userDao")
public class UserDao extends BaseMybatisDao<User, Integer>{

	@Override
	public String getMybatisMapperNamesapce() {
		return "com.renrenxian.manage.persistence.UserMapper";
	}
	
	
	public User getByPhone(String phone) {
		User user = (User)this.getSqlSession().selectOne(this.getMybatisMapperNamesapce()+".getByPhone", phone);
		return user;
	}
	
	public void updateKV(Integer id, String key, Object value, String lng, String lat) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("key", key);
		map.put("value", value);
		map.put("lng", lng);
		map.put("lat", lat);
		this.getSqlSession().update(this.getMybatisMapperNamesapce()+".updateKV", map);
	}

}
