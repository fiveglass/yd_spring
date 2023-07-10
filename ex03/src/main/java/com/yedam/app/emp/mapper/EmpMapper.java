package com.yedam.app.emp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.app.emp.service.EmpVO;

public interface EmpMapper {
	//전체조회
	public List<EmpVO> selectEmpAllList();
	//딘건조회
	public EmpVO selectEmpInfo(EmpVO empVO);
	
	//등록
	public int insertEmpInfo(EmpVO empVO);
	
	//수정 - 급여를 정해진 비율로 인상
	//두개이상의 파라미터의 경우 마이바티스에서 인식 불가
	//@param을 통해서 mapper에 이용될 이름 짓기(mapper에서만 사용)
	public int updateEmpSal(@Param("emp") int emlpoyeeId, @Param("raise") int raise);
	
	//수정 - 사원정보를 수정
	public int updateEmpInfo(EmpVO empVO);
	
	//삭제
	public int deleteEmpInfo(int employeeId);
	
}
