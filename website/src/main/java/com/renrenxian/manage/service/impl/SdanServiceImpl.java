package com.renrenxian.manage.service.impl;

import java.net.URLDecoder;
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

import com.renrenxian.common.util.Page;
import com.renrenxian.common.util.StringUtil;
import com.renrenxian.manage.dao.SdanDao;
import com.renrenxian.manage.model.Party;
import com.renrenxian.manage.model.Sdan;
import com.renrenxian.manage.model.SdanChat;
import com.renrenxian.manage.model.SdanMessage;
import com.renrenxian.manage.model.User;
import com.renrenxian.manage.mybatis.EntityDao;
import com.renrenxian.manage.service.SdanChatService;
import com.renrenxian.manage.service.SdanChatUserService;
import com.renrenxian.manage.service.SdanMessageService;
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
	
	@Resource
	private SdanChatService  sdanChatService;
	
	@Resource
	private SdanMessageService  sdanMessageService;
	
	@Resource
	private SdanChatUserService  sdanChatUserService;

	@Override
	protected EntityDao<Sdan, Integer> getEntityDao() {
		return sdanDao;
	}

	@Override
	public Map<String, Object> create(Integer uid, String title, String type,
			String area, String money, String limitdate, String howlong,
			String content)  {
		try{
		User u = userService.getById(uid);
		if(u==null){//uid对应的用户不存在
			return MapResult.initMap(1002, "异常的登陆用户");
		}
		
		Sdan sd = new Sdan();
		sd.setUid(uid+"");
		if(u.getuName() != null){
			sd.setuName(URLEncoder.encode(u.getuName(),"UTF-8"));
		}
		sd.setPhone(u.getPhone());
		
		sd.setTitle(title);
		sd.setContent(content);
		sd.setArea(area);
		sd.setMoney(money);
		sd.setType(type);
		
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
		}catch(Exception ex) {
			logger.error("", ex);
			return MapResult.failMap();
		}
	}

	
	public Map<String, Object> update(Integer sid, Integer uid, String title,
			String type, String area, String money, String limitdate,
			String howlong, String content){
		
		User u = userService.getById(uid);
		if(u==null){//uid对应的用户不存在
			return MapResult.initMap(1002, "异常的登陆用户");
		}
		
		Sdan sdan = this.sdanDao.getById(sid);
		if(sdan == null) {
			return MapResult.initMap(1003, "定单不存在。");
		}
		
		if(!sdan.getUid().equals(uid+"")) {
			return MapResult.initMap(1004, "不允许修改");
		}
		
		if(StringUtils.isNotEmpty(title)) {
			sdan.setTitle(title);
		}
		
		if(StringUtils.isNotEmpty(type)) {
			sdan.setType(type);
		}
		
		if(StringUtils.isNotEmpty(area)) {
			sdan.setArea(area);
		}
		
		if(StringUtils.isNotEmpty(money)) {
			sdan.setMoney(money);
		}
		
		if(StringUtils.isNotEmpty(limitdate)) {
			sdan.setLimitdate(limitdate);
		}
		
		if(StringUtils.isNotEmpty(howlong)) {
			sdan.setHowlong(howlong);
		}
		
		if(StringUtils.isNotEmpty(content)) {
			sdan.setContent(content);
		}
		
		this.sdanDao.update(sdan);
		return MapResult.initMap();
		
	}
	
	
	@Override
	public Page<Sdan> list(Integer uid, String type, String area, String state,int pageNo, int pageSize) {
		
		return sdanDao.list(uid, type, area, state, pageNo, pageSize);
	}

	@Override
	public Map<String, Object> getSdanInfo(Integer sid, Integer uid) {
		Sdan s = this.getById(sid);
		
		try{
			s.setuName(URLDecoder.decode(s.getuName(), "UTF-8"));
		}catch(Exception ex) {
			logger.error("", ex);
		}
		
		if(s==null){
			return MapResult.initMap(1003, "甩单不存在");
		}
		
		String joinList = s.getJoinlist();
		JSONObject data = JSONObject.fromObject(s);
		// boolean isJoin = false;
		int isJoin = 0;
		if(uid!=null){
			String juid = "|"+uid;
			
			if(!StringUtil.empty(joinList) && (joinList.endsWith(juid) || joinList.indexOf(juid+"|")>-1)){
				isJoin = 1;			
			}
		}
		
		data.put("isJoin", isJoin);
		
		Map<String, Object> map = MapResult.initMap();
		map.put("data", data);
		
		return map;
	}

	@Override
	public Map<String, Object> join(Integer sid, Integer uid,String message) {
		User u = userService.getById(uid);
		if(u==null){//uid对应的用户不存在
			return MapResult.initMap(1002, "异常的登陆用户");
		}
		
		Sdan s = this.getById(sid);
		if(s==null){
			return MapResult.initMap(1003, "甩单不存在");			
		}else if(Sdan.STATE_APPROACH.equals(s.getState())){
			return MapResult.initMap(1004, "甩单接洽中，无法加入");	
		}else if(Party.STATE_OVER.equals(s.getState()) ){
			return MapResult.initMap(1005, "甩单已结束");	
		}
		
		
		// 是否已留言过。
		SdanMessage ms = sdanMessageService.getBySidAndUid(sid+"", uid+"");
		if(ms != null ) {
			Map<String,Object> map = MapResult.failMap();
			map.put("apicode", "10001");
			map.put("message", "已经留过言了。");
			return map;
			
		}
		
		/**
		 * 创建留言相关处理
		 */
		sdanMessageService.create(sid, u, message);
		sdanChatUserService.save(sid, uid, message);
		sdanChatService.create(sid, Integer.valueOf(s.getUid()), uid, message);
		
		String jlist = s.getJoinlist();
		jlist = jlist!=null?jlist:"";
		String juid = "|"+uid;
		if(jlist.endsWith(juid) || jlist.indexOf(juid+"|")>-1){ //检查是否已经加入
			Map<String,Object> map = MapResult.initMap();
			map.put("message", "重复加入");
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
	public Map<String, Object> joinUsersList(Integer sid, int pageNo,int pageSize) {
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

	@Override
	public Map<String, Object> sdanConnect(Integer sid, Integer uid,Integer reid) {
		User u = userService.getById(uid);
		if(u==null){//uid对应的用户不存在
			return MapResult.initMap(1002, "异常的登陆用户");
		}
		
		User reu = userService.getById(reid);
		if(reu==null){//uid对应的用户不存在
			return MapResult.initMap(1009, "接洽人不存在");
		}
		
		Sdan s = this.getById(sid);
		if(s==null){
			return MapResult.initMap(1003, "甩单不存在");			
		}else if(!s.getUid().equals(uid+"")){
			return MapResult.initMap(1008, "非甩单发起人");	
		}else if(Party.STATE_OVER.equals(s.getState()) ){
			return MapResult.initMap(1005, "甩单已结束");	
		}
		
		String jlist = s.getJoinlist();
		String juid = "|"+reid;
		if(StringUtil.empty(jlist) || !(jlist.endsWith(juid) || jlist.indexOf(juid+"|")>-1)){//检查是否已经加入
			return MapResult.initMap(1010, "未申请接单");
		}
		
		s =  new Sdan();
		s.setId(sid);
		s.setSelectid(reid+"");
		s.setSelectname(reu.getuName());
		s.setSelectavatar(reu.getAvatar());
		s.setState(Sdan.STATE_APPROACH);
		
		this.update(s);
		
		Map<String,Object> map =  MapResult.initMap();
		Map<String,Object> data =  new HashMap<String,Object>();
		data.put("id", sid);
		data.put("reid", reid);
		map.put("data", data);
		return map;
	}

	@Override
	public Map<String, Object> disConnect(Integer sid, Integer uid) {
		User u = userService.getById(uid);
		if(u==null){//uid对应的用户不存在
			return MapResult.initMap(1002, "异常的登陆用户");
		}
		
		Sdan s = this.getById(sid);
		if(s==null){
			return MapResult.initMap(1003, "甩单不存在");			
		}else if(!s.getUid().equals(uid+"")){
			return MapResult.initMap(1008, "非甩单发起人");	
		}else if(Party.STATE_OVER.equals(s.getState()) ){
			return MapResult.initMap(1005, "甩单已结束");	
		}
		
		s = new Sdan();
		s.setId(sid);
		s.setSelectid("");
		s.setSelectname("");
		s.setSelectavatar("");
		s.setState(Sdan.STATE_INON);
		
		this.update(s);
		
		Map<String,Object> map =  MapResult.initMap();
		Map<String,Object> data =  new HashMap<String,Object>();
		data.put("id", sid);
		map.put("data", data);
		return map;
	}

	@Override
	public Map<String, Object> addChat(Integer sid, Integer seid, Integer reid,String message) {
		User u = userService.getById(seid);
		if(u==null){//uid对应的用户不存在
			return MapResult.initMap(1002, "发信人不存在");
		}
		
		User reu = userService.getById(reid);
		if(reu==null){//uid对应的用户不存在
			return MapResult.initMap(1009, "收件人不存在");
		}
		
		Sdan s = this.getById(sid);
		if(s==null){
			return MapResult.initMap(1003, "甩单不存在");			
		}else if(!s.getUid().equals(seid+"") && !s.getUid().equals(reid+"")){
			return MapResult.initMap(1008, "发信人错误");	
		}
		
		
		sdanChatUserService.save(sid, seid, message);
		sdanChatService.create(sid,reid, seid, message);
		
		Map<String,Object> map =  MapResult.initMap();
		Map<String,Object> data =  new HashMap<String,Object>();
		data.put("seid", seid);
		data.put("reid", reid);
		map.put("data", data);
		return map;
	}

	@Override
	public Map<String, Object> chatList(Integer sid, Integer uid, Integer uid2, int pageNo,int pageSize) {
		Sdan s = this.getById(sid);
		if(s==null){
			return MapResult.initMap(1003, "甩单不存在");			
		}
		Page<SdanChat> page = sdanChatService.list(sid, uid, uid2, pageNo, pageSize);
		
		Map<String,Object> map = MapResult.initMap();
		map.put("data", page.getResult());
		return map;
	}

	
	public Map<String,Object> chatList(Integer sid, Integer reid,int pageNo, int pageSize) {
		Sdan s = this.getById(sid);
		if(s==null){
			return MapResult.initMap(1003, "甩单不存在");			
		}
		Page<SdanChat> page = sdanChatService.list(sid, reid, pageNo, pageSize);
		Map<String,Object> map = MapResult.initMap();
		map.put("data", page.getResult());
		return map;
		
	}
	
	@Override
	public Map<String, Object> assess(Integer sid, Integer uid,Integer assessnum, String assesstxt) {
		User u = userService.getById(uid);
		if(u==null){//uid对应的用户不存在
			return MapResult.initMap(1002, "异常的登陆用户");
		}
		
		Sdan s = this.getById(sid);
		if(s==null){
			return MapResult.initMap(1003, "甩单不存在");			
		}else if(!s.getUid().equals(uid+"")){
			return MapResult.initMap(1008, "非甩单发起人");	
		}else if(Party.STATE_OVER.equals(s.getState()) ){
			return MapResult.initMap(1005, "甩单已结束");	
		}
		
		String selectidstr = s.getSelectid();
		if(StringUtil.empty(selectidstr)){
			return MapResult.initMap(1011, "无接洽人");	
		}
		Integer selectid = Integer.valueOf(selectidstr);
		
		//评分，结束甩单
		Sdan us = new Sdan();
		us.setAssessnum(assessnum+"");
		us.setAssesstxt(assesstxt);
		us.setState(Sdan.STATE_OVER);
		us.setId(sid);
		
		this.update(us);
		
		//甩单人自己加5分靠谱指数，参照php
		User sdu = new User();
		sdu.setId(uid);
		sdu.setKpno(u.getKpno()+5);
		sdu.setDanCount(String.valueOf(Integer.parseInt(u.getDanCount())+1));
		userService.update(sdu);
		
		//被评价人靠谱数处理，参照php
		int saddno;
		if(assessnum==1){
			saddno=-5;
		}else if(assessnum==3){
			saddno=5;	
		}else{
			saddno=0;	
		}
		User sUser = userService.getById(selectid);
		saddno = sUser.getKpno()+saddno;
		User selectUser = new User();
		selectUser.setId(selectid);
		selectUser.setKpno(saddno);
		userService.update(selectUser);
		
		Map<String,Object> map =  MapResult.initMap();
		Map<String,Object> data =  new HashMap<String,Object>();
		data.put("kpno", saddno);
		map.put("data", data);
		return map;
	}

	
	// delete
	public Map<String, Object> deleteSdan(Integer id, Integer uid){
		Sdan sdan = this.getById(id);
		if(sdan == null){
			Map<String, Object> map = MapResult.failMap();
			map.put("message", "甩单不存在或已被取消");
			return map;			
		}
		
		if(uid == null){
			return MapResult.initMap(1007, "未登陆用户无权取消甩单");	
		}
		
		if(!sdan.getUid().equals(uid+"")) {
			return MapResult.initMap(1008, "当前登陆用户无权取消甩单");	
		}
		
		
		this.removeById(id);
		Map<String,Object> map = MapResult.initMap();
		return map;
	}
	
	
	
	
}
