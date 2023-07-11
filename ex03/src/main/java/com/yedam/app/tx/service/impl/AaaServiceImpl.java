package com.yedam.app.tx.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yedam.app.tx.mapper.AaaMapper;
import com.yedam.app.tx.service.AaaService;

@Service
public class AaaServiceImpl implements AaaService {

	@Autowired
	AaaMapper aaaMapper;
	
	//작업 실패 시 실제 db에서도 적용하지 않게끔 하고 싶을 때(하나의 트랜잭션으로 묶어버리는 것)
	@Transactional
	@Override
	public void insert() {
		aaaMapper.insert("101");
		aaaMapper.insert("987");

	}

}
