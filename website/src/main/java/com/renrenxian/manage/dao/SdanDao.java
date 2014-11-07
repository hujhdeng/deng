package com.renrenxian.manage.dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.renrenxian.common.util.Page;
import com.renrenxian.manage.model.Party;
import com.renrenxian.manage.model.Sdan;
import com.renrenxian.manage.mybatis.BaseMybatisDao;

@Repository("sdanDao")
public class SdanDao extends BaseMybatisDao<Sdan, Integer> {

	@Override
	public String getMybatisMapperNamesapce() {
		return "com.renrenxian.manage.persistence.SdanMapper";
	}
	
	
	/**
	 * 甩单列表含我发起和参与的甩单接口
	 * @author xulihua
	 * @param uid 登陆用户uid
	 * @param type 甩单类型 可以为空
	 * @param area 所属区域 可以为空
	 * @param state 甩单状态 可以为空
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Page<Sdan> list(Integer uid,String type,String area,String state,int pageNo, int pageSize){
		Map<String,Object> map = new HashMap<String,Object>();
        map.put("uid", uid);
        map.put("type", type);
        map.put("area", area);
        map.put("state", state);
        Page<Sdan> page = new Page<Sdan>(pageNo,pageSize);
        return this.selectPage(page, this.getMybatisMapperNamesapce()+".findlist", map);
	}

}
