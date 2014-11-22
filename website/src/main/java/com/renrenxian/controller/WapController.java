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
import com.renrenxian.manage.model.Party;
import com.renrenxian.manage.model.Sdan;
import com.renrenxian.manage.model.User;
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
		Sdan sd = sdanService.getById(id);
		if(sd==null){
			//如果sdan不存在，如何处理
		}
		
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("content", content);
		mav.addObject("sd", sd);
		mav.setViewName("wap/wxfx_sdan_log");
		
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
	
	
	@RequestMapping("/wx/wx")
	public ModelAndView wxwx(HttpServletRequest httpServletRequest,
			@RequestParam(value = "uid", required = true) Integer uid){
		User u = userService.getById(uid);
		if(u==null){
			//如果u不存在，如何处理
		}
		
		/*$rs=mysql_query("select user_joinnum from info",$con);
  $myrow = mysql_fetch_array($rs);
  $user_joinnum=$myrow['user_joinnum']+1;
$sql="update info set user_joinnum='".$user_joinnum."'";
mysql_query($sql)*/
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("u", u);
		mav.addObject("user_joinnum", 1);
		mav.setViewName("wap/wx_log");
		
		return mav;
	}
	
	
	
}
