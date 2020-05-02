<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div id="page-wrapper">
	<div class="row">
	    <div class="col-lg-12">
	        <h1 class="page-header">Tables</h1>
	    </div>
	</div>
	<div class="row">
	   <div class="col-lg-12">
	       <div class="panel panel-default">
	       	<div class="panel-heading">
	       		Board Register
	       	</div>
	       	<div class="panel-body">
	       		<form role="form" class="regForm" action="/board/regComplete">
	       			<div class="table-responsive">
		       			<table class="table table-bordered table-striped">
		       				<tbody>
		       					<tr>
		       						<th style="text-align: center; width:20%;">작성자</th>
		       						<td style="text-align: center;">
		       							${boardView.writeUser}
		       						</td>
		       						<th style="text-align: center; width:20%;">조회수</th>
		       						<td style="text-align: center;">
		       							${boardView.boardCnt}
		       						</td>
		       						<th style="text-align: center; width:20%;">작성일</th>
		       						<td style="text-align: center;">
		       							${boardView.writeDate}
		       						</td>
		       					</tr>
		       				</tbody>
		       			</table>
	       			</div>
		       		<div class="form-group">
			       		<label>제목</label>
			       		<input type="text" class="form-control" name="boardTitle" value="${boardView.boardTitle}" readonly="readonly">
		       		</div>
	       			<div class="form-group">
	       				<label>내용</label>
	       				<textarea class="form-control" name="boardContent" readonly="readonly">${boardView.boardContent}</textarea>
	       			</div>
	       			<div>
	             	<p>
	             		<button type="button" class="btn btn-primary board_modify">수정</button>
	             		<button type="button" class="btn btn-primary board_delete">삭제</button>
	             		<button type="button" class="btn btn-primary board_list">목록</button>
	             	</p>
	           		</div>
					<input type="hidden" id="boardCd" name="boardCd" value="${boardView.boardCd}">
					<input type="hidden" id="nowPageNum" name="nowPageNum" value="${paging.nowPageNum}">
	       		</form>
	       	</div>
	       	
	       	<!-- reply 입력란 -->
	       	<div class="panel-body">
	       		<p>
	       			<label>댓글달기</label>
	       		</p>
	       		<div class="panel">
		       	<div class="form-group">
		       		<label>작성자</label>
		       		<input type="text" id="replyUser" class="form-control replyUser" name="replyUser">
					<label>댓글</label>
	                <textarea rows="3" id="replyContent" class="form-control replyContent" name="replyContent"></textarea>
	            </div>
	            <p>
					<button type="button" id="reply_reg" class="btn btn-success" name="" style="float: right;">댓글등록</button>
				</p>
				</div>
            </div>
            
            <!-- reply list -->
            <div class="panel-body reply_list_body">
            	<!-- <div class="reply_container">
	            <div class="panel panel-green reply_body">
	            	 <div class="panel-heading reply_user">
	               	 	ash2748
	            	 </div>
	                 <div class="panel-body reply_content">
	            	 	<p style="float:left;">댓글 테스트</p>
	            	 	<div style="float:right;">
		                    <p>
			             		<button type="button" class="reply_reply_reg">답변</button>
			             		<button type="button" class="reply_delete">삭제</button>
		             	    	<input  type="hidden" class="buttonFlag" value="empty"/>
		             	    </p>
	                 	</div>
	                 </div>
		         </div>
		         </div> -->
		         <!-- 답변창붙음 -->
	        </div>
	   </div>
	</div>
</div>
</div>

<input type="hidden" id="ureplyUser" name="ureplyUser" value="">
<input type="hidden" id="ureplyCd" name="ureplyCd" value="">


