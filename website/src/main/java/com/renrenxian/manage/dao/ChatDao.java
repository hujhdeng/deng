package com.renrenxian.manage.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.httpclient.util.DateUtil;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Repository;

import com.renrenxian.common.util.Page;
import com.renrenxian.manage.model.Chat;
import com.renrenxian.manage.mybatis.BaseMybatisDao;

@Repository("ChatDao")
public class ChatDao extends BaseMybatisDao<Chat, Integer>{

	@Override
	public String getMybatisMapperNamesapce() {
		return "com.renrenxian.manage.persistence.ChatMapper";
	}

	
	public Page<Chat> findlist(Integer seid, Integer reid, int pageNo, int pageSize){
		Map<String,Object> map = new HashMap<String,Object>();
        map.put("seid", seid);
        map.put("reid", reid);
        Page<Chat> page = new Page<Chat>(pageNo,pageSize);
        return this.selectPage(page, this.getMybatisMapperNamesapce()+".findlist", map);
    }
	
}
