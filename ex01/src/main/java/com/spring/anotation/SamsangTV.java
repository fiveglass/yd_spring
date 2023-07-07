package com.spring.anotation;

import org.springframework.stereotype.Component;

@Component(value = "tv") //세부설정도 가능함
public class SamsangTV implements TV {

	@Override
	public void on() {
		System.out.println("어노테이션 방식) samsangtv on");

	}

}
