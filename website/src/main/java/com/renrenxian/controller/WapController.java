package com.renrenxian.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.renrenxian.common.util.ConfigUtil;
import com.renrenxian.common.util.StringUtil;
import com.renrenxian.manage.model.Info;
import com.renrenxian.manage.model.Party;
import com.renrenxian.manage.model.Sdan;
import com.renrenxian.manage.model.User;
import com.renrenxian.manage.service.InfoService;
import com.renrenxian.manage.service.PartyService;
import com.renrenxian.manage.service.SdanService;
import com.renrenxian.manage.service.UserService;

@Controller
@RequestMapping("/wap")
public class WapController {
	@Resource
	private SdanService sdanService;
	
	@Resource
	private PartyService partyService;
	
	@Resource
	private UserService userService;
	
	@Resource
	private InfoService infoService;

	@RequestMapping("/wxfx/sdan")
	public ModelAndView sdan(HttpServletRequest httpServletRequest,
			@RequestParam(value = "uid", required = true) Integer uid,
			@RequestParam(value = "id", required = true) Integer id,
			@RequestParam(value = "sat", required = true)String sat) throws UnsupportedEncodingException{
		Sdan sd = sdanService.getById(id);
		if(sd==null){
			//如果sdan不存在，如何处理
		}
		
		ModelAndView mav = new ModelAndView();
		
		sd.setuName(URLDecoder.decode(sd.getuName(), ConfigUtil.getStringValue("urlencoder.enc")));
		mav.addObject("sd", sd);
		mav.addObject("wxuid", uid);
		mav.addObject("id", id);
		mav.addObject("sat", sat);
		mav.setViewName("wap/wxfx_sdan");
		
		return mav;
	}
	
	@RequestMapping("/wxfx/sdan/log")
	public ModelAndView sdanLog(HttpServletRequest httpServletRequest,
			@RequestParam(value = "uid", required = true) Integer uid,
			@RequestParam(value = "id", required = true) Integer id,
			@RequestParam(value = "content", required = true)String content){
		ModelAndView mav = new ModelAndView();
		Sdan sd = sdanService.getById(id);
		if(sd==null){
			//如果sdan不存在，如何处理
		}
		
		User u = userService.getById(uid);
		
		
		
		Info info = infoService.getInfoUpdateNum(40);
		mav.addObject("user_joinnum", info.getUserJoinnum());
		mav.addObject("content", content);
		mav.addObject("sd", sd);
		mav.addObject("u", u);
		mav.addObject("wxuid", uid);
		mav.setViewName("wap/wxfx_sdan_log");
		
		return mav;
	}
	
	
	@RequestMapping("/wxfx/party")
	public ModelAndView party(HttpServletRequest httpServletRequest,
			@RequestParam(value = "uid", required = true) Integer uid,
			@RequestParam(value = "id", required = true) Integer id) throws UnsupportedEncodingException{
		ModelAndView mav = new ModelAndView();
		Party p = partyService.getById(id);
		if(p==null){
			//如果sdan不存在，如何处理
		}
		
		p.setuName(URLDecoder.decode(p.getuName(), ConfigUtil.getStringValue("urlencoder.enc")));
		
		Info info = infoService.getInfoUpdateNum(40);
		mav.addObject("user_joinnum", info.getUserJoinnum());
		mav.addObject("m", p);
		mav.addObject("wxuid", uid);
		mav.setViewName("wap/wxfx_party");
		
		return mav;
	}
	
	
	@RequestMapping("/wxfx/party/log")
	public ModelAndView partyLog(HttpServletRequest httpServletRequest,
			@RequestParam(value = "uid", required = true) Integer uid,
			@RequestParam(value = "id", required = true) Integer id){
		ModelAndView mav = new ModelAndView();
		Party p = partyService.getById(id);
		if(p==null){
			//如果sdan不存在，如何处理
		}
		
		
		User u = userService.getById(uid);
		
		
		Info info = infoService.getInfoUpdateNum(40);
		mav.addObject("user_joinnum", info.getUserJoinnum());
		mav.addObject("m", p);
		mav.addObject("u", u);
		mav.addObject("wxuid", uid);
		mav.addObject("id", id);
		mav.setViewName("wap/wxfx_party_log");
		
		return mav;
	}
	
	
	@RequestMapping("/wx/log")
	public ModelAndView wxwx(HttpServletRequest httpServletRequest,
			@RequestParam(value = "uid", required = true) Integer uid){
		ModelAndView mav = new ModelAndView();
		User u = userService.getById(uid);
		if(u==null){
			//如果u不存在，如何处理
		}
		
		Info info = infoService.getInfoUpdateNum(40);
		mav.addObject("user_joinnum", info.getUserJoinnum());
		mav.addObject("u", u);
		mav.setViewName("wap/wx_log");
		
		return mav;
	}
	
	
	@RequestMapping("/wx/fx")
	public ModelAndView wxfx(HttpServletRequest req,
			@RequestParam(value = "uid", required = true) Integer uid){
		ModelAndView mav = new ModelAndView();
		User u = userService.getById(uid);
		if(u==null){
			//如果u不存在，如何处理
		}
		
		Info info = infoService.getInfoUpdateNum(40);
		mav.addObject("user_joinnum", info.getUserJoinnum());
		mav.addObject("u", u);
		mav.setViewName("wap/fenxiang");
		
		return mav;
	}
	
	
	
}
