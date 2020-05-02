<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Tables</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            DataTables Advanced Tables
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        	<div class="dataTables_length" id="dataTables-example_length" style="float:left;">
                        		<label>Show
                        		<select id="articles" name="articles" aria-controls="dataTables-example" class="form-control input-sm">
	                        		<option value="10">10</option>
	                        		<option value="25">25</option>
	                        		<option value="50">50</option>
	                        		<option value="100">100</option>
                        		</select> entries</label>
                        	</div>
                        	<div class="dataTables_length">
                        		<div id="dataTables-example_filter" class="dataTables_filter">
                        			<div>
	                        			<select id="searchOption" class="form-control input-sm" name="searchOption" aria-controls="dataTables-example" >
	                        				<option value="A" <c:if test="${empty board.searchOption}">selected</c:if>>전체</option>
	                        				<option value="W" <c:if test="${board.searchOption eq 'W'}">selected</c:if>>작성자</option>
	                        				<option value="T" <c:if test="${board.searchOption eq 'T'}">selected</c:if>>제목</option>
	                        			</select>
	                        			<input type="search" id="searchKeyword" class="input-sm" name="searchKeyword"  value="${empty board.searchKeyword? '' : board.searchKeyword}"placeholder="" aria-controls="dataTables-example">
	                        			<button id="search">검색</button>
                        			</div>
                        		</div>
                        	</div>
                            <table width="100%" class="table table-striped table-bordered table-hover" id="">
                                <thead>
                                    <tr>
                                        <th>작성자</th>
                                        <th>제목</th>
                                        <th>조회수</th>
                                        <th>작성일</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${list}" var="vo">
	                                <tr class="odd even">
		                                <td class="center">
		                                	${vo.writeUser}
		                                </td>
		                                <td class="center">
		                                	<a href="#" id="${vo.boardCd}" onclick="goView('${vo.boardCd}', '${paging.nowPageNum}','${paging.articles}')">${vo.boardTitle}</a>
		                                </td>
		                                <td class="center">
		                                	${vo.boardCnt}
		                                </td>
		                                <td class="center">
		                                	${vo.writeDate}
		                                </td>
	                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <!-- /.table-responsive -->
                            <div>
	                        	<p>
	                        		<button type="button" class="btn btn-primary board_reg" style="float:left;">글작성</button>
	                        	</p>
	                        	<!-- 페이징 -->
                       			<div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
                       			<ul class="pagination">
	                       			<li class="paginate_button previous" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous">
	                       				<a href="/board/list?nowPageNum=${paging.nowPageNum eq 1 ? 1 : paging.nowPageNum - 1}&articles=${paging.articles}&searchOption=${board.searchOption}&searchKeyword=${board.searchKeyword}">Previous</a>
	                       			</li>
	                       			<c:forEach begin="${paging.fromButton}" end="${paging.toButton}" varStatus="status">
		                       			<li class="paginate_button ${status.index eq paging.nowPageNum ? 'active' : ''}" aria-controls="dataTables-example" tabindex="0">
		                       				<a href="/board/list?nowPageNum=${status.index}&articles=${paging.articles}&searchOption=${board.searchOption}&searchKeyword=${board.searchKeyword}">${status.index}</a>
		                       			</li>
	                       			</c:forEach>
	                       			<li class="paginate_button next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next">
	                       				<a href="/board/list?nowPageNum=${(paging.nowPageNum eq paging.pageNum) ? paging.pageNum : paging.nowPageNum+1}&articles=${paging.articles}&searchOption=${board.searchOption}&searchKeyword=${board.searchKeyword}">Next</a>
	                       			</li>
                       			</ul>
                       			</div>
                       		</div>
                       		
                        </div>
                        <!-- /.panel-body -->
                       
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Kitchen Sink
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>First Name</th>
                                            <th>Last Name</th>
                                            <th>Username</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>Mark</td>
                                            <td>Otto</td>
                                            <td>@mdo</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>Jacob</td>
                                            <td>Thornton</td>
                                            <td>@fat</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>Larry</td>
                                            <td>the Bird</td>
                                            <td>@twitter</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Basic Table
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>First Name</th>
                                            <th>Last Name</th>
                                            <th>Username</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>Mark</td>
                                            <td>Otto</td>
                                            <td>@mdo</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>Jacob</td>
                                            <td>Thornton</td>
                                            <td>@fat</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>Larry</td>
                                            <td>the Bird</td>
                                            <td>@twitter</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Striped Rows
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>First Name</th>
                                            <th>Last Name</th>
                                            <th>Username</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>Mark</td>
                                            <td>Otto</td>
                                            <td>@mdo</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>Jacob</td>
                                            <td>Thornton</td>
                                            <td>@fat</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>Larry</td>
                                            <td>the Bird</td>
                                            <td>@twitter</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Bordered Table
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive table-bordered">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>First Name</th>
                                            <th>Last Name</th>
                                            <th>Username</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>Mark</td>
                                            <td>Otto</td>
                                            <td>@mdo</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>Jacob</td>
                                            <td>Thornton</td>
                                            <td>@fat</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>Larry</td>
                                            <td>the Bird</td>
                                            <td>@twitter</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Hover Rows
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>First Name</th>
                                            <th>Last Name</th>
                                            <th>Username</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>Mark</td>
                                            <td>Otto</td>
                                            <td>@mdo</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>Jacob</td>
                                            <td>Thornton</td>
                                            <td>@fat</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>Larry</td>
                                            <td>the Bird</td>
                                            <td>@twitter</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Context Classes
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>First Name</th>
                                            <th>Last Name</th>
                                            <th>Username</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="success">
                                            <td>1</td>
                                            <td>Mark</td>
                                            <td>Otto</td>
                                            <td>@mdo</td>
                                        </tr>
                                        <tr class="info">
                                            <td>2</td>
                                            <td>Jacob</td>
                                            <td>Thornton</td>
                                            <td>@fat</td>
                                        </tr>
                                        <tr class="warning">
                                            <td>3</td>
                                            <td>Larry</td>
                                            <td>the Bird</td>
                                            <td>@twitter</td>
                                        </tr>
                                        <tr class="danger">
                                            <td>4</td>
                                            <td>John</td>
                                            <td>Smith</td>
                                            <td>@jsmith</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
        
        $("#articles").val(${paging.articles});
        
        
        addButtonEvent();
    });
    
    function addButtonEvent(){
    	$(".board_reg").on('click',function(){
    		location.href = '/board/reg';
    	});
    	
    	//글개수
    	$("#articles").on('change',function(){
    		location.href = '/board/list?nowPageNum=' + ${paging.nowPageNum} + '&articles=' + $(this).val();
    	});
    	
    	//키워드 검색
    	//검색 벨류를 넘겨서 쿼리에서 조건 붙여 가져옴
    	//검색시 현재 페이지와 글개수를 같이 넘겨서 페이지를 유지
    	$("#search").on('click',function(){
    		var searchOption	 = $("#searchOption option:checked").val();
    		var searchKeyword	 = $("#searchKeyword").val();
    		var articles		 = $("#articles option:checked").val();
    		
    		//location.href = '/board/list?nowPageNum=' + ${paging.nowPageNum} + '&articles=' + $(this).val() + '&searchOption=' + searchOption + '&searchKeyword=' + searchKeyword;
    		location.href = '/board/list?nowPageNum=' + 1 + '&articles=' + articles  + '&searchOption=' + searchOption + '&searchKeyword=' + searchKeyword;
    		
    	});
    }
    
    //글보기
    function goView(value,pageNum,articles){
    	var id = value;
    	var nowPageNum = pageNum;
    	
    	location.href = '/board/goView?boardCd=' + id + "&nowPageNum=" + nowPageNum + "&articles=" + articles;
    }
    
    
    
    </script>
