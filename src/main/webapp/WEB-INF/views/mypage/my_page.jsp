<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="${ pageContext.request.contextPath }/resources/my_page.css" rel="stylesheet" type="text/css">
</head>


<script type="text/javascript">


//내가쓴 게시물 목록가져오기
var global_page=1;

function category_list(page){
		 /* alert("되라"); */
      
      $.ajax({
        url      :   "category_list.do",
        data      :   {"mem_idx":"${ user.mem_idx }" , "page":page },
        success   :   function(res_data){
           // res_data-> comment_list.jsp의 html 내용
           $(".bottom_box").html(res_data);
           
        },
        error      :   function(err){
           alert(err.responseText);
        }
     });// end:category_list

}

</script>

<script type="text/javascript">


//내가 쓴 댓글목록가져오기
var global_page=1;

function category_list(comment_page){
		 /* alert("되라"); */
      
      $.ajax({
        url      :   "category_list.do",
        data      :   {"mem_idx":"${ user.mem_idx }" , "page":comment_page  },
        success   :   function(res_data){
           // res_data-> comment_list.jsp의 html 내용
           $(".bottom_box").html(res_data);
           
        },
        error      :   function(err){
           alert(err.responseText);
        }
     });// end:category_list

}

</script>



<script type="text/javascript">


//댓글목록가져오기
var global_page=1;

function category_reply_list(comment_page){
		/*  alert("되라"); */
      
      $.ajax({
        url      :   "category_reply_list.do",
        data      :   {"mem_idx":"${ user.mem_idx }"/* , "page":comment_page */ },
        success   :   function(res_data){
           // res_data-> comment_list.jsp의 html 내용
           $(".bottom_box").html(res_data);
           
        },
        error      :   function(err){
           alert(err.responseText);
        }
     });// end:category_list

}

</script>

<script type="text/javascript">


//댓글목록가져오기
var global_page=1;

function category_like_list(comment_page){
		/*  alert("되라"); */
      
      $.ajax({
        url      :   "category_like_list.do",
        data      :   {"mem_idx":"${ user.mem_idx }"/* , "page":comment_page */ },
        success   :   function(res_data){
           // res_data-> comment_list.jsp의 html 내용
           $(".bottom_box").html(res_data);
           
        },
        error      :   function(err){
           alert(err.responseText);
        }
     });// end:category_list

}

</script>
<script type="text/javascript">


//내 쪽지함 가져오기

  function  msg_list(user.mem_idx){
	  
	  if("${ empty user }" != "true"){	
	      
		 location.href="../admin/msg_list.do"; 	
	
	  } 
	   
  }//end function

</script>


<script type="text/javascript">


/*    
   //현재 Document가 배치완료되면
   $(document).ready(function(){
	   
	   //댓글목록 가져오기
	   comment_list(1);
	   
   }); */

</script>


<body>
<div class="main_box">

   <!-- 왼쪽 여백에 등급 표시(회원의 등급 가져와서 보여줄것) -->
   <div class="left_side_box">
      <br><br><br>
      <c:if test="${user.grade_idx eq 1 }">
         <img alt="이미지없음" src="${ pageContext.request.contextPath }/resources/images/grade_bronze.JPG" width="70"height="70px">&nbsp;&nbsp;<br>
      	 브론즈
      </c:if>
      <c:if test="${user.grade_idx eq 2 }">
         <img alt="이미지없음" src="${ pageContext.request.contextPath }/resources/images/grade_silver.JPG" width="70"height="70px">&nbsp;&nbsp;<br>
      	실버
      </c:if>
      
      <c:if test="${user.grade_idx eq 3 }">
         <img alt="이미지없음" src="${ pageContext.request.contextPath }/resources/images/grade_gold.JPG" width="70"height="70px">&nbsp;&nbsp;<br>
      	골드
      </c:if>
      
      <c:if test="${user.grade_idx eq 4 }">
         <img alt="이미지없음" src="${ pageContext.request.contextPath }/resources/images/grade_platinum.JPG" width="70"height="70px">&nbsp;&nbsp;<br>
      	플래티넘
      </c:if>
      
      <c:if test="${user.grade_idx eq 5 }">
         <img alt="이미지없음" >&nbsp;&nbsp;<br>
      	관리자
      </c:if>
      
      
      <span>등급&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
   </div>
   
   <!-- 오른쪽 공백(아무것도 넣지 않음) -->
   <div class="right_side_box">
   </div>
   
   <!-- 누구님, 자기소개 -->
   <div class="top_left_box">
   <h2>MY PAGE</h2>
   <h2>${user.mem_nickname}</h2><!-- 누구인지 가져올것 -->
   <span>${user.mem_profile}</span>
   </div>
   
   <!-- 프로필사진,개인정보수정,우편함 -->
   <div class="top_right_box">
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <img src="${ pageContext.request.contextPath }/resources/upload/${ user.mem_pic_filename }" width="120px" height="120px"><br>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <a href="my_profile_page.do">개인정보수정</a>
   <a href="../../admin/msg_list.do?mem_nickname=${user.mem_nickname}">
   <img src="${ pageContext.request.contextPath }/resources/images/message.png" width="30px" height="30px"><!-- 뱃지기능추가 -->
   </div>
   
   <!-- 내가쓴글,내가쓴댓글,좋아요글,좋아요댓글 -->
   <div class="middle_box">
   <br><br><br><br>
   <hr  color="gray" size="20" >
   <span><a href="#" onclick="category_list(1);" >내가 쓴 글 <font color="gray">${categoryCount }</font></a></span>&nbsp;&nbsp;
   <span><a href="#" onclick="category_reply_list();" >내가 쓴 댓글<font color="gray">${ replyCount }</font></a></span>&nbsp;&nbsp;
   <span><a href="#" onclick="category_like_list();" >내가 좋아요한 글<font color="gray">${ likeCount }</font></a></span>&nbsp;&nbsp;
   <span><a href="#" onchange="category_like__reply_list();" >내가 좋아요한 댓글<font color="gray">${ replyLikeCount }</font></a></span>
   </div>
   
   <!-- 실제 아래에 목록 보여주기 -->
   <div	class="bottom_box"></div>
   
   

</div>
</body>
</html>