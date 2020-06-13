<%@page import="com.baemin.shop.ShopDTO"%>
<%@page import="com.baemin.shop.ShopDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	System.out.println("------ MyPageShop.jsp --- ");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>MyPageShop.jsp</title>
<!-- CDN - Font Awesome 4 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- CDN OFFLINE- sw_topNav.css -->
<link rel="stylesheet" href="../sw_css/sw-1.0.0.css">
<!-- CDN - W3CSS -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
		ShopDAO dao = ShopDAO.getInstance();
		ShopDTO dto = dao.getShopInfo(no);
	%>







	<!-- responsive template by SW ----------------------------------------------------------- -->
	<!-- Need   W3CSS  +  FONT AS4  +  sw+topnav offline ------------------------------------- -->
	<div class="sw-topnav-margin w3-section">&nbsp;</div>

	<!-- CONTENT ------------------------------------------------------------------------------------ -->
	<div class="sw-center">
		<!-- 가로복 제한 400~1200 ---------------------------------------------------------------------------------->
		<!-- 400~1200 사이로 조절 가능 ---------------------------------------------------------------------------------->
		<div class="sw-container-400">
			<div class="w3-container">
				<!--  main content start here!!!----------------------------------------------------------- -->

				<!--사업자 마이 페이지-->
				<div class="w3-container w3-card">

					<h2 align="center">개인정보</h2>
					<form class="w3-container" method="post" action="#"
						name="clientMyPage">

						<!--  -->
						<label><b>아이디</b></label> <input class="w3-input w3-border" name="shopId" id="shopId" readonly="readonly" type="text" value="<%=dto.getId()%>">
						<!--  -->
						<br>
						<!--  -->
						<label><b>비밀번호</b></label>
						<!--  -->
						<input class="w3-input w3-border" name="shopPw" id="shopPw" readonly="readonly" type="password" value="<%=dto.getPw()%>">
						<!--  -->
						<br>
						<!--  -->
						<label><b>분류</b></label>
						<!--  -->
						<input class="w3-input w3-border" name="shopCategory" id="shopCategory" readonly="readonly" type="text" value="<%=dto.getShopCategory()%>">
						<!--  -->
						<br>
						<!--  -->
						<label><b>매장명</b></label>
						<!--  -->
						<input class="w3-input w3-border" name="shopName" id="shopName" readonly="readonly" type="text" value="<%=dto.getShopName()%>">
						<!--  -->
						<br>
						<!--  -->
						<label><b>전화번호</b></label>
						<!--  -->
						<input class="w3-input w3-border" name="shopTel" id="shopTel" readonly="readonly" type="text" value="<%=dto.getShopTel()%>">
						<!--  -->
						<br>
						<!--  -->
						<label><b>주소</b></label>
						<!--  -->
						<input class="w3-input w3-border" name="shopAddr" id="shopAddr" readonly="readonly" type="text" value="<%=dto.getShopAddr()%>">
						<!--  -->
						<br>
						<!--  -->
						<label><b>상세주소</b></label>
						<!--  -->
						<input class="w3-input w3-border" name="shopAddr1" id="shopAddr1" readonly="readonly" type="text" value="<%=dto.getShopAddr2()%>">
						<!--  -->
						<br>
						<div align="center">
							<input type="button" class="w3-btn"
								style="background-color: #45c1bf; color: white;" value="개인정보수정"
								onclick="modalOn()"> <input type="button" class="w3-btn"
								style="background-color: #45c1bf; color: white;" value="뒤로가기"
								onclick="location='#'">
						</div>
						<br>

						<!-- 변경창을 이용할때는 모달을 이용하자 -->
						<script>
							function modalOn() {
								document.getElementById('update').style.display = 'block'
							}
							function modalOff() {
								document.getElementById('update').style.display = 'none'
							}
						</script>
					</form>
				</div>
				<!-- ------------------------------------------------------------------------------------------- -->
				<!-- 모달창 시작 -->
				<div id="update" class="w3-modal">
					<div class="w3-modal-content">
						<div class="w3-container">
							<span onClick="modalOff()" class="w3-button w3-display-topright">X</span>
							<form method="post" action="UpdateShopPro.jsp" name="modalForm">
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
				<!-- ------------------------------------------------------------------------------------------- -->


				<!-- main content end----------------------------------------------------------------------- -->
			</div>
		</div>
	</div>
	<!-- main content end----------------------------------------------------------------------- -->

	<!-- 모든페이지 공통 -->
	<!-- modal창을 제외한 모든  컴포턴트보다 하단에 위치하여야 한다. -->
	<jsp:include page="../sw_css/topnav.jsp" />

</body>
</html>