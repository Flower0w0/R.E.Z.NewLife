<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
							<h4 class="_3iiDCN">訂單編號${OrderBean.id}</h4>
						</div>
						<div style="padding: 12px 12px 6px; background-color: #fff;">

							<div style="text-align: right;">
<!-- 								<span>您的包裹已安排出貨</span> -->
							</div>
							<hr>
							<c:set var="subtotal" value="0" />
		<c:forEach var="aBean" varStatus="stat" items="${OrderBean.orderItemBeans}">
		<c:choose>
													<c:when test="${not empty aBean.newProductName}">
							<div
								style="display: grid; grid-template-columns: 90% 10%; grid-template-rows: 1fr;border: ridge 1px">
								
								<div
									style="padding: 0 12px 0 0; display: grid; grid-template-columns: 15% 85%; grid-template-rows: 1fr; ">
									<span style="text-align: center;"><img
										style="height: auto; width: 50%;"
										src="<c:url value='/_00_init/getGameImage?id=${aBean.newProductId}' />" alt=""></span>
									<div
										style="grid-column: 2/3; display: grid; grid-template-columns: 1fr; grid-template-rows: 1fr 1fr;">

										<span style="grid-row: 1/2; margin-left: 10px;">${aBean.newProductName}</span> <span
											style="grid-row: 2/3; margin-left: 10px;">商品類型 ：  ${aBean.type}，購買數量 ： ${aBean.count} 件</span>
									</div>
								</div>
								<span
									style="grid-row: 1/2; grid-column: 2/3; display: flex; justify-content: center; align-items: center;">$:<fmt:formatNumber
						value="${aBean.price*aBean.discount*aBean.count}"
						pattern="#,###,###" />元</span>
						<c:set var="subtotal"
					value="${ subtotal + aBean.price * aBean.discount * aBean.count }" />
							</div>
							</c:when>
							<c:otherwise>
							<div
								style="display: grid; grid-template-columns: 90% 10%; grid-template-rows: 1fr;">
								
								<div
									style="padding: 0 12px 0 0; display: grid; grid-template-columns: 15% 85%; grid-template-rows: 1fr;">
									<span style="text-align: center;"><img
										style="height: auto; width: 50%;"
										src="<c:url value='/_00_init/getGameImage?id=${aBean.oldProductId}' />' />" alt=""></span>
									<div
										style="grid-column: 2/3; display: grid; grid-template-columns: 1fr; grid-template-rows: 1fr 1fr; ">

										<span style="grid-row: 1/2; margin-left: 10px;">${aBean.oldProductName}</span> <span
											style="grid-row: 2/3; margin-left: 10px;">商品類型 ：  ${aBean.type} 購買數量 ： ${aBean.count} 件</span>
									</div>
								</div>
								<span
									style="grid-row: 1/2; grid-column: 2/3; display: flex; justify-content: center; align-items: center;">$:<fmt:formatNumber
						value="${aBean.price*aBean.discount*aBean.count}"
						pattern="#,###,###" />元</span>
						<c:set var="subtotal"
					value="${ subtotal + aBean.price * aBean.discount * aBean.count }" />
							</div>
							</c:otherwise>
							</c:choose>						
							</c:forEach>
						
							<hr>
							<div>
								<div
									style="display: grid; grid-template-columns: 66% 4% 20% 10%;">
									<span style="grid-column: 3/4; text-align: right;">訂單金額:</span>
									<span style="grid-column: 4/5; text-align: center;">$:<fmt:formatNumber value="${subtotal}" pattern="#,###,###" />元</span>
								</div>
							</div>

							
						</div>
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