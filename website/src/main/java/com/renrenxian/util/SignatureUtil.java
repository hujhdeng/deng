package com.renrenxian.util;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.apache.log4j.Logger;

/**
 * rest接口的加密串工具类
 * 
 */
public class SignatureUtil {
	private static final Logger logger = Logger.getLogger(SignatureUtil.class);

	/**
	 * APP KEY和VALUE定义
	 * 
	 * @author haoxw
	 */
	public final static Map<String, String> APPKEY = new TreeMap<String, String>();
	static {
		// web调用
		APPKEY.put("0001", "wertqwerfghlnn34we");
		//android端调用
		APPKEY.put("0002", "fsfs19sflklnn39wqa");
		//ios调用
		APPKEY.put("0003", "mfbnlklns934daf158");
		//预留1
		APPKEY.put("0004", "123fbnlxcvs901daf1");
		//预留2
		APPKEY.put("0005", "567nlklns9xcvbfuio");
		//预留3
		APPKEY.put("0006", "vbnmklns394dafjkln");
		//预留4
		APPKEY.put("0007", "mtyuhjlns934daf376");
		//预留5
		APPKEY.put("0008", "lklmns9fbn3f14d8a5");
		//预留6
		APPKEY.put("0009", "fdgherdfswer123erv");
	}

	/**
	 * 获取参数签名
	 * 
	 * @param params
	 *            参数列表（不要求有序）
	 * @param key
	 *            应用Key
	 * @return 签名参数
	 */
	public static String getAppSignature(Map<String, ?> params, String key) {
		List<String> list = new ArrayList<String>();
		for (Map.Entry<String, ?> e : params.entrySet()) {
			list.add(e.getKey() + "=" + String.valueOf(e.getValue()));
		}
		Collections.sort(list);
		return getAppSignature(list, key);
	}

	/**
	 * 获取参数签名
	 * 
	 * @param params
	 *            要签名的参数（不要求有序）
	 * @param key
	 *            签名的key
	 * @return 签名后的内容
	 */
	public static String getAppSignature(List<String> params, String key) {
		if (params == null || key == null) {
			return null;
		}
		final String secret = APPKEY.get(key);
		return generateSignature(params, secret);
	}

	/**
	 * Calculates the signature for the given set of params using the supplied
	 * secret
	 * 
	 * @param params
	 *            Strings of the form "key=value"
	 * @param secret
	 * @return the signature
	 */
	public static String generateSignature(List<String> params, String secret) {
		if (params == null || secret == null) {
			logger.warn("params or secret is null");
			return null;
		}
		Collections.sort(params);
		StringBuilder buf = new StringBuilder();
		for (String p : params) {
			buf.append(p);
		}
		buf.append(secret);
		return md5(buf.toString());
	}

	public static String md5(String s) {
		try {
			java.security.MessageDigest md = java.security.MessageDigest
					.getInstance("MD5");
			StringBuilder result = new StringBuilder();
			byte[] bs = md.digest(s.getBytes("UTF-8"));
			for (int i = 0; i < bs.length; i++) {
				byte b = bs[i];
				result.append(Integer.toHexString((b & 0xf0) >>> 4));
				result.append(Integer.toHexString(b & 0x0f));
			}
			return result.toString();
		} catch (java.security.NoSuchAlgorithmException ex) {
			logger.error("", ex);
		} catch (UnsupportedEncodingException uee) {
			logger.error("", uee);
		}
		return "";
	}

}
