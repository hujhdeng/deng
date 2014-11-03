package com.renrenxian.controller;

import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.renrenxian.common.util.StringUtil;
import com.renrenxian.common.util.ValidUtils;
import com.renrenxian.manage.model.User;
import com.renrenxian.manage.service.UserService;
import com.renrenxian.manage.service.YzmService;
import com.renrenxian.util.result.MapResult;

@Controller
@RequestMapping("/user")
public class UserController {

	public static String[] keys = new String[]{"uName","company", "kpno", "address", "sex", "old", "area", "keyword", "industy",
		"business", "year", "cont", "alert", "locat", "alert2"};
	
	private static Logger logger = LoggerFactory
			.getLogger(UserController.class);

	@Resource
	private UserService userService;
	@Resource
	private YzmService yzmService;

	@RequestMapping(value = "/reg")
	@ResponseBody
	public Map<String, Object> reg(HttpServletRequest httpServletRequest,
			@RequestParam(value = "phone", required = true) String phone,
			@RequestParam(value = "password", required = true) String password,
			@RequestParam(value = "yzm", required = true) String yzm,
			@RequestParam(value = "lng", required = true) String lng,
			@RequestParam(value = "lat", required = true) String lat) {
		try {
			// 检查参数
			if (StringUtils.isEmpty(phone)) {
				return MapResult.initMap(2001, "手机号不能为空");
			}
			if (StringUtils.isEmpty(password)) {
				return MapResult.initMap(2002, "密码不能为空");
			}
			if (StringUtils.isEmpty(yzm)) {
				return MapResult.initMap(2003, "请填写验证码");
			}
			if (!ValidUtils.validMobile(phone)) {
				return MapResult.initMap(2004, "请正确填写手机号");
			}

			// 检查手机是否存在
			User tmp = userService.getByPhone(phone);
			if (null != tmp) {
				return MapResult.initMap(2005, "手机号码已经存在，请直接登录");
			}

			// 验证码
			if (!yzmService.checkYzm(phone, yzm)) {
				return MapResult.initMap(2006, "验证码不正确");
			}

			User user = new User();
			user.setPhone(phone);
			user.setuPwd(password);
			user.setLat(lat);
			user.setLng(lng);
			user.setKpno(60);
			user.setDanCount("0");
			user.setRegtime(new Date());
			user.setFollowbothcount("0");
			user.setFollowcount("0");
			user.setFollowmecount("0");
			user.setLocat("1"); // 位置信息设置（1默认打开，0关闭位置信息）
			userService.save(user);

			Map<String, Object> map = MapResult.initMap();
			map.put("uid", user.getId());
			return map;
		} catch (Exception ex) {
			logger.error("", ex);
			return MapResult.failMap();
		}
	}

	@RequestMapping(value = "/login")
	@ResponseBody
	public Map<String, Object> login(HttpServletRequest httpServletRequest,
			@RequestParam(value = "phone", required = true) String phone,
			@RequestParam(value = "password", required = true) String password,
			@RequestParam(value = "lng", required = true) String lng,
			@RequestParam(value = "lat", required = true) String lat) {
		logger.info("phone:{}, password:{}, lng:{},lat:{}", new String[] {
				phone, password, lng, lat });
		try {
			// 检查
			if (StringUtils.isEmpty(phone)) {
				return MapResult.initMap(2001, "手机号不能为空");
			}
			if (StringUtils.isEmpty(password)) {
				return MapResult.initMap(2002, "密码不能为空");
			}

			Map<String, Object> map = userService.login(phone, password, lng,
					lat);
			return map;
		} catch (Exception ex) {
			logger.error("", ex);
			return MapResult.failMap();
		}
	}

	// 忘记密码接口
	@RequestMapping(value = "/updatepwd")
	@ResponseBody
	public Map<String, Object> updatepwd(HttpServletRequest httpServletRequest,
			@RequestParam(value = "phone", required = true) String phone,
			@RequestParam(value = "password", required = true) String password,
			@RequestParam(value = "yzm", required = true) String yzm,
			@RequestParam(value = "lng", required = true) String lng,
			@RequestParam(value = "lat", required = true) String lat) {
		logger.info("phone:{}, password:{},yzm:{}, lng:{},lat:{}", new String[] {
				phone, password, yzm, lng, lat });
		try {
			// TODO 密码长度 交互安全问题
			// 检查参数
			if (StringUtils.isEmpty(phone)) {
				return MapResult.initMap(2001, "手机号不能为空");
			}
			if (StringUtils.isEmpty(password)) {
				return MapResult.initMap(2002, "密码不能为空");
			}
			if (StringUtils.isEmpty(yzm)) {
				return MapResult.initMap(2003, "请填写验证码");
			}
			if (!ValidUtils.validMobile(phone)) {
				return MapResult.initMap(2004, "请正确填写手机号");
			}
			
			Map<String, Object> map = userService.updatePwd(phone,password,yzm,lng,lat);
			return map;

		} catch (Exception ex) {
			logger.error("", ex);
			return MapResult.failMap();
		}
	}
	
