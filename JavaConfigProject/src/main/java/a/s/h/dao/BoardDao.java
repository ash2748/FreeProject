package a.s.h.dao;

import java.util.HashMap;
import java.util.List;

import a.s.h.dto.BoardDto;

public interface BoardDao {
	
	//게시글 리스트
	public List<BoardDto> boardList(HashMap<String, Object> hashMap);
	
	//게시글 전체개수
	public int boardCount(BoardDto boardDto);
	
	//게시글 상세 화면
	public BoardDto goView(String boardCd);
	
	//게시글 등록 화면
	public void boardReg(BoardDto boardDto);
	
	//게시글 삭제하기
	public void goDelete(String boardCd);
	
	//게시글 수정화면
	public BoardDto goModify(String boardCd);
	
	//게시글 수정완료화면
	public void goModifyComplete(BoardDto boardDto);

	//게시글 카운트 업
	public void upCount(String boardCd);

}
