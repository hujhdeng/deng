package com.renrenxian.common.util;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.renrenxian.util.SignatureUtil;

import java.util.Map;
import java.util.regex.Pattern;

public class ValidUtils {
	private static transient Logger logger = LoggerFactory.getLogger(ValidUtils.class);
	//private static Pattern emailPattern = Pattern.compile("\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*");
	private static Pattern emailPattern = Pattern.compile("^[a-zA-Z0-9_-]{1,}+(.*)@[a-zA-Z0-9_-]{1,}+(.*)+(\\.)+[a-zA-Z]{1,}$");
	private static Pattern mobliePattern = Pattern.compile("^1[0-9]{10}$");
	private static Pattern landPhonePattern = Pattern
			.compile("^((\\(\\d{2,3}\\))|(\\d{3}\\-))?(\\(0\\d{2,3}\\)|0\\d{2,3}-)?[1-9]\\d{6,7}(\\-\\d{1,4})?$");

	/**
	 * 计算字符串字节数（英文字符1,中文字符2） note:
	 * 函数对中文做了特殊处理，因此如果输入中含有中文，应该调用此函数，否则，直接通过String的length操作判断
	 * 
	 * @param str
	 * @return
	 */
	public static int displayLength(String str) {

		int dislpayLen = 0;
		if (str == null)
			return dislpayLen;

		int len = str.length();
		for (int i = 0; i < len; ++i) {
			char ch = str.charAt(i);
			if (ch > '\u00FF')
				dislpayLen = dislpayLen + 2;
			else
				dislpayLen++;
		}
		return dislpayLen;
	}

	/**
	 * 验证一个可能含有中文的字符串长度是否在指定的长度范围内 note:
	 * 函数对中文做了特殊处理，因此如果输入中含有中文，应该调用此函数，否则，直接通过String的length操作判断
	 * 
	 * @param str
	 * @param maxLength
	 * @return 如果大于最大值，则返回false，否则返回true
	 */
	public static boolean validateMaxLength(String str, int maxLength) {
		// null小于任何长度的maxLength
		if (str == null || str.length() == 0)
			return true;

		int length = str.length();
		// 只有字符串在最大长度和最大长度的1/2之间才去获取实际长度
		if (length <= maxLength && length > maxLength / 2) {
			return !(ValidUtils.displayLength(str) > maxLength);
		}
		return (length <= maxLength);
	}

	/**
	 * 验证一个可能含有中文的字符串长度是否在指定的长度范围内 note:
	 * 函数对中文做了特殊处理，因此如果输入中含有中文，应该调用此函数，否则，直接通过String的length操作判断
	 * 
	 * @param str
	 * @param maxLength
	 * @return 如果小于最小值，则返回false，否则返回true
	 */
	public static boolean validateMinLength(String str, int minLength) {
		// null小于任何长度的minLength
		if (str == null)
			return false;

		int length = str.length();
		if (length >= minLength)
			return true;
		// 只有字符串在最大长度和最大长度的1/2之间才去获取实际长度
		if (length < minLength && length >= minLength / 2) {
			return !(ValidUtils.displayLength(str) < minLength);
		}
		return (length > minLength);
	}

	public static boolean validateMaxNumber(int value, int maxLength) {

		// 只有字符串在最大长度和最大长度的1/2之间才去获取实际长度
		return (value <= maxLength);
	}

	/**
	 * 验证是否 字符串是email
	 * 
	 * @param email
	 * @return true if email else false；
	 */
	public static boolean validEmail(String email) {
		if (email == null || email.length() == 0 || email.indexOf(".") == -1 || email.indexOf("@") == -1 || email.indexOf(" ") != -1) {
			return false;
		}
		return emailPattern.matcher(email).find();
	}

	/**
	 * 验证是不是手机号码
	 * 
	 * @param mobile
	 * @return
	 */
	public static boolean validMobile(String mobile) {
		if (!NumberUtils.isDigits(mobile)) {
			return false;
		}

		return mobliePattern.matcher(mobile).find();
	}

	/**
	 * 验证是否为固定电话 必须含有区号以及‘-’
	 * 
	 * @param landPhone
	 * @return
	 */
	public static boolean validLandPhone(String landPhone) {
		if (landPhone == null || //
				landPhone.length() == 0 || //
				landPhone.indexOf("-") == -1) {
			return false;
		}
		return landPhonePattern.matcher(landPhone).find();

	}

	public static void main(String[] args) {
		System.out.println(validEmail("ctfly@live.cn"));
		System.out.println(validMobile("15811018570"));
	}

	/**
	 * 空判断
	 * 
	 * @param args
	 * @return
	 */
	public static boolean validNull(String... args) {
		boolean flag = true;
		for (String s : args) {
			if (StringUtils.isEmpty(s)) {
				flag = false;
				break;
			}
		}
		return flag;
	}

	/**
	 * 验证签名信息
	 * 
	 * @param so_sig
	 * @param map
	 * @return
	 */
	public static boolean validSign(String so_sig, Map<String, String> map) {

		if (StringUtils.isEmpty(so_sig)) {
			return false;
		}
		try {
			String appkey = map.get("appkey").toString();
			String safe_sig = SignatureUtil.getAppSignature(map, appkey);
			logger.info("appkey=" + appkey + "###so_sig=" + so_sig + "###safe_sig=" + safe_sig);
			if (safe_sig != null && StringUtils.equals(so_sig, safe_sig)) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			logger.error("", e);
			return false;
		}
	}
	/**
	 * 判断输入是否是数字
	 * @param key
	 * @return
	 */
	public static boolean validLong(String key) {
		if (StringUtils.isEmpty(key)) {
			return false;
		}
		Pattern pattern = Pattern.compile("[0-9]*");
		return pattern.matcher(key).matches();
	}
}
