package com.yedam.app;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yedam.app.emp.mapper.EmpMapper;
import com.yedam.app.emp.service.EmpVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/spring/database-context.xml")
//locations의 값은 database-context.xml의 properties 경로 가져오기
public class EmpMapperClient {
	@Autowired
	EmpMapper empMapper;
	
	//전체조회
	//@Test
	public void selectAllEmp() {
		List<EmpVO> empList = empMapper.selectEmpAllList();
		assertTrue(!empList.isEmpty()); //원하는 방향으로 반전시키기
		
	}
	
	//단건조회
	//@Test
	public void selectEmpInfo() {
		EmpVO empVO = new EmpVO();
		empVO.setEmployeeId(100); //객체에 EmployeeId 담기
		
		EmpVO findVO = empMapper.selectEmpInfo(empVO); //실행된 반환값을 findVO로 넣어줌
		assertEquals(findVO.getLastName(), "King"); //assertEquals 두가지의 값이 같은지 여부
	}
	
	//등록
	//@Test
	public void insertEmpInfo() {
		EmpVO empVO = new EmpVO();
		empVO.setLastName("Kang");
		empVO.setFirstName("San-Ha");
		empVO.setEmail("shKang@google.com");
		empVO.setJobId("IT_PROG");
		empVO.setSalary(5000);
		
		//오류가 나지 않는다면 아래 실행
		empMapper.insertEmpInfo(empVO);
		assertNotEquals(empVO.getEmployeeId(), 0);
			
	}
	
	//급여 갱신
	//@Test
	public void updateEmpSal() {
		EmpVO empVO = new EmpVO();
		empVO.setEmployeeId(1001);
		int result =empMapper.updateEmpSal(empVO, 10);
		assertEquals(result, 1);
	}
	
	//정보수정
	//@Test
	public void updateEmpInfo() {
		EmpVO empVO = new EmpVO();
		empVO.setEmployeeId(1001);
		
		EmpVO findVO = empMapper.selectEmpInfo(empVO);
		System.out.println(findVO);
		
		empVO.setEmail("sanh@naver.com");
		empVO.setSalary(6200);
		
		int result = empMapper.updateEmpInfo(empVO);
		assertEquals(result, 1);
	}
	
	//삭제
	@Test
	public void deleteEmpInfo() {
		int result = empMapper.deleteEmpInfo(1001);
		assertEquals(result, 1);
	}
}
