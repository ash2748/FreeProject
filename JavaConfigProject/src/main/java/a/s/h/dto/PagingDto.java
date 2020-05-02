package a.s.h.dto;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class PagingDto {
	private int total;			//총 글의 개수
	private int articles;		//볼 글의 개수
	private int pageNum;		//전체 페이지 번호
	private int nowPageNum;		//현재 페이지 번호
	private int fromArticleNum;	//~부터
	private int toArticleNum;	//~까지
	private int fromButton;		//프롬버튼
	private int toButton;		//투버튼
	
	public PagingDto() {
		
	}
	
	public PagingDto(int nowPageNum, int total, int articles) {
		this.nowPageNum	= nowPageNum;
		this.total      = total;
		this.articles   = articles;
		this.pageNum    = setTotalPageNum(total, articles);
		
		setFromTo();			//가져올 글의 첫번째부터 끝번째 번호
		setFromToButton();		//페이지버튼 개수 및 버튼의 처음과 끝 셋팅
	}

	//페이지 총 번호 셋팅
	private int setTotalPageNum(int total, int articles) {
		return (total%articles == 0 ? total/articles : total/articles + 1);
	}
	
	//from and to setting
	private void setFromTo() {
		this.fromArticleNum = ((nowPageNum - 1) * articles) + 1;
		this.toArticleNum	= nowPageNum * articles;
	}
	
	//from and to Button setting
	private void setFromToButton() {
		this.fromButton = 1 + ((nowPageNum-1)/10 * 10);
		this.toButton	= fromButton + 9 >= pageNum ? pageNum : fromButton + 9;
	}
}
