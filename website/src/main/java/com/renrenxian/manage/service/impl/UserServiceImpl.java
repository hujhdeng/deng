package com.renrenxian.manage.service.impl;

import java.io.File;
import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.renrenxian.manage.dao.UserDao;
import com.renrenxian.manage.model.User;
import com.renrenxian.manage.mybatis.EntityDao;
import com.renrenxian.manage.service.UserService;
import com.renrenxian.manage.service.YzmService;
import com.renrenxian.manage.service.base.impl.BaseServiceMybatisImpl;
import com.renrenxian.util.result.MapResult;


@Service("userService")
@Transactional
public class UserServiceImpl extends BaseServiceMybatisImpl<User,Integer> implements UserService{

	private static Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

	@Resource
	private UserDao userDao;
	
	@Resource
	private YzmService yzmService;
	
	@Override
	protected EntityDao<User, Integer> getEntityDao() {
		return userDao;
	}

	@Override
	public User getByPhone(String phone){
		return userDao.getByPhone(phone);
	}
	
	public Map<String,Object> login(String phone, String password, String lng, String lat){
		User user = this.getByPhone(phone);
		if(null == user) {
			return MapResult.initMap(2007, "手机号码不存在");
		}
		
		if(!user.getuPwd().equals(password)) {
			return MapResult.initMap(10001, "密码错误！");
		}
		
		user.setLat(lat);
		user.setLng(lng);
		user.setLogtime(new Date());
		this.userDao.update(user);
		Map<String, Object> map = MapResult.initMap();
		map.put("data", user);
		return map;
	}

	// 更新密码
	@Override
	public Map<String, Object> updatePwd(String phone, String password,
			String yzm, String lng, String lat) {
		
		boolean b = yzmService.checkYzm(phone, yzm);
		if(!b) {
			return MapResult.initMap(10001, "验证码错误！");
		}
		User user = userDao.getByPhone(phone);
		if(null == user) {
			return MapResult.initMap(10001, "电话号码不存在！");
		}
		user.setuPwd(password);
		if(StringUtils.isEmpty(lng)){
			user.setLng(lng);
		}
		if(StringUtils.isEmpty(lat)){
			user.setLat(lat);
		}
		Map<String, Object> map = MapResult.initMap();
		return map;
	}

	@Override
	public Map<String, Object> getUserInfo(int id, String lng, String lat) {
		
		User user = userDao.getById(id);
		if(user != null) {
			if(!StringUtils.isEmpty(lng)) {
				user.setLng(lng);
			}
			if(!StringUtils.isEmpty(lat)) {
				user.setLat(lat);
			}
			userDao.update(user);
			
			Map<String, Object> map = MapResult.initMap();
			map.put("data", user);
			return map;
		}else{
			return MapResult.initMap(1001, "用户不存在");
		}
		
	}

	@Override
	public Map<String, Object> updateKV(int id, String key, Object value, String lng, String lat) {
		try{
			userDao.updateKV(id, key, value, lng, lat);
			return MapResult.initMap();
		}catch(Exception ex) {
			logger.error("", ex);
			return MapResult.initMap(1001, "修改信息错误");
		}
	}
	
	@Override
	public Map<String, Object> upload(int id, MultipartFile file, String path){
		User user = userDao.getById(id);
		if(user == null) {
			return MapResult.initMap(10001, "用户错误！");
		}
		try{
			String ext = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			String filename = System.currentTimeMillis() + ext;
			file.transferTo(new File(path, filename));
			// 保存
			user.setAvatar(filename);
			this.userDao.update(user);
			
			Map<String, Object> map = MapResult.initMap(1000, "成功");
			map.put("avatar", filename);
			return map;
			
		}catch(Exception ex){
			logger.error("", ex);
			return MapResult.initMap(1001, "保存图片失败");
		}
	}
	
	// 补充资料
	public Map<String, Object> updateReplenish(User user){
		if(user == null || user.getId() == null || user.getId() == 0) {
			return MapResult.initMap(1001, "用户错误");
		}
		// 从数据库里获取信息
		User tmp = userDao.getById(user.getId());
		// BeanUtils.copyProperties(source, target);
		if(tmp == null) {
			return MapResult.initMap(1001, "用户错误");
		}
		
		if(StringUtils.isNotEmpty(user.getuName())) {
			tmp.setuName(user.getuName());
		}
		
		if(StringUtils.isNotEmpty(user.getCompany())) {
			tmp.setCompany(user.getCompany());
		}
		if(StringUtils.isNotEmpty(user.getAddress())) {
			tmp.setAddress(user.getAddress());
		}
		if(StringUtils.isNotEmpty(user.getSex())) {
			tmp.setSex(user.getSex());
		}
		if(StringUtils.isNotEmpty(user.getOld())) {
			tmp.setOld(user.getOld());
		}
		if(StringUtils.isNotEmpty(user.getAlert())) {
			tmp.setAlert(user.getArea());
		}
		if(StringUtils.isNotEmpty(user.getKeyword())) {
			tmp.setKeyword(user.getKeyword());
		}
		if(StringUtils.isNotEmpty(user.getIndusty())) {
			tmp.setIndusty(user.getIndusty());
		}
		if(StringUtils.isNotEmpty(user.getBusiness())) {
			tmp.setBusiness(user.getBusiness());
		}
		if(StringUtils.isNotEmpty(user.getYear())) {
			tmp.setYear(user.getYear());
		}
		if(StringUtils.isNotEmpty(user.getCont())) {
			tmp.setCont(user.getCont());
		}
		// alert
		if(StringUtils.isNotEmpty(user.getLocat())) {
			tmp.setLocat(user.getLocat());
		}
		// alert2
		//  tmp
		userDao.update(tmp);
		return MapResult.initMap();
	}
	
	
	public Map<String, Object> addFollow(int id, String followphone){
		
		
		return null;
	}
}
