package com.renrenxian.manage.service.impl;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.renrenxian.common.util.ConfigUtil;
import com.renrenxian.common.util.Page;
import com.renrenxian.manage.dao.PartyDao;
import com.renrenxian.manage.model.Party;
import com.renrenxian.manage.model.User;
import com.renrenxian.manage.mybatis.EntityDao;
import com.renrenxian.manage.service.PartyService;
import com.renrenxian.manage.service.UserService;
import com.renrenxian.manage.service.base.impl.BaseServiceMybatisImpl;
import com.renrenxian.util.result.DataResult;
import com.renrenxian.util.result.MapResult;


@Service("paytyService")
@Transactional
public class PartyServiceImpl extends BaseServiceMybatisImpl<Party,Integer> implements PartyService{
	
	@Resource
	private UserService  userService;

	private static Logger logger = LoggerFactory.getLogger(PartyServiceImpl.class);

	@Resource
	private PartyDao partyDao;

	@Override
	protected EntityDao<Party, Integer> getEntityDao() {
		return partyDao;
	}

	@Override
	public Map<String, Object> createParty(Integer uid, String title,
			String content, String type, Date partytime, String city,
			String area, String adr, String membernum) throws UnsupportedEncodingException {
		
		Party p = new Party();
		
		User u = userService.getById(uid);
		if(u==null){//uid对应的用户不存在，直接返回，无法创建party
			return MapResult.initMap(1002, "异常的登陆用户");
		}
		
		p.setUid(uid);
		String enc = ConfigUtil.getStringValue("urlencoder.enc");
		p.setuName(URLEncoder.encode(u.getuName(), enc));
		
		p.setTitle(title);
		p.setContent(content);
		p.setType(type);
		
		p.setPartytime(partytime);
		p.setRegtime(new Date());
		
		p.setCity(city);
		p.setArea(area);
		p.setAdr(adr);
		p.setMembernum(membernum);
		
		p.setJoinlist("");
		p.setJoinnum("0");
		
		this.save(p);
		
		Map<String, Object> map = MapResult.initMap();
		map.put("data", p);
		return null;
	}

	@Override
	public Page<Party> list(Integer uid, Integer myjoinid, String type,
			String area, int pageNo, int pageSize) {
		//强制uid和myjoinid二选一
		if(uid!=null){
			myjoinid = null;
		}
		return partyDao.list(uid, myjoinid, type, area, pageNo, pageSize);
	}

	
}
