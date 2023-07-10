package com.yedam.app;

import static org.junit.Assert.assertEquals;
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
	@Test
	public void selectEmpInfo() {
		EmpVO empVO = new EmpVO();
		empVO.setEmployeeId(100); //객체에 EmployeeId 담기
		
		EmpVO findVO = empMapper.selectEmpInfo(empVO); //실행된 반환값을 findVO로 넣어줌
		assertEquals(findVO.getLastName(), "King"); //assertEquals 두가지의 값이 같은지 여부
	}
}
