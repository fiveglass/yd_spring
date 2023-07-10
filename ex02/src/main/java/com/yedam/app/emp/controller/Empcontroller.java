package com.yedam.app.emp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yedam.app.emp.mapper.EmpMapper;
import com.yedam.app.emp.service.EmpVO;

@Controller //컨트롤러 어노테이션이라고 등록해야 허용되는 부분들이 있음
public class Empcontroller {
	
	@Autowired
	EmpMapper empMapper;
	
	@RequestMapping(value = "emp", method=RequestMethod.GET) 
	public String empList(Model model, EmpVO empVO) {
		model.addAttribute("emp", empMapper.getEmp(empVO));
		return "emp";
	}
}
