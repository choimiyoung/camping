<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


    
<!DOCTYPE html>
<html>
<head>
	<!--sweet alert  -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
	<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/main.css">

	
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">

#review2{
	height	:	1200px;
}
/* #carpool_market{
	height	:	1200px;
} */


.wrap {
	font-family: 'Noto Sans KR', sans-serif;
	text-decoration: none;
	border-collapse: collapse;
	/* margin: 0px;  */
	padding: 0px;
	color: #000;
	margin-right: 80px;
	cursor: pointer;
	
}

.nav {
	display:flex;
	width: 100%;
	justify-content:space-around;
	line-height: 80px;
	color: black;
	margin-bottom: 0px;
	list-style: none;
	font-weight: 700;
	
	
}

.nav>li {
	/* margin-left: 40px; */
	font-size: 21px;
	
	
}

.nav>li>a {
	/* margin-left:50px; */
	color: black;
	text-decoration: none;
	 transform: scale(1.2);
	  display: block;
	  transition: 0.6s;
	  background-color: #fff;
	  -webkit-background-clip: text;
      -moz-background-clip: text;
      background-clip: text;
}

.nav>li>a:hover{

	  transition: 0.1s;
	  transform: scale(1);
	  background-color: #1c445e;
	  color: transparent;
	  text-shadow: 2px 2px 3px rgba(255,255,255,0.5);
	  -webkit-background-clip: text;
      -moz-background-clip: text;
       background-clip: text;

}


.mypage{

	display:flex;
	width: 100%;
	justify-content:flex-end;
	line-height:30px;
	color: black;
	margin: 0;
	list-style: none;
	font-weight: normal;


}

.mypage>li{
/* 
	display:flex;
	justify-content:space-between;
	color: black;
	margin-bottom: 30px;
	list-style: none;  */
	margin-left: 30px;
	margin-right: 20px;
}

.mypage>li>a {
	text-decoration: none;
	color: black;
	font-weight: 300;
}


</style>

<script type="text/javascript">

	function searchAll() {
		
		var search_text = $("#search_text").val().trim();
		
		if(search_text==''){
			
			alert('???????????? ???????????????!!');
			$("#search_text").val("");
			$("#search_text").focus();
			return;
		}
		
		location.href = "/camping/homepage/total_search_list.do?search_text=" + encodeURIComponent(search_text);
		
	}

</script>




<script type="text/javascript">

   
   
   $(document).ready(function(){
      
         $("#btn_login_form").click(function(){
            
            if("${!empty user}"=="true"){
               
               location.href="${pageContext.request.contextPath}/member/mypage/my_page.do";
            }
            if("${!empty user and user.grade_idx eq '5'}"=="true"){
               
               location.href="${pageContext.request.contextPath}/member/member_mypage_adm.do";
               
            
            }
         
            
            if("${empty user}"=="true"){
            Swal.fire({
                 title: 'Login Form',
                 html: `<input type="text" id="login" class="swal2-input" placeholder="Username">
                 <input type="password" id="password" class="swal2-input" placeholder="Password">`,
                 showDenyButton: true,   
                 confirmButtonText: 'Sign in',
                /*  cancelButtonText:'????????????', */
                 denyButtonText: '????????????',
                 focusConfirm: false,
                 preConfirm: () => {
                    
                   const login = Swal.getPopup().querySelector('#login').value
                   const password = Swal.getPopup().querySelector('#password').value
                   if (!login || !password) {
                     Swal.showValidationMessage(`Please enter login and password`)
                   }
                   return { email: login, pwd: password }
                 }
               }).then((result) => {
                 
                  if (result.isConfirmed) {
                     //console.log(result.value.login)
                     var email = result.value.email;
                     var pwd= result.value.pwd;
                     
                     $.ajax({
                        
                        url: 'member/login.do',
                        data:{'mem_email':email,'mem_pwd':pwd},
                        dataType:'json',
                        success:function(result_data){
                           
                           // result_data = {'result': 'success'}
                           // result_data = {'result': 'fail_email'}
                           // result_data = {'result': 'fail_pwd'}
                           
                           if(result_data.result=='fail_email'){
                              Swal.fire('???????????????!',"email??? ???????????? ????????????",'warning');
                              return;
                           }else if (result_data.result=='fail_pwd'){
                              Swal.fire('????????? ??????!',"passwore??? ????????????",'error');
                              return;
                           }else if (result_data.result=='fail_mem_out'){
                        
                              Swal.fire('????????? ??????!',"????????? ???????????????.",'error');
                              return;
                           }
                           
                           if(result_data.result=='success'){
                              Swal.fire({
                                    icon: 'success',                         
                                    title: result_data.mem_nickname +"???"  ,        
                                    text: '???????????????!'
                                }).then(function(){
                                   location.href="";
                                   
                                });
                              
                           }
                           
                        }
                     });
                  }else if(result.isDenied){
                     
                     location.href="member/insert_form.do";
                  }
                  
                  
                  //console.log('id',id,'pwd',pwd);
                  
                  //Swal.fire('Hi!!');
                 
               }); 
            }
         });
   
         
   });
   
   
   function logout(){
      
      const swalWithBootstrapButtons = Swal.mixin({
           customClass: {
             confirmButton: 'btn btn-success',
             cancelButton: 'btn btn-danger'
           },
           buttonsStyling: false
         })

         swalWithBootstrapButtons.fire({
           title: '???????????? ???????????????????',
           text: "????????? ???????????????!",
           icon: 'warning',
           showCancelButton: true,
           confirmButtonText: 'Yes!',
           cancelButtonText: 'No, cancel!',
           reverseButtons: true
         }).then((result) => {
           if (result.isConfirmed) {
             swalWithBootstrapButtons.fire(
               'logout',
               '???????????????!',
               'success'
              
             ).then(function(){
                location.href="${pageContext.request.contextPath}/member/logout.do";
             });
           } else if (
             /* Read more about handling dismissals below */
             result.dismiss === Swal.DismissReason.cancel
           ) {
             swalWithBootstrapButtons.fire(
               'Cancelled',
               '?????????????????????;)',
               'error'
             )
           }
         });
      
      
   }
   
   
