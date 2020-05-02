package a.s.h.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import a.s.h.dto.BoardDto;
import a.s.h.dto.PagingDto;
import a.s.h.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	
	//게시판 리스트
//	@GetMapping("/list")
//	public String list(Model model, int nowPageNum, int articles, String searchKeyword) {
//		int total 	   		= 0;
//		List list 			= new ArrayList<>();
//
//		total    		    = boardService.boardCount();							//글 전체 개수
//		PagingDto pagingDto = new PagingDto(nowPageNum, total, articles);			//현재글번호, 글 전체 개수, 보여줄 글 개수 셋팅
//		
//		list 				= boardService.boardList(pagingDto);
//
//		model.addAttribute("paging",pagingDto);										
//		model.addAttribute("list",list);
//		
//		return "/list";
//	}
	
	//게시판 리스트
		@GetMapping("/list")
		public String list(Model model, int nowPageNum, int articles, BoardDto boardDto) {
			int total 	   					= 0;
			List list 						= new ArrayList<>();
			HashMap<String, Object> hashMap = new HashMap<String, Object>();

			total    		   				= boardService.boardCount(boardDto);							//글 전체 개수
			
			PagingDto pagingDto 			= new PagingDto(nowPageNum, total, articles);			//현재글번호, 글 전체 개수, 보여줄 글 개수 셋팅
			
			hashMap.put("boardDto", boardDto);
			hashMap.put("pagingDto", pagingDto);
			
			list 							= boardService.boardList(hashMap);

			model.addAttribute("paging",pagingDto);	
			model.addAttribute("board",boardDto);
			model.addAttribute("list",list);
			
			return "/list";
		}
	
	//게시글 등록 화면
	@GetMapping("/reg")
	public String reg(Model model, BoardDto boardDto) {
		return "/boardReg";
	}
	
	//게시글 등록 완료
	@GetMapping("/regComplete")
	public String regComplete(Model model, BoardDto boardDto) {
		boardService.boardReg(model, boardDto);
		//SELECT KEY로 생성된 값을 받아온 후 map에 담음
		//기본 현재페이지번호 1셋팅, 글개수10 셋팅
		//모델에 map을 셋팅
		//리다이렉트는 view로 바꿈
		
		return "redirect:/board/goView?boardCd=" + boardDto.getBoardCd() + "&nowPageNum=1&articles=10";
	}
	
	//게시글 상세 보기
	@GetMapping("/goView")
	public String goView(Model model, @RequestParam String boardCd, @RequestParam int nowPageNum, @RequestParam int articles) {
		BoardDto boardView  = new BoardDto();
		PagingDto pagingDto = new PagingDto();
		
		pagingDto.setNowPageNum(nowPageNum);	//현재글번호 셋팅
		pagingDto.setArticles(articles);		//글개수 셋팅
		
		boardView 		   = boardService.goView(boardCd);
		
		model.addAttribute("boardView", boardView);
		model.addAttribute("paging",pagingDto);
		
		return "/boardView";
	}
	
	@GetMapping("/goDelete")
	public String goDelete(Model model, String boardCd) {
		boardService.goDelete(boardCd);
		
		return "redirect:/board/list?nowPageNum=1&articles=10"; 
	}
	
	@GetMapping("/goModify")
	public String goModify(Model model, @RequestParam String boardCd, @RequestParam int nowPageNum, @RequestParam int articles) {
		BoardDto boardModify = new BoardDto();
		PagingDto pagingDto = new PagingDto();
		
		boardModify = boardService.goModify(boardCd);	//수정할 데이터 가져오기
		
		pagingDto.setNowPageNum(nowPageNum);	//현재글번호 셋팅
		pagingDto.setArticles(articles);		//글개수 셋팅
		
		model.addAttribute("boardModify", boardModify);
		model.addAttribute("paging",pagingDto);
		
		return "/boardModify"; 
	}
	
	@PostMapping("/goModifyComplete")
	public String goModifyComplete(Model model, BoardDto boardDto, PagingDto pagingDto) {
		boardService.goModifyComplete(boardDto);	//수정할 데이터 가져오기
		
		return "redirect:/board/goView?boardCd=" + boardDto.getBoardCd() + "&nowPageNum=" + pagingDto.getNowPageNum() + "&articles=" + pagingDto.getArticles(); 
	}
}
