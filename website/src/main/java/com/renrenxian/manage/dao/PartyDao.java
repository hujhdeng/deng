package com.renrenxian.manage.dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.renrenxian.common.util.Page;
import com.renrenxian.manage.model.Party;
import com.renrenxian.manage.mybatis.BaseMybatisDao;

@Repository("partyDao")
public class PartyDao extends BaseMybatisDao<Party, Integer>{

	@Override
	public String getMybatisMapperNamesapce() {
		return "com.renrenxian.manage.persistence.PartyMapper";
	}
	
	/**
	 * 聚会列表含我发起和参与的聚会接口
	 * @param uid 登陆用户uid
	 * @param myjoinid 参与聚会的用户uid
	 * @param type 聚会类型 可以为空
	 * @param area 所属区域 可以为空
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Page<Party> list(Integer uid,Integer myjoinid,String type,String city,int pageNo, int pageSize){
		Map<String,Object> map = new HashMap<String,Object>();
        map.put("uid", uid);
        map.put("myjoinid", myjoinid);
        map.put("type", type);
        map.put("city", city);
        Page<Party> page = new Page<Party>(pageNo,pageSize);
        return this.selectPage(page, this.getMybatisMapperNamesapce()+".findlist", map);
	}

	
}
