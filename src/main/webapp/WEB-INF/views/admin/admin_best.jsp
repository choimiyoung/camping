<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
    
<html>

<head>
<!-- Bootstrap CSS -->

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <!-- Bootstrap core CSS -->
  <link href="../resources/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!--external css-->
  <link href="../resources/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="../resources/css/zabuto_calendar.css">
  <link rel="stylesheet" type="text/css" href="../resources/lib/gritter/css/jquery.gritter.css" />
  <!-- Custom styles for this template -->
  <link href="../resources/css/style.css" rel="stylesheet">
  <link href="../resources/css/style-responsive.css" rel="stylesheet">
  <script src="../resources/lib/chart-master/Chart.js"></script>

<!-- 검색페이징 -->
<script type="text/javascript">
	
	function search() {
		
		var search = $("#search").val();
		var search_text = $("#search_text").val().trim();
		
		//전체검색이 아닌경우
		if(search != 'review_all' && search_text == ''){
			alert('검색어를 입력하세요!!');
			$("#search_text").val('');
			$("#search_text").focus();
			return;
		}
		
		location.href="review_list.do?search=" + search + "&search_text=" + encodeURIComponent(search_text);
		
	
	}

	$(function(){
		
		
		
		if("${ not empty param.search }"=="true"){
			$("#search").val('${param.search}');
		}
		
		//전체 검색이 실행시 검색어를 지우기
		if("${ param.search eq 'review_all' }"=="true"){
			$("#search_text").val('');
		}
		
		
		
		
	}); 

</script>

<script type="text/javascript">

	function best_select(review_idx){
		
		$.ajax({
			
			url			:	"../admin/best_select.do",
			data		:	{"review_idx":review_idx},
			success		:	function(res_data){
				
				$("#disp").html(res_data);
				alert("해당글을 베스트리뷰로 등록하였습니다");
				location.href="admin_best_list.do";
				
				
				
			},
			error		:	function(err){
				alert(err.responseText);
			}
			
		});
		
		
	}

</script>

<style type="text/css">

	#best_review_box{
		text-align:center;
		margin-top: 50px;		
		margin-bottom: 50px;		
	}

	.best_three{
		width	:	1000px;
	}
	
	.best_pic{
		display	:	inline-block;
		width	:	200px;
		height	:	200px;
		overflow: hidden;
		margin: 0 auto;
		
		border:  1px solid  #cccccc ;
		box-shadow: 1px 1px 2px black;
		border-radius: 15px 15px;
		
	}
	
	.best_pic > img	{
		
  		width: 100%;
  		height:100%;
  		object-fit:cover;
  	
  		
	}
	
</style>

</head>




<body>
  <section id="container">

    <header class="header black-bg">
      <div class="sidebar-toggle-box">
        <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
      </div>
      <!--logo start-->
      <a href="/camping/" class="logo"><b>HOME</b></a>
      <!--logo end-->
      <div class="nav notify-row" id="top_menu">
        <!--  notification start -->
        <ul class="nav top-menu">
          <!-- settings start -->
          <li class="dropdown">
            <a data-toggle="dropdown" class="dropdown-toggle" >
              <i class="fa fa-tasks">신규회원</i>
              <span class="badge bg-theme">8</span>
              </a>
            <ul class="dropdown-menu extended tasks-bar">
              <div class="notify-arrow notify-arrow-green"></div>
              <li>
                <p class="green">신규회원이 8명 가입했습니다.</p>
              </li>
       
            </ul>
          </li>
          <!-- settings end -->
          <!-- inbox dropdown start-->
          <li id="header_inbox_bar" class="dropdown">
            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
              <i class="fa fa-envelope-o">등업회원</i>
              <span class="badge bg-theme">3</span>
              </a>
            <ul class="dropdown-menu extended inbox">
              <div class="notify-arrow notify-arrow-green"></div>
              <li>
                <p class="green">등업이 필요한 회원이 3명있습니다.</p>
              </li>
  
        </ul>
        <!--  notification end -->
      </div>
      <div class="top-menu">
        <ul class="nav pull-right top-menu">
          <li><a class="logout" href="login.html">Logout</a></li>
        </ul>
      </div>
    </header>
  
    <aside>
      <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu" id="nav-accordion">
          <p class="centered"><a href="profile.html"><img src="../resources/img/ui-sam.jpg" class="img-circle" width="80"></a></p>
          <h5 class="centered">관리자임당</h5>
          <li class="mt">
            <a  href="/camping/admin/admin_page.do">
              <i class="fa fa-dashboard"></i>
              <span>Dashboard</span>
              </a>
          </li>
     
          <li class="sub-menu">
            <a href="carpool_list.do">
              <i class="fa fa-th"></i>
              <span>카풀 게시판</span>
              </a>
          </li>
     
          <li class="sub-menu">
              <a href="market_list.do">
              <i class="fa fa-th"></i>
              <span>마켓 게시판</span>
              </a>
          </li>
     
          <li class="sub-menu">
            <a href="review_list.do">
              <i class="fa fa-th"></i>
              <span>리뷰 게시판</span>
              </a>
          </li>
        
          <li class="sub-menu">
            <a href="member_list.do">
              <i class="fa fa-th"></i>
              <span>멤버리스트</span>
              </a>
          </li>
          
          <li class="sub-menu">
           <a class="active"href="#">
              <i class="fa fa-th"></i>
              <span>베스트리뷰</span>
              </a>
          </li>
        </ul>
        <!-- sidebar menu end-->
      
      </div>
    </aside>
    <!--sidebar end-->

  <!--main content start-->
