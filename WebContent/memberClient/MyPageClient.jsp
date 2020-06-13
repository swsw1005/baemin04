<%@page import="com.baemin.member.MemberDTO"%>
<%@page import="com.baemin.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	System.out.println("------ MyPageClient.jsp --- ");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>MyPageClient.jsp</title>



<!-- CDN - Google Icons -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!-- CDN - Font Awesome 4 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- CDN - W3CSS -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- CDN OFFLINE- sw_topNav.css -->
<link rel="stylesheet" href="../sw_css/sw-1.0.0.css">
<!-- CDN - jquery 3.4.1 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
* {
	margin: 0px;
	padding: 0px;
}
</style>
<script>
	// 스크립트
		function pwCheck() {
			var pw = document.modalForm.pw.value;
			var pwc = document.modalForm.pwc.value;
			if (pw == pwc && pw.length > 3) {
				console.log("비밀번호 일치");
				document.getElementById("btn").disabled = false;
				pwCk = 1;
			} else {
				console.log("비밀번호 틀림");
				document.getElementById("btn").disabled = true;
				pwCk = 0;
			}
		} //  pwCheck() end
		
function rePwCheck(){
	document.getElementById("btn").disabled = true;
		}
		
</script>
</head>
<body>
	<!-- 내용 -->
	<%
		Object no_ob = session.getAttribute("no");
		int no = Integer.parseInt(no_ob + "");
		MemberDAO dao = MemberDAO.getInstance();
		MemberDTO dto = dao.getDTO(no);
	%>


	<!-- responsive template by SW ----------------------------------------------------------- -->
	<!-- Need   W3CSS  +  FONT AS4  +  sw+topnav offline ------------------------------------- -->
	<div class="sw-topnav-margin">&nbsp;</div>

	<!-- CONTENT ------------------------------------------------------------------------------------ -->
	<div class="sw-center">
		<!-- 가로복 제한 400~1200 ---------------------------------------------------------------------------------->
		<!-- 400~1200 사이로 조절 가능 ---------------------------------------------------------------------------------->
		<div class="sw-container-400">
			<div class="w3-container">
				<!--  main content start here!!!----------------------------------------------------------- -->



				<!--사용자 마이 페이지-->
				<div class="w3-container w3-card">

					<table class="w3-table">

						<tr>
							<td colspan="2">
								<h2><%=dto.getName()%></h2>
							</td>
						</tr>

						<tr>
							<td>ID</td>
							<td><%=dto.getId()%></td>
						</tr>

						<tr>
							<td>Tel</td>
							<td><%=dto.getTel()%></td>
						</tr>

						<tr>
							<td>주소</td>
							<td><%=dto.getAddr()%></td>
						</tr>
						<tr>
							<td></td>
							<td><%=dto.getAddr2()%></td>
						</tr>

						<tr>
							<td>가입일</td>
							<td><%=dto.getRegDate()%></td>
						</tr>

					</table>

					<p>
						<!-- 변경창을 이용할때는 모달을 이용하자 -->
						<script>
							function modalOn() {
								document.getElementById('update').style.display = 'block'
							}
							function modalOff() {
								document.getElementById('update').style.display = 'none'
							}
						</script>
						<button onClick="modalOn()" class="w3-button w3-black">개인정보
							수정</button>
						<!-- ------------------------------------------------------------------------------------------------ -->
						<button onClick="location = '../util/logout.jsp'" class="w3-button w3-black">로그아웃</button>
					</p>
				</div>
				<!-- ------------------------------------------------------------------------------------------------ -->
				<!-- 모달창 시작 -->
				<div id="update" class="w3-modal">
					<div class="w3-modal-content">
						<div class="w3-container">
							<span onClick="modalOff()" class="w3-button w3-display-topright">X</span>
							<form method="post" action="UpdateClientPro.jsp" name="modalForm">
								<input type="hidden" value="<%=dto.getNo()%>" name="no">
								<p>비밀번호 변경</p>
								<p>
									<input type="password" name="pw" id="pw" onkeydown="rePwCheck()">
								</p>

								<!-- Ajax 처리로 비밀번호 체크 -->
								<p>비밀번호 확인</p>
								<p>
									<input type="password" name="pwc" id="pwc" onkeydown="rePwCheck()">
								</p>
								<p>
									<input type="button" value="비밀번호 확인" onClick="pwCheck()">
								</p>
								<p>
									<input class="w3-button w3-border" type="submit" value="변경" disabled="disabled" name="btn" id="btn">
									<input class="w3-button w3-border" type="button" value="취소"
										onclick="modalOff()">
								</p>
							</form>
						</div>
					</div>
				</div>
				<!-- 모달창 끝 -->
				<!-- ------------------------------------------------------------------------------------------------ -->
			




				<!-- main content end----------------------------------------------------------------------- -->
			</div>
		</div>
	</div>
	<!-- main content end----------------------------------------------------------------------- -->

	<!-- responsive template by SW ----------------------------------------------------------- -->
	<!-- Need   W3CSS  +  FONT AS4  +  sw+topnav offline ------------------------------------- -->
	<div class="sw-topnav-margin">&nbsp;</div>
	<div class="sw-topnav-margin">&nbsp;</div>
	<%-- 사이트 공통 부분 Include - topnav --%>
	<jsp:include page="../sw_css/memberTopNav.jsp" />


</body>
</html>