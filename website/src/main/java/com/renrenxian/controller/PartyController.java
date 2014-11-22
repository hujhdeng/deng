package com.renrenxian.controller;

import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.codehaus.jackson.map.util.JSONPObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.renrenxian.common.util.DateUtil;
import com.renrenxian.common.util.Page;
import com.renrenxian.manage.model.Party;
import com.renrenxian.manage.model.User;
import com.renrenxian.manage.service.PartyService;
import com.renrenxian.manage.service.UserService;
import com.renrenxian.util.result.MapResult;

/**
 * 聚会相关api请求方法
 *
 */
@Controller
@RequestMapping("/party")
public class PartyController {

	@Resource
	private PartyService partyService;
	
	@Resource
	private UserService userService;

	private static Logger logger = LoggerFactory.getLogger(PartyController.class);

	/**
	 * 发起聚会
	 * @param httpServletRequest
	 * @param uid 登陆用户的id
	 * @param title 聚会标题
	 * @param content 聚会内容
	 * @param type 聚会类型
	 * @param partytime 聚会时间 yyyyMMdd
	 * @param city 所在城市
	 * @param area 所属区域
	 * @param adr 聚会地点
	 * @param membernum 人数上限
	 * @return {apicode:处理结果状态码,message:处理结果描述信息,data:处理结果主体数据Party }
	 */
	@RequestMapping(value = "/add")
	@ResponseBody
	public Map<String, Object> add(HttpServletRequest httpServletRequest,
			@RequestParam(value = "uid", required = true)Integer uid,
			@RequestParam(value = "title", required = true)String title,
			@RequestParam(value = "content", required = false)String content,
			@RequestParam(value = "type", required = true)String type,
			@RequestParam(value = "partytime", required = true)String partytime,
			@RequestParam(value = "city", required = true)String city,
			@RequestParam(value = "area", required = true)String area,
			@RequestParam(value = "adr", required = true)String adr,
			@RequestParam(value = "membernum", required = true)String membernum) {
		
		if (StringUtils.isEmpty(title) || StringUtils.isEmpty(content)
				|| StringUtils.isEmpty(type) || StringUtils.isEmpty(partytime)
				|| StringUtils.isEmpty(city) || StringUtils.isEmpty(area)
				|| StringUtils.isEmpty(adr) ||  StringUtils.isEmpty(membernum)) {
			return MapResult.initMap(1001, "参数错误");
		}
		
		try {
			Date partyDate = DateUtil.str2Date(partytime, "yyyyMMdd");
			return partyService.createParty(uid, title, content, type, partyDate, city, area, adr, membernum);
		} catch (Exception e) {
			return MapResult.failMap();
		}
		
		
	}

