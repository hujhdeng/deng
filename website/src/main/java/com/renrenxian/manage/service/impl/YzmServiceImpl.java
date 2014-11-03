package com.renrenxian.manage.service.impl;

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

			String content = ConfigUtil.getStringValue("sms.content") + str;
			logger.info("str:{}", content);
			String url = ConfigUtil.getStringValue("sms.url");
			Map<String, String> params = new HashMap<String, String>();
			params.put("username", ConfigUtil.getStringValue("sms.username"));
			params.put("password", ConfigUtil.getStringValue("sms.password"));
			params.put("mobile", phone);
			params.put("apikey", ConfigUtil.getStringValue("sms.apikey"));
			// params.put("content",StringUtil.covertCode(content, "UTF-8", "GBK"));
			params.put("content", StringUtil.gbToIso(content));
			String re = HttpClientUtils.getInstance().postResponse(url, params, Charsets.UTF8, false);
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
