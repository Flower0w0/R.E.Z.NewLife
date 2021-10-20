<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<!-- <link rel="stylesheet" href="./css/main.css"> -->
<!-- <link rel="stylesheet" href="./css/product.css"> -->
<link rel="stylesheet" href="<c:url value='/css/person.css' />">
<link rel="stylesheet" href="<c:url value='/css/person.css.map' />">
<link rel="stylesheet" href="<c:url value='/css/main.css' />">
<link rel="stylesheet" href="<c:url value='/css/text.css' />">
<link rel="shortcut icon" href="<c:url value='/images/R.E.Z.Logo/favicon.ico' />" rel="external nofollow" type="image/x-icon" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<title>R.E.Z.新生－遊戲第二人生</title>
</head>

<body background="<c:url value='/images/bg/repeated-square.png' />">

	<div id="id_wrapper">
		<jsp:include page="/fragment/top.jsp" />
		<div id="id_content">
			<div>
				<jsp:include page="/fragment/top2.jsp" />

				<!-- 會員資料 -->
				<div class="container_1">
					<div class="member_content">
						<div class="_2w2H6X" style="margin-bottom: 10px;">
							<h3 class="_3iiDCN">我的訂單</h3>
						</div>
						<c:choose>
							<c:when test="${not empty memberOrders}">
								<div style="padding: 12px 12px 6px; background-color: #fff;">
									<div style="text-align: right;">
										<span></span>
									</div>
									<hr>
									<table class="table">
										<thead>
											<tr>
												<th scope="col" style="text-align: center;">訂單編號</th>
												<th scope="col">訂單日期</th>
												<th scope="col">送貨地址</th>
												<th scope="col" style="text-align: center;">訂單狀態</th>
												<th scope="col" style="text-align: center;">訂單金額</th>
											</tr>
										</thead>
										<c:forEach var="anOrderBean" varStatus="stat"
											items="${memberOrders}">
											<tbody>
												<tr>
													<th style="text-align: center;" scope="row"><a
														href='<c:url value='/_06_orderProcess/orderDetail?memberId=${LoginOK.memberId}&id=${anOrderBean.id}' />'>
															${anOrderBean.id} </a></th>
													<td>${anOrderBean.date}</td>
													<td>${anOrderBean.deladdress}</td>
													<td style="text-align: center;">${anOrderBean.state}</td>
													<td style="text-align: center;">${anOrderBean.total}</td>
												</tr>
											</tbody>
										</c:forEach>
									</table>
								</div>
							</c:when>
							<c:otherwise>
								<div id="block" style="margin-top: 20%; text-align: center; color: #6c757d;">
									<h1>快將喜愛的遊戲帶回家吧❤</h1>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
					<!-- 左側欄 -->
					<jsp:include page="/fragment/sideMenu.jsp" />
				</div>
			</div>
		</div>

		<!-- 頁尾 -->
		<jsp:include page="/fragment/footer.jsp" />
	</div>
</body>

</html>