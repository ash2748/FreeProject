package a.s.h.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import a.s.h.dao.ReplyDao;
import a.s.h.dto.BoardDto;
import a.s.h.dto.ReplyDto;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	ReplyDao replyDao;
	
	//댓글 리스트
	@Override
	public List<ReplyDto> replyList(BoardDto boardDto) {
		// TODO Auto-generated method stub
		return replyDao.replyList(boardDto);
	}
	
	//댓글 등록
	@Override
	public void replyReg(ReplyDto replyDto) {
		replyDao.replyReg(replyDto);
	}

	@Override
	public ReplyDto replyGet(ReplyDto replyDto) {
		return replyDao.replyGet(replyDto);	
	}

	
	
	//댓글 가져오기
	
	

	
	//댓글 수정
	
	//댓글 삭제
	
	

}
