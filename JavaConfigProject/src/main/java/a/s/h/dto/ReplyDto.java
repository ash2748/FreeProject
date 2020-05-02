package a.s.h.dto;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ReplyDto {
	private String replyCd;			//댓글코드
	private String replyUser;		//댓글유저아이디
	private int replyNo;			//댓글번호
	private String replyContent;	//댓글내용
	private String ureplyCd;		//상위댓글코드
	private String ureplyUser;		//상위댓글유저아이디
	private String boardCd;			//게시글 코드
	private String writeDate;		//댓글일자
	private String updateDate;		//댓글업데이트일자
}
