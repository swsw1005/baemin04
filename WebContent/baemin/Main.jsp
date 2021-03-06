<%@page import="com.baemin.member.MemberDTO"%>
<%@page import="com.baemin.member.MemberDAO"%>
<%@page import="com.baemin.shop.ShopDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	System.out.println("------ main.jsp --- ");
%>

<%
	Object grade_ob = session.getAttribute("grade");
	Object id_ob = session.getAttribute("id");
	Object no_ob = session.getAttribute("no");
	//Object memberX_ob = session.getAttribute("memberX");
	//Object memberY_ob = session.getAttribute("memberY");

	System.out.println(grade_ob);
	System.out.println(id_ob);
	System.out.println(no_ob);
	if (grade_ob == null) {
		grade_ob = 0;
	}
	if (id_ob == null) {
		id_ob = 0;
	}
	if (no_ob == null) {
		no_ob = 0;
	}

	int grade = Integer.parseInt(grade_ob + "");

	System.out.println("session grade=" + grade);

	if (grade < 1) {
		System.out.println("session grade=" + grade);
		response.sendRedirect("../index.html");
	}

	int memberNo = Integer.parseInt(no_ob + "");
	//double memberX = Double.parseDouble(memberNo_ob + "");
	//double memberY = Double.parseDouble(memberNo_ob + "");

	MemberDAO dao = MemberDAO.getInstance();
	MemberDTO dto = dao.getDTO(memberNo);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>main.jsp</title>

<!-- CDN - Font Awesome 4 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- CDN - W3CSS -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- CDN OFFLINE- sw_topNav.css -->
<link rel="stylesheet" href="../sw_css/sw-1.0.0.css">
<!-- CDN - daum zipCode -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- CDN - jquery 3.4.1 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- CDN - Google Icons -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">


<style>
* {
	font-family: baemin_font;
}

img {
	width: 100%;
}

.mySlides {
	display: none;
}

.font-80 {
	font-size: 80%;
}

#topnav {
	position: fixed;
	top: 0;
	width: 100%;
	overflow: hidden;
}
</style>
<script>
	function openDaumPostcode() {

		new daum.Postcode({
			oncomplete : function(data) {
				document.getElementById('addr').value = data.address;
			}

		}).open();
	} //openDaumPostcode()---
</script>

</head>