<script>
	$(document).ready(function() {
	    addButtonEvent();
	    replyInit();
	});
	
	//댓글리스트 가져오기F
	function replyInit(){
		var boardCd = $("#boardCd").val();	//댓글 리스트
		
		$.ajax({
			url: "/reply/replyList",
			data: JSON.stringify({ 
				"boardCd"		: boardCd,
			}), 
			method: "POST", 
			dataType: "json", 								// 서버에서 보내줄 데이터의 타입
			contentType: "application/json; charset=UTF-8",	//JSON타입으로 보내기 위해 contentType 설정(컨트롤러에서는 @ReqeustBody 있는 경우 자동 set)
			success : function(list,status){
				replyInitDrawing(list);
			},error : function(status){
				alert("에러");
			}
		});
	}
	
	//댓글리스트 그리기(init)F
	function replyInitDrawing(list){
		var innerHtml = "";
		
		list.forEach(list => 
			replyDrawing("N",list)
		);
		
	}
	
	//버튼F
	function addButtonEvent(){
		//목록 돌아가기
		$(".board_list").on('click',function(){
			location.href = "/board/list?nowPageNum=" + ${paging.nowPageNum} + "&articles=" + ${paging.articles};
		});
		
		//글등록화면
		$(".board_reg").on('click',function(){
			$("form").submit();
		});
		
		//글삭제
		$(".board_delete").on('click',function(){
			location.href = "/board/goDelete?boardCd=" + $("#boardCd").val();
		});
		
		//수정
		$(".board_modify").on('click',function(){
			location.href = "/board/goModify?boardCd=" + $("#boardCd").val() + "&nowPageNum=" + ${paging.nowPageNum} + "&articles=" + ${paging.articles};
		});
		
		//댓글등록
		$("#reply_reg").on('click',function(){
			replyReg();
		});
		
		//대댓글 등록(답변 버튼)
		$(document).on('click','.reply_reply_reg',function(e){
			e.preventDefault();
			var flag		=	$(this).closest("p").find(".buttonFlag");
			var flagValue	=	flag.val();
			var ureplyUser	=	$(this).closest(".reply_body").find(".writeUser").val();
			var ureplyCd	=	$(this).closest(".reply_body").find(".replyCd").val();
			
			
			//this 버튼 클릭시, 답변창 그리기 / 플래그 added
			//this 버튼 다시 클릭시, 답변창 닫기
			
			
			if(flagValue == "empty"){												//답변창 없을 때
				replyReplyBoxDrawing($(this),flagValue, ureplyUser, ureplyCd);		//답변창 그리기
				flag.val("added");
				$(this).text("취소");
			}else{																	//답변창 있을 때
				replyReplyBoxDrawing($(this),flagValue);							//답변창 삭제
				flag.val("empty");
				$(this).text("답변");
			} 
		});
		
		//대댓글 등록 완료
		$(document).on('click', '.reply_reply_reg_complete', function(){
			var body 		 = $(this).closest(".reply_reply_body");		//대댓글창 몸통
			var bodyPrev	 = $(this).closest(".reply_container");			//이거 여부로 댓글 달기
			$(this).closest("p").find(".buttonFlag").val("empty");
			
			var boardCd		 = $("#boardCd").val();							//게시글코드
			var replyUser 	 = body.find(".replyUser").val();				//작성자
			var replyContent = body.find(".replyContent").val();			//댓글컨텐츠
			var ureplyCd	 = body.find(".ureplyCd").val();				//부모댓글코드
			var ureplyUser	 = body.find(".ureplyUser").val();				//부모댓글유저
			
			replyReplyReg(bodyPrev, boardCd, replyUser, replyContent, ureplyCd, ureplyUser);
			
			body.remove();
		});
	}
	
	
	//댓글등록하기(에이젝스)F
	function replyReg(){
		var boardCd		 = $("#boardCd").val();								//게시글코드
		var replyUser 	 = $("#replyUser").val();							//작성자
		var replyContent = $("#replyContent").val();						//댓글컨텐츠
		var bodyPrev	 = "N";
			
		//에이젝스 호출
		$.ajax({
			url: "/reply/replyReg",
			data: JSON.stringify({ 
				"boardCd"		: boardCd,
				"replyUser"	    : replyUser,
				"replyContent"  : replyContent
			}), 
			method: "POST", 
			dataType: "json", 								// 서버에서 보내줄 데이터의 타입
			contentType: "application/json; charset=UTF-8",	//JSON타입으로 보내기 위해 contentType 설정(컨트롤러에서는 @ReqeustBody 있는 경우 자동 set)
			success : function(body,status){
				if(status == 'success'){
					replyDrawing(bodyPrev, body);						//등록성공 시, 댓글 그려주기
				}else{
					alert("오류가 발생하였습니다.");
				}
			}
		});
	}
	
	//대댓글등록하기(에이젝스)F
	function replyReplyReg(bodyPrev, boardCd, replyUser, replyContent, ureplyCd, ureplyUser){
			
		//에이젝스 호출
		$.ajax({
			url: "/reply/replyReg",
			data: JSON.stringify({ 
				"boardCd"		: boardCd,
				"replyUser"	    : replyUser,
				"replyContent"  : replyContent,
				"ureplyCd"		: ureplyCd,
				"ureplyUser"	: ureplyUser
			}), 
			method: "POST", 
			dataType: "json", 											// 서버에서 보내줄 데이터의 타입
			contentType: "application/json; charset=UTF-8",				//JSON타입으로 보내기 위해 contentType 설정(컨트롤러에서는 @ReqeustBody 있는 경우 자동 set)
			success : function(body,status){
				if(status == 'success'){
					replyDrawing(bodyPrev, body);						//등록성공 시, 댓글 그려주기
				}else{
					alert("오류가 발생하였습니다.");
				}
			}
		});
	}
	
	//댓글 추가F
	function replyDrawing(bodyPrev, body){
		var replyListBody = "";
		if(bodyPrev != "N"){
			replyListBody = bodyPrev;			
		}else{
			replyListBody = $(".reply_list_body");	//댓글 최상위 DOM
		}
		var innerHtml     = "";						//drawing할 DOM
		
		//더할 내용 추가
		innerHtml += '<div class="reply_container">';
		innerHtml += '<div class="panel panel-green reply_body">';
		innerHtml += '	<div class="panel-heading reply_user">';
		innerHtml += 		body.replyUser;
		innerHtml += '	</div>';
		innerHtml += '	<div class="panel-body reply_content">';
		innerHtml += '		<p style="float:left;">';
		if(body.ureplyUser != null){
			innerHtml += '  	<div style="color:red; float:left;">@' + body.ureplyUser + ' : </div>';							
		}
		innerHtml += 			body.replyContent;
		innerHtml += '		</p>';
		innerHtml += '		<div style="float:right;">';
		innerHtml += '			<p>';
		innerHtml += '				<button type="button" class="reply_reply_reg">답변</button>';
		innerHtml += '				<button type="button" class="reply_delete">삭제</button>';
		innerHtml += '				<input  type="hidden" class="buttonFlag" value="empty"/>';
		innerHtml += '			</p>';
		innerHtml += '		</div>';
		innerHtml += '		<input type="hidden" class="writeUser" name="writeUser" value="'+ body.replyUser+'"/>';
		innerHtml += '		<input type="hidden" class="replyCd"   name="replyCd" value="'+ body.replyCd+'"/>';
		innerHtml += '	</div>';
		innerHtml += '	</div>';
		innerHtml += '	</div>';
		innerHtml += '</div>';
		innerHtml += '</div>'
		
		
		replyListBody.append(innerHtml);
	}
	
	//대댓글창 그리기F
	function replyReplyBoxDrawing(dom, flagValue, ureplyUser, ureplyCd){
		var replyBody = dom.closest(".reply_container");
		var innerHtml = "";
		
		if(flagValue == "empty"){								//답변창 없는 상태일 때
			innerHtml 	  += '<div class="form-group reply_reply_body">';
			innerHtml	  += '		<label>작성자</label>';
			innerHtml	  += '		<input type="text" id="replyUser" class="form-control replyUser" name="replyUser">';
			innerHtml 	  += '		<label>답변</label>';
			innerHtml	  += '		<textarea rows="3" id="replyContent" class="form-control replyContent" name="replyContent"></textarea>';
			innerHtml	  += '		<button type="button" class="btn btn-default btn-circle reply_reply_reg_complete"><i class="fa fa-check"></i></button>';
			innerHtml 	  += '		<input type="hidden"  class="ureplyUser" name="ureplyUser" value="'  + ureplyUser +'"/>';
			innerHtml 	  += '		<input type="hidden"  class="ureplyCd"   name="ureplyCd"   value="'  + ureplyCd	 +'"/>';
			innerHtml	  += '</div>';
			
			replyBody.append(innerHtml);						//대댓글창을 더하기
		}else{													//답변창이 있는 상태일 때
			replyBody.find(".reply_reply_body").remove();		//대댓글창 삭제(next,siblings 왜 안 먹혀 왜!!)
		}
	}
</script>