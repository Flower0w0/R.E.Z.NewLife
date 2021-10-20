<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0"
	crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value='/css/main.css' />">
<link rel="stylesheet" href="<c:url value='/css/forget.css' />">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="shortcut icon"
	href="<c:url value='/images/R.E.Z.Logo/favicon.ico' />"
	rel="external nofollow" type="image/x-icon" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script>
<title>R.E.Z新生－遊戲第二人生</title>
</head>

<body background="<c:url value='/images/bg/loginbg.png' />">

	<div id="id_wrapper">
		<div>
			<jsp:include page="/fragment/top.jsp" />
			<div id="id_content">
				<jsp:include page="/fragment/top2.jsp" />

				<!-- =================================================== -->

				<!--forget忘記密碼-->
				<div class="forget-center">
					<FORM action="<c:url value='/_01_register/sendEmail' />"
						method="POST">
						<Table class="forget">



							<tr height="36">
								<td class="joinus" colspan='4'>請輸入註冊信箱</td>
							</tr>

							<tr>
								<td><span>${forgetpwMSG}</span></td>
							</tr>

							<tr>
								<td><input type="text" name="email" placeholder="請輸入您的信箱" /></td>
							</tr>



							<tr height="52">
								<td><input type='submit' value="確認送出" /></td>
							</tr>


						</Table>
					</FORM>
				</div>
				<!--forget忘記密碼 End-->
			</div>
		</div>
		<!-- 頁尾 -->
		<jsp:include page="/fragment/footer.jsp" />
	</div>
</body>
</html>