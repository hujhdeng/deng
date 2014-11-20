package com.renrenxian.common.util;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;


public class AppListener implements ServletContextListener {

    @Override
	public void contextInitialized(ServletContextEvent sce) {
		ServletContext sc = sce.getServletContext();
		sc.setAttribute("wxappid", ConfigUtil.getStringValue("wxappid"));
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		
	}
}