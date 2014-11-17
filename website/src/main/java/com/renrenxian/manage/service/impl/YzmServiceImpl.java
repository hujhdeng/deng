package com.renrenxian.manage.service.impl;

import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.renrenxian.common.util.Charsets;
import com.renrenxian.common.util.ConfigUtil;
import com.renrenxian.common.util.HttpClientUtils;
import com.renrenxian.common.util.StringUtil;
import com.renrenxian.manage.dao.YzmDao;
import com.renrenxian.manage.model.Yzm;
import com.renrenxian.manage.mybatis.EntityDao;
import com.renrenxian.manage.service.YzmService;
import com.renrenxian.manage.service.base.impl.BaseServiceMybatisImpl;

@Service("yzmService")
@Transactional
public class YzmServiceImpl extends BaseServiceMybatisImpl<Yzm, Integer>
		implements YzmService {

	private static Logger logger = LoggerFactory
			.getLogger(YzmServiceImpl.class);

	@Resource
	private YzmDao yzmDao;

	@Override
	protected EntityDao<Yzm, Integer> getEntityDao() {
		return yzmDao;
	}

	@Override
	public boolean send(String phone) {
		try {
			// 产生随机数
			String str = StringUtil.randomNum(4);

			Yzm yzm = new Yzm();
			yzm.setPhone(phone);
			yzm.setYzm(str);
			yzm.setRegtime(new Date());
			yzmDao.save(yzm);

			/**
			String content = ConfigUtil.getStringValue("sms.content") + str;
			logger.info("str:{}", content);
			String url = ConfigUtil.getStringValue("sms.url");
			Map<String, String> params = new HashMap<String, String>();
			params.put("username", ConfigUtil.getStringValue("sms.username"));
			params.put("password", ConfigUtil.getStringValue("sms.password"));
			params.put("mobile", phone);
			params.put("apikey", ConfigUtil.getStringValue("sms.apikey"));
			// params.put("content",StringUtil.covertCode(content, "UTF-8", "GBK"));
			// params.put("content", StringUtil.gbToIso(content));
			// params.put("content", content);
			String re = HttpClientUtils.getInstance().postResponse(url, params, Charsets.UTF8, false);
			**/
			
			// String content = URLEncoder.encode(ConfigUtil.getStringValue("sms.content") + str, "UTF-8");
			// String tmp = ConfigUtil.getStringValue("sms.content") + str;
			// String content = StringUtil.covertCode(tmp, code1, code2);
			// String content = new String(tmp.getBytes());
			String content = "您的验证码是：" + str;
			// content = new String(content.getBytes("UTF-8"), "GBK");
			logger.info("str:{}", content);
			content = URLEncoder.encode(content, "GBK");
			logger.info("str:{}", content);
			String url = ConfigUtil.getStringValue("sms.url");
			
			
			url = url + "?username=" + ConfigUtil.getStringValue("sms.username");
			url = url + "&" + "password=" + ConfigUtil.getStringValue("sms.password");
			url = url + "&" + "mobile=" + phone;
			url = url + "&" + "apikey=" + ConfigUtil.getStringValue("sms.apikey");
			url = url + "&" + "content=" + content;
			
			
			/**
			Map<String, String> map = new HashMap<String, String>();
			map.put("username", ConfigUtil.getStringValue("sms.username"));
			map.put("password", ConfigUtil.getStringValue("sms.password"));
			map.put("mobile", phone);
			map.put("apikey", ConfigUtil.getStringValue("sms.apikey"));
			map.put("content", content);
			String re = HttpClientUtils.getInstance().postResponse(url, map, Charsets.ISO8859, false);
			**/
			logger.info("url:{}", url);
			String re = HttpClientUtils.getInstance().getResponse(url);
			
			logger.info("re:{}", re);
		} catch (Exception ex) {
			logger.error("", ex);
			return false;
		}
		return true;
	}

	
	public boolean checkYzm(String phone, String num) {
		Yzm yzm = yzmDao.getByPhoneLast(phone);
		if(yzm != null) {
			if(yzm.getYzm().equalsIgnoreCase(num)){
				return true;
			}
		}
		return false;
	}
	
}
