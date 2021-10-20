<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" href="<c:url value='/css/product.css' />">
<link rel="stylesheet" href="<c:url value='/css/person.css' />">
<link rel="stylesheet" href="<c:url value='/css/person.css.map' />">
<link rel="stylesheet" href="<c:url value='/css/text.css' />">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="shortcut icon" href="<c:url value='/images/R.E.Z.Logo/favicon.ico' />" rel="external nofollow" type="image/x-icon" />
<title>R.E.Z.新生－遊戲第二人生</title>
</head>

<body background="<c:url value='/images/bg/repeated-square.png' />">

	<div id="id_wrapper">
		<jsp:include page="/fragment/top.jsp" />
		<div id="id_content">
			<div>
				<jsp:include page="/fragment/top2.jsp" />

				<!-- 會員資料 -->
 <c:url var='post_url' value='/_01_register/Account' />
<%-- 				<form:form method='POST' action="<c:url value='/_01_register/Account' />" enctype='multipart/form-data' modelAttribute="memberBean"> --%>
				<form:form method='POST' action="${post_url}" enctype='multipart/form-data' modelAttribute="memberBean">
<%-- 				<input value="${anEntry.memberId}" name="memberId" type="hidden"> --%>
				
				<div class="container_1">
					<div class="member_content" role="main">
						<div class="_2YiVnW">
							<div class="_2w2H6X">
								<h3 class="_3iiDCN">我的帳號</h3>
							</div>
							<div class="goiz2O">
								<div class="pJout2">
										<div class="_3BlbUs">
											<div class="_1iNZU3">
												<div class="_2PfA-y">
													<label>使用者帳號</label>
												</div>
												<div class="_2_JugQ">
													<div class="_2bdFDW">
														<div class="_3S9myJ">${LoginOK.memberId}</div>
														<button class="_2CLMxo"></button>
													</div>
												</div>
											</div>
										</div>
										<div class="_3BlbUs">
											<div class="_1iNZU3">
												<div class="_2PfA-y">
													<label>密碼</label>
												</div>
												<div class="_2_JugQ">
													<div class="input-with-validator-wrapper">
														<div class="input-with-validator">
															<form:input path="password"  placeholder="" maxlength="255"/>
															<form:errors path="password" cssClass="error"/>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="_3BlbUs">
											<div class="_1iNZU3">
												<div class="_2PfA-y">
													<label>姓名</label>
												</div>
												<div class="_2_JugQ">
													<div class="input-with-validator-wrapper">
														<div class="input-with-validator">
															<input type="text" placeholder="" maxlength="255"
																value="${LoginOK.name}">
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="_3BlbUs">
											<div class="_1iNZU3">
												<div class="_2PfA-y">
													<label>暱稱</label>
												</div>
												<div class="_2_JugQ">
													<div class="input-with-validator-wrapper">
														<div class="input-with-validator">
															<form:input path="nickName" placeholder="${LoginOK.nickName}" maxlength="255"/>
																<form:errors path="nickName" cssClass="error"/>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="_3BlbUs">
											<div class="_1iNZU3">
												<div class="_2PfA-y">
													<label>生日</label>
												</div>
												<div class="_2_JugQ">
													<div class="input-with-validator-wrapper">
														<div class="input-with-validator">
															<input name='birthday' placeholder="" maxlength="255" value="${LoginOK.birthday}"/>
																<form:errors name='birthday' cssClass="error"/>																
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="_3BlbUs">
											<div class="_1iNZU3">
												<div class="_2PfA-y">
													<label>Email</label>
												</div>
												<div class="_2_JugQ">
													<div class="input-with-validator-wrapper">
														<div class="input-with-validator">
															<form:input path='email' placeholder="${LoginOK.email}" maxlength="255"/>
																<form:errors path='email' cssClass="error"/>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="_3BlbUs">
											<div class="_1iNZU3">
												<div class="_2PfA-y">
													<label>手機號碼</label>
												</div>
												<div class="_2_JugQ">
													<div class="input-with-validator-wrapper">
														<div class="input-with-validator">
															<form:input path='phone' placeholder="${LoginOK.phone}" maxlength="255"/>
																<form:errors path='phone' cssClass="error"/>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="_3BlbUs">
											<div class="_1iNZU3">
												<div class="_2PfA-y">
													<label>收件地址</label>
												</div>
												<div class="_2_JugQ">
													<div class="input-with-validator-wrapper">
														<div class="input-with-validator">
															<form:input path='address' placeholder="${LoginOK.address}" maxlength="255"/>
																<form:errors path='address' cssClass="error"/>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div style="text-align: end;">
											<input class="btn buttoncss" type='submit'>
										</div>
								</div>
								<div class="_1aIEbS" style="align-items: center;">
									<div class="X1SONv">
										<div class="_1FzaUZ">
											<img style="height: auto; width: 6.25rem;"
												src="<c:url value='/_00_init/getMemberImage?id=${LoginOK.memberId}' />">
										</div>
										<label class="btn btn-info"> 
										<form:input id="upload_img" path="memberMultipartFile"
											style="display: none;" type="file"
											accept="image/png, image/jpeg" />
											<i class="fa fa-photo">選擇圖片</i>
										</label>
										<div class="_3Jd4Zu">
											<div class="_3UgHT6">檔案大小:最大1MB</div>
											<div class="_3UgHT6">檔案限制: .JPEG, .PNG</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>


					<!-- 左側欄 -->
					<jsp:include page="/fragment/sideMenu.jsp" />

				</div>
				</form:form>
			</div>
		</div>

		<!-- 頁尾 -->
		<jsp:include page="/fragment/footer.jsp" />
	</div>

</body>

</html>