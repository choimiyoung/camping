<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"   uri="http://java.sun.com/jsp/jstl/functions" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
  .content_type, .regdate_type{
     border: 1px solid #cccccc;
     padding: 5px;
     margin: 5px;
  }
  
  .content_type{
     min-height: 50px;
  }
</style>


 

</head>
<body>


<hr>


<!-- <a  href="list.do?page=1">1</a> -->

<!-- for(CommentVo vo : list) -->
<div>${pageMenu}</div>
<c:forEach var="vo1"  items="${map1.carpool_reply_mem_list }">

    <div class="panel panel-success">
      <div class="panel-heading">
                <b>${ user.mem_email }</b>님의 게시글
                <!-- 글쓴이만 삭제 -->
                
      </div>
      
      <div class="panel-body">
         <div class="content_type">
            <%-- ${ vo1.carpool_reply_title } --%>
         </div> 
         <div class="regdate_type">작성일자: ${ fn:substring(vo1.carpool_reply_regdate,0,16) }</div>
      </div>
    </div>
</c:forEach>
<c:forEach var="vo2"  items="${map1.market_reply_mem_list }">

    <div class="panel panel-success">
      <div class="panel-heading">
                <b>${ user.mem_email }</b>님의 게시글
                <!-- 글쓴이만 삭제 -->
                
      </div>
      
      <div class="panel-body">
         <div class="content_type">
           <%--  ${ vo2.market_reply_title } --%>
         </div> 
         <div class="regdate_type">작성일자: ${ fn:substring(vo2.market_reply_regdate,0,16) }</div>
      </div>
    </div>
</c:forEach>   
<c:forEach var="vo3"  items="${map1.review_reply_mem_list }">

    <div class="panel panel-success">
      <div class="panel-heading">
                <b>${ user.mem_email }</b>님의 게시글
                <!-- 글쓴이만 삭제 -->
                
      </div>
      
      <div class="panel-body">
         <div class="content_type">
          <%--   ${ vo3.review_reply_title } --%>
         </div> 
         <div class="regdate_type">작성일자: ${ fn:substring(vo3.review_reply_regdate,0,16) }</div>
      </div>
    </div>
</c:forEach>





</body>
</html>