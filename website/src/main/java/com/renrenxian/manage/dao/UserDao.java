package com.renrenxian.manage.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.renrenxian.common.util.Page;
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
	
	// getByPhones
		public List<User> getByPhones(List<String> list) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("phones", StringUtils.join(list, ","));
			String phones = StringUtils.join(list, ",");
			return this.getSqlSession().selectList(this.getMybatisMapperNamesapce() + ".getByPhones", map);
		}
		
		// 
		public Page<User> getByPhonesLike(String phone, int pageNo, int pageSize) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("phone", "%"+phone+"%");
			Page<User> page = new Page<User>(pageNo, pageSize);
			return this.selectPage(page, this.getMybatisMapperNamesapce() + ".getByPhonesLike", map);
		}
		
		
	/**
	 * 根据用户id集合分页获取对应的用户列表
	 * @param uids 用户id集合
	 * @param pageNo 分页页码
	 * @param pageSize 分页大小
	 * @return Page<User>
	 */
	public Page<User> findUsersByUserIds(Object[] uids,int pageNo, int pageSize){
		Map<String,Object> map = new HashMap<String,Object>();
        map.put("userIds", uids);
        Page<User> page = new Page<User>(pageNo,pageSize);
        return this.selectPage(page, this.getMybatisMapperNamesapce()+".findUsersByUserIds", map);
	}

	
	// findPageByPhones
		public Page<User> findPageByPhones(String[] phones, int pageNo, int pageSize){
			Map<String,Object> map = new HashMap<String,Object>();
	        map.put("phones", phones);
	        Page<User> page = new Page<User>(pageNo,pageSize);
	        return this.selectPage(page, this.getMybatisMapperNamesapce()+".findPageByPhones", map);
		}
		
		// findPageByNear
		public Page<User> findPageByNear(int uid, String minlng, String maxlng,
				String minlat, String maxlat, String starttime, int pageno, int pagesize){
			Map<String,Object> map = new HashMap<String,Object>();
	        map.put("uid", uid);
	        map.put("minlng", minlng);
	        map.put("maxlng", maxlng);
	        map.put("minlat", minlat);
	        map.put("maxlat", maxlat);
	        map.put("starttime", starttime);
	        Page<User> page = new Page<User>(pageno,pagesize);
	        return this.selectPage(page, this.getMybatisMapperNamesapce()+".findPageByNear", map);
		}
		
		
		public Integer findByIdCount (int uid) {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("uid", uid);
			Integer i = (Integer)this.getSqlSession().selectOne(this.getMybatisMapperNamesapce()+".findByIdCount", map);
			return i;
		}
		
		
}
