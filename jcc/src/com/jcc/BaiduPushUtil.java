package com.jcc;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import com.alibaba.fastjson.JSONObject;

public class BaiduPushUtil {
	public static void apush(String pushid, String resp) {
		// ���� GET ����
		// String
		// s=HttpRequest.sendGet("http://localhost:6144/Home/RequestString",
		// "key=123&v=456");
		// System.out.println(s);

		// ���� POST ����
		
		//获取java环境默认编码
		System.out.println(System.getProperty("file.encoding"));
		System.setProperty("file.encoding", "utf-8");//设置java环境默认编码
		System.out.println(System.getProperty("file.encoding"));
		String baseUrl = "http://channel.api.duapp.com/rest/2.0/channel/channel";
		String apiKey = "vQkReFkwLT7LZojKXDGXPgCw";
		String secretKey = "2xKnWbecAffpmEr9te5ww0xN5PxtTEbS";
		// String uid = "1146069893470858455";
		String uid = pushid;
		String requestMethed = "POST";
		ArrayList<String> list = new ArrayList<String>();
		Map<String, String> map = new HashMap<String, String>();
		map.put("method", "push_msg");
		map.put("apikey", apiKey);
		map.put("timestamp", "12344543232");
		// map.put("expires", "1238747373");
		map.put("v", "1");
		map.put("device_type", "3");
		map.put("push_type", "1");
		map.put("user_id", uid);
//		try {
//			resp = new String(resp.getBytes("gbk"),"utf-8");
//		} catch (UnsupportedEncodingException e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		}
//		try {
//			resp = URLEncoder.encode(resp, "utf-8");
//		} catch (UnsupportedEncodingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		try {
//			resp = Base64.encode(resp.getBytes("utf-8"));
//		} catch (UnsupportedEncodingException e) {
//			e.printStackTrace();
//		}
//		System.out.println("Base64:"+resp);
//		try {
//			System.out.println(";;"+new String(Base64.decode(resp), "utf-8"));
//		} catch (UnsupportedEncodingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		map.put("messages", resp);
		map.put("msg_keys", "a");
		Set<String> keySet = map.keySet();
		for (String string : keySet) {
			list.add(string);
		}
		Collections.sort(list);
		String keyValue = "";
		for (String string : list) {
			keyValue = keyValue + string + "=" + map.get(string);
		}
		String baseStr = requestMethed + baseUrl + keyValue + secretKey;
		System.out.println(baseStr);
		String string2md5 = MD5Util.string2MD5(URLEncoder.encode(baseStr));
		System.out.println(string2md5);
		map.put("sign", string2md5);

		Set<String> keySet2 = map.keySet();
		String parstr = "";
		for (String string : keySet2) {
			parstr += string + "=" + map.get(string) + "&";
		}
		parstr = parstr.substring(0, parstr.length() - 1);
		System.out.println("parstr:" + parstr);
//		String sr = HttpRequest
//				.sendPost(
//						"http://channel.api.duapp.com/rest/2.0/channel/channel",
//						parstr);
//		System.out.println(sr);
//		String sr = HttpRequest
//		.sendPost(
//				"http://localhost:8080/jcc/push",
//				"msg=看看aa");
//		System.out.println(sr);
//		AsyncHttpClient client = new AsyncHttpClient();
//		Future<Response> f;
//		try {
//			BoundRequestBuilder preparePost = client.preparePost("http://channel.api.duapp.com/rest/2.0/channel/channel");
//			for (String string : keySet2) {
//				preparePost.addParameter(string, map.get(string));
//			}
//			f = preparePost.execute();
//			System.out.println(f.get().getResponseBody("Big5"));// 谷歌的输出编码集为Big5，反向解析结果的时候使用
//		} catch (Exception e) {}

	}

	public static void ipush(String pushid, String resp) {
		// ���� GET ����
		// String
		// s=HttpRequest.sendGet("http://localhost:6144/Home/RequestString",
		// "key=123&v=456");
		// System.out.println(s);

		// ���� POST ����

		String baseUrl = "http://channel.api.duapp.com/rest/2.0/channel/channel";
		String apiKey = "vQkReFkwLT7LZojKXDGXPgCw";
		String secretKey = "2xKnWbecAffpmEr9te5ww0xN5PxtTEbS";
		// String uid = "973520447633333614";
		String uid = pushid;
		String requestMethed = "POST";
		ArrayList<String> list = new ArrayList<String>();
		Map<String, String> map = new HashMap<String, String>();
		map.put("method", "push_msg");
		map.put("apikey", apiKey);
		map.put("timestamp", "12344543232");
		// map.put("expires", "1238747373");
		map.put("v", "1");
		map.put("device_type", "4");
		map.put("push_type", "1");
		map.put("user_id", uid);
		map.put("deploy_status", "1");
		map.put("message_type", "1");
		JSONObject rootObject = new JSONObject();

		JSONObject iphoneObject = new JSONObject();
		iphoneObject.put("alert", "alertmessage");
		iphoneObject.put("sound", "alert.wav");
		iphoneObject.put("badge", "1");
		rootObject.put("aps", iphoneObject);

		// JSONObject customObject = new JSONObject();
		// customObject.put("type", "1");
		//
		// JSONObject messageObject = new JSONObject();
		// messageObject.put("id", "3");
		// messageObject.put("sdid", "7");
		// messageObject.put("seid", "43");
		// messageObject.put("reid", "44");
		// messageObject.put("content", "3");
		// messageObject.put("regtime", "");
		// customObject.put("message", messageObject);

		JSONObject customObject = JSONObject.parseObject(resp);
		rootObject.put("resp", customObject);
		map.put("messages", rootObject.toJSONString());
		System.out.println(rootObject.toJSONString());
		map.put("msg_keys", "a");
		Set<String> keySet = map.keySet();
		for (String string : keySet) {
			list.add(string);
		}
		Collections.sort(list);
		String keyValue = "";
		for (String string : list) {
			keyValue = keyValue + string + "=" + map.get(string);
		}
		String baseStr = requestMethed + baseUrl + keyValue + secretKey;
		System.out.println(baseStr);
		String string2md5 = MD5Util.string2MD5(URLEncoder.encode(baseStr));
		System.out.println(string2md5);
		map.put("sign", string2md5);

		Set<String> keySet2 = map.keySet();
		String parstr = "";
		for (String string : keySet2) {
			parstr += string + "=" + map.get(string) + "&";
		}
		parstr = parstr.substring(0, parstr.length() - 1);
		System.out.println(parstr);
		String sr = HttpRequest
				.sendPost(
						"http://channel.api.duapp.com/rest/2.0/channel/channel",
						parstr);
		System.out.println(sr);
	}

	public static void main(String[] args) {
		apush("1146069893470858455", "lkjkl噢噢噢噢");
	}
}
