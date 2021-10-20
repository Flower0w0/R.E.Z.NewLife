<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
span.error {
	color: red;
	display: inline-block;
	font-size: 5pt;
}
</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- <link rel='stylesheet' href='${pageContext.request.contextPath}/css/style.css'  type="text/css" /> --%>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0"
	crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value='/css/main.css' />">
<link rel="stylesheet" href="<c:url value='/css/memberRegister.css' />">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="shortcut icon" href="<c:url value='/images/R.E.Z.Logo/favicon.ico' />" rel="external nofollow" type="image/x-icon" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script>
<title>R.E.Z.新生－遊戲第二人生</title>
</head>

<body onLoad="setFocusToUserId()"
	background="<c:url value='/images/bg/loginbg.png' />">
	<div id="id_wrapper">
		<jsp:include page="/fragment/top.jsp" />
		<div id="id_content">
			<div>
				<jsp:include page="/fragment/top2.jsp" />
				<!-- =================================================== -->
				<div align='center' id="content">
					<form:form method="POST" modelAttribute="memberBean" enctype='multipart/form-data'>
<!-- 						<Table style="width: 400px; background-color: #E7CDFF; cellspacing: 0; border: 2px solid black;"> -->
			<Table class="memberRegister">
							<tr height="36">
								<td class="joinus" colspan='4' >加入會員</td>
							</tr>

							<tr height="52">
								<td ><label class="fontSize">帳號</label><br>&nbsp;</td>
								<td >
									<form:input path='memberId' class="fieldWidth"  /><br>&nbsp; 
									<form:errors path="memberId" cssClass="error" />
								</td>
							</tr>
							<tr height="52">
								<td><label class="fontSize">密碼</label><br>&nbsp;</td>
								<td>
									<form:input type="password" path='password' class="fieldWidth" /><br>&nbsp; 
									<form:errors path="password" cssClass="error" />
									</td>
							</tr>
							<tr height="52">
								<td>
									<label class="fontSize">密碼確認</label><br>&nbsp;
								</td>
								<td >
									<form:input type="password" path='password1' class="fieldWidth"  /><br>&nbsp; 
									<form:errors path="password1" cssClass="error" />
								</td>
							</tr>
							<tr height="52">
								<td ><label class="fontSize">姓名</label><br>&nbsp;</td>
								<td >
									<form:input path='name' class="fieldWidth"  /><br>&nbsp; 
									<form:errors path="name" cssClass="error" />
								</td>
							</tr>
							<tr height="52">
								<td><label class="fontSize">地址</label><br>&nbsp;</td>
								<td><form:input path='address' class="fieldWidth"
										 /><br>&nbsp; <form:errors
										path="address" cssClass="error" /></td>
										
							<tr height="52">
								<td><label class="fontSize">電話</label><br>&nbsp;</td>
								<td><form:input type='text' path='phone' class="fieldWidth"
										 /><br>&nbsp; <form:errors
										path="phone" cssClass="error" /></td>
							</tr>
							
							<tr height="52">
								<td><label class="fontSize">電子郵件</label><br>&nbsp;</td>
								<td><form:input type='text' path='email' class="fieldWidth"
										 /><br>&nbsp; <form:errors path="email" cssClass="error" /></td>
							<tr>

							<tr height="52">
								<td><label class="fontSize">暱稱</label><br>&nbsp;</td>
								<td><form:input type='text' path='nickName'
										class="fieldWidth"  /><br>&nbsp; <form:errors
										path="nickName" cssClass="error" /></td>
							<tr height="52">
								<td><label class="fontSize">生日</label><br>&nbsp;</td>
								<td><form:input type='text' path='birthday'
										class="fieldWidth"  /><br>&nbsp; <form:errors
										path="birthday" cssClass="error" style="width:300px;" /></td>
								<td><form:input type='hidden' path='rank'
										class="fieldWidth"  /><br>&nbsp; <form:errors
										path="rank" cssClass="error" /></td>
							</tr>
							<tr height="52">
								<td><label class="fontSize">照片</label><br>&nbsp;</td>
								<td><form:input path="memberMultipartFile" type='file' /><br>&nbsp;
									<form:errors path="memberMultipartFile" cssClass="error" /></td>
							</tr>
							<tr height="42">
								<td colspan='4'>
									<div id="btnArea" align="center">
										<input class="buttoncss btn" type="submit" name="submit" id="submit" value="儲存" />
										<input class="buttoncss btn" type="reset" name="cancel" id="cancel" value="重填">
									</div>
								</td>
							</tr>
						</Table>

					</form:form>
				</div>
				<!-- <a href="<c:url value='/crm/showAllMembers'/> " >回前頁</a> -->
			</div>
		</div>
		<!-- 頁尾 -->
		<jsp:include page="/fragment/footer.jsp" />
	</div>
</body>
</html>
