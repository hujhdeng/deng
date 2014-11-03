package com.renrenxian.controller;

import java.io.IOException;
import java.nio.charset.Charset;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import com.renrenxian.common.util.BeanJsonUtil;
import com.renrenxian.util.SignatureUtil;
import com.renrenxian.util.result.BaseResult;
import com.renrenxian.util.result.DataResult;

public class JsonBaseController {

	private final static Logger logger = LoggerFactory.getLogger(JsonBaseController.class);

	/**
	 * js返回
	 */
	public static final MediaType TEXT_JAVASCRIPT = new MediaType("text", "plain", Charset.forName("UTF-8"));

	/**
	 * 指定返回头内容类型
	 * 
	 * @return
	 */
	protected HttpHeaders getResponseHeaders() {
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.setContentType(TEXT_JAVASCRIPT);
		return responseHeaders;
	}

	/**
	 * 从cookies取用户信息 解密串 返回用户基础信息
	 * 
	 * @param request
	 * @return
	 */
	protected String getUserInfo(HttpServletRequest request) {
		String userInfo = "";
		return userInfo;
	}

	/**
	 * 空判断
	 * 
	 * @param args
	 * @return
	 */
	protected boolean validNull(String... args) {
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
	protected boolean validSign(String so_sig, Map<String, String> map) {

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
	
	public ResponseEntity<String> internalServerError(Exception e) {
		BaseResult br = BaseResult.INVALID_PARAMETER;
		br.setCode(6001);
		br.setMsg(e.toString());
		ResponseEntity<String> result = null;
		try {
			result = new ResponseEntity<String>(BeanJsonUtil.toJson(br), getResponseHeaders(), HttpStatus.OK);
		} catch (IOException e1) {
			logger.error("internalServerError",e);
		}
		return result;
	}

	public DataResult initDataResult() {
		DataResult dr = new DataResult();
		dr.setCode(BaseResult.SUCCESS.getCode());
		dr.setMsg(BaseResult.SUCCESS.getMsg());
		return dr;
	}

	
}