	/**
	 * 聚会列表含我发起和参与的聚会接口，
	 * 聚会发起人 uid 或myjoinid
	 * （带uid为返回我发起的聚会，带myjoinid为返回我参加的聚会，
	 * 二者只能选一个，uid和myjoinid均为空时返回所有聚会列表
	 * @param httpServletRequest
	 * @param uid 登陆用户uid 可以为空 
	 * @param myjoinid 参与聚会的用户uid 可以为空 
	 * @param type 聚会类型 可以为空 
	 * @param city 所属区域 可以为空
	 * @param pageno 分页页码 可以为空 
	 * @param pagesize 分页大小 可以为空 
	 * @return {"apicode":状态,"data":List<Party>,"message":处理结果描述}
	 */
	@RequestMapping(value = "/list")
	@ResponseBody
	public Map<String, Object> list(HttpServletRequest httpServletRequest,
			@RequestParam(value = "uid", required = false) Integer uid,
			@RequestParam(value = "myjoinid", required = false) Integer myjoinid,
			@RequestParam(value = "type", required = false) String type,
			@RequestParam(value = "city", required = false) String city,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "pagesize", required = false) Integer pagesize) {

		logger.info("list-->uid:{}, myjoinid:{},type:{},city:{},page:{}, pagesize:{}",
				new Object[]{uid, myjoinid, type, city, page, pagesize}
				);
		if (null == page || page == 0) {
			page = 1;
		}

		if (null == pagesize || pagesize == 0) {
			pagesize = 20;
		}
		try {
			Page<Party> page1 = partyService.list(uid, myjoinid,type, city, page,pagesize);
			Map<String, Object> map = MapResult.initMap();
			map.put("data", page1.getResult());
			logger.info("return map:{}", map);
			return map;
		} catch (Exception ex) {
			ex.printStackTrace();
			return MapResult.failMap();
		}
	}
	
	/**
	 * 获取聚会详情
	 * @param httpServletRequest
	 * @param pid 聚会id
	 * @param uid 登陆用户id
	 * @return {"apicode":状态,"data":{Party属性值,isJoin:登录用户是否参加聚会},"message":处理结果描述}
	 */
	@RequestMapping(value = "/info")
	@ResponseBody
	public Map<String, Object> info(HttpServletRequest httpServletRequest,
			@RequestParam(value = "id", required = true) Integer id,
			@RequestParam(value = "uid", required = false) Integer uid){
		logger.info("info-->pid:{}, uid:{}", id, uid);
		try {
			Map<String,Object> map = partyService.getPartyInfo(id, uid);
			logger.info("return map:{}", map);
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			return MapResult.failMap();
		}
		
	}
	
	
	/**
	 * 登陆用户申请参加pid聚会
	 * @param httpServletRequest
	 * @param uid 登陆用户id
	 * @param pid 聚会id
	 * @return {"apicode":状态,"data":{joinnum:聚会实际参加人数},"message":处理结果描述}
	 */
	@RequestMapping(value = "/join")
	@ResponseBody
	public Map<String, Object> join(HttpServletRequest httpServletRequest,
			@RequestParam(value = "id", required = true) Integer id,
			@RequestParam(value = "uid", required = true) Integer uid){
		
		try {
			Map<String,Object> map = partyService.join(id, uid);
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			return MapResult.failMap();
		}
		
	}
	
	
	/**
	 * 登陆用户申请接单
	 * @param httpServletRequest
	 * @param uid 登陆用户id 发信人
	 * @param id 甩单id
	 * @param message 留言内容
	 * @return {"apicode":状态,"data":{joinnum:甩单实际参加人数},"message":处理结果描述}
	 */
	@RequestMapping(value = "/wxlogjoin")
	@ResponseBody
	public JSONPObject join(HttpServletRequest req,
			@RequestParam(value = "id", required = true) Integer id,
			@RequestParam(value="phone",required=true)String phone,
			@RequestParam(value="u_pwd",required=true)String u_pwd){
		
		logger.info("join--> id:{},phone:{}, u_pwd:{}", new Object[]{id,phone,u_pwd});
		try {
			Map<String,Object> map;
			map = userService.login(phone, u_pwd, null, null);
			if((Integer)map.get("apicode")==10000){
				User u = (User)map.get("data");
				map = partyService.join(id, u.getId());
			}
			
			JSONPObject jsonp = new JSONPObject(req.getParameter("callback"),map);
			return jsonp;
		} catch (Exception e) {
			e.printStackTrace();
			return new JSONPObject(req.getParameter("callback"),MapResult.failMap());
		}
		
	}
	
	/**
	 * 登陆用户申请取消pid聚会的报名
	 * @param httpServletRequest
	 * @param uid 登陆用户id
	 * @param pid 聚会id
	 * @return {"apicode":状态,"data":{joinnum:聚会实际参加人数},"message":处理结果描述}
	 */
	@RequestMapping(value = "/unjoin")
	@ResponseBody
	public Map<String, Object> unjoin(HttpServletRequest httpServletRequest,
			@RequestParam(value = "id", required = true) Integer id,
			@RequestParam(value = "uid", required = true) Integer uid){
		
		try {
			Map<String,Object> map = partyService.unjoin(id, uid);
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			return MapResult.failMap();
		}
		
	}
	
	/**
	 * 分页获取参加pid聚会的用户的列表
	 * @param httpServletRequest
	 * @param pid 聚会id
	 * @param page 分页页码
	 * @param pagesize 分页大小
	 * @return {apicode:处理结果状态码,message:处理结果描述信息,data:[User] }
	 */
	@RequestMapping(value = "/joinUserList")
	@ResponseBody
	public Map<String, Object> joinUsersList(HttpServletRequest httpServletRequest,
			@RequestParam(value = "id", required = true) Integer id,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "pagesize", required = false) Integer pagesize){
		
		logger.info("joinUserList-->params id:{}, page:{}, pageSize:{}", new Object[]{id, page, pagesize});
		if (null == page || page == 0) {
			page = 1;
		}

		if (null == pagesize || pagesize == 0) {
			pagesize = 20;
		}
		
		try {
			Map<String,Object> map = partyService.joinUsersList(id, page, pagesize);
			logger.info("return map:{}", map);
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			return MapResult.failMap();
		}
	}

	
	/**
	 * 取消聚会
	 * @param id 聚会id
	 * @param uid 登陆用户id
	 * @return {apicode:处理结果状态码,message:处理结果描述信息,data:[UserId 参加聚会的用户id] }
	 */
	@RequestMapping(value = "/cancel")
	@ResponseBody
	public Map<String,Object> cancelParty(HttpServletRequest httpServletRequest,
			@RequestParam(value = "id", required = true) Integer id,
			@RequestParam(value = "uid", required = true) Integer uid){
		
		logger.info("cancel-->id:{}, uid:{}", id, uid);
		
		try {
			Map<String,Object> map = partyService.cancelParty(id, uid);
			logger.info("return map:{}", map);
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			return MapResult.failMap();
		}
		
	}
	
}
