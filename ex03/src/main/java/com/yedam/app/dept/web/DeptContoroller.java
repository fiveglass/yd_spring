package com.yedam.app.dept.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.app.dept.service.DeptService;
import com.yedam.app.dept.service.DeptVO;

@Controller
public class DeptContoroller {
	
	@Autowired
	DeptService deptService;
	
	
	//전체조회
	@GetMapping("/deptList")
	public String getDeptAllList(Model model) {
		model.addAttribute("deptList", deptService.getDeptAll());
		
		return "dept/deptList";
	}
	
	//단건조회
	@GetMapping("/deptInfo")
	public String getDeptInfo(DeptVO deptVO, Model model) {
		DeptVO findVO = deptService.getDept(deptVO);
		model.addAttribute("deptInfo", findVO);
		
		return "dept/deptInfo";
	}
	
	//등록 폼 이동
	@GetMapping("/deptInsert")
	public String deptInsertForm() {
		return "dept/deptInsert";
	}
	
	//등록 실행
	@PostMapping("/deptInsert")
	public String deptInsertProcess(DeptVO deptVO, RedirectAttributes rtt) {
		int deptId = deptService.insertDept(deptVO);
		String result = null;
		if(deptId == -1) {
			result ="정상 등록 실패";
		}else {
			result= "정상 등록 완료";
		}
		
		
		rtt.addFlashAttribute("result", result);
		return "redirect:deptList";
	}
	
	//수정
	@PostMapping("/deptUpdate")
	@ResponseBody
	public Map<String, String> deptUpdateProcess(@RequestBody DeptVO deptVO){
		return deptService.updateDept(deptVO);
	}
	
	//삭제
	@PostMapping("/deptDelete")
	@ResponseBody
	public String deptDeleteProcess(@RequestParam(name="id") int departmentId) {
		Map<String, String> map = deptService.deleteDept(departmentId);
		return map.get("결과");
	}
	
}
