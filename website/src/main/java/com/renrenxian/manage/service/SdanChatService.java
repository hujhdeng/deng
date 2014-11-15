package com.renrenxian.manage.service;

import java.util.Map;

import com.renrenxian.common.util.Page;
import com.renrenxian.manage.model.Party;
import com.renrenxian.manage.model.SdanChat;
import com.renrenxian.manage.service.base.BaseServiceMybatis;

public interface SdanChatService extends BaseServiceMybatis<SdanChat,Integer> {

	/**
	 * 创建一个 SdanChat
	 * @param sid 甩单id
	 * @param ruid 甩单所属用户id 收信人
	 * @param suid 发信人 当前登陆用户id
	 * @param message 留言消息
	 * @return
	 */
	public Map<String,Object> create(Integer sid,Integer ruid,Integer suid,String message);
	
	/**
	 * 分页获取甩单聊天内容列表
	 * @param sid 登陆用户uid
	 * @param reid 收发件人
	 * @param pageNo 分页页码
	 * @param pageSize 分页大小
	 * @return
	 */
	public Page<SdanChat> list(Integer sid,Integer reid,int pageNo, int pageSize);
	
}
