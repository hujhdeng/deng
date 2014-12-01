package com.renrenxian.manage.service;

import java.util.Map;

import com.renrenxian.common.util.Page;
import com.renrenxian.manage.model.SdanMessage;
import com.renrenxian.manage.model.User;
import com.renrenxian.manage.service.base.BaseServiceMybatis;

public interface SdanMessageService extends BaseServiceMybatis<SdanMessage,Integer> {
	
	/**
	 * 创建一个甩单留言
	 * @param sid 甩单id
	 * @param user 留言人id
	 * @return
	 */
	public Map<String,Object> create(Integer sid,User user,String message);

	public Map<String, Object> getBySid(Integer sid, int pageNo, int pagesize);
	
	public SdanMessage getBySidAndUid(String sid, String uid);
	
}
