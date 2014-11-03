package com.renrenxian.interceptor;


public class AuthInterceptor extends BaseAuthInterceptor {
	static {
		useUriFilterForNoCheck();
		controllerUriFilter.add("");
		
		
	}

	

}
