<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>R.E.Z.新生－遊戲第二人生</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.4.2/css/all.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css">
<link rel="shortcut icon"
	href="<c:url value='/images/R.E.Z.Logo/favicon.ico' />"
	rel="external nofollow" type="image/x-icon" />
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

<!-- <link rel="stylesheet" href="../css copy/style.css"> -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.4.2/css/all.css">
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script> -->
<!-- Fonts -->
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700"
	rel='stylesheet' type='text/css'>
<link
	href="http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz:400,700"
	rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="<c:url value='/css/main.css' />">

<!-- jS -->
<script src="<c:url value='/jQuery-TWzipcode-master/twzipcode.js' />"></script>
<script
	src="<c:url value='/jQuery-TWzipcode-master/jquery.twzipcode.min.js' />"></script>
<script
	src="<c:url value='/jQuery-TWzipcode-master/jquery.twzipcode.js' />"></script>
<script src="<c:url value='/jQuery-TWzipcode-master/bower.json' />"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script>


</head>
<style>
body {
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI",
		"Microsoft JhengHei", Roboto, "Helvetica Neue", Arial, sans-serif
}
</style>


<body background="<c:url value='/images/bg/repeated-square.png' />">
	<div id="id_wrapper">
		<jsp:include page="/fragment/top.jsp" />
		<div id="id_content">
			<div>
				<jsp:include page="/fragment/top2.jsp" />
				<!-- ---------------------------------- -->

				<div class="container main-contant py-5">
					<h1 class="text-center mb-3 text-secondary">R.E.Z.新生</h1>
					<div class="form-row text-center"
						style="background-image: url(<c:url value='/images/bg/struckaxiom.png' />); border-radius: 1rem;">
						<div class="col-3 col-sm"
							style="display: inline-block; margin: 0 5% 0 0;">
							<div class="alert alert-light alert-rounded" role="alert"
								style="margin: 1rem 0;">1.確認商品</div>
						</div>
						<div class="col-3 col-sm"
							style="display: inline-block; margin: 0 5% 0 5%;">
							<div class="alert alert-light alert-rounded" role="alert"
								style="margin: 1rem 0;">2.輸入資訊</div>
						</div>
						<div class="col-3 col-sm"
							style="display: inline-block; margin: 0 0 0 5%;">
							<div class="alert alert-primary alert-rounded" role="alert"
								style="margin: 1rem 0;">3.訂單完成</div>
						</div>
					</div>

					<div class="row justify-content-center py-5">
						<div class="col-md-8">
							<h2 class="text-center pb-2">親愛的會員 ${BuyOrder.memberName}
								您好，感謝您的訂購❤</h2>
							<hr>
							<br>
							<table class="table table-sm text-center">
								<thead>
									<tr>
										<th width="20%">商品圖片</th>
										<th width="10%">商品類型</th>
										<th width="50%">商品名稱</th>
										<th width="10%">數量</th>
										<th width="10%">小計</th>
									</tr>
								</thead>


								<tbody>
									<c:forEach varStatus="vs" var="entry" items="${BuyOrderitems}">
										<tr>
											<c:choose>
												<c:when test="${not empty entry.newProductId}">
													<td class="align-middle"
														style="display: flex; justify-content: center; align-items: center;">
														<img style="height: auto; width: 70%;"
														src="<c:url value='/_00_init/getGameImage?id=${entry.newProductId}' />">
													</td>
													<td class="align-middle" style="margin-left: 10px;">
														${entry.type}</td>
													<td class="align-middle" style="margin-left: 10px;">
														${entry.newProductName}</td>
												</c:when>
												<c:otherwise>
													<td class="align-middle"
														style="display: flex; justify-content: center; align-items: center;">
														<img style="height: auto; width: 70%;"
														src="<c:url value='/_00_init/getGameImage?id=${entry.oldProductId}' />">
													</td>
													<td class="align-middle" style="margin-left: 10px;">
														${entry.type}</td>
													<td class="align-middle" style="margin-left: 10px;">
														${entry.oldProductName}</td>
												</c:otherwise>
											</c:choose>


											<td class="align-middle">${entry.count}</td>
											<td class="align-middle text-right"><fmt:formatNumber
													value="${entry.price * entry.discount * entry.count}"
													pattern="#,###" />元</td>
										</tr>

										<!-- 									<tr> -->
										<!-- 										<td colspan="3" style="text-align: left;">運費</td> -->
										<!-- 										<td class="align-middle text-right"><strong>$60</strong> -->
										<!-- 										</td> -->
										<!-- 									</tr> -->

									</c:forEach>
									<tr>
										<td colspan="" style="text-align: center;">運費</td>
										<td></td>
										<td></td>
										<td></td>
										<td class="align-middle text-right"><strong>100元</strong>
										</td>
									</tr>
									<tr>
										<td colspan="" style="text-align: center;">合計</td>
										<td></td>
										<td></td>
										<td></td>
										<td class="align-middle text-right"><strong><fmt:formatNumber
													value="${BuyOrder.total}" pattern="#,###,###" />元</strong></td>
									</tr>
								</tbody>
							</table>

							<!-- 								<h3 class="text-center pb-2 pt-2">收件資訊</h3> -->
							<table class="table table-sm" style="text-align: left;">
								<tbody>
									<tr>
										<th width="20%" class="py-2 text-center">會員帳號</th>
										<td style="text-align: left;">${BuyOrder.memberName}</td>
									</tr>
									<tr>
										<th class="py-2 text-center">收件姓名</th>
										<td class="align-middle">${BuyOrder.person}</td>
									</tr>
									<tr>
										<th class="py-2 text-center">收件電話</th>
										<td class="align-middle">${BuyOrder.phone}</td>
									</tr>
									<tr>
										<th class="py-2 text-center">收件地址</th>
										<td class="align-middle">${BuyOrder.deladdress}</td>
									</tr>
									<tr>
										<th class="py-2 text-center">付款方式</th>
										<td class="align-middle">${BuyOrder.payway}</td>
									</tr>
									<tr>
										<th class="py-2 text-center">訂單備註</th>
										<td class="align-middle">${BuyOrder.desc}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- 頁尾 -->
		<jsp:include page="/fragment/footer.jsp" />
	</div>

</body>

</html>