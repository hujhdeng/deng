package com.renrenxian.manage.service;

import java.util.Map;

import com.renrenxian.manage.model.SdanChatUser;
import com.renrenxian.manage.service.base.BaseServiceMybatis;

public interface SdanChatUserService extends BaseServiceMybatis<SdanChatUser,Integer> {

	/**
	 * 保持一个SdanChatUser
	 * @param sid
	 * @param uid
	 * @param message
	 * @return
	 */
	public Map<String,Object> save(Integer sid,Integer uid,String message);
	
	
}
