package com.renrenxian.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.renrenxian.common.util.ValidUtils;
import com.renrenxian.manage.service.YzmService;
import com.renrenxian.util.result.MapResult;

@Controller
@RequestMapping("/user/yzm")
public class YzmController {

	@Resource
	private YzmService yzmService;
	
	@RequestMapping(value = "/sendSms")
	@ResponseBody
	public Map<String, Object> sendSms(
			HttpServletRequest httpServletRequest,
			@RequestParam(value = "phone", required = true) String phone) {
		
		// 验证
		if(!ValidUtils.validMobile(phone)) {
			return MapResult.initMap(2004, "手机号码不正确");
		}
		
		boolean b = yzmService.send(phone);
		if(b){
			return MapResult.initMap();
		}else{
			return MapResult.initMap(10001, "发送失败");
		}
	}
	
}
