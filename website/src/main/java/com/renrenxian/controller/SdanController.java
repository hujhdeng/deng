package com.renrenxian.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.renrenxian.common.util.Page;
import com.renrenxian.manage.model.Sdan;
import com.renrenxian.manage.service.SdanService;
import com.renrenxian.util.result.MapResult;

/**
 * 甩单相关api请求方法
 *
 */
@Controller
@RequestMapping("/sdan")
public class SdanController {

	private static Logger logger = LoggerFactory.getLogger(SdanController.class);
	
	@Resource
	private SdanService sdanService;

	/**
	 * 发起甩单
	 * @param httpServletRequest
	 * @param uid 登陆用户的id 发起人uid
	 * @param title 甩单标题
	 * @param type 业务类型
	 * @param area 办理地点
	 * @param money 贷款金额
	 * @param limitdate 放款期限
	 * @param howlong 用款周期
	 * @param content 甩单介绍
	 * @return {apicode:处理结果状态码,message:处理结果描述信息,data:处理结果主体数据Sdan }
	 */
	@RequestMapping(value = "/add")
	@ResponseBody
	public Map<String, Object> add(HttpServletRequest httpServletRequest,
			@RequestParam(value = "uid", required = true)Integer uid,
			@RequestParam(value = "title", required = true)String title,
			@RequestParam(value = "type", required = true)String type,
			@RequestParam(value = "area", required = true)String area,
			@RequestParam(value = "money", required = true)String money,
			@RequestParam(value = "limitdate", required = true)String limitdate,
			@RequestParam(value = "howlong", required = true)String howlong,
			@RequestParam(value = "content", required = false)String content) {
		
		
		logger.info("add--> uid:{}, title:{}, type:{}, area:{}, money:{}, limitdate:{}, howlong:{},content:{}",
				new Object[]{uid, title, type, area, money, limitdate, howlong, content}
				);
		if (StringUtils.isEmpty(title) || StringUtils.isEmpty(type)
				|| StringUtils.isEmpty(area) || StringUtils.isEmpty(money) 
				|| StringUtils.isEmpty(limitdate) || StringUtils.isEmpty(howlong) 
				||  StringUtils.isEmpty(content)) {
			return MapResult.initMap(1001, "参数错误");
		}
		
		try {			
			return sdanService.create(uid, title, type, area, money, limitdate, howlong, content);
		} catch (Exception e) {
			return MapResult.failMap();
		}
		
		
	}

	
	@RequestMapping(value = "/update")
	@ResponseBody
	public Map<String, Object> update(HttpServletRequest httpServletRequest,
			@RequestParam(value = "id", required = true)Integer id,
			@RequestParam(value = "uid", required = true)Integer uid,
			@RequestParam(value = "title", required = true)String title,
			@RequestParam(value = "type", required = true)String type,
			@RequestParam(value = "area", required = true)String area,
			@RequestParam(value = "money", required = true)String money,
			@RequestParam(value = "limitdate", required = true)String limitdate,
			@RequestParam(value = "howlong", required = true)String howlong,
			@RequestParam(value = "content", required = false)String content) {
		
		logger.info("update -->id:{}, uid:{}, title:{}, type:{}, area:{}, money:{}, limitdate:{}, howlong:{},content:{}",
				new Object[]{id, uid, title, type, area, money, limitdate, howlong, content}
				);
		if (StringUtils.isEmpty(title) || StringUtils.isEmpty(type)
				|| StringUtils.isEmpty(area) || StringUtils.isEmpty(money) 
				|| StringUtils.isEmpty(limitdate) || StringUtils.isEmpty(howlong) 
				||  StringUtils.isEmpty(content)) {
			return MapResult.initMap(1001, "参数错误");
		}
		
		if(id == null) {
			return MapResult.initMap(1002, "参数错误");
		}
		
		try {			
			return sdanService.update(id, uid, title, type, area, money, limitdate, howlong, content);
			
		} catch (Exception e) {
			return MapResult.failMap();
		}
		
		
	}
	
