<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>carpool_market</title>
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   
 <!--     <script>
   
         var mem_idx = "${user.mem_idx}";
   
        $(function () {
           console.log(mem_idx);
        });
    </script> -->
   
    <script type="text/javascript">
         var mem_idx = "${user.mem_idx}";
         var carpool_idx = "${vo.carpool_idx}";
         var carpool_like_idx = "${vo.carpool_like_idx}";
         var market_idx = "${vo.market_idx}";
         var market_like_idx = "${vo.market_like_idx}";
         
         
      function updatelike(carpool_idx){
         
           $.ajax({
               type : "POST",  
               url : "/camping/carpool_insertlike.do",       
               dataType : "json",   
               data : {  'mem_idx' : mem_idx,'carpool_idx' : carpool_idx},
               success : function(data) {
                      location.reload();
               },
               error : function(){
                  alert("로그인 하셔야 합니다.");
               }
           });  
           //console.log(mem_idx);
           //console.log(carpool_idx);
       }
      
      function deletelike(carpool_idx){
         
           $.ajax({
               type : "POST",  
               url : "/camping/carpool_deletelike.do",       
               dataType : "json",   
               data : {  'mem_idx' : mem_idx,'carpool_idx' : carpool_idx},
               success : function(data) {
                      location.reload();
               },
               error : function(){
                  alert("로그인 하셔야 합니다.");
               }
           });  
           //console.log(mem_idx);
           //console.log(carpool_idx);
       }
       
      function updatelike1(market_idx){
         
           $.ajax({
               type : "POST",  
               url : "/camping/market_insertlike.do",       
               dataType : "json",   
               data : {  'mem_idx' : mem_idx,'market_idx' : market_idx},
               success : function(data) {
                      location.reload();
               },
               error : function(){
                  alert("로그인 하셔야 합니다.");
               }
           });  
           //console.log(mem_idx);
           //console.log(carpool_idx);
       }
      
      function deletelike1(market_idx){
         
           $.ajax({
               type : "POST",  
               url : "/camping/market_deletelike.do",       
               dataType : "json",   
               data : {  'mem_idx' : mem_idx,'market_idx' : market_idx},
               success : function(data) {
                      location.reload();
               },
               error : function(){
                  alert("로그인 하셔야 합니다.");
               }
           });  
           //console.log(mem_idx);
           //console.log(carpool_idx);
       }
  
    </script>
    
    
    
    <style>
      #container {
       
          margin-top:100px;
         height   :   800px;
        /* margin: 0px auto; */
        padding: 20px;
        /* border: 1px solid #bcbcbc; */
        display:inline-block;
         text-align: center;
       
      }
      
      #left_box{
         width   :45%;
         display:inline-block;
         text-align: center;
      }
      
      #right_box{
         width   :45%;
         display:inline-block;
         text-align: center;
      }
      
      #carpool-left {
         
        width: 80%;
        /* height: 350px; */ 
        padding: 20px;
        /* margin-top: 40px;
        margin-left: 130px;
        margin-bottom: 30px; */
       /*  float: left; */ 
        border: 1px solid #bcbcbc;
        box-shadow: 3px 3px 3px gray;
        border-radius: 10px 10px;
        display:inline-block;
        
      }
       #carpool-left1 {
        width: 48%;
        /* padding: 5px; */ 
        /* float: left; */
        /* border: 1px solid #bcbcbc; */
        display:inline-block;
        
      }
      #carpool-left2 {
        width: 48%;
        /* height: 30px; */
        /* padding: 5px; */
        margin-left: 10px;
         /*  float: left;  */
        /* border: 1px solid #bcbcbc; */
        display:inline-block;
      }
       #carpool-left3 {
        width: 100%;
        /* height: 290px; */
        padding: 5px;
        margin-top: 10px;
        float: left; 
        /* border: 1px solid #bcbcbc; */
      }
      #carpool-table-mini {
        width: 100%;
        /* height: 20px; */
        padding: 5px;
        margin-top: 10px;
        margin-left: 1px;
        float: left; 
        border: 1px solid #bcbcbc;
        font-size: 15px;
        text-align: left;
        box-shadow: 2px 2px 2px gray;
        border-radius: 10px 10px;
      }
      #market-right {
        width: 80%;
       /*  height: 350px; */
        padding: 20px;
        /* margin-top: 40px;
        margin-right: 130px;
        margin-bottom: 30px; */
        /* float: right;  */
        border: 1px solid #bcbcbc;
        box-shadow: 3px 3px 3px gray;
        border-radius: 10px 10px;
        display:inline-block;
        
      }
      #market-right1 {
        width: 48%;
          /*  padding: 5px; */
        /* border: 1px solid #bcbcbc; */
        /* margin-left: 50px; */
        display:inline-block;
      }
      #market-right2 {
        width: 48%;
        /* height: 30px; */
        /* padding: 5px; */
        margin-left: 10px;
          /* float: left; */
        /* border: 1px solid #bcbcbc; */
        display   :inline-block;
      }
       #market-right3 {
        width: 100%;
        /* height: 290px; */
        padding: 5px;
        margin-top: 10px;
        float: left; 
        /* border: 1px solid #bcbcbc; */
      }
      #market-table-mini {
        width: 100%;
        /* height: 20px; */
        padding: 5px;
        margin-top: 10px;
        margin-left: 1px;
        float: left; 
        border: 1px solid #bcbcbc;
        font-size: 15px;
        text-align: left;
        box-shadow: 2px 2px 2px gray;
        border-radius: 10px 10px;
      }
      #weather {
         margin-top:100px;
        clear: both;
        padding: 20px;
        /* border: 1px solid #bcbcbc; */
      }
    </style>

  </head>
  <body>
    <div id="container">
       <div id="left_box">
         <div id="carpool-left">
            <div id="carpool-left1" style="text-align::right; font-weight:bold; font-size: 40px" >
           <span>CARPOOL</span>
           </div>
           <div id="carpool-left2" style="text-align:right; font-size: 15px" >
           <span></span><br>
           <span><a href="/camping/board/carpool_list.do" style="text-decoration: none; color: black;">+더보기</a></span>
           </div>
           <div id="carpool-left3">
          <c:forEach var="vo" items="${ list }" begin="0" end="4">
           <div id="carpool-table-mini">
            <table>
               <tr>
                  
                  <td style="width: 60%;"><a href="board/carpool_view.do?carpool_idx=${vo.carpool_idx }&page=${ empty param.page ? 1 : param.page}" style="text-decoration: none; color: black;">&nbsp;${ vo.carpool_title }</td>
                  <td style="width: 20%;">&nbsp;${ vo.mem_nickname }</td>
                  <td style="width: 12%;">&nbsp;${ fn:substring(vo.carpool_regdate,5,10) }</td>
                  
                  <c:if test="${(empty user.mem_idx) or (vo.heart_flag eq 0)}">
                  <td><button type="button" style="background: none; border: none;" onclick="updatelike('${ vo.carpool_idx }');">
                  <img src="${ pageContext.request.contextPath }/resources/images/heart-0.png" width="20px" height="20px">
                  </c:if>
                  <c:if test="${vo.heart_flag eq 1 }">
                     <td><button type="button" style="background: none; border: none;" onclick="deletelike('${ vo.carpool_idx }');">
                     <img src="${ pageContext.request.contextPath }/resources/images/heart-1.png" width="20px" height="20px">
                  </c:if>
                  </button></td>
                  <td style="width: 8%; text-align: center;" >&nbsp;&nbsp;${ vo.cnt }&nbsp;&nbsp;</td>
               </tr>
            </table>
            </div>
            </c:forEach>
           </div>
         </div>
       </div>
    <div id="right_box">
      <div id="market-right">
        <div id="market-right1" style="text-align::right; font-weight:bold; font-size: 40px">
        <span>MARKET</span>
        </div>
         <div id="market-right2" style="text-align:right; font-size: 15px" >
        <span></span><br>
        <span><a href="/camping/board/market_list.do" style="text-decoration: none; color: black;">+더보기</a></span>
        </div>
        <div id="market-right3">
        <c:forEach var="vo" items="${ list1 }" begin="0" end="4">
        <div id="market-table-mini">
         <table>
            <tr>
               <td style="width: 60%"><a href="board/market_view.do?market_idx=${vo.market_idx }&page=${ empty param.page ? 1 : param.page}" style="text-decoration: none; color: black;">&nbsp;${ vo.market_title }</td>
               <td style="width: 25%">&nbsp;${ vo.mem_nickname }</td>
               <td style="width: 15%">&nbsp;${ fn:substring(vo.market_regdate,5,10) }</td>
               
               <c:if test="${(empty user.mem_idx) or (vo.heart_flag eq 0)}">
               <td><button type="button" style="background: none; border: none;" onclick="updatelike1('${ vo.market_idx }');">
               <img src="${ pageContext.request.contextPath }/resources/images/heart-0.png" width="20px" height="20px">
               </c:if>
               <c:if test="${vo.heart_flag eq 1 }">
                  <td><button type="button" style="background: none; border: none;" onclick="deletelike1('${ vo.market_idx }');">
                  <img src="${ pageContext.request.contextPath }/resources/images/heart-1.png" width="20px" height="20px">
               </c:if>
               </button></td>
               <td style="width: 20%">&nbsp;&nbsp;${ vo.cnt }&nbsp;&nbsp;</td>
               </tr>
         </table>
         </div>
         </c:forEach>
        </div>
      </div>
     </div>
      <div id="weather">
      
        <iframe width="100%" height="110px"
	      src="https://indify.co/widgets/live/weather/IPxU1S1y9VdqZC9NSsg2"
	      frameborder="0" onclick="location.href='https://www.weather.go.kr/w/weather/forecast/short-term.do'"></iframe>
	      
      </div>
      
    </div>
    
  </body>
</html>