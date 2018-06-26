<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../container/header.jsp"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<link href="${pageContext.request.contextPath }/resources/css/post.css" rel="stylesheet">

<div class="container">
    <div class="row">
		<div class="col-lg-offset-1 col-lg-10 col-lg-offset-1">
            <section>
                  <div class= 'insta'>
                    <div class='top-insta'>
                      <a href='${pageContext.request.contextPath }/member/mypage.do'><img id='user_img' src='https://static1.squarespace.com/static/55198f1ce4b00c2cab3e5e30/t/5526d500e4b009f3ec94b422/1428608282728/600x600%26text%3Dprofile+img.gif?format=300w'></a>
                      <a href='${pageContext.request.contextPath }/member/mypage.do' class='user'>uncle_oreo</a>
					  <a href='#' id='menu' class="dropdown-toggle" data-toggle="dropdown">
						<i class="fas fa-ellipsis-v fa-2x"></i>
					  </a>
					  <ul class="dropdown-menu dropdown-menu-right">
						<li><a href="#">수정</a></li>
						<li><a href="#">삭제</a></li>
						<li class="divider"></li>
						<li><a href="#">신고</a></li>
					  </ul>
                    </div>
                    
                    <div class='post'>
                        <div class="overlay">
                        <span></span>
                        </div>
                      <img src="http://fakeimg.pl/365x365/">
                    </div>
                    
                    <div class='footer'>
                      <div class='react'>
                        <a role='button'><i class="far fa-heart fa-2x"></i></a>
                        <a role='button'><i class="fas fa-heart fa-2x"></i></a>
                        <a role='button'><i class="far fa-comments fa-2x"></i></a>
                        <a role='button'><i class="far fa-share-square fa-2x"></i></a>
                      </div>
                      
                      <div class='caption'>
                        <a href='${pageContext.request.contextPath }/member/mypage.do'>uncle_oreo</a>
                        <span>Done Safe and Sound</span>
                      </div>
                      
                      <div class='comment-list'>
                        <a href='#' id='a1'><img id='user_img' src='https://static1.squarespace.com/static/55198f1ce4b00c2cab3e5e30/t/5526d500e4b009f3ec94b422/1428608282728/600x600%26text%3Dprofile+img.gif?format=300w'></a>
                        <a href='#' class='user' id='a2'>uncle_oreo</a>
                        <span id='p1'>안녕!!!!</span>
                        <a href="${pageContext.request.contextPath }/board/delete.do" id='a3'>
                        	<i class="fas fa-times fa-2x"></i></a>
                      </div>
                      
                      
                      <div class='comment-write'>
                        <input type='text' id='cmnt' placeholder='Add a comment...'>
                        <a><i class="fas fa-pen-nib fa-2x"></i></a>
                      </div>
                    </div> <!-- end Footer -->
                    
                  </div> <!-- end Insta -->
                </section> <!-- end section -->
        </div>
	</div>
</div>

<%@ include file="../container/footer.jsp"%>