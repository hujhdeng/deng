package com.renrenxian.controller;

import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.renrenxian.common.util.AndroidPushMessageSample;
import com.renrenxian.common.util.IosPushNotificationSample;
import com.renrenxian.manage.model.Jccpush;
import com.renrenxian.manage.service.JccpushService;
import com.renrenxian.util.result.MapResult;

@Controller
@RequestMapping("/jcc")
public class AndroidPushNotificationController {
	private static Logger logger = LoggerFactory.getLogger(AndroidPushNotificationController.class);
	
	@Resource
	private JccpushService jccpushService;
	
	/**
	 * 安装应用时，绑定百度推送账号和设备类型
	 * @author xulihua
	 * @param uid 用户id
	 * @param pushid 百度推送id，应该是对应的ChannelId
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
	 * iso推送
	 * @author xulihua
	 * @param httpServletRequest
	 * @param pushid
	 * @param msg
	 * @return
	 */
	@RequestMapping(value = "/ipush")
	@ResponseBody
	public Map<String, Object> ipush(HttpServletRequest httpServletRequest,
			@RequestParam(value = "pushid", required = true)String pushid,
			@RequestParam(value = "msg", required = true)String msg){
		try {
			msg = new String(msg.getBytes("iso-8859-1"), "utf-8");
			String push = IosPushNotificationSample.push(pushid, msg);
			Map<String,Object> map = MapResult.initMap();
			map.put("mes", push);
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			return MapResult.failMap();
		}
		
	}
	
	/**
	 * Android推送
	 * @author xulihua
	 * @param httpServletRequest
	 * @param pushid
	 * @param msg
	 * @return
	 */
	@RequestMapping(value = "/apush")
	@ResponseBody
	public Map<String, Object> apush(HttpServletRequest httpServletRequest,
			@RequestParam(value = "pushid", required = true)String pushid,
			@RequestParam(value = "msg", required = true)String msg){
		try {
			msg = new String(msg.getBytes("iso-8859-1"), "utf-8");
			String push = AndroidPushMessageSample.push(pushid, msg);
			Map<String,Object> map = MapResult.initMap();
			map.put("mes", push);
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
	 * @param pushid
	 * @param msg
	 * @return
	 */
	@RequestMapping(value = "/push")
	@ResponseBody
	public Map<String, Object> push(HttpServletRequest httpServletRequest,
			@RequestParam(value = "uid", required = true)String uid,
			@RequestParam(value = "msg", required = true)String msg){
		try {
			msg = new String(msg.getBytes("iso-8859-1"), "utf-8");
			logger.debug("msg:"+ msg);
			Jccpush jp= jccpushService.getById(Integer.valueOf(uid));
			
			 String push;
			if ("3".equals(jp.getDevice())) {
				 push = AndroidPushMessageSample.push(jp.getPushid(), msg);
			} else {
				 push = IosPushNotificationSample.push(jp.getPushid(), msg);
			}
			logger.debug("push   over");
			Map<String,Object> map = MapResult.initMap();
			map.put("mes", push);
			return map;
			
		} catch (Exception e) {
			e.printStackTrace();
			return MapResult.failMap();
		}
		
	}
	
	
}
