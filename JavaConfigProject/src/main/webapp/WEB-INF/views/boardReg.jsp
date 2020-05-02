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
	       			<div class="form-group">
	       				<label>작성자</label>
	       				<input type="text" class="form-control" name="writeUser">
	       				<label>제목</label>
	       				<input type="text" class="form-control" name="boardTitle" >
	       			</div>
	       			<div class="form-group">
	       				<label>내용</label>
	       				<textarea class="form-control" name="boardContent"></textarea>
	       			</div>
	       			<div>
	             	<p>
	             		<button type="button" class="btn btn-primary board_reg">완료</button>
	             		<button type="button" class="btn btn-primary list">목록</button>
	             	</p>
	           		</div>
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
		$(".board_reg").on('click',function(){
			$("form").submit();
		})
		
	}
</script>