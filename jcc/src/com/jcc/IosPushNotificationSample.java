package com.jcc;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.baidu.yun.channel.auth.ChannelKeyPair;
import com.baidu.yun.channel.client.BaiduChannelClient;
import com.baidu.yun.channel.exception.ChannelClientException;
import com.baidu.yun.channel.exception.ChannelServerException;
import com.baidu.yun.channel.model.PushUnicastMessageRequest;
import com.baidu.yun.channel.model.PushUnicastMessageResponse;
import com.baidu.yun.core.log.YunLogEvent;
import com.baidu.yun.core.log.YunLogHandler;

public class IosPushNotificationSample {

    public static String  push(String id, String msg) {

        /*
         * @brief 推送单播通知(IOS APNS) message_type = 1 (默认为0)
         */
        // 1. 设置developer平台的ApiKey/SecretKey
    	 
        ChannelKeyPair pair = new ChannelKeyPair(Constants.apiKey, Constants.secretKey);

        // 2. 创建BaiduChannelClient对象实例
        BaiduChannelClient channelClient = new BaiduChannelClient(pair);

        // 3. 若要了解交互细节，请注册YunLogHandler类
        channelClient.setChannelLogHandler(new YunLogHandler() {
            public void onHandle(YunLogEvent event) {
                System.out.println(event.getMessage());
            }
        });

        try {

            // 4. 创建请求类对象
            // 手机端的ChannelId， 手机端的UserId， 先用1111111111111代替，用户需替换为自己的
            PushUnicastMessageRequest request = new PushUnicastMessageRequest();
            request.setDeviceType(4); // device_type => 1: web 2: pc 3:android
                                      // 4:ios 5:wp
            request.setDeployStatus(1); // DeployStatus => 1: Developer 2:
                                        // Production
//            request.setChannelId(11111111111L);
            request.setUserId(id);

            request.setMessageType(1);
//            request.setMessage("{\"aps\":{\"alert\":\"Hello Baidu Channel\"}}");
            
            JSONObject resp = JSON.parseObject(msg);
            JSONObject msgObject = resp.getJSONObject("message");
            String content = msgObject.getString("content");
            //封装json start
            JSONObject rootObject = new JSONObject();

    		JSONObject iphoneObject = new JSONObject();
    		if (content.length()>5) {
    			iphoneObject.put("alert", content.subSequence(0, 5)+"...");
			}else {
				iphoneObject.put("alert", content);
			}
    		iphoneObject.put("sound", "alert.wav");
    		iphoneObject.put("badge", "1");
    		rootObject.put("aps", iphoneObject);

//    		JSONObject customObject = new JSONObject();
//    		customObject.put("type", "1");
//
//    		JSONObject messageObject = new JSONObject();
//    		messageObject.put("id", "3");
//    		messageObject.put("sdid", "7");
//    		messageObject.put("seid", "43");
//    		messageObject.put("reid", "44");
//    		messageObject.put("content", "kkk啦啦啦啦");
//    		messageObject.put("regtime", "");
//    		customObject.put("message", messageObject);

    		JSONObject customObject = JSONObject.parseObject(msg);
    		rootObject.put("resp", customObject);
            //封装json end
            request.setMessage(rootObject.toJSONString());
            System.out.println("getMessage:"+request.getMessage());
            // 5. 调用pushMessage接口
            PushUnicastMessageResponse response = channelClient
                    .pushUnicastMessage(request);

            // 6. 认证推送成功
            System.out.println("push amount : " + response.getSuccessAmount());
            return "push success push amount : " + response.getSuccessAmount();
        } catch (ChannelClientException e) {
            // 处理客户端错误异常
            e.printStackTrace();
        } catch (ChannelServerException e) {
            // 处理服务端错误异常
            System.out.println(String.format(
                    "request_id: %d, error_code: %d, error_message: %s",
                    e.getRequestId(), e.getErrorCode(), e.getErrorMsg()));
        }
        return "push fail";
    }
    public static void main(String[] args) {
		push("973520447633333614", "{\"aa\":\"bb\"}");
	}

}
