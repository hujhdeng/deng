package com.renrenxian.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.renrenxian.manage.model.Info;
import com.renrenxian.manage.service.InfoService;
import com.renrenxian.util.result.MapResult;


@Controller
@RequestMapping("/info")
public class InfoController {
	
	private static Logger logger = LoggerFactory.getLogger(InfoController.class);

	@Resource
	private InfoService infoService;
	
	// 获取版本信息
	@RequestMapping(value = "/ver")
	@ResponseBody
	public Map<String, Object> ver(HttpServletRequest httpServletRequest
			) {
		logger.info("ver...begin...");
		try {
			Info info = infoService.getById(40);
			Map<String, Object> map = MapResult.initMap();
			Map<String, Object> m = new HashMap<String, Object>();
			m.put("ver", info.getVer());
			m.put("type", info.getType());
			m.put("message", info.getMessage());
			map.put("data", m);
			return map;
		} catch (Exception ex) {
			logger.error("", ex);
			return MapResult.failMap();
		}
	}
	
	// getabout
	@RequestMapping(value = "/about")
	@ResponseBody
	public Map<String, Object> about(HttpServletRequest httpServletRequest
			) {
		logger.info("about...begin...");
		try {
			Info info = infoService.getById(40);
			Map<String, Object> map = MapResult.initMap();
			
			Map<String, Object> m = new HashMap<String, Object>();
			m.put("aboutkpno", info.getAboutkpno());
			m.put("aboutus", info.getAboutus());
			map.put("data", m);
			return map;
		} catch (Exception ex) {
			logger.error("", ex);
			return MapResult.failMap();
		}
	}
	
	@RequestMapping(value = "/law")
	public String law() {
		return "law";
	}
	
}
