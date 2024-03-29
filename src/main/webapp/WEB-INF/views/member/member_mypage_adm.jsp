<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>   
<style type="text/css">
   
   body{ 
      margin:0; 
      
      font-family:'맑은 고딕', verdana;
       padding:80px;
   }
   
    .top{
       width: 100%;
       margin-bottom: 40px;
        display:block;
    }
   
   .table_option{
      
      float: left;
      margin-bottom: 0px;
      margin-left: 10px;
      
   }
   
/*    
   .btn {
      float:right;
   
    }
    */
   section> #container { 
      padding:20px 0; 
      border-top:2px solid #eee; 
      border-bottom:2px solid #eee;
      
      margin-left: auto;
      margin-right: auto;
      
       }
    
    aside { 
       float:left; 
       width:200px; 
       }
   
    div#container_box { 
       float:right; 
       width:calc(100% - 200px - 20px); 
    
       }
       
    
    aside>ul>li { 
       text-align:center; 
       margin-bottom:10px; 
      
       }
       
   
   li { 
         
         font-size:20px; 
         text-align:center; 
         padding:15px;
         
         
         
         }
         
   #category { font-size:30px; 
              margin-bottom:20px; 
               text-align:center; 
               width: 20%;}
   
   li a { 
         color:#000; 
         display:block; 
         padding:10px 0; 
         text-decoration: none;
         }
   
   li a:hover { 
         text-decoration:none; 
         background:#eee; 
         }
         
   .table_list{
   
   
      margin-left: auto;
      margin-right: auto;
      width: 100%;
      
      
   }
   .table_list th {
      font-size:  20px;
      font-weight: bold;
      text-align: center;
      padding: 10px;
      border-bottom: 2px solid #666;
      
   }
   
   
   .table_list tbody td{
      
      text-align:center;
      font-size: 12px;
      border-bottom: 1px solid #e4e4e4;
      
   }
   
   
   .table_list tbody td a  {
      
      text-align:left;
      font-size: 12px;
      height: 33px;
      text-decoration: none;
      color: black;
      
   }
   
   .table_list tbody td a:hover  {
      
      text-decoration: underline;
      
   }
   
   .table_list tbody td img  {
      
      width: 100px;
      
   }
   
   
   #title{
   
      padding-bottom: 70px;
      text-align: center;
      margin: auto;
      font-size: 80px;
   }
   
   
   .page_wrap {
      padding-top: 100px;
      text-align:center;
      font-size:0;
    }
    
   
   .page_nation {
      display:inline-block;
   }
   .page_nation .none {
      display:none;
   }
   .page_nation a {
      display:block;
      margin:0 3px;
      float:left;
      border:1px solid #e6e6e6;
      width:28px;
      height:28px;
      line-height:28px;
      text-align:center;
      background-color:#fff;
      font-size:13px;
      color:#999999;
      text-decoration:none;
   }
   
   
   .page_nation {
      border:1px solid #ccc;
   }
   .page_nation .first {
      background:#f8f8f8 url('${ pageContext.request.contextPath }/resources/images/page_pprev.png') no-repeat center center;
      margin-left:0;
   }
   .page_nation .prev {
      background:#f8f8f8 url('${ pageContext.request.contextPath }/resources/images/page_prev.png') no-repeat center center;
      margin-right:7px;
   }
   .page_nation .next {
      background:#f8f8f8 url('${ pageContext.request.contextPath }/resources/images/page_next.png') no-repeat center center;
      margin-left:7px;
   }
   .page_nation .last {
      background:#f8f8f8 url('${ pageContext.request.contextPath }/resources/images/page_nnext.png') no-repeat center center;
      margin-right:0;
   }
   .page_nation a:hover, 
   .page_nation a.active {
      background-color:#42454c;
      color:#fff;
      border:1px solid #42454c;
   }
   
</style>
   

<script type="text/javascript">
	
	function search() {
		
		var search = $("#search").val();
		var search_text = $("#search_text").val().trim();
		
		//전체검색이 아닌경우
		if(search != 'member_all' && search_text == ''){
			alert('검색어를 입력하세요!!');
			$("#search_text").val('');
			$("#search_text").focus();
			return;
		}
		
		location.href="member_mypage_adm.do?search=" + search + "&search_text=" + encodeURIComponent(search_text);
		
	
	}

	$(function(){
		
		if("${ not empty param.search }"=="true"){
			$("#search").val('${param.search}');
		}
		
		//전체 검색이 실행시 검색어를 지우기
		if("${ param.search eq 'member_all' }"=="true"){
			$("#search_text").val('');
		}
		
	}); 

</script>
   
<!-- 등급수정폼 -->   
<script type="text/javascript">

	function change() {
		
		location.href="grade_change.do?mem_idx=${ vo.mem_idx }";
		
	}



