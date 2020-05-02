package a.s.h.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.ui.Model;

import a.s.h.dto.BoardDto;

public interface BoardService {
	
	//게시글 리스트
	public List<BoardDto> boardList(HashMap<String, Object> hashMap);
	
	//게시글 전체개수
	public int boardCount(BoardDto boardDto);
		
	//게시글 상세화면
	public BoardDto goView(String boardCd);
	
	//게시글 등록화면
	public void boardReg(Model model,BoardDto boardDto);
	
	//게시글 삭제하기
	public void goDelete(String boardCd);
	
	//게시글 수정화면
	public BoardDto goModify(String boardCd);
	
	//게시글 수정완료화면
	public void goModifyComplete(BoardDto boardDto);
	
			
	
}
