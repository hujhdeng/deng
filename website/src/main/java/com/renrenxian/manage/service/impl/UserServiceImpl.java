package com.renrenxian.manage.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.renrenxian.common.util.Page;
import com.renrenxian.common.util.StringUtil;
import com.renrenxian.manage.dao.UserDao;
import com.renrenxian.manage.model.User;
import com.renrenxian.manage.mybatis.EntityDao;
import com.renrenxian.manage.mybatis.SortWrapper;
import com.renrenxian.manage.mybatis.WhereWrapper;
import com.renrenxian.manage.service.UserService;
import com.renrenxian.manage.service.YzmService;
import com.renrenxian.manage.service.base.impl.BaseServiceMybatisImpl;
import com.renrenxian.util.result.MapResult;

@Service("userService")
@Transactional
public class UserServiceImpl extends BaseServiceMybatisImpl<User, Integer>
		implements UserService {

	private static Logger logger = LoggerFactory
			.getLogger(UserServiceImpl.class);

	@Resource
	private UserDao userDao;

	@Resource
	private YzmService yzmService;

	@Override
	protected EntityDao<User, Integer> getEntityDao() {
		return userDao;
	}

	@Override
	public User getByPhone(String phone) {
		return userDao.getByPhone(phone);
	}

	public Map<String, Object> login(String phone, String password, String lng,
			String lat) {
		User user = this.getByPhone(phone);
		if (null == user) {
			return MapResult.initMap(10001, "手机号码不存在");
		}

		if (!user.getuPwd().equals(password)) {
			return MapResult.initMap(10001, "密码错误！");
		}

		user.setLat(StringUtil.parseDouble(lat));
		user.setLng(StringUtil.parseDouble(lng));
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
		if (!b) {
			return MapResult.initMap(10001, "验证码错误！");
		}
		User user = userDao.getByPhone(phone);
		if (null == user) {
			return MapResult.initMap(10001, "电话号码不存在！");
		}
		user.setuPwd(password);
		if (StringUtils.isEmpty(lng)) {
			user.setLng(StringUtil.parseDouble(lng));
		}
		if (StringUtils.isEmpty(lat)) {
			user.setLat(StringUtil.parseDouble(lat));
		}
		userDao.update(user);
		Map<String, Object> map = MapResult.initMap();
		return map;
	}

	// 获取自己信息
	@Override
	public Map<String, Object> getUserInfo(int id, String lng, String lat) {

		User user = userDao.getById(id);
		if (user != null) {
			if (!StringUtils.isEmpty(lng)) {
				user.setLng(StringUtil.parseDouble(lng));
			}
			if (!StringUtils.isEmpty(lat)) {
				user.setLat(StringUtil.parseDouble(lat));
			}
			user.setLogtime(new Date());
			userDao.update(user);
			Map<String, Object> map = MapResult.initMap();
			map.put("data", user);
			return map;
		} else {
			return MapResult.initMap(1001, "用户不存在");
		}

	}

	@Override
	public Map<String, Object> updateKV(int id, String key, Object value,
			String lng, String lat) {
		try {
			userDao.updateKV(id, key, value, lng, lat);
			return MapResult.initMap();
		} catch (Exception ex) {
			logger.error("", ex);
			return MapResult.initMap(1001, "修改信息错误");
		}
	}

	@Override
	public Map<String, Object> upload(int id, MultipartFile file, String path) {
		User user = userDao.getById(id);
		if (user == null) {
			return MapResult.initMap(10001, "用户错误！");
		}
		try {
			String ext = file.getOriginalFilename().substring(
					file.getOriginalFilename().lastIndexOf("."));
			String filename = System.currentTimeMillis() + ext;
			file.transferTo(new File(path, filename));
			// 保存
			user.setAvatar(filename);
			this.userDao.update(user);

			Map<String, Object> map = MapResult.initMap();
			map.put("avatar", filename);
			return map;

		} catch (Exception ex) {
			logger.error("", ex);
			return MapResult.initMap(1001, "保存图片失败");
		}
	}

	// 补充资料
	public Map<String, Object> updateReplenish(User user) {
		if (user == null || user.getId() == null || user.getId() == 0) {
			return MapResult.initMap(1001, "用户错误");
		}
		// 从数据库里获取信息
		User tmp = userDao.getById(user.getId());
		// BeanUtils.copyProperties(source, target);
		if (tmp == null) {
			return MapResult.initMap(1001, "用户错误");
		}

		if (StringUtils.isNotEmpty(user.getuName())) {
			tmp.setuName(user.getuName());
		}

		if (StringUtils.isNotEmpty(user.getCompany())) {
			tmp.setCompany(user.getCompany());
		}
		if (StringUtils.isNotEmpty(user.getAddress())) {
			tmp.setAddress(user.getAddress());
		}
		if (StringUtils.isNotEmpty(user.getSex())) {
			tmp.setSex(user.getSex());
		}
		if (StringUtils.isNotEmpty(user.getOld())) {
			tmp.setOld(user.getOld());
		}
		
		if (StringUtils.isNotEmpty(user.getArea())) {
			tmp.setArea(user.getArea());
		}
		
		if (StringUtils.isNotEmpty(user.getKeyword())) {
			tmp.setKeyword(user.getKeyword());
		}
		if (StringUtils.isNotEmpty(user.getIndusty())) {
			tmp.setIndusty(user.getIndusty());
		}
		if (StringUtils.isNotEmpty(user.getBusiness())) {
			tmp.setBusiness(user.getBusiness());
		}
		if (StringUtils.isNotEmpty(user.getYear())) {
			tmp.setYear(user.getYear());
		}
		if (StringUtils.isNotEmpty(user.getCont())) {
			tmp.setCont(user.getCont());
		}
		
		if (StringUtils.isNotEmpty(user.getAlert())) {
			tmp.setAlert(user.getAlert());
		}
		
		// 经纬度
		// if (StringUtils.isNotEmpty(user.getLng())) {
		if(user.getLng() != null) {
			tmp.setLng(user.getLng());
		}
		
		//if (StringUtils.isNotEmpty(user.getLat())) {
		if(user.getLat() != null) {
			tmp.setLat(user.getLat());
		}
		
		// alert
		if (StringUtils.isNotEmpty(user.getLocat())) {
			tmp.setLocat(user.getLocat());
		}
		// alert2
		// tmp
		userDao.update(tmp);
		return MapResult.initMap();
	}

	
	/**
	 * 
	 * @param id  登录用户id
	 * @param uid 被关注用户id
	 * @return
	 */
	public Map<String, Object> addFollow(int id, int uid) {
		User fuser = userDao.getById(uid);
		if(fuser == null) {
			return MapResult.failMap();
		}
		return addFollow(id, fuser.getPhone());
	}
	
	
	public Map<String, Object> addFollow(int id, String followphone) {
		// 检查uid
		User user = userDao.getById(id);
		if (user == null) {
			return MapResult.initMap(1001, "用户不存在");
		}
		User followUser = userDao.getByPhone(followphone);
		if (followUser == null) {
			return MapResult.initMap(1001, "手机号不存在");
		}

		String tmp = user.getFollowList();
		String[] follows = StringUtils.split(tmp, "|");
		if (follows != null) {
			List<String> l1 = Arrays.asList(follows);
			if (l1.contains(followphone)) {
				return MapResult.initMap(1001, "已关注过");
			}

		}
		// 查询是否被对方关注过
		tmp = followUser.getFollowList();
		follows = StringUtils.split(tmp, "|");
		if (follows != null) {
			List<String> l1 = Arrays.asList(follows);
			if (l1.contains(user.getPhone())) { // 被对方关注过
				user.setFollowbothcount((StringUtil.parseInt(
						user.getFollowbothcount(), 0) + 1)
						+ "");
				followUser.setFollowbothcount((StringUtil.parseInt(
						followUser.getFollowbothcount(), 0) + 1)
						+ "");
			}
		}

		user.setFollowcount((StringUtil.parseInt(user.getFollowcount(), 0) + 1)
				+ "");
		user.setFollowList((user.getFollowList() == null ? "" : user
				.getFollowList()) + "|" + followphone);
		userDao.update(user);
		// 对方
		followUser.setFollowmecount((StringUtil.parseInt(
				followUser.getFollowmecount(), 0) + 1)
				+ "");
		followUser.setKpno(followUser.getKpno() + 1);
		userDao.update(followUser);
		return MapResult.initMap();
	}

	public Map<String, Object> deleteFollow(int id, String followphone) {
		// 检查uid
		User user = userDao.getById(id);
		if (user == null) {
			return MapResult.initMap(1001, "用户不存在");
		}
		User followUser = userDao.getByPhone(followphone);
		if (followUser == null) {
			return MapResult.initMap(1001, "手机号不存在");
		}
		
		String tmp = user.getFollowList();
		String[] follows = StringUtils.split(tmp, "|");
		
		if (follows == null) {
			return MapResult.initMap(1001, "没有关注过");
		} else {
			List<String> l1 = Arrays.asList(follows);
			if (!l1.contains(followphone)) {
				return MapResult.initMap(1001, "没有关注过");
			}
		}
		
		// 查询是否被对方关注过
		tmp = followUser.getFollowList();
		follows = StringUtils.split(tmp, "|");
		if (follows != null) {
			List<String> l1 = Arrays.asList(follows);
			if (l1.contains(user.getPhone())) {  //对方的关注列表有我，即为相互关注
				user.setFollowbothcount((StringUtil.parseInt(
						user.getFollowbothcount(), 0) - 1)
						+ "");
				followUser.setFollowbothcount((StringUtil.parseInt(
						followUser.getFollowbothcount(), 0) - 1)
						+ "");
			}
		}
		user.setFollowcount((StringUtil.parseInt(user.getFollowcount(), 0) - 1) + "");
		user.setFollowList(user.getFollowList().replace("|"+followphone, ""));
		this.userDao.update(user);
		//写对方
		followUser.setFollowmecount((StringUtil.parseInt(
				followUser.getFollowmecount(), 0) - 1)
				+ "");
		followUser.setKpno(followUser.getKpno() - 1);
		this.userDao.update(followUser);
		return MapResult.initMap();
	}

	
	// 获取follows
		public Page<User> follows(int id, int pageNo, int pageSize) {
			// 检查uid
			User user = userDao.getById(id); // 用户不对，返回null
			if (user == null) {
				return null;
			}

			String follows = user.getFollowList();
			Page<User> page = new Page<User>(pageNo, pageSize);
			if (StringUtils.isEmpty(follows)) {
				page.setTotalCount(0);
				page.setResult(null);
				return page;
			}
			String[] phones = StringUtils.split(follows, "|");

			if (phones == null) {
				page.setResult(null);
				return page;
			} else {
				List<String> l1 = Arrays.asList(phones);
				page.setTotalCount(l1.size());
				if (page.getOffset() < l1.size()) {
					int toIndex = 0;
					if ((page.getOffset() + pageSize) > l1.size()) {
						toIndex = l1.size();
					} else {
						toIndex = page.getOffset() + pageSize;
					}
					List<String> t = l1.subList(page.getOffset(), toIndex);
					List<User> list = this.userDao.getByPhones(t);
					page.setResult(list);
					return page;
				} else {
					page.setResult(null);
					return page;
				}

			}
		}

		public Page<User> followme(int id, Integer pageno, Integer pagesize) {
			// 检查uid
			User user = userDao.getById(id); // 用户不对，返回null
			if (user == null) {
				return null;
			}
			Page<User> page = this.userDao.getByPhonesLike(user.getPhone(), pageno,
					pagesize);
			return page;
		}

		public List<User> followBoth(int id) {

			// 检查uid
			User user = userDao.getById(id); // 用户不对，返回null
			if (user == null) {
				return null;
			}

			List<User> list = new ArrayList<User>();

			String iphone = user.getPhone();
			if (StringUtils.isEmpty(iphone)) {
				return null;
			}
			// 我关注的人
			String ifollow = user.getFollowList();

			if (StringUtils.isEmpty(ifollow)) { // 没有关注人
				return null;
			}
			String[] follows = StringUtils.split(ifollow, "|");
			List<String> ifollowList = Arrays.asList(follows);

			// 查询关注我的人
			Page<User> page1 = userDao
					.getByPhonesLike(iphone, 1, Integer.MAX_VALUE);
			if (page1 != null && page1.getResult() != null) {
				for (User u1 : page1.getResult()) {
					if (ifollowList.contains(u1.getPhone())) {
						list.add(u1);
						continue;
					}
				}
			}
			return list;
		}
		
	
	@Override
	public Page<User> findUsersByUserIds(Object[] uids, int pageNo,int pageSize) {
		if(uids==null || uids.length==0){
			return new Page<User>(pageNo,pageSize);
		}
		return this.userDao.findUsersByUserIds(uids, pageNo, pageSize);
	}
	
	

	@Override
	public Map<String, Object> search(int uid, List<WhereWrapper> whereList,
			List<SortWrapper> sortList, Integer pageno, Integer pagesize) {

		User user = userDao.getById(uid);
		if (user == null) {
			return MapResult.initMap(1001, "用户不存在");
		}

		Page<User> page = new Page<User>(pageno, pagesize);
		page = this.userDao.findPage(page, whereList, sortList);
		if (page == null || page.getResult() == null) {
			return MapResult.initMap(1001, "没有数据");
		}

		String ifollow = user.getFollowList();

		List<User> list = new ArrayList<User>();
		List<User> tmp = page.getResult();
		for (User u : tmp) {
			if (StringUtils.isEmpty(ifollow)) {
				u.setuPwd("0"); 	// 未关注
			} else {
				if (ifollow.indexOf(u.getPhone()) > 0) {
					u.setuPwd("1"); // 已关注
				} else {
					u.setuPwd("0"); // 未关注
				}
			}
			list.add(u);
		}
		logger.info("page total:{}, count:{}", page.getTotalCount(), page.getTotalPages());
		Map<String, Object> map = MapResult.initMap();
		map.put("data", list);

		return map;
	}
	
	
	public Map<String, Object> findByPhones(int uid, String phones,
			int pageno, int pagesize) {
		
		User user = userDao.getById(uid);
		if (user == null) {
			return MapResult.initMap(1001, "用户不存在");
		}
		
		String[] ps = StringUtils.split(phones, "[, ]");
		Page<User> page = new Page<User>(pageno, pagesize);
		page = this.userDao.findPageByPhones(ps, pageno, pagesize);
		if(page == null || page.getResult() == null || page.getResult().size() == 0) {
			return MapResult.initMap(1002, "无有数据");
		}
		
		Map<String, Object> map = MapResult.initMap();
		map.put("data", page.getResult());
		return map;
	}
	
	// near
	public Map<String, Object> near(int uid, double minlng, double maxlng,
			double minlat, double maxlat, String starttime, int pageno, int pagesize){
		
		User user = userDao.getById(uid);
		if (user == null) {
			return MapResult.initMap(1001, "用户不存在");
		}
		Page<User> page = this.userDao.findPageByNear(uid, minlng, maxlng, minlat, maxlat, starttime, pageno, pagesize);
		if(page == null || page.getResult() == null || page.getResult().size() == 0) {
			return MapResult.initMap(1002, "无有数据");
		}
		Map<String, Object> map = MapResult.initMap();
		
		map.put("data", page.getResult());
		return map;
	}

	
	public Map<String, Object> near(int uid, double lat, double lng, double range, String starttime, int pageno, int pagesize){
		
		User user = userDao.getById(uid);
		if (user == null) {
			return MapResult.initMap(1001, "用户不存在");
		}
		double minlngd = lng - range;
		double maxlngd = lng + range;
		double minlatd = lat - range;
		double maxlatd = lat + range;

		Page<User> page = this.userDao.findPageByNear(uid, minlngd, maxlngd, minlatd, maxlatd, starttime, pageno, pagesize);
		if(page == null || page.getResult() == null || page.getResult().size() == 0) {
			return MapResult.initMap(1002, "无有数据");
		}
		Map<String, Object> map = MapResult.initMap();
		
		List<User> list = new ArrayList<User>();
		for(User u1 : page.getResult()) {
			u1.setDistance(StringUtil.getDistance(lat, lng, u1.getLat(), u1.getLng()));
			list.add(u1);
		}
		map.put("data", list);
		return map;
	}
	
	public Integer findByIdCount (int uid){
		return this.userDao.findByIdCount(uid);
	}
	
	
	
	// 获取别人的信息，并确认我是否关注过他
	@Override
	public Map<String, Object> getUserInfoByMy(int myuid, int uid) {
		User user = userDao.getById(uid);
		User myUser = userDao.getById(myuid);
		if(user != null && myUser != null) {
			
			Map<String, Object> map = MapResult.initMap();
			String myFollowList =  myUser.getFollowList();
			if(StringUtils.isNotEmpty(myFollowList)) {
				int index = myFollowList.indexOf("|" + user.getPhone());
				if(index >= 0) {
					// map.put("hasfollow", true);  // 已关注
					user.setHasfollow("1");
				}else{
					user.setHasfollow("0");
				}
			} else {
				user.setHasfollow("0"); // 未关注
			}
			map.put("data", user);
			return map;
			
		} else {
			return MapResult.initMap(1001, "用户不存在");
		}

	}
	
	
	@Override
	public Map<String, Object> kwsearch(int uid, String keyword, Integer pageno, Integer pagesize) {

		User user = userDao.getById(uid);
		if (user == null) {
			return MapResult.initMap(1001, "用户不存在");
		}

		keyword = "%"+keyword+"%";
		
		List<WhereWrapper> whereList = new ArrayList<WhereWrapper>();
		WhereWrapper where = null;
		where = new WhereWrapper("phone", WhereWrapper.SYMBOL_LIKE, keyword);
		whereList.add(where);
		
		where = new WhereWrapper("u_name", WhereWrapper.SYMBOL_LIKE, keyword);
		whereList.add(where);
		
		where = new WhereWrapper("industy", WhereWrapper.SYMBOL_LIKE, keyword);
		whereList.add(where);
		
		where = new WhereWrapper("area", WhereWrapper.SYMBOL_LIKE, keyword);
		whereList.add(where);
		
		where = new WhereWrapper("business", WhereWrapper.SYMBOL_LIKE, keyword);
		whereList.add(where);
		
		where = new WhereWrapper("keyword", WhereWrapper.SYMBOL_LIKE, keyword);
		whereList.add(where);
		
		where = new WhereWrapper("cont", WhereWrapper.SYMBOL_LIKE, keyword);
		whereList.add(where);
		
		where = new WhereWrapper("company", WhereWrapper.SYMBOL_LIKE, keyword);
		whereList.add(where);
		
		List<SortWrapper> sortList = new ArrayList<SortWrapper>();
		SortWrapper sort = new SortWrapper("kpno", SortWrapper.DESC);
		sortList.add(sort);

		Page<User> page = new Page<User>(pageno, pagesize);
		
		page = this.userDao.findPage(page, whereList, sortList);
		if (page == null || page.getResult() == null) {
			return MapResult.initMap(1001, "没有数据");
		}

		String ifollow = user.getFollowList();

		List<User> list = new ArrayList<User>();
		List<User> tmp = page.getResult();
		for (User u : tmp) {
			if (StringUtils.isEmpty(ifollow)) {
				u.setHasfollow("0");	// 未关注
			} else {
				if (ifollow.indexOf(u.getPhone()) >= 0) {
					u.setHasfollow("1"); // 已关注
				} else {
					u.setHasfollow("0"); // 未关注
				}
			}
			list.add(u);
		}
		logger.info("page total:{}, count:{}", page.getTotalCount(), page.getTotalPages());
		Map<String, Object> map = MapResult.initMap();
		map.put("data", list);
		return map;
	}
	
}
