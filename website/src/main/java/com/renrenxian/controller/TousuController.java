package com.renrenxian.controller;

import java.util.Date;
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

import com.renrenxian.common.util.StringUtil;
import com.renrenxian.manage.model.Tousu;
import com.renrenxian.manage.service.TousuService;
import com.renrenxian.manage.service.UserService;
import com.renrenxian.util.result.MapResult;

@Controller
@RequestMapping("/tousu")
public class TousuController {

	private static Logger logger = LoggerFactory.getLogger(TousuController.class);

	@Resource
	private TousuService tousuService;
	@Resource
	private UserService userService;
	
	/**
	 * 
	 * @param httpServletRequest
	 * @param seid 投诉人id
	 * @param reid seid (投诉必须，意见反馈不用)
	 * @param type （1，投诉，2建议）
	 * @param content 投诉内容
	 * @return
	 */
	@RequestMapping(value = "/submit")
	@ResponseBody
	public Map<String, Object> reg(HttpServletRequest httpServletRequest,
			@RequestParam(value = "seid", required = true) String seid,
			@RequestParam(value = "reid", required = true) String reid,
			@RequestParam(value = "type", required = true) String type,
			@RequestParam(value = "content", required = true) String content
			){
		
		// 检查
		if(!("1".equals(type) || "2".equals(type))) {
			return MapResult.initMap(1002, "请提交投诉建议");
		}
		
		int sid = StringUtil.parseInt(seid, 0);
		if(sid == 0) {
			return MapResult.initMap(1003, "sid用户错误");
		}
		
		if("1".equals(type)) {
			int rid = StringUtil.parseInt(reid, 0);
			if(rid == 0) {
				return MapResult.initMap(1004, "rid用户错误");
			}
		}
		
		if(StringUtils.isEmpty(content)) {
			return MapResult.initMap(1004, "请提交投诉建议内容");
		}
		
		Tousu tousu = new Tousu();
		tousu.setContent(content);
		tousu.setRegtime(new Date());
		tousu.setReid(reid);
		tousu.setSeid(seid);
		tousu.setType(type);
		
		try{
			tousuService.save(tousu);
			return MapResult.initMap();
		}catch(Exception ex) {
			logger.error("", ex);
			return MapResult.initMap(1005, "提交错误");
		}
	}
	
	
}
