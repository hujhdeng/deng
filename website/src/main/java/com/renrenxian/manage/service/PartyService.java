package com.renrenxian.manage.service;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Map;

import com.renrenxian.common.util.Page;
import com.renrenxian.manage.model.Party;
import com.renrenxian.manage.service.base.BaseServiceMybatis;

public interface PartyService extends BaseServiceMybatis<Party,Integer> {

	/**
	 * 发起聚会
	 * @author xulihua
	 * @param uid 登陆用户的id
	 * @param title 聚会标题
	 * @param content 聚会内容
	 * @param type 聚会类型
	 * @param partytime 聚会时间
	 * @param city 所在城市
	 * @param area 所属区域
	 * @param adr  聚会地点
	 * @param membernum 人数上限
	 * @return {apicode:处理结果状态码,message:处理结果描述信息,data:处理结果主体数据Party }
	 * 			apicode：1000处理成功 、 1002 异常的登陆用户
	 * @throws UnsupportedEncodingException 
	 */
	public Map<String, Object> createParty(Integer uid,String title,String content,String type,Date partytime,String city,String area,String adr,String membernum) throws UnsupportedEncodingException;
	
	/**
	 * 聚会列表含我发起和参与的聚会接口，聚会发起人 uid 或myjoinid（带uid为返回我发起的聚会，带myjoinid为返回我参加的聚会，二者只能选一个，uid和myjoinid均为空时返回所有聚会列表
	 * @author xulihua
	 * @param uid 登陆用户uid
	 * @param myjoinid 参与聚会的用户uid
	 * @param type 聚会类型 可以为空 
	 * @param area 所属区域 可以为空
	 * @param pageNo
	 * @param pagesize
	 * @return
	 */
	public Page<Party> list(Integer uid,Integer myjoinid,String type,String area,int pageNo, int pageSize);
	
}
