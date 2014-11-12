package com.renrenxian.common.util;

import java.util.Map;

import com.baidu.yun.channel.auth.ChannelKeyPair;
import com.baidu.yun.channel.client.BaiduChannelClient;
import com.baidu.yun.channel.exception.ChannelClientException;
import com.baidu.yun.channel.exception.ChannelServerException;
import com.baidu.yun.channel.model.PushUnicastMessageRequest;
import com.baidu.yun.channel.model.PushUnicastMessageResponse;
import com.baidu.yun.core.log.YunLogEvent;
import com.baidu.yun.core.log.YunLogHandler;
import com.renrenxian.util.result.MapResult;

public class PushMessageUtil {
	
	public static final String apiKey=ConfigUtil.getStringValue("jcc.apiKey");
	public static final String secretKey=ConfigUtil.getStringValue("jcc.secretKey");
	
	//0 推送单播消息(消息类型为透传，由开发方应用自己来解析消息内容)
	public static final int MES_TYPE_MS = 0;
	
	//1 推送单播通知(Android Push SDK拦截并解析)
	public static final int MES_TYPE_NOTICE = 1;
	
	//web设备
	public static final int DV_TYPE_WEB = 1;
	
	//pc设备
	public static final int DV_TYPE_PC = 2;
	
	//android设备
	public static final int DV_TYPE_AN = 3;
	
	//IOS设备
	public static final int DV_TYPE_IOS = 4;
	
	//IOS设备
	public static final int DV_TYPE_WP = 5;
	
	
	/**
	 * 百度安卓 推送单播消息(消息类型为透传，由开发方应用自己来解析消息内容)
	 * @author xulihua
	 * @param userid  手机端的UserId
	 * @param msg 消息主体内容
	 * @return
	 */
 	public static Map<String,Object> pushAndroidMessage(String userid, String msg) {
 		return push(userid, msg, PushMessageUtil.MES_TYPE_MS, PushMessageUtil.DV_TYPE_AN);
 	}
 	
 	/**
	 * 百度IOS 推送单播消息(消息类型为透传，由开发方应用自己来解析消息内容)
	 * @author xulihua
	 * @param userid  手机端的UserId
	 * @param msg 消息主体内容
	 * @return
	 */
 	public static Map<String,Object> pushIOSMessage(String userid, String msg) {
 		return push(userid, msg, PushMessageUtil.MES_TYPE_MS, PushMessageUtil.DV_TYPE_IOS);
 	}
 	
 	/**
	 * 百度安卓 推送单播通知(Android Push SDK拦截并解析)
	 * @author xulihua
	 * @param userid  手机端的UserId
	 * @param msg 消息主体内容
	 * @return
	 */
 	public static Map<String,Object> pushAndroidNotice(String userid, String msg) {
 		return push(userid, msg, PushMessageUtil.MES_TYPE_NOTICE, PushMessageUtil.DV_TYPE_AN);
 	}
 	
 	/**
	 * 百度IOS 推送单播通知(Android Push SDK拦截并解析)
	 * @author xulihua
	 * @param userid  手机端的UserId
	 * @param msg 消息主体内容
	 * @return
	 */
 	public static Map<String,Object> pushIOSNotice(String userid, String msg) {
 		return push(userid, msg, PushMessageUtil.MES_TYPE_NOTICE, PushMessageUtil.DV_TYPE_IOS);
 	}
	
	
	/**
	 * 百度消息/通知推送
	 * @author xulihua
	 * @param userid  手机端的UserId
	 * @param msg 消息主体内容
	 * @param messageType 消息类型
	 * 				0 推送单播消息(消息类型为透传，由开发方应用自己来解析消息内容) 缺省
	 * 				1 推送单播通知(Android Push SDK拦截并解析)
	 * @param DeviceType
	 *              1 web
	 *              2 pc
	 *              3 android 缺省
	 *              4 ios
	 *              5 wp
	 * @return
	 */
	 public static Map<String,Object> push(String userid, String msg,Integer messageType,Integer deviceType) {
		 
		 	messageType = messageType!=null?messageType:0;
		 	deviceType = deviceType!=null?deviceType:3;
		 
	        // 1. 设置developer平台的ApiKey/SecretKey
	        ChannelKeyPair pair = new ChannelKeyPair(apiKey, secretKey);

	        // 2. 创建BaiduChannelClient对象实例
	        BaiduChannelClient channelClient = new BaiduChannelClient(pair);

	        // 3. 若要了解交互细节，请注册YunLogHandler类
	        channelClient.setChannelLogHandler(new YunLogHandler() {
	            @Override
	            public void onHandle(YunLogEvent event) {
	                System.out.println(event.getMessage());
	            }
	        });

	        try {

	            // 4. 创建请求类对象
	            // 手机端的ChannelId， 手机端的UserId， 
	            PushUnicastMessageRequest request = new PushUnicastMessageRequest();
	            request.setDeviceType(deviceType); // device_type => 1: web 2: pc 3:android
	                                      // 4:ios 5:wp
	            //request.setChannelId(3874779336278337834l);
	            request.setUserId(userid);

	            request.setMessageType(messageType);
	            request.setMessage(msg);

	            // 5. 调用pushMessage接口
	            PushUnicastMessageResponse response = channelClient.pushUnicastMessage(request);

	            // 6. 认证推送成功
	            Map<String,Object> map = MapResult.initMap();
	            map.put("pushAmount", response.getSuccessAmount());
	           return map;

	        } catch (ChannelClientException e) {
	            e.printStackTrace();
	        } catch (ChannelServerException e) {
	            // 处理服务端错误异常
	            System.out.println(String.format(
	                    "request_id: %d, error_code: %d, error_message: %s",
	                    e.getRequestId(), e.getErrorCode(), e.getErrorMsg()));
	            
	        }
	        
	        return MapResult.failMap();
	    }
	 
	 
	 	
}
