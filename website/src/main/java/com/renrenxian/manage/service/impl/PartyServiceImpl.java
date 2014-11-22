package com.renrenxian.manage.service.impl;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.renrenxian.common.util.ConfigUtil;
import com.renrenxian.common.util.Page;
import com.renrenxian.common.util.StringUtil;
import com.renrenxian.manage.dao.PartyDao;
import com.renrenxian.manage.model.Party;
import com.renrenxian.manage.model.User;
import com.renrenxian.manage.mybatis.EntityDao;
import com.renrenxian.manage.service.PartyService;
import com.renrenxian.manage.service.UserService;
import com.renrenxian.manage.service.base.impl.BaseServiceMybatisImpl;
import com.renrenxian.util.result.DataResult;
import com.renrenxian.util.result.MapResult;


@Service("paytyService")
@Transactional
public class PartyServiceImpl extends BaseServiceMybatisImpl<Party,Integer> implements PartyService{

	private static Logger logger = LoggerFactory.getLogger(PartyServiceImpl.class);

	@Resource
	private PartyDao partyDao;
	
	@Resource
	private UserService  userService;

	@Override
	protected EntityDao<Party, Integer> getEntityDao() {
		return partyDao;
	}

	@Override
	public Map<String, Object> createParty(Integer uid, String title,
			String content, String type, Date partytime, String city,
			String area, String adr, String membernum) throws UnsupportedEncodingException {
		
		User u = userService.getById(uid);
		if(u==null){//uid对应的用户不存在，直接返回，无法创建party
			return MapResult.initMap(1002, "异常的登陆用户");
		}
		
		Party p = new Party();
		
		p.setUid(uid);
		String enc = ConfigUtil.getStringValue("urlencoder.enc");
		p.setuName(URLEncoder.encode(u.getuName(), enc));
		p.setPhone(u.getPhone());
		
		p.setTitle(title);
		p.setContent(content);
		p.setType(type);
		
		p.setPartytime(partytime);
		p.setRegtime(new Date());
		
		p.setCity(city);
		p.setArea(area);
		p.setAdr(adr);
		p.setMembernum(membernum);
		
		p.setJoinlist("");
		p.setJoinnum("0");
		
		p.setState(Party.STATE_ON_JOINING);
		
		this.save(p);
		
		Map<String, Object> map = MapResult.initMap();
		map.put("data", p);
		return map;
	}

	
	public Map<String, Object> updateParty(Integer pid, Integer uid,
			String title, String content, String type, Date partyDate,
			String city, String area, String adr, String membernum) {
		
		User u = userService.getById(uid);
		if(u==null){//uid对应的用户不存在，直接返回，无法创建party
			return MapResult.initMap(1002, "异常的登陆用户");
		}
		
		Party p = this.getById(pid);
		if(p == null) {
			return MapResult.initMap(1003, "聚会不存在错误");
		}
		
		if(p.getUid() != uid) {
			return MapResult.initMap(1004, "你不能修改该聚会");
		}
		
		if(StringUtils.isNotEmpty(title)) {
			p.setTitle(title);
		}
		
		if(StringUtils.isNotEmpty(content)) {
			p.setContent(content);
		}
		
		if(StringUtils.isNotEmpty(type)) {
			p.setType(type);
		}
		
		if(partyDate != null) {
			p.setPartytime(partyDate);
		}
		
		if(StringUtils.isNotEmpty(city)) {
			p.setCity(city);
		}
		
		if(StringUtils.isNotEmpty(adr)) {
			p.setAdr(adr);
		}
		
		if(StringUtils.isNotEmpty(area)) {
			p.setArea(area);
		}
		
		if(StringUtils.isNotEmpty(membernum)) {
			p.setMembernum(membernum);
		}
		this.partyDao.update(p);
		
		return MapResult.initMap();
	}
	
	
	@Override
	public Page<Party> list(Integer uid, Integer myjoinid, String type,
			String city, int pageNo, int pageSize) {
		//强制uid和myjoinid二选一
		if(uid!=null){
			myjoinid = null;
		}
		return partyDao.list(uid, myjoinid, type, city, pageNo, pageSize);
	}

