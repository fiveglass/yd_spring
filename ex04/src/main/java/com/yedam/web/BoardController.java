package com.yedam.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.web.borad.service.BoardService;
import com.yedam.web.borad.service.BoardVO;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	//전체조회 : uri = boardList, return = board/boardList
	@GetMapping("/boardList")
	public String getBoardList(Model model) {
		model.addAttribute("boardList", boardService.getBoardList());
		
		return "board/boardList";
	}
	
	
	//단건조회 : uri = boardInfo, return = board/boardInfo
	@GetMapping("/boardInfo")
	public String getBoardInfo(BoardVO boardVO, Model model) {
		BoardVO findVO = boardService.getBoardInfo(boardVO);
		model.addAttribute("boardInfo", findVO);
		
		return "board/boardInfo";
	}
	
	//등록(폼) : uri = boardInsert, return = board/boardInsert
	@GetMapping("/boardInsert")
	public String boardInsertForm() {
		return "board/boardInsert";
	}
	
	//데이터 처리 방법
	//Redirect : 강제로 페이지를 원하는 곳으로 이동
	
	//서로 자바객체를 이해할 수 있도록 매핑해주는 것이라 이해하면 쉬움
	//ResponseBody : 클라이언트에서 서버로 필요한 데이터를 요청하기 위해 JSON 데이터를 요청 본문에 담아서 서버요청 (자바객체를 HTTP요청의 바디내용으로 매핑)
	//RequestBody : 서버에서 클라이언트로 응답 데이터를 전송(자바객체-> HTTP 응답 본문의 객체 변환 전송)
	//위와 같은 형식은 페이지 이동은 되지 않고 값만 전달
	//xml이나 json기반의 메시지를 사용하는 요청의 경우에 이 방법이 매우 유용
	//ajax처리 시 get, post에 따라 데이터를 알아서 처리
	
	//session : 값을 임시 저장하는 장소로 쓰임
	//생성 : HttpSession session = request.getSession();
	//사용 : session.setAttribute(String name, Object value);
	
	//등록(처리) : uri = boardInsert, return = 전체조회 다시 호출
	@PostMapping("/boardInsert")
	public String boardInsertProcess(BoardVO boardVO, RedirectAttributes rtt) {
		boardService.insertBoardInfo(boardVO);
		return "redirect:boardList";
	}
	
	//수정(폼) : uri = boardUpdate, return = board/boardUpdate
	@GetMapping("/boardUpdate")
	public String boardUpdate(BoardVO boardVO, Model model) {
		BoardVO findVO = boardService.getBoardInfo(boardVO);
		model.addAttribute("boardInfo", findVO);
	
		return "board/boardUpdate";
	}
	
	//수정(처리) : uri= boardUpdate, return = 수정대상, 성공여부 반환
	@PostMapping("/boardUpdate")
	@ResponseBody
	public Map<String, Object> boardUpdateProcess(BoardVO boardVO){
		boolean result = false;
		
		int boardNo = boardService.updateBoardInfo(boardVO);
		if(boardNo  > -1) {
			result = true;
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("result", result);
		map.put("boardInfo", boardVO);
		
		return map;
				
	}
	
	
	@GetMapping("/boardDelete")
	public String boardDelete(@RequestParam(name="bno", defaultValue="0") int bno, RedirectAttributes rtt) {
		boardService.deleteBoardInfo(bno);
		return "redirect:boardList";
	}
	
}
