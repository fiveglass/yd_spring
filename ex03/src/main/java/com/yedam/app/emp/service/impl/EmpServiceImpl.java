package com.yedam.app.emp.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.app.emp.mapper.EmpMapper;
import com.yedam.app.emp.service.EmpService;
import com.yedam.app.emp.service.EmpVO;
import com.yedam.app.tx.mapper.AaaMapper;

@Service
public class EmpServiceImpl implements EmpService {
	
	//@Autowired : 필요한 의존 객체의 “타입"에 해당하는 빈을 찾아 주입
	//database-context에 bean으로 등록되어있음
	@Autowired
	EmpMapper empMapper;
	
	@Autowired //하나의 메소드에 여러개의 어노테이션 가능
	AaaMapper aaaMapper;
	
	@Override
	public List<EmpVO> getEmpAll() {
		// TODO Auto-generated method stub
		return empMapper.selectEmpAllList();
	}

	@Override
	public EmpVO getEmp(EmpVO empVO) {
		// TODO Auto-generated method stub
		return empMapper.selectEmpInfo(empVO);
	}

	@Override
	public int insertEmp(EmpVO empVO) {
		int result = empMapper.insertEmpInfo(empVO);
		if(result == 1) {
			return empVO.getEmployeeId();
		}else {
			return -1;
		}
	}

	@Override
	public String updateEmpSal(int empId, int raise) {
		String message = null;
		
		EmpVO empVO = new EmpVO();
		empVO.setEmployeeId(empId);
		
		int result = empMapper.updateEmpSal(empVO, raise);
		if(result == 1) {
			message = "정상적으로 급여를 갱신하였습니다.";
		}else {
			message = "작업이 실패하였습니다. 정보를 확인해주세요.";
		}
		return message;
	}

	@Override
	public Map<String, String> updateEmp(EmpVO empVO) {
		Map<String, String> map = new HashMap<>();
		
		map.put("사원번호", String.valueOf(empVO.getEmployeeId()));
		
		int result = empMapper.updateEmpInfo(empVO);
		
		if(result == 1) {
			map.put("결과", "Success");
		}else {
			map.put("결과", "Fail");
		}
		return map;
	}

	@Override
	public Map<String, String> deleteEMp(int empId) {
		Map<String, String> map = new HashMap<>();
		
		map.put("사원번호", String.valueOf(empId));
		
		int result = empMapper.deleteEmpInfo(empId);
		
		if(result == 1) {
			map.put("결과", "Success");
		}else {
			map.put("결과", "Fail");
		}
		return map;
	}

}