</script>

</head>



<body style="margin: 0">

   <div class="wrap">
      <ul class="nav">
         <li><a href="#link_header">HOME</a></li>
         <li><a href="#review2">REVIEW</a></li>
         <li><a href="#carpool_market">CARPOOL</a></li>
         <li><a href="#carpool_market">MARKET</a></li>
         <li><a href="#footer">WHEATER</a></li>
         <li><a href="#" id="btn_login_form" >MYPAGE</a></li>
         <!--????????? ??????????????? ????????????  -->
         
      </ul>
         <c:if test="${not empty user }">
         
               <ul class="mypage">
                  
                  <li><a href="#">
                     <c:if test="${user.grade_idx eq 1 }">
                        <img alt="???????????????" src="${ pageContext.request.contextPath }/resources/images/grade_bronze.JPG" width="30">
                     </c:if>
                     
                     <c:if test="${user.grade_idx eq 2 }">
                        <img alt="???????????????" src="${ pageContext.request.contextPath }/resources/images/grade_silver.JPG" width="30">
                     </c:if>
                     
                     <c:if test="${user.grade_idx eq 3 }">
                        <img alt="???????????????" src="${ pageContext.request.contextPath }/resources/images/grade_gold.JPG" width="30">
                     </c:if>
                     
                     <c:if test="${user.grade_idx eq 4 }">
                        <img alt="???????????????" src="${ pageContext.request.contextPath }/resources/images/grade_platinum.JPG" width="30">
                     </c:if>
                     
                     <c:if test="${user.grade_idx eq 5 }">
                        ?????????
                     </c:if>
                     </a></li>
                     
                  <li><a href="#">${user.mem_nickname}???</a></li>
                  <li><a href="#">?????????</a></li>
                  <li><a href="#" onclick="logout();">????????????</a></li>
               </ul>
         
         </c:if>
   </div>


   <div class="wrap_1">
      
      <div class="intro_bg">
         <div class="intro_text">
            <h1> CAMP US ???? </h1>
         </div>
         <div class= "search_area">
           <form>
            <input type="search" placeholder="Search" id="search_text" value="${ param.search_text }">
            <span><i class="bi-search" onclick="searchAll();"></i></span>
           </form>
         <ul class="hashtag">
            <li><a href="/camping/homepage/total_search_list.do?search_text=??????">#??????</a></li>
            <li><a href="/camping/homepage/total_search_list.do?search_text=?????????">#?????????</a></li>
            <li><a href="/camping/homepage/total_search_list.do?search_text=????????????">#????????????</a></li>
            <li><a href="/camping/homepage/total_search_list.do?search_text=??????">#??????</a></li>
            <li><a href="/camping/homepage/total_search_list.do?search_text=???????????????">#???????????????</a></li>
         </ul>
         </div>
      </div>
   </div>
   
<div class="slidebox">
   <input type="radio" name="slide" id="slide1" checked="checked">
   <input type="radio" name="slide" id="slide2" >
   <input type="radio" name="slide" id="slide3">
   <input type="radio" name="slide" id="slide4">
   <ul class="slidelist">
     <li class="slideitem">
      <div>
         <label for="slide4" class="left"></label>
         <label for="slide2" class="right"></label>
         <a><img src="${ pageContext.request.contextPath }/resources/images/slideimg01.jpg"></a>
         
      </div>
     </li>
     <li class="slideitem">
      <div>
         <label for="slide1" class="left"></label>
         <label for="slide3" class="right"></label>
         <a><img src="${ pageContext.request.contextPath }/resources/images/slideimg02.jpg"></a>
      </div>
     </li>
     <li class="slideitem">
      <div>
         <label for="slide2" class="left"></label>
         <label for="slide4" class="right"></label>
         <a><img src="${ pageContext.request.contextPath }/resources/images/slideimg03.jpg"></a>
      </div>
     </li>
     <li class="slideitem">
      <div>
         <label for="slide3" class="left"></label>
         <label for="slide1" class="right"></label>
         <a><img src="${ pageContext.request.contextPath }/resources/images/slideimg04.jpg"></a>
      </div>
     </li>
   </ul>
</div>

<div id="review2">
   <%@include file="review2.jsp" %>
</div>

<div id="carpool_market">
   <%@include file="carpool_market.jsp" %>
</div>

<div id="footer">
   <%@include file ="footer.jsp" %>
</div>
</body>
</html>