<body>

	<!-- responsive template by SW ----------------------------------------------------------- -->
	<!-- Need   W3CSS  +  FONT AS4  +  sw+topnav offline ------------------------------------- -->
	<div class="sw-topnav-margin">&nbsp;</div>

	<!-- CONTENT ------------------------------------------------------------------------------------ -->
	<div class="sw-center">
		<!-- 가로복 제한 400~1200 ---------------------------------------------------------------------------------->
		<!-- 400~1200 사이로 조절 가능 ---------------------------------------------------------------------------------->
		<div class="sw-container-500">
			<!-- <div class="w3-row">
                <div class="w3-col w3-right" style="width:60px">
                    &nbsp;
                    <button class="w3-button w3-circle w3-white w3-border" onclick="jusoChangeOpen()">+</button>
                </div>

                <div class="w3-rest">
                    <input id="juso" class="w3-input w3-border w3-round-large" value="서울 영등포구 국회대로36길 17">
                    1. div로 표기. 버튼 따로없이 주소를 클릭하면 모달창 열기??
                </div>
            </div> -->
			<div class="w3-row w3-center" style="margin-top: 3%">
				<button type="button" class="w3-button w3-white w3-center"
					onclick="jusoModalOpen()">
					<!-- ------------------------------------------------------- -->
					<span id="addr_result"> <%=dto.getAddr()%>
					</span> &nbsp;<span id="addr2_result"> <%=dto.getAddr2()%>
					</span>
				</button>
			</div>
		</div>

		<!--  광고 슬라이드 start here!!!----------------------------------------------------------- -->
		<!-- <div class="sw-container-500 w3-section">
            <div style="width: 100%; background: cyan;" class="w3-center w3-border">
                <img src="../source//ad_sample.jpg" alt="" width="100%">
            </div>
        </div> -->
		<div class="sw-container-500" style="margin-top: 1%">
			<div class="w3-content" style="width: 100%">
				<!-- ------------------------------------------------------------ -->
				<img class="w3-round mySlides" src="../source/img/1.png"
					style="width: 100%">
				<!-- ------------------------------------------------------------ -->
				<img class="w3-round mySlides" src="../source/img/2.png"
					style="width: 100%">
				<!-- ------------------------------------------------------------ -->
				<img class="w3-round mySlides" src="../source/img/3.png"
					style="width: 100%">
				<!-- ------------------------------------------------------------ -->
				<img class="w3-round mySlides" src="../source/img/4.png"
					style="width: 100%">
				<!-- ------------------------------------------------------------ -->
				<img class="w3-round mySlides" src="../source/img/5.png"
					style="width: 100%">
				<!-- ------------------------------------------------------------ -->
				<img class="w3-round mySlides" src="../source/img/6.png"
					style="width: 100%">
				<!-- ------------------------------------------------------------ -->
				<img class="w3-round mySlides" src="../source/img/7.png"
					style="width: 100%">
				<!-- ------------------------------------------------------------ -->
				<img class="w3-round mySlides" src="../source/img/8.png"
					style="width: 100%">
				<!-- ------------------------------------------------------------ -->
				<img class="w3-round mySlides" src="../source/img/9.png"
					style="width: 100%">
				<!-- ------------------------------------------------------------ -->
				<img class="w3-round mySlides" src="../source/img/10.png"
					style="width: 100%">
				<!-- ------------------------------------------------------------ -->
				<img class="w3-round mySlides" src="../source/img/11.png"
					style="width: 100%">
				<!-- ------------------------------------------------------------ -->
				<img class="w3-round mySlides" src="../source/img/12.png"
					style="width: 100%">
				<!-- ------------------------------------------------------------ -->
				<img class="w3-round mySlides" src="../source/img/13.png"
					style="width: 100%">
			</div>
		</div>
		<script>
			var myIndex = 0;
			carousel();

			function carousel() {
				var i;
				var x = document.getElementsByClassName("mySlides");
				for (i = 0; i < x.length; i++) {
					x[i].style.display = "none";
				}
				myIndex++;
				if (myIndex > x.length) {
					myIndex = 1
				}
				x[myIndex - 1].style.display = "block";
				setTimeout(carousel, 2000); // Change image every 2 seconds
			}
		</script>
		<!-- main content end----------------------------------------------------------------------- -->

		<!-- shopList.jsp?category=hansik -->

		<!--단락 구분선-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-->
		<div class="sw-container-500" style="margin-top: 2%;">
			<div class="w3-container">
				<!--  main content start here!!!----------------------------------------------------------- -->
				<div class="w3-row">
					<div class="w3-col s3 w3-center w3-padding"
						onclick="go2ShopList(this)">
						<img src="../source/img/hansik.png" alt="한식" max-width="110px">
						<input type="hidden" value="korean" />
					</div>
					<!-- .... -->
					<div class="w3-col s3 w3-center w3-padding"
						onclick="go2ShopList(this)">
						<img src="../source/img/yangsik.png" alt="양식" max-width="110px">
						<input type="hidden" value="western" />
					</div>
					<!-- .... -->
					<div class="w3-col s3 w3-center w3-padding"
						onclick="go2ShopList(this)">
						<img src="../source/img/jungsik.png" alt="중식" max-width="110px">
						<input type="hidden" value="chinese" />
					</div>
					<!-- .... -->
					<div class="w3-col s3 w3-center w3-padding"
						onclick="go2ShopList(this)">
						<img src="../source/img/ilsik.png" alt="일식" max-width="110px">
						<input type="hidden" value="japanese" />
					</div>
				</div>

				<div class="w3-row">
					<div class="w3-col s3 w3-center">한식</div>
					<div class="w3-col s3 w3-center">양식</div>
					<div class="w3-col s3 w3-center">중식</div>
					<div class="w3-col s3 w3-center">일식</div>
				</div>

				<div class="w3-row">
					<!-- .... -->
					<div class="w3-col s3 w3-center w3-padding"
						onclick="go2ShopList(this)">
						<img src="../source/img/pizza.png" alt="피자" max-width="110px">
						<input type="hidden" value="pizza" />
					</div>
					<!-- .... -->
					<div class="w3-col s3 w3-center w3-padding"
						onclick="go2ShopList(this)">
						<img src="../source/img/chicken.png" alt="치킨" max-width="110px">
						<input type="hidden" value="chicken" />
					</div>
					<!-- .... -->
					<div class="w3-col s3 w3-center w3-padding"
						onclick="go2ShopList(this)">
						<img src="../source/img/fastfood.png" alt="햄버거" max-width="110px">
						<input type="hidden" value="hamburger" />
					</div>
					<!-- .... -->
					<div class="w3-col s3 w3-center w3-padding"
						onclick="go2ShopList(this)">
						<img src="../source/img/cafe.png" alt="카페" max-width="110px">
						<input type="hidden" value="cafe" />
					</div>
				</div>

				<div class="w3-row">
					<div class="w3-col s3 w3-center">피자</div>
					<div class="w3-col s3 w3-center">치킨</div>
					<div class="w3-col s3 w3-center">햄버거</div>
					<div class="w3-col s3 w3-center">카페</div>
				</div>
				<!-- .... -->
			</div>
			<!-- main content end----------------------------------------------------------------------- -->
		</div>
		<!-- main content end----------------------------------------------------------------------- -->
	</div>
	<script>
		function go2ShopList(e) {
			var a1 = e.children[1].value;
			console.log(a1);
			location.href = "ShopList.jsp?category=" + a1;
		}
	</script>


	<!-- The Modal //////////////////////////////////////////////-->
	<div id="jusoChange" class="w3-modal">
		<div class="w3-modal-content w3-round-large">
			<div class="w3-container w3-center">
				<div class="w3-row w3-section">
					<label>주소</label>
				</div>
				<div class="w3-row w3-center">
					<input class="w3-input w3-border" type="text" name="addr" id="addr"
						readonly>
				</div>
				<div class="w3-row w3-section">
					<label>상세주소</label>
				</div>
				<div class="w3-row w3-center">
					<input class="w3-input w3-border" type="text" name="addr2"
						id="addr2">
				</div>
				<div class="w3-row w3-section w3-center">
					<button class="w3-button w3-baemint" type="button"
						onclick="openDaumPostcode()" style="width: 100px;">주소입력</button>
					<button class="w3-button w3-baemint" type="button"
						onclick="updateJuso()" style="width: 100px;">주소변경</button>
				</div>
				<span
					onclick="document.getElementById('jusoChange').style.display='none'"
					class="w3-button w3-display-topright">&times;</span>
			</div>
		</div>
	</div>
	<!-- The Modal //////////////////////////////////////////////-->
	<script>
		function jusoChangeOpen() {
			document.getElementById('jusoChange').style.display = 'block';
		}

		function updateJuso() {
			var addr = document.getElementById("addr").value;
			var addr2 = document.getElementById("addr2").value;
			console.log("--------" + addr + " " + addr2);
			// JSON 데이터로 만들기
			var reply = {
				// 항목이름 : 값(변수)
				addr : addr,
				addr2 : addr2
			}
			var url = "UpdateJuso.jsp";
			// ajax(비동기 통신)를 통해서 post방식의 입력한 데이터를 서버에 넘기기
			$.ajax({
				type : "get",
				url : url,
				data : reply,
				// 리턴 되어 돌려 받는 데이터의 타입
				dataType : "text",
				// 기본값이므로 삭제 가능
				success : function(result, status, xhr) {
					console.log("result=" + result);
					console.log("status=" + status);
					var isIDOK = result.trim() + "";
					console.log("isIDOK=" + isIDOK);
					if (isIDOK == "yes") {
						hasIDCheck = 1;
					} else {
						hasIDCheck = 0;
					}
				},
				error : function(xhr, status, error) {
					alert(xhr + "/" + status + "/" + error);
				} // error의 끝
			}); // ajax의 끝
		}
	</script>

	<!-- responsive template by SW ----------------------------------------------------------- -->
	<!-- Need   W3CSS  +  FONT AS4  +  sw+topnav offline ------------------------------------- -->
	<div class="sw-topnav-margin">&nbsp;</div>
	<div class="sw-topnav-margin">&nbsp;</div>
	<%-- 사이트 공통 부분 Include - topnav --%>
	<jsp:include page="../sw_css/memberTopNav.jsp" />




</body>

</html>