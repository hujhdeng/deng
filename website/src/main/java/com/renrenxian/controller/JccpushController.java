package com.renrenxian.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.renrenxian.manage.service.JccpushService;
import com.renrenxian.util.result.MapResult;

@Controller
@RequestMapping("/jcc")
public class JccpushController {
	private static Logger logger = LoggerFactory.getLogger(JccpushController.class);
	
	@Resource
	private JccpushService jccpushService;
	
	/**
	 * 安装应用时，绑定百度推送账号和设备类型
	 * @author xulihua
	 * @param uid 用户id
	 * @param pushid 百度推送id，应该是对应的百度推送的userId
	 * @param deviceType 设备类型
	 * @return
	 */
	@RequestMapping(value = "/bind")
	@ResponseBody
	public Map<String, Object> bind(HttpServletRequest httpServletRequest,
			@RequestParam(value = "uid", required = true)String uid,
			@RequestParam(value = "pushid", required = true)String pushid,
			@RequestParam(value = "deviceType", required = true)String deviceType){
		try {
			Map<String,Object> map = jccpushService.bind(uid, pushid, deviceType);
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			return MapResult.failMap();
		}
	}
	
	/**
	 * 自适应匹配设备推送
	 * @author xulihua
	 * @param httpServletRequest
	 * @param uid 登陆用户，发送消息id
	 * @param msg 消息体
	 * @return
	 */
	@RequestMapping(value = "/push")
	@ResponseBody
	public Map<String, Object> push(HttpServletRequest httpServletRequest,
			@RequestParam(value = "uid", required = true)Integer uid,
			@RequestParam(value = "reid", required = true)Integer reid,
			@RequestParam(value = "msg", required = true)String msg){
		try {
			msg = new String(msg.getBytes("iso-8859-1"), "utf-8");
			Map<String,Object> map = jccpushService.sendMessage(uid, reid, msg);
			
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			return MapResult.failMap();
		}
		
	}
	
	
	
	
}
