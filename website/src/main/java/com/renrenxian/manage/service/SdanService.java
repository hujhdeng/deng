package com.renrenxian.manage.service;

import java.util.Map;

import com.renrenxian.common.util.Page;
import com.renrenxian.manage.model.Sdan;
import com.renrenxian.manage.service.base.BaseServiceMybatis;

public interface SdanService extends BaseServiceMybatis<Sdan,Integer> {
	
	/**
	 * 发起甩单
	 * @param uid 发起人uid
	 * @param title 甩单标题
	 * @param type 业务类型
	 * @param area 办理地点
	 * @param money 贷款金额
	 * @param limitdate 放款期限
	 * @param howlong 用款周期
	 * @param content 甩单介绍
	 * @return
	 */
	public Map<String,Object> create(Integer uid,String title,String type,String area,String money,String limitdate,String howlong,String content);
	
	
	/**
	 * 根据参数条件查找到的甩单列表分页
	 * @param uid 聚会发起人（可以为空）
	 * @param type 聚会类型 type（可以为空）
	 * @param area 所属区域 area（可以为空）
	 * @param state 状态        state(可以为空)
	 * @param pageNo 分页页码
	 * @param pageSize 分页大小
	 * @return
	 */
	public Page<Sdan> list(Integer uid, String type,String area,String state, int pageNo, int pageSize);
	
	
	/**
	 * 获取甩单详情和登陆用户是否参加接单
	 * @param sid 甩单id
	 * @param uid 当前登陆用户id
	 * @return
	 */
	public Map<String, Object> getSdanInfo(Integer sid, Integer uid);
	
	
	/**
	 * 申请接单
	 * @param sid 甩单id
	 * @param uid 当前登陆用户id
	 * @param message 留言内容
	 * @return
	 */
	public Map<String, Object> join(Integer sid, Integer uid,String message);
	
	
	/**
	 * 查看接单所有参加人员
	 * @param sid 甩单id
	 * @param pageNo 分页页码
	 * @param pageSize 分页大小
	 * @return
	 */
	public Map<String, Object> joinUsersList(Integer sid, int pageNo,int pageSize);
	
	/**
	 * 
	 * 甩单发起接洽
	 * @param sid 甩单id
	 * @param uid 登陆用户id，即甩单人id
	 * @param reid 接洽人id
	 * @return
	 */
	public Map<String, Object> sdanConnect(Integer sid,Integer uid,Integer reid);
	
	
	/**
	 * 
	 * 甩单取消所有接洽
	 * @param sid 甩单id
	 * @param uid 登陆用户id，即甩单人id
	 * @return
	 */
	public Map<String, Object> disConnect(Integer sid,Integer uid);
	
	/**
	 * 甩单提交聊天接洽
	 * @param sid 甩单id
	 * @param seid 发信人id
	 * @param reid 收信人id  reid
	 * @param message 聊天内容
	 * @return
	 */
	public Map<String, Object> addChat(Integer sid,Integer seid,Integer reid,String message);
	
	/**
	 * 分页获取甩单聊天内容列表
	 * @param sid 甩单id
	 * @param reid 收发件人
	 * @param pageNo 分页页码
	 * @param pageSize 分页大小
	 * @return
	 */
	public Map<String,Object> chatList(Integer sid,Integer reid,int pageNo, int pageSize);
	
	/**
	 * 甩单人评价并结束单靠谱指数+5
	 * @param sid 甩单id
	 * @param uid 登陆用户id，即发起甩单的用户id
	 * @param assessnum 评价分数 1差，2一般，3好
	 * @param assesstxt 评价内容
	 * @return
	 */
	public Map<String,Object> assess(Integer sid,Integer uid,Integer assessnum,String assesstxt);
}
