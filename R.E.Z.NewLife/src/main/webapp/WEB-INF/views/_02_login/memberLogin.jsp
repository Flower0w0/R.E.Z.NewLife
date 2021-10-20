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
<link rel="stylesheet" href="<c:url value='/css/login.css' />">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="shortcut icon" href="<c:url value='/images/R.E.Z.Logo/favicon.ico' />" rel="external nofollow" type="image/x-icon" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script>
<title>R.E.Z.新生－遊戲第二人生</title>
<script type="text/javascript">
	//由<body>的onLoad事件處理函數觸發此函數
	function setFocusToUserId() {
		document.forms[0].userId.focus(); // 將游標放在userId欄位內
	}
</script>

</head>

<body onLoad="setFocusToUserId()"
	background="<c:url value='/images/bg/loginbg.png' />">

	<div id="id_wrapper">
		<div>
			<jsp:include page="/fragment/top.jsp" />
			<div id="id_content">
				<jsp:include page="/fragment/top2.jsp" />

				<!-- =================================================== -->

				<!--login登入-->
<%-- 				<c:set var="funcName" value="LOG" scope="session" /> --%>
				<c:set var="msg" value="登入" />
				<c:if test="${ ! empty sessionScope.timeOut }">
					<!-- 表示使用逾時，重新登入 -->
					<c:set var="msg"
						value="<font color='red'>${sessionScope.timeOut}</font>" />
				</c:if>
				<!-- 引入共同的頁首 -->
				<%-- <jsp:include page="/fragment/topMVC.jsp" /> --%>
				<form:form method="POST" modelAttribute="loginBean">
					<div class="login-center">
						<form action="">
							<div class="login">
								<h1>Login登入</h1>
								<%-- <div class="error" style="text-align: center; vertical-align: middle;" >${errorSaveData}<br></div> --%>
								<%-- <Font color="#006600"  face="標楷體">${msg}</Font> --%>
								<%-- <Font color="#006600" face="標楷體">${AppName}</Font> --%>

								<form:input type="text" path="userId" placeholder="請輸入您的帳號" />
								<form:errors path="userId" cssClass="error" />

								<form:input type="password" path="password"
									placeholder="請輸入您的密碼" />
								<form:errors path="password" cssClass="error" />

								<table class="relative1">
									<tr>
										<td><form:checkbox path="rememberMe" /></td>
										<td><h6>
												<small>記住密碼</small>
											</h6></td>
									</tr>
								</table>
				<table><tr >
								<td>
								<a href="<c:url value='/_01_register/memberRegister' /> " >
								<input type="button" value='註冊' style="margin-left:7px" ></a>
								</td>
								
								<td>
								<input type="submit" value="登入"> 
								</td>

								<td>
								<a href="<c:url value='/_01_register/forget' /> " >
								<input type="button" value='忘記密碼' ></a>
								</td>
				<tr></table>
								<button tabindex="0" class="login-footer" dir="ltr">使用條款/隱私政策</button>
								<p>註冊即同意使用條款與隱私政策</p>
							</div>
						</form>
					</div>		
				</form:form>


								
				<!--login登入 End-->
			</div>
		</div>
		<!-- 頁尾 -->
		<jsp:include page="/fragment/footer.jsp" />
	</div>
</body>
</html>