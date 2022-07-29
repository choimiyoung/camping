<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Bootstrap 3.x -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- CKEditor -->
<script src="//cdn.ckeditor.com/4.19.0/full/ckeditor.js"></script>
  
<style type="text/css">
   #box{
      width: 700px;
      margin: auto;
      margin-top: 50px;
   }

   textarea {
	   width: 100%;
	   min-height: 300px;
	   resize: none;
   }
</style>

<script type="text/javascript">
   
   function send(f){
	   
	   
	   var carpool_title = f.carpool_title.value.trim();
	   var carpool_content = CKEDITOR.instances.carpool_content.getData().trim();
	   
	   if(carpool_title==''){
		   alert('제목을 입력하세요!!');
		   f.carpool_title.value='';
		   f.carpool_title.focus();
		   return;
	   }
	   
	   if(carpool_content==''){
		   alert('내용을 입력하세요!!');

		   return;
	   }
	   
	   f.action = "carpool_modify.do";
	   f.submit();
	   
	   
   }


</script>


</head>
<body>

<form>
    <input type="hidden"  name="mem_idx"  value="${ user.mem_idx }">
    <input type="hidden"  name="carpool_idx"  value="${ vo.carpool_idx }">
    <input type="hidden"  name="page"  value="${ param.page }">
    <input type="hidden"  name="search"  value="${ param.search }">
    <input type="hidden"  name="search_text"  value="${ param.search_text }">
	<div id="box">
	    <div class="panel panel-primary">
	      <div class="panel-heading"><h3>수정하기</h3></div>
	      <div class="panel-body">
	         <table class="table table-striped">
	            <tr>
	               <th width="15%">작성자</th>
	               <td><input name="mem_nickname" value="${ user.mem_nickname }" readonly="readonly">
	            </tr>
	            <tr> 
	               <th>제목</th>
	               <td><input style="width:100%;" name="carpool_title" value="${ vo.carpool_title }"></td>
	            </tr>
	            
	            <tr>
	               <td colspan="2">
	                   <textarea name="carpool_content"  rows="" cols="">${ vo.carpool_content }</textarea>
	                   <script>
							// Replace the <textarea id="editor1"> with a CKEditor
							// instance, using default configuration.
							CKEDITOR.replace( 'carpool_content', {
							     filebrowserUploadUrl: '${pageContext.request.contextPath}/ckeditorImageUpload.do'	
							});
								
							CKEDITOR.on('dialogDefinition', function( ev ){
						            var dialogName = ev.data.name;
						            var dialogDefinition = ev.data.definition;
						          
						            switch (dialogName) {
						                case 'image': //Image Properties dialog
								              //dialogDefinition.removeContents('info');
								              dialogDefinition.removeContents('Link');
								              dialogDefinition.removeContents('advanced');
								              break;
							    }
							 });
						</script>
	                   
	               </td>
	            </tr>
	            
	            <tr>
	               <td colspan="2" align="center">
	                    <input class="btn btn-primary"  type="button"  value="수정하기"
	                           onclick="send(this.form);">
	                    <input class="btn btn-success"  type="button"  value="목록보기"
	                           onclick="location.href='carpool_list.do?page=${param.page}';">
	               </td>
	            </tr>
	            
	         </table>
	      </div>
	    </div>
	</div>
</form>


</body>
</html>