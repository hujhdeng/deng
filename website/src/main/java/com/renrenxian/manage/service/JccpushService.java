package com.renrenxian.manage.service;

import java.util.Map;

import com.renrenxian.manage.model.Jccpush;
import com.renrenxian.manage.service.base.BaseServiceMybatis;

public interface JccpushService extends BaseServiceMybatis<Jccpush,Integer> {
	
	/**
	 * 安装应用时，绑定百度推送账号和设备类型
	 * @author xulihua
	 * @param uid 用户id
	 * @param pushid 百度推送id，应该是对应的ChannelId
	 * @param deviceType 设备类型
	 * @return
	 */
	public Map<String,Object> bind(String uid,String pushid,String deviceType);

}