<section id="main-content">
 <section class="wrapper">
  <div class="row">
	<div class="container">
		<h1>Best Review</h1>

			<div id="best_review_box">
				<div id="best_review_three">
					<div class="best_three">
						<c:forEach var="review_vo" items="${review_list }">
						<%-- ${review_vo.best_number} --%>
							<div class="best_pic">
								<img
									src="${pageContext.request.contextPath}/resources/upload/${review_vo.review_thumbnail}">
							</div>

						</c:forEach>
					</div>
				</div>
			</div>
			
			<div class="testlist">
			<form id="boardForm" name="boardForm" method="post">
				<table class="table table-hover">
					<colgroup>
						<col width="10%" />
						<col width="28%" />
						<col width="10%" />
						<col width="10%" />
						<col width="15%" />
						<col width="15%" />
						<col width="20%" />
					</colgroup>
					

				   <div class="page_nation">
				    <a href="#" onclick="paging();">
				         ${ pageMenu }
				      </a>   
					 </div>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>조회수</th>
							<th>좋아요</th>
							<th>작성자</th>
							<th>등록일자</th>
							<th></th>
						</tr>
					</thead>
					  <c:if test="${ empty list }">
			             <tr>
			                <td colspan="7" align="center">
			                   게시물이 없습니다.
			                </td>
			             </tr>
			          </c:if>
					<c:forEach var="vo" items="${ list }">
					<tr>
						<td>${ vo.review_no }</td>
						<td class="subject"><a href="../board/review_view.do?review_idx=${vo.review_idx }&page=${ empty param.page ? 1 : param.page}&search=${ param.search }&search_text=${ param.search_text}">${ vo.review_title }</td>
						<td>${ vo.review_hit_count }</td>
						<td>${ vo.cnt }</td>
						<td>${ vo.mem_nickname }</td>
						<td>${ fn:substring(vo.review_regdate,0,10) }</td>
						<td><input type="button" value="베스트리뷰선택" onclick="best_select('${vo.review_idx }')"></td>
					</tr>
				</c:forEach>
					<tbody id="dataSection"></tbody>
				</table>
			</form>
		</div>

	</div>
		</div>
</section>
</section>
	
		<!-- pagination{s} -->
		<div class="pagination1">
			<ul id="paginationBox" class="pagination">
				
			</ul>
		</div>
		<!-- pagination{e} -->

		<!-- search{s} -->

		<div class="form-group row justify-content-center">

			<div class="w100" style="padding-left: 10px">
				<select class="form-control form-control-sm" name="searchField" id="search">
					<option value="all">전체보기</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="mem_nickname">작성자</option>
						<option value="title_content_mem_nickname">제목+작성자+내용</option>
				</select>
			</div>

			<div class="w300" style="padding-right: 10px">
				<input type="text" class="form-control form-control-sm"
					name="search_text" id="search_text" value="${ param.search_text }">
			</div>

			<div>
				<button class="btn btn-sm btn-primary" name="btnSearch"
					id="btnSearch" onclick="search();">검색</button>
			</div>
		</div>

		<div id="disp2"></div>
		
</body>


</html>
</html>