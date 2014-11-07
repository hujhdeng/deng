package com.renrenxian.manage.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.renrenxian.common.util.Page;
import com.renrenxian.common.util.StringUtil;
import com.renrenxian.manage.dao.SdanDao;
import com.renrenxian.manage.model.Party;
import com.renrenxian.manage.model.Sdan;
import com.renrenxian.manage.model.User;
import com.renrenxian.manage.mybatis.EntityDao;
import com.renrenxian.manage.service.SdanService;
import com.renrenxian.manage.service.UserService;
import com.renrenxian.manage.service.base.impl.BaseServiceMybatisImpl;
import com.renrenxian.util.result.MapResult;


@Service("sdanService")
@Transactional
public class SdanServiceImpl extends BaseServiceMybatisImpl<Sdan,Integer> implements SdanService{

	private static Logger logger = LoggerFactory.getLogger(SdanServiceImpl.class);

	@Resource
	private SdanDao sdanDao;
	
	@Resource
	private UserService  userService;

	@Override
	protected EntityDao<Sdan, Integer> getEntityDao() {
		return sdanDao;
	}

	@Override
	public Map<String, Object> create(Integer uid, String title, String type,
			String area, String money, String limitdate, String howlong,
			String content) {
		User u = userService.getById(uid);
		if(u==null){//uid对应的用户不存在，直接返回，无法创建party
			return MapResult.initMap(1002, "异常的登陆用户");
		}
		
		Sdan sd = new Sdan();
		sd.setUid(uid+"");
		sd.setuName(u.getuName());
		sd.setPhone(u.getPhone());
		
		sd.setTitle(title);
		sd.setContent(content);
		sd.setArea(area);
		sd.setMoney(money);
		
		sd.setLimitdate(limitdate);
		sd.setHowlong(howlong);
		
		sd.setState(Sdan.STATE_INON);
		sd.setRegtime(new Date());
		sd.setJoinlist("");
		sd.setJoinnum("0");
		
		this.save(sd);
		
		Map<String, Object> map = MapResult.initMap();
		map.put("data", sd);
		
		return map;
	}

	@Override
	public Page<Sdan> list(Integer uid, String type, String area, String state,
			int pageNo, int pageSize) {
		
		return sdanDao.list(uid, type, area, state, pageNo, pageSize);
	}

	@Override
	public Map<String, Object> getSdanfo(Integer sid, Integer uid) {
		Sdan s = this.getById(sid);
		if(s==null){
			return MapResult.initMap(1003, "甩单不存在");
		}
		
		String joinList = s.getJoinlist();
		JSONObject data = JSONObject.fromObject(s);
		boolean isJoin = false;
		if(uid!=null){
			String juid = "|"+uid;
			
			if(!StringUtil.empty(joinList) && (joinList.endsWith(juid) || joinList.indexOf(juid+"|")>-1)){
				isJoin = true;			
			}
		}
		
		data.put("isJoin", isJoin);
		
		Map<String, Object> map = MapResult.initMap();
		map.put("data", data);
		
		return map;
	}

	@Override
	public Map<String, Object> join(Integer sid, Integer uid) {
		User u = userService.getById(uid);
		if(u==null){//uid对应的用户不存在，直接返回，无法创建party
			return MapResult.initMap(1002, "异常的登陆用户");
		}
		
		Sdan s = this.getById(sid);
		if(s==null){
			return MapResult.initMap(1003, "聚会不存在");			
		}else if(Sdan.STATE_APPROACH.equals(s.getState())){
			return MapResult.initMap(1004, "甩单接洽中，无法加入");	
		}else if(Party.STATE_OVER.equals(s.getState()) ){
			return MapResult.initMap(1005, "聚会已结束");	
		}/*else if(s.getPartytime().getTime()>=System.currentTimeMillis()){//实际聚会时间已经过期
			s = new Sdan();
			s.setId(sid);
			s.setState(Sdan.STATE_OVER);
			this.update(p);
			
			logger.info("Sdan("+pid+")实际聚会时间已经过期,将聚会状态设置已过期");
			return MapResult.initMap(1005, "聚会已结束");	
		}*/
		
		String jlist = s.getJoinlist();
		jlist = jlist!=null?jlist:"";
		String juid = "|"+uid;
		if(jlist.endsWith(juid) || jlist.indexOf(juid+"|")>-1){//检查是否已经加入
			Map<String,Object> map = MapResult.initMap(1000, "重复加入");
			map.put("data", s.getJoinnum());
			return map;
		}
		
		
		int jnum = Integer.valueOf(s.getJoinnum());
		jlist += juid;
		jnum++;
		s = new Sdan();
		s.setId(sid);
		s.setJoinlist(jlist);
		s.setJoinnum(jnum+"");
		
		this.update(s);
		
		JSONObject json = new JSONObject();
		json.put("joinnum", jnum);
		Map<String,Object> map = MapResult.initMap();
		map.put("data", json);
		
		
		return map;
	}

	@Override
	public Map<String, Object> joinUsersList(Integer sid, int pageNo,
			int pageSize) {
		Sdan s = this.getById(sid);
		if(s==null){
			return MapResult.initMap(1003, "甩单不存在");			
		}
		
		
		String jlist = s.getJoinlist();
		if(StringUtil.empty(jlist)){
			Map<String,Object> map =  MapResult.initMap();	
			map.put("data", new ArrayList<User>());
			return map;
		}
		
		//移除第一个“|”，然后通过“|”进行分割
		jlist = jlist.substring(1);
		String[] juids = jlist.split("\\|");
		Page<User> page = userService.findUsersByUserIds(juids, pageNo, pageSize);
		
		Map<String,Object> map =  MapResult.initMap();	
		map.put("data", page.getResult());
		return map;
	}

	
}
