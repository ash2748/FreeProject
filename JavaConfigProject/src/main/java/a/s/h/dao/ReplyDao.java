package a.s.h.dao;

import java.util.List;

import a.s.h.dto.BoardDto;
import a.s.h.dto.ReplyDto;

public interface ReplyDao {
	
	//댓글리스트
	public List<ReplyDto> replyList(BoardDto boardDto);
	//댓글등록
	public void replyReg(ReplyDto replyDto);
	//댓글 가져오기
	public ReplyDto replyGet(ReplyDto replyDto);
}
