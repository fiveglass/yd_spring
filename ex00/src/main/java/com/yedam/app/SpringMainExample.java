package com.yedam.app;

import org.springframework.context.support.GenericXmlApplicationContext;

public class SpringMainExample {

	public static void main(String[] args) {
		GenericXmlApplicationContext ctx
		 = new GenericXmlApplicationContext("classpath:applicationContexts.xml");
		
		TV tv = (TV)ctx.getBean("tv");
		tv.on();

	}

}
