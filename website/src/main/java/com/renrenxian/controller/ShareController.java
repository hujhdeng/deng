package com.renrenxian.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.renrenxian.manage.model.User;
import com.renrenxian.manage.service.UserService;


@Controller
@RequestMapping("/share")
public class ShareController {

	private static Logger logger = LoggerFactory.getLogger(ShareController.class);
	@Resource
	private UserService userService;
	
	public ModelAndView fenxiang(HttpServletRequest httpServletRequest,
			@RequestParam(value = "uid", required = true) Integer uid,
			@RequestParam(value = "sat", required = true)String sat){
		try{
			
			User user = userService.getById(uid);
			Integer count = userService.findByIdCount(uid);
			ModelAndView mv = new ModelAndView();
			mv.addObject("user", user);
			mv.addObject("count", count);
			
		}catch(Exception ex) {
			logger.error("", ex);
		}
		return null;
	}
	
}