	@Override
	public Map<String, Object> getPartyInfo(Integer partyId, Integer uid) {
		Party p = this.getById(partyId);
		if(p==null){
			return MapResult.initMap(1003, "聚会不存在");			
		}
		String joinList = p.getJoinlist();
		JSONObject data = JSONObject.fromObject(p);
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
	public Map<String, Object> join(Integer pid, Integer uid) {
		User u = userService.getById(uid);
		if(u==null){//uid对应的用户不存在
			return MapResult.initMap(1002, "异常的登陆用户");
		}
		
		Party p = this.getById(pid);
		if(p==null){
			return MapResult.initMap(1003, "聚会不存在");			
		}else if(Party.STATE_ON_UNJOIN.equals(p.getState())){
			return MapResult.initMap(1004, "聚会人数已满");	
		}else if(Party.STATE_OVER.equals(p.getState()) ){
			return MapResult.initMap(1005, "聚会已结束");	
		}else if(p.getPartytime().getTime()>=System.currentTimeMillis()){//实际聚会时间已经过期
			p = new Party();
			p.setId(pid);
			p.setState(Party.STATE_OVER);
			this.update(p);
			
			logger.info("Party("+pid+")实际聚会时间已经过期,将聚会状态设置已过期");
			return MapResult.initMap(1005, "聚会已结束");	
		}
		
		String jlist = p.getJoinlist();
		jlist = jlist!=null?jlist:"";
		String juid = "|"+uid;
		if(jlist.endsWith(juid) || jlist.indexOf(juid+"|")>-1){//检查是否已经加入
			Map<String,Object> map = MapResult.initMap(1000, "重复加入");
			map.put("data", p.getJoinnum());
			return map;
		}
		
		//检查是否人数已满
		int mnum = Integer.valueOf(p.getMembernum());
		int jnum = Integer.valueOf(p.getJoinnum());
		if(mnum==jnum){
			p = new Party();
			p.setId(pid);
			p.setState(Party.STATE_ON_UNJOIN);
			this.update(p);
			return MapResult.initMap(1004, "聚会人数已满");	
		}
		
		jlist += juid;
		jnum++;
		p = new Party();
		p.setId(pid);
		p.setJoinlist(jlist);
		p.setJoinnum(jnum+"");
		if(mnum==jnum){
			p.setState(Party.STATE_ON_UNJOIN);
		}
		
		this.update(p);
		
		JSONObject json = new JSONObject();
		json.put("joinnum", jnum);
		Map<String,Object> map = MapResult.initMap();
		map.put("data", json);
		
		return map;
	}

	@Override
	public Map<String, Object> unjoin(Integer pid, Integer uid) {
		User u = userService.getById(uid);
		if(u==null){//uid对应的用户不存在，直接返回，无法创建party
			return MapResult.initMap(1002, "异常的登陆用户");
		}
		
		Party p = this.getById(pid);
		if(p==null){
			return MapResult.initMap(1003, "聚会不存在");			
		}else if(Party.STATE_OVER.equals(p.getState()) || p.getPartytime().getTime()>=System.currentTimeMillis()){
			return MapResult.initMap(1005, "聚会已结束，无需取消");	
		}
		
		
		String jlist = p.getJoinlist();
		String juid = "|"+uid;
		if(StringUtil.empty(jlist) || !(jlist.endsWith(juid) || jlist.indexOf(juid+"|")>-1)){//检查是否已经加入
			return MapResult.initMap(1006, "未加入聚会");
		}
		
		//截取移除需要被移除的用户id
		int in = jlist.indexOf(juid+"|");
		int len = juid.length()+1;
		if(in>-1){//不在结尾
			jlist = jlist.substring(0, in)+jlist.substring(in+len-1);
		}else{//在结尾
			in = jlist.lastIndexOf(juid);
			jlist = jlist.substring(0, in);
		}
		
		//更新入库
		p = new Party();
		p.setId(pid);
		p.setJoinlist(jlist);
		int jnum;
		String jnumstr = p.getJoinnum();
		if(StringUtil.empty(jnumstr)){
			jnum = 0;
		}else{
			jnum = Integer.valueOf(jnumstr)-1;
			jnum = jnum>=0?jnum:0;
		}
		
		p.setJoinnum(jnum+"");
		p.setState(Party.STATE_ON_JOINING);
		this.update(p);
		
		JSONObject json = new JSONObject();
		json.put("joinnum", jnum);
		Map<String,Object> map = MapResult.initMap();
		map.put("data", json);
		
		return map;
	}

	@Override
	public Map<String, Object> joinUsersList(Integer pid, int pageNo,int pageSize) {
		Party p = this.getById(pid);
		if(p==null){
			return MapResult.initMap(1003, "聚会不存在");			
		}
		
		
		String jlist = p.getJoinlist();
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

	@Override
	public Map<String, Object> cancelParty(Integer pid, Integer uid) {
		Party p = this.getById(pid);
		if(p==null){
			Map<String, Object> map = MapResult.initMap();
			map.put("message", "聚会不存在或已被取消");
			return map;			
		}
		
		if(uid==null){
			return MapResult.initMap(1007, "未登陆用户无权取消聚会");	
		}else if(!uid.equals(p.getUid())){
			return MapResult.initMap(1008, "当前登陆用户无权取消聚会");	
		}
		
		this.removeById(pid);
		String jlist = p.getJoinlist();
		Map<String,Object> map = MapResult.initMap();
		Map<String,Object> data = new HashMap<String,Object>();
		data.put("joinlist", jlist);
		map.put("data", data);
		
		return map;
	}

	
	
	// @Override
	// delete
	public Map<String, Object> deleteParty(Integer pid, Integer uid) {
		Party p = this.getById(pid);
		if(p==null){
			Map<String, Object> map = MapResult.failMap();
			map.put("message", "聚会不存在或已被取消");
			return map;			
		}
		
		if(uid==null){
			return MapResult.initMap(1007, "未登陆用户无权取消聚会");	
		}else if(!uid.equals(p.getUid())){
			return MapResult.initMap(1008, "当前登陆用户无权取消聚会");	
		}
		
		this.removeById(pid);
		Map<String,Object> map = MapResult.initMap();
		return map;
	}
	
	
}
