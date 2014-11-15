package com.renrenxian.manage.dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.renrenxian.common.util.Page;
import com.renrenxian.manage.model.Party;
import com.renrenxian.manage.model.SdanChat;
import com.renrenxian.manage.mybatis.BaseMybatisDao;

@Repository("sdanChatDao")
public class SdanChatDao extends BaseMybatisDao<SdanChat, Integer>{

	@Override
	public String getMybatisMapperNamesapce() {
		return "com.renrenxian.manage.persistence.SdanChatMapper";
	}
	
	
	/**
	 * 分页获取甩单聊天内容列表
	 * @param sid 登陆用户uid
	 * @param reid 收发件人
	 * @param pageNo 分页页码
	 * @param pageSize 分页大小
	 * @return
	 */
	public Page<SdanChat> list(Integer sid,Integer reid,int pageNo, int pageSize){
		Map<String,Object> map = new HashMap<String,Object>();
        map.put("sid", sid);
        map.put("reid", reid);
        Page<SdanChat> page = new Page<SdanChat>(pageNo,pageSize);
        return this.selectPage(page, this.getMybatisMapperNamesapce()+".findlist", map);
	}

}
