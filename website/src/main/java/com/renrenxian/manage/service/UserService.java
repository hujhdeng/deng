package com.renrenxian.manage.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.renrenxian.common.util.Page;
import com.renrenxian.manage.model.User;
import com.renrenxian.manage.service.base.BaseServiceMybatis;

public interface UserService extends BaseServiceMybatis<User,Integer> {

	public User getByPhone(String phone);
	
	public Map<String,Object> login(String phone, String password, String lng, String lat);

	public Map<String, Object> updatePwd(String phone, String password,
			String yzm, String lng, String lat);

	public Map<String, Object> getUserInfo(int id, String lng, String lat);

	public Map<String, Object> updateKV(int id, String key, Object value, String lng, String lat);

	public Map<String, Object> upload(int id, MultipartFile file, String path);

	public Map<String, Object> updateReplenish(User user);

	public Map<String, Object> addFollow(int id, String followphone);

	public Map<String, Object> deleteFollow(int id, String followphone);
	
	/**
	 * 根据用户id集合分页获取对应的用户列表
	 * @author xulihua
	 * @param uids 用户id集合
	 * @param pageNo 分页页码
	 * @param pageSize 分页大小
	 * @return Page<User>
	 */
	public Page<User> findUsersByUserIds(Object[] uids,int pageNo, int pageSize);
	
}
