<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/sockjs.min.js"></script>
<!-- bootstrap CDN -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- fontawesome icon-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" rel="stylesheet">
<c:set var="profile" value="${sessionScope.memInfo.id}" />
<div class="col-12 row justify-content-center align-items-center my-5 ">
		<a href=""><img src="/resources/img/logo.png"
			alt="Almom Logo" width="180px" class="img-fluid" /></a>
</div>
<div class="col-12">
		<div class="col-2" style="float: left">
			<span> 목록 </span>
		</div>
		<div class="col-8" style="float: left; text-align: center;">
			hoho 님과 대화</div>
		<div class="col-2" style="float: right">
			<span> 닫기 </span>
		</div>
</div>
<!-- 채팅 내용 -->
	<div class="col-12">
		<div class="col-11"
			style="margin: 0 auto; border: 1px solid #01D1FE; height: 400px; border-radius: 10px; overflow:scroll" id = "chatArea">
			<div id="chatMessageArea" style = "margin-top : 10px; margin-left:10px;"></div>
		</div>
	</div>

	<!-- 채팅 입력창 -->
	<div class="col-12" style="margin-top: 20px; margin-bottom: 15px;">
		<div class="col-12" style="float: left">
			<textarea class="form-control"
				style="border: 1px solid #01D1FE; height: 65px; float: left; width: 80%"
				placeholder="Enter ..." id = "message">
			</textarea>
			<span style="float: right; width: 18%; height: 65px; text-align: center; background-color: #01D1FE; border-radius: 5px;">
				<a style="margin-top: 30px; text-align: center; color: white; font-weight: bold;" id = "sendBtn"><br>전송</a>
			</span>
		</div>
	</div>
<input type="text" id="nickname" value = "${user_name }" style = "display:none">
<input type="button" id="enterBtn" value="입장" style = "display:none">
<input type="button" id="exitBtn" value="나가기" style = "display:none">



<script type="text/javascript">
	connect();
	
	 function connect() {
		    sock = new SockJS('/chat');
		    sock.onopen = function() {
		        console.log('open');
		    };
		    sock.onmessage = function(evt) {
	    	 var data = evt.data;
	    	   console.log(data)
	  		   var obj = JSON.parse(data)  	   
	    	   console.log(obj)
	    	   appendMessage(obj.message_content);
		    };
		    sock.onclose = function() {
		    	 appendMessage("연결을 끊었습니다.");
		        console.log('close');
		    };
		}
	 
	 function send() {
		  var msg = $("#message").val();
		  if(msg != ""){
			  message = {};
			  message.message_content = $("#message").val()
		  	  message.TUTOR_USER_user_id = '${TUTOR_USER_user_id}'
		  	  message.USER_user_id = '${profile.user_id}'
		  	  message.CLASS_class_id = '${class_id}'
		  	  message.message_sender = '${profile.user_id}'
		  }
		  
		  sock.send(JSON.stringify(message));
		  $("#message").val("");
		 }
	 
	 function getTimeStamp() {
		   var d = new Date();
		   var s =
		     leadingZeros(d.getFullYear(), 4) + '-' +
		     leadingZeros(d.getMonth() + 1, 2) + '-' +
		     leadingZeros(d.getDate(), 2) + ' ' +

		     leadingZeros(d.getHours(), 2) + ':' +
		     leadingZeros(d.getMinutes(), 2) + ':' +
		     leadingZeros(d.getSeconds(), 2);

		   return s;
		 }
	 
	 function leadingZeros(n, digits) {
		   var zero = '';
		   n = n.toString();

		   if (n.length < digits) {
		     for (i = 0; i < digits - n.length; i++)
		       zero += '0';
		   }
		   return zero + n;
		 }







		 function appendMessage(msg) {

			 if(msg == ''){
				 return false;
			 }else{


			 var t = getTimeStamp();
			 $("#chatMessageArea").append("<div class='col-12 row' style = 'height : auto; margin-top : 5px;'><div class='col-2' style = 'float:left; padding-right:0px; padding-left : 0px;'><img id='profileImg' class='img-fluid' src='/displayFile?fileName=${userImage}&directory=profile' style = 'width:50px; height:50px; '><div style='font-size:9px; clear:both;'>${user_name}</div></div><div class = 'col-10' style = 'overflow : y ; margin-top : 7px; float:right;'><div class = 'col-12' style = ' background-color:#ACF3FF; padding : 10px 5px; float:left; border-radius:10px;'><span style = 'font-size : 12px;'>"+msg+"</span></div><div col-12 style = 'font-size:9px; text-align:right; float:right;'><span style ='float:right; font-size:9px; text-align:right;' >"+t+"</span></div></div></div>")		 

			  var chatAreaHeight = $("#chatArea").height();
			  var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
			  $("#chatArea").scrollTop(maxScroll);

			 }
		 }
		 $(document).ready(function() {
		  $('#message').keypress(function(event){
		   var keycode = (event.keyCode ? event.keyCode : event.which);
		   if(keycode == '13'){
		    send();
		   }
		   event.stopPropagation();
		  });



		  $('#sendBtn').click(function() { send(); });/* $('#enterBtn').click(function() { connect(); }); $('#exitBtn').click(function() { disconnect(); }); */
		 });

</script>
<span id="count" class="badge bg-theme"></span>
