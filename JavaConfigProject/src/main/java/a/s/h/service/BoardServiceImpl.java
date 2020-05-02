package a.s.h.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import a.s.h.dao.BoardDao;
import a.s.h.dto.BoardDto;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDao boardDao;
	
	//게시글 상세 보기
	@Override
	public BoardDto goView(String boardCd) {
		//카운트를 1 올린다.
		upCount(boardCd);
		return boardDao.goView(boardCd);
	}
	
	//게시글 카운트 업
	private void upCount(String boardCd) {
		boardDao.upCount(boardCd);
	}
	
	//게시글 리스트
	@Override
	public List<BoardDto> boardList(HashMap<String, Object> hashMap) {
		return boardDao.boardList(hashMap);
	}
	
	//게시글 전체개수
	@Override
	public int boardCount(BoardDto boardDto) {
		return boardDao.boardCount(boardDto);
	}

	@Override
	public void boardReg(Model model, BoardDto boardDto) {
		boardDao.boardReg(boardDto);
		
	}

	@Override
	public void goDelete(String boardCd) {
		boardDao.goDelete(boardCd);
	}
	
	//게시글 수정화면
	public BoardDto goModify(String boardCd) {
		return boardDao.goModify(boardCd);
	}
	
	//게시글 수정완료화면
	public void goModifyComplete(BoardDto boardDto) {
		boardDao.goModifyComplete(boardDto);
	}
		
		
	
	
	
}
