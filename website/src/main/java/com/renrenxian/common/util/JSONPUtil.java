package com.renrenxian.common.util;

import java.util.Map;

import org.codehaus.jackson.map.util.JSONPObject;

public class JSONPUtil {
	private String callback;
	private Map<String,Object> res;
	
	
	public JSONPUtil(Map<String, Object> res) {
		this.res = res;
	}
	
	public JSONPUtil(String callback, Map<String, Object> res) {
		this.callback = callback;
		this.res = res;
	}
	public String getCallback() {
		return callback;
	}
	public void setCallback(String callback) {
		this.callback = callback;
	}
	public Map<String, Object> getRes() {
		return res;
	}
	public void setRes(Map<String, Object> res) {
		this.res = res;
	}

	
	public static Object JSONPOrMap(String callback, Map<String, Object> res) {
		if(StringUtil.empty(callback)){
			return res;
		}else{
			return  new JSONPObject(callback,res);
		}
		
	}
	
	
	
	
	
	
}
