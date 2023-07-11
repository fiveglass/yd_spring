package com.yedam.app.emp.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.app.emp.service.EmpService;
import com.yedam.app.emp.service.EmpVO;

@Controller
public class EmpController {
	
	@Autowired
	EmpService empService;
	
	//조회(데이터, 일반페이지) -> get으로 처리
	//등록, 수정, 삭제		   -> post로 처리
	
	//전체조회
	@GetMapping("/empList")
	public String getEmpAllList(Model model) {
		model.addAttribute("empList", empService.getEmpAll());
		
		//다이렉트로 찾는 것이 아님. 어느곳에 있는지 알려줌.
		return "emp/empList";
	}
	
	//단건조회
	@GetMapping("/empInfo")
	public String getEmpInfo(EmpVO empVO, Model model) {
		EmpVO findVO = empService.getEmp(empVO);
		model.addAttribute("empInfo", findVO);
		
		return "emp/empInfo";
	}
	
	//등록 : 양식
	@GetMapping("/empInsert")
	public String empInsertForm() {
		return "emp/empInsert";
	}
	
	//등록 : 실행
	@PostMapping("/empInsert")
	public String empInsertPrcess(EmpVO empVO, RedirectAttributes rtt) {
		int empId = empService.insertEmp(empVO);
		String result = null;
		if(empId == -1) {
			result="정상적으로 등록되지 않았습니다.";
		}else {
			result="정상적으로 등록되었습니다."
				+"\n 등록된 사원의 사번은 " + empId +"입니다.";
		}
		//넘겨주려는 키, 넘겨주려는 값 -> 결국, 지금 result값에 담긴 메세지를 다시 보내주려고 하는 것
		rtt.addFlashAttribute("result", result);
		return "redirect:empList";
	}
	
	//수정 : 실행
	//ct와 server가 서로 json으로 데이터 교환
	//ct->server : RequestBody
	//server->ct : ResponseBody
	@PostMapping("/empUpdate")
	@ResponseBody
	public Map<String, String> empUpdateProcess(@RequestBody EmpVO empVO){
		return empService.updateEmp(empVO);
	}
	
}
