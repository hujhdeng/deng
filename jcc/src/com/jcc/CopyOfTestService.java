package com.jcc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;

public class CopyOfTestService extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// req.setCharacterEncoding("UTF-8");
		// resp.setCharacterEncoding("UTF-8");
		System.out.println("req:" + req.toString());
		String act = (String) req.getParameter("act");
		if (act.equals("bind")) {
			String uid = (String) req.getParameter("uid");
			String pushid = (String) req.getParameter("pushid");
			String deviceType = (String) req.getParameter("deviceType");
			resp.getWriter()
					.append("he")
					.append("-" + req.getParameter("uid") + "-"
							+ req.getParameter("pushid")).flush();
			DBUtil.addUser(uid, pushid, deviceType);
		} else if (act.equals("ipush")) {
			String pushid = (String) req.getParameter("pushid");
			String msg = (String) req.getParameter("msg");
//			msg = new String(msg.getBytes("iso-8859-1"), "utf-8");
//			BaiduPushUtil.ipush(pushid, msg);
			IosPushNotificationSample.push(pushid, msg);
		} else if (act.equals("apush")) {
			String pushid = (String) req.getParameter("pushid");
			String msg = (String) req.getParameter("msg");
//			msg = new String(msg.getBytes("iso-8859-1"), "utf-8");
//			BaiduPushUtil.apush(pushid, msg);
			AndroidPushMessageSample.push(pushid, msg);
		} else if (act.equals("push")) {
			String uid = (String) req.getParameter("uid");
			String msg = (String) req.getParameter("msg");
			System.out.println("msg:" + msg);
			// msg = new String(msg.getBytes("iso-8859-1"),"utf-8");
			// System.out.println("msg:"+ msg);

			String[] idAndType = DBUtil.getPushidByUid(uid);
			if (idAndType[1].equals("3")) {
				// BaiduPushUtil.apush(idAndType[0],msg);
				AndroidPushMessageSample.push(idAndType[0], msg);
			} else {
				// BaiduPushUtil.ipush(idAndType[0],msg);
				IosPushNotificationSample.push(idAndType[0], msg);
			}
			System.out.println("push   over");
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// req.setCharacterEncoding("UTF-8");
		// resp.setCharacterEncoding("UTF-8");
		System.out.println("req:" + req.toString());
		String act = (String) req.getParameter("act");
		if (act.equals("bind")) {
			String uid = (String) req.getParameter("uid");
			String pushid = (String) req.getParameter("pushid");
			String deviceType = (String) req.getParameter("deviceType");
			resp.getWriter()
					.append("he")
					.append("-" + req.getParameter("uid") + "-"
							+ req.getParameter("pushid")).flush();
			DBUtil.addUser(uid, pushid, deviceType);
		} else if (act.equals("ipush")) {
			String pushid = (String) req.getParameter("pushid");
			String msg = (String) req.getParameter("msg");
			BaiduPushUtil.ipush(pushid, msg);
		} else if (act.equals("apush")) {
			String pushid = (String) req.getParameter("pushid");
			String msg = (String) req.getParameter("msg");
			BaiduPushUtil.apush(pushid, msg);
		} else if (act.equals("push")) {
			String uid = (String) req.getParameter("uid");
			String msg = (String) req.getParameter("msg");
			msg = new String(msg.getBytes("iso-8859-1"), "utf-8");
			System.out.println("msg:" + msg);
			String[] idAndType = DBUtil.getPushidByUid(uid);
			if (idAndType[1].equals("3")) {
				BaiduPushUtil.apush(idAndType[0], msg);
			} else {
				BaiduPushUtil.ipush(idAndType[0], msg);
			}
		}
	}

	public static void main(String[] args) {
//		AndroidPushMessageSample.push("1146069893470858455", "hh呵呵呵");

		iospush();
		
		
	}
	private static void iospush() {
		JSONObject rootObject = new JSONObject();

		JSONObject iphoneObject = new JSONObject();
		iphoneObject.put("alert", "alertmessage");
		iphoneObject.put("sound", "alert.wav");
		iphoneObject.put("badge", "1");
		rootObject.put("aps", iphoneObject);

		JSONObject customObject = new JSONObject();
		customObject.put("type", "1");

		JSONObject messageObject = new JSONObject();
		messageObject.put("id", "3");
		messageObject.put("sdid", "7");
		messageObject.put("seid", "43");
		messageObject.put("reid", "44");
		messageObject.put("content", "kkk啦啦啦啦");
		messageObject.put("regtime", "");
		customObject.put("message", messageObject);

		rootObject.put("resp", customObject);
		IosPushNotificationSample.push("973520447633333614", rootObject.toJSONString());

	}

}
