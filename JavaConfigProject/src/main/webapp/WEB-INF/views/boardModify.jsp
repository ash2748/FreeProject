<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	       		<form role="form" name= "frm" method="POST">
	       			<div class="table-responsive">
		       			<table class="table table-bordered table-striped">
		       				<tbody>
		       					<tr>
		       						<th style="text-align: center; width:20%;">작성자</th>
		       						<td style="text-align: center;">
		       							${boardModify.writeUser}
		       						</td>
		       						<th style="text-align: center; width:20%;">조회수</th>
		       						<td style="text-align: center;">
		       							${boardModify.boardCnt}
		       						</td>
		       						<th style="text-align: center; width:20%;">작성일</th>
		       						<td style="text-align: center;">
		       							${boardModify.writeDate}
		       						</td>
		       					</tr>
		       				</tbody>
		       			</table>
	       			</div>
	       			<div class="form-group">
	       				<label>제목</label>
	       				<input type="text" class="form-control" name="boardTitle" value="${boardModify.boardTitle}">
	       			</div>
	       			<div class="form-group">
	       				<label>내용</label>
	       				<textarea class="form-control" name="boardContent">${boardModify.boardContent}</textarea>
	       			</div>
	       			<div>
	             	<p>
	             		<button type="button" class="btn btn-primary board_modify_complete">완료</button>
	             		<button type="button" class="btn btn-primary board_modify_cancel">취소</button>
	             		<button type="button" class="btn btn-primary list">목록</button>
	             	</p>
	           		</div>
	           		<input type="hidden" id="writeUser" name="writeUser" value="${boardModify.writeUser}">
					<input type="hidden" id="boardCd" name="boardCd" value="${boardModify.boardCd}">
					<input type="hidden" id="nowPageNum" name="nowPageNum" value="${paging.nowPageNum}">
					<input type="hidden" id="articles" name="articles" value="${paging.articles}">
	       		</form>
	       	</div>
	       </div>
	   </div>
	</div>
</div>

<script>
	$(document).ready(function() {
	    addButtonEvent();
	});
	
	function addButtonEvent(){
		//목록 돌아가기
		$(".board_list").on('click',function(){
			location.href = "/board/list";
		});
		
		//수정취소
		$(".board_modify_cancel").on('click',function(){
			location.href = "/board/goView?boardCd=" + $("#boardCd").val();
		});
		
		//수정완료
		$(".board_modify_complete").on('click',function(){
			var frm = document.frm;
			frm.action = "/board/goModifyComplete";
			frm.submit();
		});
	}
</script>