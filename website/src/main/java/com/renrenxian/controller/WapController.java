package com.renrenxian.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.renrenxian.manage.model.Party;
import com.renrenxian.manage.model.Sdan;
import com.renrenxian.manage.service.PartyService;
import com.renrenxian.manage.service.SdanService;

@Controller
@RequestMapping("/wap")
public class WapController {
	
	@Resource
	private SdanService sdanService;
	
	@Resource
	private PartyService partyService;

	@RequestMapping("/wxfx/sdan")
	public ModelAndView sdan(HttpServletRequest httpServletRequest,
			@RequestParam(value = "uid", required = true) Integer uid,
			@RequestParam(value = "id", required = true) Integer id,
			@RequestParam(value = "sat", required = true)String sat){
		Sdan sd = sdanService.getById(id);
		if(sd==null){
			//如果sdan不存在，如何处理
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("sd", sd);
		mav.setViewName("wap/wxfx_sdan");
		
		return mav;
	}
	
	
	@RequestMapping("/wxfx/party")
	public ModelAndView party(HttpServletRequest httpServletRequest,
			@RequestParam(value = "uid", required = true) Integer uid,
			@RequestParam(value = "id", required = true) Integer id,
			@RequestParam(value = "sat", required = true)String sat){
		Party p = partyService.getById(id);
		if(p==null){
			//如果sdan不存在，如何处理
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("m", p);
		mav.setViewName("wap/wxfx_party");
		
		return mav;
	}
}
