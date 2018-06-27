<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/container/header.jsp"%>
<style>
 #ok, #cancel{
  background-color: #9770f9; 
  border: none;
  color: white;
  text-align: center;
  margin-right:5px;
}
 #can {
 color: white;
 text-decoration:none;
 }
</style>

<div class="container">
   <div class="page-header">
      <div class="row">
         <div class="col-lg-12">
            <p align="center">
               <b>게시물을 등록해주세요.</b>
            </p>
         </div>
      </div>
   </div>
  <div class="row">
    <form class="form-horizontal" action="${pageContext.request.contextPath }/board/upload.do">
        <div class="form-group">
			<div class="col-lg-offset-3 col-lg-6 col-lg-offset-3">
          		<label>내용</label>
				<br>
          		<textarea class="form-control" id="content" name="content" 
          			placeholder="Content" rows="8"></textarea>
          		<br>
	    	</div>
	    	<div class="col-lg-offset-3 col-lg-6 col-lg-offset-3">
	    		<label>첨부파일</label>
	    		<br>
	    		<input type="file" name="img1" multiple><br>
	    	</div>
		
			<div class="col-lg-offset-3 col-lg-6 col-lg-offset-3">
				<label><input type="radio" name="public_yn" value="y" checked>전체공개</label>&nbsp;&nbsp;
				<label><input type="radio" name="public_yn" value="n">친구공개</label>
		    </div>
	    </div>
	    
		<div class="col-lg-offset-8">
			<input type="hidden" name="writer" value="${sessionScope.id }">
	    	<button type="submit" class="btn btn-primary" id = "ok">등록</button>
	    	<button type="button" onclick="location.href='${pageContext.request.contextPath }/board/list.do'"
	    		 class="btn btn-primary" id = "cancel">취소</button>
	    </div>
  	</form>
  </div>
</div>
<%@ include file="/WEB-INF/views/container/footer.jsp"%>