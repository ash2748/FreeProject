package a.s.h.dto;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class BoardDto {
	private PagingDto pagingDto;
	
	private String boardCd;
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private int boardCnt;
	private String writeUser;
	private String writeDate;
	private String updateUser;
	private String updateDate;
	
	private String searchOption;
	private String searchKeyword;
}
