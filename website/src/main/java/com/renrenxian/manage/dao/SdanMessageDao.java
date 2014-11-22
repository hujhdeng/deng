package com.renrenxian.manage.dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.renrenxian.common.util.Page;
import com.renrenxian.manage.model.SdanMessage;
import com.renrenxian.manage.model.User;
import com.renrenxian.manage.mybatis.BaseMybatisDao;

@Repository("sdanMessageDao")
public class SdanMessageDao extends BaseMybatisDao<SdanMessage, Integer>{

	@Override
	public String getMybatisMapperNamesapce() {
		return "com.renrenxian.manage.persistence.SdanMessageMapper";
	}

	
	
	public Page<SdanMessage> getBySid(Integer sid, int pageNo, int pagesize) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sdanid", sid);
		Page<SdanMessage> page = new Page<SdanMessage>(pageNo, pagesize);
		return this.selectPage(page, this.getMybatisMapperNamesapce() + ".getBySid", map);
	}
	
}
