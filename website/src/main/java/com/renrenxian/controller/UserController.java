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
import org.codehaus.jackson.map.util.JSONPObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.renrenxian.common.util.Page;
import com.renrenxian.common.util.StringUtil;
import com.renrenxian.common.util.ValidUtils;
import com.renrenxian.manage.model.Info;
import com.renrenxian.manage.model.User;
import com.renrenxian.manage.mybatis.SortWrapper;
import com.renrenxian.manage.mybatis.WhereWrapper;
import com.renrenxian.manage.service.InfoService;
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

	@Resource
	private InfoService infoService;
	
	@RequestMapping(value = "/reg")
	@ResponseBody
	public JSONPObject reg(HttpServletRequest req,
			@RequestParam(value = "phone", required = true) String phone,
			@RequestParam(value = "password", required = true) String password,
			@RequestParam(value = "yzm", required = true) String yzm,
			@RequestParam(value = "lng", required = false) String lng,
			@RequestParam(value = "lat", required = false) String lat) {
		String callback = req.getParameter("callback");
		try {
			Map<String,Object> map;
			// 检查参数
			if (StringUtils.isEmpty(phone)) {
				map = MapResult.initMap(2001, "手机号不能为空");
			}else if (StringUtils.isEmpty(password)) {
				map = MapResult.initMap(2002, "密码不能为空");
			}else if (StringUtils.isEmpty(yzm)) {
				map = MapResult.initMap(2003, "请填写验证码");
			}else if (!ValidUtils.validMobile(phone)) {
				map = MapResult.initMap(2004, "请正确填写手机号");
			}else{
				// 检查手机是否存在
				User tmp = userService.getByPhone(phone);
				if (null != tmp) {
					map = MapResult.initMap(2005, "手机号码已经存在，请直接登录");
				}else if (!yzmService.checkYzm(phone, yzm)) {// 验证码
					map = MapResult.initMap(2006, "验证码不正确");
				}else{
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

					map = MapResult.initMap();
					map.put("uid", user.getId());
					
				}
			}

			return new JSONPObject(callback,map);
			
		} catch (Exception ex) {
			logger.error("", ex);
			return new JSONPObject(callback,MapResult.failMap());
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
	public JSONPObject updatepwd(HttpServletRequest req,
			@RequestParam(value = "phone", required = true) String phone,
			@RequestParam(value = "password", required = true) String password,
			@RequestParam(value = "yzm", required = true) String yzm,
			@RequestParam(value = "lng", required = false) String lng,
			@RequestParam(value = "lat", required = false) String lat) {
		logger.info("phone:{}, password:{},yzm:{}, lng:{},lat:{}", new String[] {
				phone, password, yzm, lng, lat });
		try {
			// TODO 密码长度 交互安全问题
			// 检查参数
			Map<String,Object> map;
			if (StringUtils.isEmpty(phone)) {
				map =  MapResult.initMap(2001, "手机号不能为空");
			}
			if (StringUtils.isEmpty(password)) {
				map = MapResult.initMap(2002, "密码不能为空");
			}
			if (StringUtils.isEmpty(yzm)) {
				map = MapResult.initMap(2003, "请填写验证码");
			}
			if (!ValidUtils.validMobile(phone)) {
				map = MapResult.initMap(2004, "请正确填写手机号");
			}
			
			map = userService.updatePwd(phone,password,yzm,lng,lat);
			
			return new JSONPObject(req.getParameter("callback"),map);

		} catch (Exception ex) {
			logger.error("", ex);
			return new JSONPObject(req.getParameter("callback"),MapResult.failMap());
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
			logger.info("return map:{}", map);
			return map;
		} catch (Exception ex) {
			logger.error("", ex);
			return MapResult.failMap();
		}
	}

	// 用户信息
		@RequestMapping(value = "/userinfoByMy")
		@ResponseBody
		public Map<String, Object> userinfoByMy(HttpServletRequest httpServletRequest,
				@RequestParam(value = "uid", required = true) String uid,
				@RequestParam(value = "myid", required = true) String myid
				) {
			
			logger.info("uid:{}, myid:{}", new String[] {
					uid, myid });
			try {
				int id = StringUtil.parseInt(uid, 0);
				if(id == 0) {
					return MapResult.initMap(1001, "用户id错误！");
				}
				int myuid = StringUtil.parseInt(myid, 0);
				if(id == 0) {
					return MapResult.initMap(1001, "用户myid错误！");
				}
				
				Map<String, Object> map = userService.getUserInfoByMy(myuid, id);
				logger.info("return map:{}", map);
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
	
	
	@RequestMapping(value = "/upload",method = RequestMethod.GET)
	public String upload(){
		return "upload";
	}
	
	
	//补充信息
	@RequestMapping(value = "/replenish")
	@ResponseBody
	public Map<String, Object> replenish(
			HttpServletRequest request,
			User user
			) {
		
		logger.info("user: {}" , user);
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
		logger.info("returm map:{}", map);
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
		logger.info("returm map:{}", map);
		return map;
	}
	
	
	// 我关注的人接口
		@RequestMapping(value = "/ifollowlist")
		@ResponseBody
		public Map<String, Object> ifollowlist(HttpServletRequest request,
				@RequestParam(value = "uid", required = true) String uid,
				@RequestParam(value = "page", required = false) Integer page,
				@RequestParam(value = "pagesize", required = false) Integer pagesize) {
			logger.info("ifollowlist  uid:{} ", uid);
			int id = StringUtil.parseInt(uid, 0);
			if (id == 0) {
				return MapResult.initMap(1001, "用户id错误！");
			}

			if (null == page || page == 0) {
				page = 1;
			}

			if (null == pagesize || pagesize == 0) {
				pagesize = 100;
			}
			try {
				Page<User> page1 = userService.follows(id, page, pagesize);
				if (page1 == null) {
					return MapResult.initMap(1001, "用户错误");
				} else {
					Map<String, Object> map = MapResult.initMap();
					map.put("data", page1.getResult());
					logger.info("return map:{}", map);
					return map;
				}
			} catch (Exception ex) {
				logger.error("", ex);
				return MapResult.failMap();
			}
		}

		// 个人信息页面——关注我的人接口
		@RequestMapping(value = "/followmelist")
		@ResponseBody
		public Map<String, Object> followmelist(HttpServletRequest request,
				@RequestParam(value = "uid", required = true) String uid,
				@RequestParam(value = "page", required = false) Integer page,
				@RequestParam(value = "pagesize", required = false) Integer pagesize) {
			logger.info("followmelist  uid:{} ", uid);
			int id = StringUtil.parseInt(uid, 0);
			if (id == 0) {
				return MapResult.initMap(1001, "用户id错误！");
			}

			if (null == page || page == 0) {
				page = 1;
			}

			if (null == pagesize || pagesize == 0) {
				pagesize = 100;
			}
			
			try {
				Page<User> page1 = userService.followme(id, page, pagesize);
				if (page1 == null) {
					return MapResult.initMap(1001, "用户错误");
				} else {
					Map<String, Object> map = MapResult.initMap();
					map.put("data", page1.getResult());
					logger.info("return map:{}", map);
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
			logger.info("followbothlist  uid:{}",
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
						/**
						JSONArray array = new JSONArray();
						JSONObject object = null;
						for (User user : list) {
							object = new JSONObject();
							object.put("uid", user.getId());
							object.put("avatar", user.getAvatar());
							array.add(object);
						}
						map.put("data", array);
						**/
						map.put("data", list);
						logger.info("return map:{}", map);
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
				@RequestParam(value = "page", required = false) Integer page,
				@RequestParam(value = "pagesize", required = false) Integer pagesize
		) {
			
			logger.info("phone:{}, uName:{}, indstry:{}, area:{}, business:{}, page:{}, pagesize:{}", new Object[]{
					phone, uName, industy, area, business, page, pagesize
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
			
			if (null == page || page == 0) {
				page = 1;
			}

			if (null == pagesize || pagesize == 0) {
				pagesize = 20;
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
				Map<String, Object> map = userService.search(id, whereList, sortList, page, pagesize);
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
				@RequestParam(value = "phonelist", required = false) String phonelist,
				@RequestParam(value = "page", required = false) Integer page,
				@RequestParam(value = "pagesize", required = false) Integer pagesize
		) {
			logger.info("uid:{}, phonelist:{}, page:{}, pagesize:{}", new Object[]{
					uid, phonelist,  page, pagesize});
			
			int id = StringUtil.parseInt(uid, 0);
			if (id == 0) {
				return MapResult.initMap(1001, "用户id错误！");
			}
			
			if(StringUtils.isEmpty(phonelist)) {
				return MapResult.initMap(1001, "电话为空！");
			}
			
			if (null == page || page == 0) {
				page = 1;
			}

			if (null == pagesize || pagesize == 0) {
				pagesize = 100;
			}
			
			try{
				Map<String, Object> map = userService.findByPhones(id, phonelist, page, pagesize);
				logger.info("return map:{}", map);
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
				@RequestParam(value = "range", required = false) String range,
				@RequestParam(value = "page", required = false) Integer page,
				@RequestParam(value = "pagesize", required = false) Integer pagesize
		) {
			logger.info("uid:{}, lng:{}, lat:{}, range:{}, pageno:{}, pagesize:{}", new Object[]{
					uid, lng, lat, range, page, pagesize});
			
			int id = StringUtil.parseInt(uid, 0);
			if (id == 0) {
				return MapResult.initMap(1001, "用户id错误！");
			}
			
			double lngd = StringUtil.parseDouble(lng, 0);
			double latd = StringUtil.parseDouble(lat, 0);
			double ranged = StringUtil.parseDouble(range, 0.6);
			
			double minlngd = lngd - ranged;
			double maxlngd = lngd + ranged;
			double minlatd = latd - ranged;
			double maxlatd = latd + ranged;
			
			if (null == page || page == 0) {
				page = 1;
			}

			if (null == pagesize || pagesize == 0) {
				pagesize = 100;
			}
			
			//long time = System.currentTimeMillis() - 20 * 60 * 1000;
			//String starttime = DateUtil.date2Str(new Date(time));
			String starttime = null;
			
			try{
				Map<String, Object> map = userService.near(id, minlngd+"", maxlngd + "", minlatd + "", maxlatd + "", starttime, page, pagesize);
				logger.info("return map: {}", map);
				return map;
			}catch(Exception ex) {
				logger.error("", ex);
				return MapResult.failMap();
			}
		}
		
		
		@RequestMapping(value = "/kwSearch")
		@ResponseBody
		public Map<String, Object> kwSearch(
				HttpServletRequest request,
				@RequestParam(value = "uid", required = true) String uid,
				@RequestParam(value = "keyword", required = true) String keyword,
				@RequestParam(value = "page", required = false) Integer page,
				@RequestParam(value = "pagesize", required = false) Integer pagesize
		){
			
			logger.info("kwSearch-->params uid:{}, keyword:{}, page:{}, pagesize:{}", new Object[]{uid, keyword, page, pagesize});
			
			int id = StringUtil.parseInt(uid, 0);
			if (id == 0) {
				return MapResult.initMap(10001, "用户id错误！");
			}
			
			if(StringUtils.isEmpty("keyword")) {
				return MapResult.initMap(10002, "请输入关键字");
			}
			
			keyword = "%" + keyword + "%";
			
			if (null == page || page == 0) {
				page = 1;
			}
			
			if (null == pagesize || pagesize == 0) {
				pagesize = 20;
			}
			
			try{
				Map<String, Object> map = userService.kwsearch(id, keyword, page, pagesize);
				logger.info("return map:{}", map);
				return map;
			}catch(Exception ex) {
				logger.error("", ex);
				return MapResult.failMap();
			}
			
		}
		
		
		@RequestMapping(value = "/wxuser")
		@ResponseBody
		public Map<String, Object> wxuser(
				HttpServletRequest request,
				@RequestParam(value = "uid", required = true) String uid
		){
			int id = StringUtil.parseInt(uid, 0);
			if (id == 0) {
				return MapResult.initMap(10001, "用户id错误！");
			}
			try{
				User user = userService.getById(id);
				Info info = infoService.getById(40);
				Map<String, Object> map = MapResult.initMap();
				map.put("user", user);
				map.put("userUoinnum", info.getUserJoinnum());
				return map;
			}catch(Exception ex){
				logger.error("", ex);
				return MapResult.failMap();
			}
		}
		
		
		@RequestMapping(value = "/test")
		@ResponseBody
		public Map<String, Object> test(
				HttpServletRequest request
		){
			logger.info("test....");
			return MapResult.initMap();
		}
		
}
