package com.program.wx;

import javax.servlet.ServletContextEvent;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.ContextLoaderListener;


public class SpringListener extends ContextLoaderListener{
	private static Logger logger =LoggerFactory.getLogger(SpringListener.class);
	
	public void contextInitialized(ServletContextEvent event) {
		super.contextInitialized(event);
		logger.info("-------------------------------开始加载spring beans-------------------------------");
		ApplicationContext cxt = getCurrentWebApplicationContext();
		logger.info("------Loaded Bean--------------------------");
		for(String s :cxt.getBeanDefinitionNames()){
			logger.info(s);
		}
		logger.info("------Loaded Bean--------------------------");
		logger.info("-------------------------------完成加载spring beans-------------------------------");
	}
}
