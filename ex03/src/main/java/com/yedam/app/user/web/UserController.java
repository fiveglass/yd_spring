package com.yedam.app.user.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yedam.app.emp.service.EmpService;
import com.yedam.app.user.service.UserVO;

@Controller
public class UserController {
	
	@Autowired
	EmpService empService;
	
	@RequestMapping("/getObject") // 루트 여부 큰 의미 없음
	public String getCommandObject(UserVO userVO) {
		//요청정보를 받을 때 반드시 키 값으로 받아 줄 것
		//폼태그로 리스트를 보낼 때 몇번째 리스트인지 명확하게 보내야함. 받는 쪽에서는 객체 형태로 받아주어야 함.
		//ex.mypage.do?list[0].name=choi... -> private List<UserVO> list;
		//하나의 객체, 리스트 상관없이 매개변수로 받을 때는 객체로 받아야함.
		System.out.printf("===============%s\n", userVO.getName());
		System.out.printf("===============%s\n", userVO.getAge());
		return "";
	}
	
	@RequestMapping("getList")
	public String getCommandArray(UserListVO listVO) {
		for(UserVO userVO : listVO.getList()) {
			System.out.printf("===============%s\n", userVO.getName());
			System.out.printf("===============%s\n", userVO.getAge());
		}
		return "";
	}
	
	@RequestMapping("getValues")
	public String getParamValues(@RequestParam(required = false) String name, @RequestParam(defaultValue = "1") Integer age) {
		System.out.printf("===============%s\n", name);
		System.out.printf("===============%s\n", age);
		
		return "";
	}
	
	@RequestMapping("users/{empid}")
	public String getPathValues(@PathVariable("empid") String id) {
		System.out.printf("===============%s\n", id);
		
		return "";
	}
	
	@RequestMapping("getJsonVal")
	public String getJsonValues(@RequestBody UserVO userVO) {
		System.out.printf("===============%s\n", userVO.getName());
		System.out.printf("===============%s\n", userVO.getAge());
		
		return "";
	}
}