</script>   
<script type="text/javascript">
var mem_idx = "${vo.mem_idx}";

function member_getout(mem_idx){
	 
	   Swal.fire({
	        title: '정말 해당 사용자를 \n 휴면계정으로 \n전환하시겠습니까?',
	        html: "<h5>선택한 사용자정보가 휴면계정으로 전환됩니다</h5>",
	        icon: 'question',
	        showCancelButton: true,
	        confirmButtonColor: '#3085d6',
	        cancelButtonColor: '#d33',
	        confirmButtonText: '강퇴',
	        cancelButtonText:  '취소'
	      }).then((result) => {
	        
	         if (result.isConfirmed) {
	            
	        	 location.href="member_getout.do?mem_idx="+mem_idx; 
	            
	            return;
	            
	         }
	      });
	      
	   }//member_getout
	   
   //관리자로 등업
   function member_admin(mem_idx){
		 
	   Swal.fire({
	        title: '정말 해당 사용자를 \n 관리자로 \n전환하시겠습니까?',
	        html: "<h5>선택한 사용자가 관리자로 전환됩니다</h5>",
	        icon: 'question',
	        showCancelButton: true,
	        confirmButtonColor: '#3085d6',
	        cancelButtonColor: '#d33',
	        confirmButtonText: '등업',
	        cancelButtonText:  '취소'
	      }).then((result) => {
	        
	         if (result.isConfirmed) {
	            
	        	 location.href="member_admin.do?mem_idx="+mem_idx; 
	            
	            return;
	            
	         }
	      });
	      
	   }//member_admin   
  
</script>       
   
   
   </head>
   <body>
   
   
   <h id="title">member list</h5>
   <div class="top">
    <!--   <form method="post" name="search" action=""> -->
		<table class="table_option">
			<tr>
				<td><select class="form-control" id="search" name="searchField" style="font-size:16px;">
						<option value="member_all">전체보기</option>
						<option value="grade_idx">등급별</option>
						<option value="mem_regdate">가입일자</option>
				</select></td>
				<td>
				  <input type="text" class="form-control"
					     placeholder="검색어 입력" name="searchText" id="search_text" value="${ param.search_text }" maxlength="100" >
				</td>
				<td>
				  <button type="button" class="btn-search" value="검색" onclick="search();">검색</button>
				</td>
			</tr>

		</table>
  <!--     </form> -->
   
     
   </div>
   
       <table  class="table_list">
          <thead>
             <tr>
                <th>회원번호</th>
                <th>등급</th>
                <th>닉네임</th>
                <th>쓴글</th>
                <th>쓴댓글</th>
                <th>좋아요글</th>
                <th>좋아요댓글</th>
                <th>이메일</th>
                <th>생일</th>
                <th>가입일</th>
                <th>휴면여부</th>
                <th>선택</th>
             </tr>
          </thead>
          
          <tbody>
                <c:if test="${empty list }">
                <tr>
                   <td colspan="12" align="center">
                      <font color="red">등록된 회원이 없습니다</font>
                   </td>
                </tr> 
                </c:if>
          </tbody>
             
          <tbody>
             <c:forEach  var="vo" items="${list}">
      
            <tr>
            
               <td>${ vo.mem_idx }</td>
               <c:if test="${vo.grade_idx eq 1 }"> <td>브론즈</td></c:if>
               <c:if test="${vo.grade_idx eq 2 }"> <td>실버</td></c:if>
               <c:if test="${vo.grade_idx eq 3 }"> <td>골드</td></c:if>
               <c:if test="${vo.grade_idx eq 4 }"> <td>플레티넘</td></c:if>
               <c:if test="${vo.grade_idx eq 5 }"> <td>관리자</td></c:if>
               <td>${ vo.mem_nickname }</td>
               <td>쓴글</td>
               <td>쓴댓글</td>
               <td>좋아요글</td>
               <td>좋아요댓글</td>
               <td>${ vo.mem_email }</td>
               <td>${ vo.mem_birth }</td>
               <td>${fn:substring(vo.mem_regdate,0,10) }</td>
               <c:if test="${vo.mem_status eq 0 }"> <td style="color: red;">휴면계정</td></c:if>
               <c:if test="${vo.mem_status eq 1 }"> <td>정상계정</td></c:if>
               <td>
                   <div style="text-align:center;"> 
                   <button class="btn btn-outline-dark"
                           onclick="member_getout('${ vo.mem_idx }');" >휴면계정전환</button> 
                   <button class="btn btn-outline-dark"
                   		   onclick="member_admin('${ vo.mem_idx }');" >관리자로등업</button>
                  </div>
               </td>
            </tr>
      
             </c:forEach>      
          </tbody>
       </table> 
   
   <div class="page_wrap">
      <div class="page_nation">
         ${ pageMenu }
      </div>
    </div>
      
   
   
   
</body>
</html>