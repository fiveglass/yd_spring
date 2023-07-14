package com.yedam.web.board.mapper;

import java.util.List;

import com.yedam.web.borad.service.BoardVO;

public interface BoardMapper {
	//전체조회
	public List<BoardVO> selectBoardAllList();
	
	//단건조회
	public BoardVO selectBoardInfo(BoardVO boardVO);
	
	//등록
	//게시글 번호 자동생성
	//테이블을 참조해서 필수값과 옵션값을 구분하기
	public int insertBoardInfo(BoardVO boardVO);
	
	//수정
	//수정대상 : 제목, 내용, 이미지
	//수정 시 수정 날짜가 반드시 등록 될 것
	public int updateBoardInfo(BoardVO boardVO);
	
	//삭제
	public int deleteBoardInfo(int bNo);
	
}