	// 用户信息
	@RequestMapping(value = "/userinfo")
	@ResponseBody
	public Map<String, Object> userinfo(HttpServletRequest httpServletRequest,
			@RequestParam(value = "uid", required = true) String uid,
			@RequestParam(value = "lng", required = true) String lng,
			@RequestParam(value = "lat", required = true) String lat) {
		logger.info("uid:{}, lng:{},lat:{}", new String[] {
				uid, lng, lat });
		try {
			int id = StringUtil.parseInt(uid, 0);
			if(id == 0) {
				return MapResult.initMap(1001, "用户id错误！");
			}
			Map<String, Object> map = userService.getUserInfo(id,lng,lat);
			return map;
		} catch (Exception ex) {
			logger.error("", ex);
			return MapResult.failMap();
		}
	}

	// 修改用户信息
	@RequestMapping(value = "/updateUser")
	@ResponseBody
	public Map<String, Object> updateUser(
			HttpServletRequest httpServletRequest,
			@RequestParam(value = "uid", required = true) String uid,
			@RequestParam(value = "key", required = true) String key,
			@RequestParam(value = "value", required = true) String value,
			@RequestParam(value = "lng", required = true) String lng,
			@RequestParam(value = "lat", required = true) String lat) {
		logger.info("uid:{},key:{}, value:{}, lng:{},lat:{}", new String[] {
				uid, key, value, lng, lat });
		try {
			int id = StringUtil.parseInt(uid, 0);
			if(id == 0) {
				return MapResult.initMap(1001, "用户id错误！");
			}
			
			if(StringUtils.isEmpty(key) || StringUtils.isEmpty(value)) {
				return MapResult.initMap(1001, "参数错误");
			}
			
			for(String tmp : keys){
				if(tmp.equals(key)){
					break;
				}else{
					return MapResult.initMap(1001, "参数错误");
				}
			}
			
			Map<String, Object> map = userService.updateKV(id, key, value, lng, lat);
			return map;
		} catch (Exception ex) {
			logger.error("", ex);
			return MapResult.failMap();
		}
	}
	
	@RequestMapping(value = "/upload",method = RequestMethod.POST)
	@ResponseBody
    public Map<String, Object> upload(
    		HttpServletRequest request,
    		@RequestParam(value = "uid", required = true) String uid,
    		@RequestParam(value = "file", required = false) MultipartFile file
    		) {  
		logger.info("upload file uid:{}", uid);
		int id = StringUtil.parseInt(uid, 0);
		if(id == 0) {
			return MapResult.initMap(1001, "用户id错误！");
		}
		
        String path = request.getSession().getServletContext().getRealPath("file");  
        String fileName = file.getOriginalFilename();  
        String ext = fileName.substring(fileName.lastIndexOf("."));
        
        if(".jpg".equalsIgnoreCase(ext) || ".png".equalsIgnoreCase(ext) || ".gif".equalsIgnoreCase(ext) || ".jpeg".equalsIgnoreCase(ext)){
        	
        } else {
        	return MapResult.initMap(1001, "请选择图片！");
        }
        
        Map<String, Object> map = userService.upload(id, file, path);
        return map;
    }  
	
	/**
	@RequestMapping(value = "/upload",method = RequestMethod.GET)
	public String upload(){
		return "upload";
	}
	**/
	
	//补充信息
	@RequestMapping(value = "/replenish")
	@ResponseBody
	public Map<String, Object> replenish(
			HttpServletRequest request,
			User user
			) {
		
		// 参数检查
		if(user == null) {
			return MapResult.initMap(1001, "参数错误！");
		}
		if(user.getId() == null || user.getId() == 0) {
			return MapResult.initMap(1001, "用户错误");
		}
		
		Map<String, Object> map = userService.updateReplenish(user);
		return map;
	}
	
	
	// 添加关注
	@RequestMapping(value = "/addFollow")
	@ResponseBody
	public Map<String, Object> addFollow(
			HttpServletRequest request,
			@RequestParam(value = "uid", required = true) String uid,
			@RequestParam(value = "followphone", required = true) String followphone
			) {
		
		if (!ValidUtils.validMobile(followphone)) {
			return MapResult.initMap(2004, "请正确填写手机号");
		}
		logger.info("addFollow  uid:{}, phone:{}", uid, followphone);
		int id = StringUtil.parseInt(uid, 0);
		if(id == 0) {
			return MapResult.initMap(1001, "用户uid错误！");
		}
		
		Map<String, Object> map = userService.addFollow(id, followphone);
		
		return null;
	}
	
}
