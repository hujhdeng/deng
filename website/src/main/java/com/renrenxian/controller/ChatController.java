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
import com.renrenxian.common.util.StringUtil;
import com.renrenxian.manage.model.Chat;
import com.renrenxian.manage.model.ChatUser;
import com.renrenxian.manage.service.ChatService;
import com.renrenxian.manage.service.ChatUserService;
import com.renrenxian.util.result.MapResult;

@Controller
@RequestMapping("/chat")
public class ChatController {

	private static Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	@Resource
	private ChatService chatService;

	@Resource
	private ChatUserService chatUserService;

	// 聊天之写入聊天记录接口
	// seid=35&reid=36&content=聊天内容
	@RequestMapping(value = "/send")
	@ResponseBody
	public Map<String, Object> send(HttpServletRequest httpServletRequest,
			@RequestParam(value = "seid", required = true) String seid,
			@RequestParam(value = "reid", required = true) String reid,
			@RequestParam(value = "content", required = true) String content) {
		// 检查参数
		
		logger.info("send seid:{}, reid:{}, content:{}", new Object[]{seid, reid, content});
		if (StringUtils.isEmpty(seid) || StringUtils.isEmpty(reid)
				|| StringUtils.isEmpty(content)) {
			return MapResult.initMap(1001, "参数错误");
		}
		int sendid = StringUtil.parseInt(seid, 0);
		int reviceid = StringUtil.parseInt(reid, 0);
		if (sendid == 0 || reviceid == 0) {
			return MapResult.initMap(1001, "用户错误");
		}
		try {
			Map<String, Object> map = chatService.send(sendid, reviceid, content);
			logger.info("return map: {}", map);
			return map;
		} catch (Exception ex) {
			return MapResult.failMap();
		}
	}

	// 聊天之获取聊天记录列表接口
	@RequestMapping(value = "/list")
	@ResponseBody
	public Map<String, Object> list(HttpServletRequest httpServletRequest,
			@RequestParam(value = "seid", required = true) String seid,
			@RequestParam(value = "reid", required = true) String reid,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "pagesize", required = false) Integer pagesize) {

		// 检查参数
		int sendid = StringUtil.parseInt(seid, 0);
		int reviceid = StringUtil.parseInt(reid, 0);
		if (sendid == 0 || reviceid == 0) {
			return MapResult.initMap(1001, "用户错误");
		}

		if (null == page || page == 0) {
			page = 1;
		}

		if (null == pagesize || pagesize == 0) {
			pagesize = 20;
		}
		try {
			Page<Chat> page1 = chatService.list(sendid, reviceid, page,
					pagesize);
			Map<String, Object> map = MapResult.initMap();
			map.put("data", page1.getResult());
			
			logger.info("return map:{}", map);
			
			return map;
		} catch (Exception ex) {
			return MapResult.failMap();
		}
	}

	// 聊天过的人列表接口
	@RequestMapping(value = "/listuser")
	@ResponseBody
	public Map<String, Object> listUser(HttpServletRequest httpServletRequest,
			@RequestParam(value = "uid", required = true) String uid,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "pagesize", required = false) Integer pagesize) {

		logger.info("listuser-->uid:{}, page:{}, pagesize:{}", new Object[]{uid, page, pagesize});
		
		int id = StringUtil.parseInt(uid, 0);
		if (id == 0) {
			return MapResult.initMap(1001, "用户错误");
		}

		if (null == page || page == 0) {
			page = 1;
		}

		if (null == pagesize || pagesize == 0) {
			pagesize = 20;
		}
		try {
			// Page<ChatUser> page1 = chatUserService.findBySeid(id, page, pagesize);
			Page<ChatUser> page1 = chatUserService.findByReid(id, page, pagesize);
			Map<String, Object> map = MapResult.initMap();
			map.put("data", page1.getResult());
			logger.info("return map:{}", map);
			return map;
		} catch (Exception ex) {
			return MapResult.failMap();
		}
	}

}
