package com.renrenxian.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

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

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.renrenxian.common.util.DateUtil;
import com.renrenxian.common.util.Page;
import com.renrenxian.common.util.StringUtil;
import com.renrenxian.common.util.ValidUtils;
import com.renrenxian.manage.model.User;
import com.renrenxian.manage.mybatis.SortWrapper;
import com.renrenxian.manage.mybatis.WhereWrapper;
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
	
	// 上传头像文件接口
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
		
		return map;
	}
	
	// 取消关注接口
	@RequestMapping(value = "/deleteFollow")
	@ResponseBody
	public Map<String, Object> deleteFollow(
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
		
		Map<String, Object> map = userService.deleteFollow(id, followphone);
		
		return map;
	}
	
	
	// 我关注的人接口
		@RequestMapping(value = "/ifollowlist")
		@ResponseBody
		public Map<String, Object> ifollowlist(HttpServletRequest request,
				@RequestParam(value = "uid", required = true) String uid,
				@RequestParam(value = "pageno", required = false) Integer pageno,
				@RequestParam(value = "pagesize", required = false) Integer pagesize) {
			logger.info("ifollowlist  uid:{} ", uid);
			int id = StringUtil.parseInt(uid, 0);
			if (id == 0) {
				return MapResult.initMap(1001, "用户id错误！");
			}

			if (null == pageno || pageno == 0) {
				pageno = 1;
			}

			if (null == pagesize || pagesize == 0) {
				pagesize = 100;
			}
			try {
				Page<User> page = userService.follows(id, pageno, pagesize);
				if (page == null) {
					return MapResult.initMap(1001, "用户错误");
				} else {
					Map<String, Object> map = MapResult.initMap();
					map.put("data", page);
					return map;
				}
			} catch (Exception ex) {
				logger.error("", ex);
				return MapResult.failMap();
			}
		}

		// 个人信息页面——关注我的人接口
		// 我关注的人接口
		@RequestMapping(value = "/followmelist")
		@ResponseBody
		public Map<String, Object> followmelist(HttpServletRequest request,
				@RequestParam(value = "uid", required = true) String uid,
				@RequestParam(value = "pageno", required = false) Integer pageno,
				@RequestParam(value = "pagesize", required = false) Integer pagesize) {
			logger.info("followmelist  uid:{} ", uid);
			int id = StringUtil.parseInt(uid, 0);
			if (id == 0) {
				return MapResult.initMap(1001, "用户id错误！");
			}

			if (null == pageno || pageno == 0) {
				pageno = 1;
			}

			if (null == pagesize || pagesize == 0) {
				pagesize = 100;
			}
			
			try {
				Page<User> page = userService.followme(id, pageno, pagesize);
				if (page == null) {
					return MapResult.initMap(1001, "用户错误");
				} else {
					Map<String, Object> map = MapResult.initMap();
					map.put("data", page);
					return map;
				}
			} catch (Exception ex) {
				logger.error("", ex);
				return MapResult.failMap();
			}
		}

		// 相互关注的人接口
		@RequestMapping(value = "/followbothlist")
		@ResponseBody
		public Map<String, Object> followbothlist(HttpServletRequest request,
				@RequestParam(value = "uid", required = true) String uid) {
			logger.info("followbothlist  uid:{}, pageNo:{}, pagesize:{}",
					new Object[] { uid });
			int id = StringUtil.parseInt(uid, 0);
			if (id == 0) {
				return MapResult.initMap(1001, "用户id错误！");
			}

			try {
				List<User> list = userService.followBoth(id);
				if (list == null) {
					return MapResult.initMap(1001, "没有关注人");
				} else {
					if (list.size() == 0) { // 没有相互关注的人
						return MapResult.initMap(1000, "没有相互关注的人");
					} else {
						Map<String, Object> map = MapResult.initMap();
						JSONArray array = new JSONArray();
						JSONObject object = null;
						for (User user : list) {
							object = new JSONObject();
							object.put("uid", user.getId());
							object.put("avatar", user.getAvatar());
							array.add(object);
						}
						map.put("data", array);
						return map;
					}
				}
			} catch (Exception ex) {
				logger.error("", ex);
				return MapResult.failMap();
			}
		}

		// 从业者列表及查询
		@RequestMapping(value = "/search")
		@ResponseBody
		public Map<String, Object> search(
				HttpServletRequest request,
				@RequestParam(value = "uid", required = true) String uid,
				@RequestParam(value = "phone", required = false) String phone, // 手机
				@RequestParam(value = "uName", required = false) String uName, // 用户名
				@RequestParam(value = "industy", required = false) String industy, // 行业
				@RequestParam(value = "area", required = false) String area, // 区域
				@RequestParam(value = "business", required = false) String business, // 业务种类
				@RequestParam(value = "pageno", required = false) Integer pageno,
				@RequestParam(value = "pagesize", required = false) Integer pagesize
		) {
			
			logger.info("phone:{}, uName:{}, indstry:{}, area:{}, business:{}, pageno:{}, pagesize:{}", new Object[]{
					phone, uName, industy, area, business, pageno, pagesize
			});
			
			int id = StringUtil.parseInt(uid, 0);
			if (id == 0) {
				return MapResult.initMap(1001, "用户id错误！");
			}
			
			Map<String, String> tmap = new HashMap<String, String>();
			
			if(StringUtils.isNotEmpty(phone)) {
				tmap.put("phone", "%" + phone + "%");
			}
			if(StringUtils.isNotEmpty(uName)) {
				tmap.put("u_name", "%" + uName + "%");
			}
			if(StringUtils.isNotEmpty(industy)) {
				tmap.put("industy", "%" + industy + "%");
			}
			if(StringUtils.isNotEmpty(area)) {
				tmap.put("area", "%" + area + "%");
			}
			if(StringUtils.isNotEmpty(business)) {
				tmap.put("business", "%" + business + "%");
			}
			
			if (null == pageno || pageno == 0) {
				pageno = 1;
			}

			if (null == pagesize || pagesize == 0) {
				pagesize = 100;
			}
			
			try{
				List<WhereWrapper> whereList = new ArrayList<WhereWrapper>();
				Set<Entry<String, String>> set = tmap.entrySet();
				WhereWrapper where = null;
				for(Entry<String, String> e : set) {
					where = new WhereWrapper(e.getKey(), WhereWrapper.SYMBOL_LIKE, e.getValue());
					whereList.add(where);
				}
				// order by kpno desc
				
				List<SortWrapper> sortList = new ArrayList<SortWrapper>();
				SortWrapper sort = new SortWrapper("kpno", SortWrapper.DESC);
				sortList.add(sort);
				// 
				Map<String, Object> map = userService.search(id, whereList, sortList, pageno, pagesize);
				return map;
			}catch(Exception ex) {
				logger.error("", ex);
				return MapResult.failMap();
			}
			
		}
		
		// 我可能认识的人
		@RequestMapping(value = "/friends")
		@ResponseBody
		public Map<String, Object> friends(
				HttpServletRequest request,
				@RequestParam(value = "uid", required = true) String uid,
				@RequestParam(value = "phones", required = false) String phones,
				@RequestParam(value = "pageno", required = false) Integer pageno,
				@RequestParam(value = "pagesize", required = false) Integer pagesize
		) {
			logger.info("uid:{}, phones:{}, pageno:{}, pagesize:{}", new Object[]{
					uid, phones,  pageno, pagesize});
			
			int id = StringUtil.parseInt(uid, 0);
			if (id == 0) {
				return MapResult.initMap(1001, "用户id错误！");
			}
			
			if(StringUtils.isEmpty(phones)) {
				return MapResult.initMap(1001, "电话为空！");
			}
			
			if (null == pageno || pageno == 0) {
				pageno = 1;
			}

			if (null == pagesize || pagesize == 0) {
				pagesize = 100;
			}
			
			try{
				Map<String, Object> map = userService.findByPhones(id, phones, pageno, pagesize);
				return map;
			}catch(Exception ex) {
				logger.error("", ex);
				return MapResult.failMap();
			}
		}

		
		// 附近的人
		/**
		小经度 minlng
		大经度 malling
		小维度 minlat
		大维度 maxlat
		page
		pagesize (默认20)
		**/
		@RequestMapping(value = "/near")
		@ResponseBody
		public Map<String, Object> near(
				HttpServletRequest request,
				@RequestParam(value = "uid", required = true) String uid,
				@RequestParam(value = "lng", required = true) String lng,
				@RequestParam(value = "lat", required = true) String lat,
				@RequestParam(value = "pageno", required = false) Integer pageno,
				@RequestParam(value = "pagesize", required = false) Integer pagesize
		) {
			logger.info("uid:{}, lng:{}, lat:{}, pageno:{}, pagesize:{}", new Object[]{
					uid, lng, lat, pageno, pagesize});
			
			int id = StringUtil.parseInt(uid, 0);
			if (id == 0) {
				return MapResult.initMap(1001, "用户id错误！");
			}
			
			double lngd = StringUtil.parseDouble(lng);
			double latd = StringUtil.parseDouble(lat);
			
			double minlngd = lngd - 0.6;
			double maxlngd = lngd + 0.6;
			double minlatd = latd - 0.6;
			double maxlatd = latd + 0.6;
			
			if (null == pageno || pageno == 0) {
				pageno = 1;
			}

			if (null == pagesize || pagesize == 0) {
				pagesize = 100;
			}
			
			long time = System.currentTimeMillis() - 20 * 60 * 1000;
			String starttime = DateUtil.date2Str(new Date(time));
			
			try{
				Map<String, Object> map = userService.near(id, minlngd+"", maxlngd + "", minlatd + "", maxlatd + "", starttime, pageno, pagesize);
				return map;
			}catch(Exception ex) {
				logger.error("", ex);
				return MapResult.failMap();
			}
		}
		
		
}