	/**
	 * 根据参数条件查找到的甩单列表分页
	 * @param httpServletRequest
	 * @param uid 登陆用户uid 可以为空 
	 * @param type 甩单类型 可以为空 
	 * @param area 所属区域 可以为空
	 * @param state 甩单状态 可以为空
	 * @param pageno 分页页码 可以为空 
	 * @param pagesize 分页大小 可以为空 
	 * @return {"apicode":状态,"data":List<Sdan>,"message":处理结果描述}
	 */
	@RequestMapping(value = "/list")
	@ResponseBody
	public Map<String, Object> list(HttpServletRequest httpServletRequest,
			@RequestParam(value = "uid", required = false) Integer uid,
			@RequestParam(value = "type", required = false) String type,
			@RequestParam(value = "area", required = false) String area,
			@RequestParam(value = "state", required = false) String state,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "pagesize", required = false) Integer pagesize) {

		logger.info("list--> params uid:{}, type:{}, area:{}, state:{}, state:{},page:{}, pagesize:{}",
				new Object[]{uid, type, area, state, page, pagesize}
				);
		if (null == page || page == 0) {
			page = 1;
		}

		if (null == pagesize || pagesize == 0) {
			pagesize = 20;
		}
		try {
			Page<Sdan> page1 = sdanService.list(uid, type, area, state, page, pagesize);
			if(page1 != null && page1.getResult() != null) {
				Map<String, Object> map = MapResult.initMap();
				/**
				List<Sdan> list = new ArrayList<Sdan>();
				for(Sdan sdan : page1.getResult()) {
					sdan.setRegtimeString(DateUtil.date2Str(sdan.getRegtime()));
					list.add(sdan);
				}
				map.put("data", list);
				**/
				map.put("data", page1.getResult());
				logger.info("return map:{}", map);
				return map;
			}else {
				return MapResult.failMap();
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			return MapResult.failMap();
		}
	}
	
	/**
	 * 获取甩单详情
	 * @param httpServletRequest
	 * @param id 甩单id
	 * @param uid 登陆用户id
	 * @return {"apicode":状态,"data":{Sdan属性值,isJoin:登录用户是否参加甩单},"message":处理结果描述}
	 */
	@RequestMapping(value = "/info")
	@ResponseBody
	public Map<String, Object> info(HttpServletRequest httpServletRequest,
			@RequestParam(value = "id", required = true) Integer id,
			@RequestParam(value = "uid", required = false) Integer uid){
		
		logger.info("info-->id:{},uid:{}", id, uid);
		try {
			Map<String,Object> map = sdanService.getSdanInfo(id, uid);
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
	@RequestMapping(value = "/join")
	@ResponseBody
	public Map<String, Object> join(HttpServletRequest httpServletRequest,
			@RequestParam(value = "id", required = true) Integer id,
			@RequestParam(value = "uid", required = true) Integer uid,
			@RequestParam(value = "message", required = true) String message){
		
		logger.info("join--> id:{}, uid:{}, message:{}", new Object[]{id, uid, message});
		try {
			
			if (StringUtils.isEmpty(message) ) {
				return MapResult.initMap(1001, "参数错误，留言内容不能为空");
			}
			
			Map<String,Object> map = sdanService.join(id, uid,message);
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			return MapResult.failMap();
		}
		
	}
	
	
	
	/**
	 * 分页获取参加id甩单的用户的列表
	 * @param httpServletRequest
	 * @param id 甩单id
	 * @param pageno 分页页码
	 * @param pagesize 分页大小
	 * @return {apicode:处理结果状态码,message:处理结果描述信息,data:[User] }
	 */
	@RequestMapping(value = "/joinUserList")
	@ResponseBody
	public Map<String, Object> joinUsersList(HttpServletRequest httpServletRequest,
			@RequestParam(value = "id", required = true) Integer id,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "pagesize", required = false) Integer pagesize){
		
		logger.info("joinUserList-->id:{},page:{},pagesize:{}", new Object[]{id, page, pagesize});
		
		if (null == page || page == 0) {
			page = 1;
		}

		if (null == pagesize || pagesize == 0) {
			pagesize = 20;
		}
		
		try {
			Map<String,Object> map = sdanService.joinUsersList(id, page, pagesize);
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			return MapResult.failMap();
		}
	}
	
	/**
	 * 
	 * 甩单发起接洽
	 * @param id 甩单id
	 * @param uid 登陆用户id，即甩单人id
	 * @param reid 接洽人id
	 * @return {apicode:处理结果状态码,message:处理结果描述信息,data:{"id":甩单id,"reid":"37"} }
	 */
	@RequestMapping(value = "/connect")
	@ResponseBody
	public Map<String, Object> sdanConnect(HttpServletRequest httpServletRequest,
			@RequestParam(value = "id", required = true) Integer id,
			@RequestParam(value = "uid", required = true) Integer uid,
			@RequestParam(value = "reid", required = true) Integer reid){
		
		logger.info("connect--> id:{}, uid:{], reid:{}", new Object[]{id, uid, reid});
		
		try {
			Map<String,Object> map = sdanService.sdanConnect(id, uid, reid);
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			return MapResult.failMap();
		}
	}
	
	/**
	 * 甩单取消所有接洽
	 * @param id 甩单id
	 * @param uid 登陆用户id，即甩单人id
	 * @return {apicode:处理结果状态码,message:处理结果描述信息,data:{"id":甩单id} }
	 */
	@RequestMapping(value = "/disconnect")
	@ResponseBody
	public Map<String, Object> disConnect(HttpServletRequest httpServletRequest,
			@RequestParam(value = "id", required = true) Integer id,
			@RequestParam(value = "uid", required = true) Integer uid){
		
		logger.info("disconnect--> id:{}, uid:{}", id, uid);
		
		try {
			Map<String,Object> map = sdanService.disConnect(id, uid);
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			return MapResult.failMap();
		}
	}
	
	/**
	 * 甩单取消所有接洽
	 * @param id 甩单id
	 * @param seid 发信人id
	 * @param reid 收信人id  reid
	 * @param message 聊天内容
	 * @return {apicode:处理结果状态码,message:处理结果描述信息,data:{"seid":发信人,"reid":收信人id} }
	 */
	@RequestMapping(value = "/chat/add")
	@ResponseBody
	public Map<String, Object> chatAdd(HttpServletRequest httpServletRequest,
			@RequestParam(value = "id", required = true) Integer id,
			@RequestParam(value = "seid", required = true) Integer seid,
			@RequestParam(value = "reid", required = true) Integer reid,
			@RequestParam(value = "message", required = true) String message){
		
		logger.info("chat/add-->params id:{}, seid:{}, reid:{}, message:{}", new Object[]{id, seid, reid, message});
		try {
			if (StringUtils.isEmpty(message) ) {
				return MapResult.initMap(1001, "参数错误，留言内容不能为空");
			}
			Map<String,Object> map = sdanService.addChat(id, seid, reid, message);
			logger.info("return map:{}", map);
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			return MapResult.failMap();
		}
	}

	/**
	 * 分页获取甩单聊天内容列表
	 * @param id 甩单id
	 * @param reid 收、发件人
	 * @param pageNo 分页页码
	 * @param pageSize 分页大小
	 * @return {apicode:处理结果状态码,message:处理结果描述信息,data:[SdanChat] }
	 */
	@RequestMapping(value = "/chat/list")
	@ResponseBody
	public Map<String,Object> chatList(HttpServletRequest httpServletRequest,
			@RequestParam(value = "id", required = true) Integer id,
			@RequestParam(value = "reid", required = false) Integer reid,
			@RequestParam(value = "page", required = false) Integer page, 
			@RequestParam(value = "pagesize", required = false) Integer pagesize){
		
		logger.info("chat/list-->id:{}, reid:{}, page:{}, pagesize:{}", new Object[]{id, reid, page, pagesize});
		
		try {
			if (null == page || page == 0) {
				page = 1;
			}

			if (null == pagesize || pagesize == 0) {
				pagesize = 100;
			}
			
			Map<String,Object> map = sdanService.chatList(id, reid, page, pagesize);
			logger.info("return map:{}", map);
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			return MapResult.failMap();
		}
	}
	
	/**
	 * 甩单人评价并结束单靠谱指数+5
	 * @param id 甩单id
	 * @param uid 登陆用户id，即发起甩单的用户id
	 * @param assessnum 评价分数 1差，2一般，3好
	 * @param assesstxt 评价内容
	 * @return {apicode:处理结果状态码,message:处理结果描述信息,data:{kpno:被评价人的靠谱指数} }
	 */
	@RequestMapping(value = "/chat/assess")
	@ResponseBody
	public Map<String,Object> assess(HttpServletRequest httpServletRequest,
			@RequestParam(value = "id", required = true) Integer id,
			@RequestParam(value = "uid", required = true) Integer uid,
			@RequestParam(value = "assessnum", required = true) Integer assessnum,
			@RequestParam(value = "assesstxt", required = true) String assesstxt){
		
		logger.info("chat/assess-->id:{}, uid:{}, assessnum:{}, assesstxt:{}", new Object[]{id,uid,assessnum, assesstxt});
		
		try {
			
			Map<String,Object> map = sdanService.assess(id, uid, assessnum, assesstxt);
			logger.info("return map:{}", map);
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			return MapResult.failMap();
		}
	}
	
	
	@RequestMapping(value = "/delete")
	@ResponseBody
	public Map<String,Object> deleteSdan(HttpServletRequest httpServletRequest,
			@RequestParam(value = "id", required = true) Integer id,
			@RequestParam(value = "uid", required = true) Integer uid){
		
		logger.info("delete-->id:{}, uid:{}", id, uid);
		try {
			Map<String,Object> map = sdanService.deleteSdan(id, uid);
			logger.info("return map:{}", map);
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			return MapResult.failMap();
		}
		
	}
	
}
