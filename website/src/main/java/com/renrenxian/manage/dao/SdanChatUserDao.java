package com.renrenxian.manage.dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.renrenxian.manage.model.SdanChatUser;
import com.renrenxian.manage.mybatis.BaseMybatisDao;

@Repository("sdanChatUserDao")
public class SdanChatUserDao extends BaseMybatisDao<SdanChatUser, Integer>{

	@Override
	public String getMybatisMapperNamesapce() {
		return "com.renrenxian.manage.persistence.SdanChatUserMapper";
	}
	
	public SdanChatUser findBySdanidAndUser(Integer sdanid,Integer ruid){
		Map<String,Object> map = new HashMap<String,Object>();
        map.put("sdanid", sdanid);
        map.put("ruid", ruid);
        return this.getSqlSession().selectOne(getMybatisMapperNamesapce()+".findBySdanidAndUser", map);
	}

}
