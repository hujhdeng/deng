package com.renrenxian.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.util.JSONPObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.renrenxian.common.util.ValidUtils;
import com.renrenxian.manage.service.YzmService;
import com.renrenxian.manage.service.impl.UserServiceImpl;
import com.renrenxian.util.result.MapResult;

@Controller
@RequestMapping("/user/yzm")
public class YzmController {

	private static Logger logger = LoggerFactory.getLogger(YzmController.class);
	
	@Resource
	private YzmService yzmService;
	
	@RequestMapping(value = "/sendSms")
	@ResponseBody
	public Map<String, Object> sendSms(
			HttpServletRequest req,
			@RequestParam(value = "phone", required = true) String phone) {
		
		logger.info("sendSms-->phone:{}", phone);
		Map<String,Object> map;
		// 验证
		if(!ValidUtils.validMobile(phone)) {
			map = MapResult.initMap(2004, "手机号码不正确");
		}
		
		boolean b = yzmService.send(phone);
		
		if(b){
			map =  MapResult.initMap();
		}else{
			map = MapResult.initMap(10001, "发送失败");
		}
		
		// JSONPObject jsonp = new JSONPObject(req.getParameter("callback"),map);
		//return jsonp;
		return map;
	}
	
}
