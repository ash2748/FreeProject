package a.s.h.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import a.s.h.dto.BoardDto;
import a.s.h.dto.ReplyDto;
import a.s.h.service.ReplyService;

@RestController
@RequestMapping("/reply/*")
public class ReplyController {
	
	@Autowired
	ReplyService replyService;
	
	//댓글리스트
	@PostMapping("/replyList")
	public ResponseEntity<List<ReplyDto>> replyList(Model model, @RequestBody BoardDto boardDto){
		ResponseEntity<List<ReplyDto>> returnEntity;	//reg여부에 따라 상태코드를 다르게 보내기 위하여 RepsonseEntity 타입 인스턴스
		List<ReplyDto> list = new ArrayList<>();
		
		try {
			list	=	replyService.replyList(boardDto);	//댓글 리스트 불러오기
			
			returnEntity = new ResponseEntity<List<ReplyDto>>(list, HttpStatus.ACCEPTED);
		}catch (Exception e) {
			e.printStackTrace();
			returnEntity = new ResponseEntity<List<ReplyDto>>(list, HttpStatus.BAD_REQUEST);
		}
			
		return returnEntity;
	}
	
	//댓글등록
	@PostMapping("/replyReg")
	public ResponseEntity<ReplyDto> replyReg(Model model, @RequestBody ReplyDto replyDto){
		ResponseEntity<ReplyDto> returnEntity;	//reg여부에 따라 상태코드를 다르게 보내기 위하여 RepsonseEntity 타입 인스턴스
		ReplyDto replyGet = new ReplyDto();

		try {
			replyService.replyReg(replyDto);				//댓글등록
			
			replyGet = replyService.replyGet(replyDto);		//등록댓글 불러오기
			
			returnEntity = new ResponseEntity<ReplyDto>(replyGet, HttpStatus.ACCEPTED);
		}catch (Exception e) {
			e.printStackTrace();
			returnEntity = new ResponseEntity<ReplyDto>(replyGet, HttpStatus.BAD_REQUEST);
		}
		
		return returnEntity;
	}
	

}
