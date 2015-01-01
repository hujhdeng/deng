package com.renrenxian.manage.service;

import com.renrenxian.common.util.StringUtil;

public class Main {

	public static void main(String[] args) {
		
		String lng = "ll";
		double lngd = StringUtil.parseDouble(lng, 0);
		if(lngd == 0.0) {
			System.out.println(true);
		}else{
			System.out.println(false);
		}
	}

}
