<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

<link rel="stylesheet" href="<c:url value='/css/main.css' />">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.4.2/css/all.css">
<link rel="shortcut icon" href="<c:url value='/images/R.E.Z.Logo/favicon.ico' />" rel="external nofollow" type="image/x-icon" />
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script> -->
<!-- Fonts -->
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700"
	rel='stylesheet' type='text/css'>
<link
	href="http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz:400,700"
	rel='stylesheet' type='text/css'>



<!-- jS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script>
<script src="<c:url value='/jQuery-TWzipcode-master/twzipcode.js' />"></script>
<script
	src="<c:url value='/jQuery-TWzipcode-master/jquery.twzipcode.min.js' />"></script>
<script
	src="<c:url value='/jQuery-TWzipcode-master/jquery.twzipcode.js' />"></script>
<script src="<c:url value='/jQuery-TWzipcode-master/bower.json' />"></script>

<script type="text/javascript">

function cancelOrder() {
	if (confirm("確定取消此份訂單 ? ") ) {
		// 接收此資料的Servlet會使用 finalDecision 參數的值
		document.forms[0].finalDecision.value = "CANCEL";
		document.forms[0].action="<c:url value='/_05_shoppingCart/ProcessOrder.do' />";
		document.forms[0].submit();
		return;
	} else {
		return;
	}
}
function reconfirmOrder() {
	var sa = document.getElementById('ShippingAddress').value;
	if  (sa === "") {
		window.alert ('出貨地址不能是空白');
		return ; 
	}
	if (confirm("確定送出此份訂單 ? ") ) {
		// 接收此資料的Servlet會使用 finalDecision 參數的值
		document.forms[0].finalDecision.value = "ORDER";
		document.forms[0].action="<c:url value='/_05_shoppingCart/ProcessOrder.do' />";
		document.forms[0].method="POST";
		document.forms[0].submit();
		return;
	} else {
		return;
	}
}
</script>

</head>
<style>
body {
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI",
		"Microsoft JhengHei", Roboto, "Helvetica Neue", Arial, sans-serif
}

.address {
	display: flex;
	flex-wrap: wrap;
	margin: 0px;
}

.pay {
	width: 250px;
	/* background: #aaa; */
	display: flex;
}

</style>


<body background="<c:url value='/images/bg/repeated-square.png' />">
	<div id="id_wrapper">
		<jsp:include page="/fragment/top.jsp" />
		<div id="id_content">
			<div>
				<jsp:include page="/fragment/top2.jsp" />

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
							<div class="alert alert-primary alert-rounded" role="alert"
								style="margin: 1rem 0;">2.輸入資訊</div>
						</div>
						<div class="col-3 col-sm"
							style="display: inline-block; margin: 0 0 0 5%;">
							<div class="alert alert-light alert-rounded" role="alert"
								style="margin: 1rem 0;">3.訂單完成</div>
						</div>
					</div>

					<FORM action="<c:url value='/_05_shoppingCart/ProcessOrder.do' />"
						method="POST">

						<div class="row justify-content-center py-5">

							<div class="col-md-8">
								<!-- 						訂單資訊 -->
								<div class="input-group mb-3">
									<span style="font-size: large;"></span>
								</div>



								<!-- 買家資料 -->
								<h3 class="text-center pb-2 pt-2">收件資訊</h3>
								<div class="form-row">
									<div class="input-group mb-3">
										
									</div>
									<div class="input-group mb-3">
										<span class="input-group-text" id="inputGroup-sizing-default">訂單日期：</span>
										<span class="form-control" aria-label="Sizing example input"
											aria-describedby="inputGroup-sizing-default">${SYSTEM.today}</span>
									</div>
									<div class="input-group mb-3">
										<span class="input-group-text" id="inputGroup-sizing-default">會員帳號：</span>
										<span class="form-control" aria-label="Sizing example input"
											aria-describedby="inputGroup-sizing-default">${LoginOK.memberId}</span>
									</div>
									<div class="input-group mb-3">
										<span class="input-group-text" id="inputGroup-sizing-default">會員信箱：</span>
										<span class="form-control" aria-label="Sizing example input"
											aria-describedby="inputGroup-sizing-default">${LoginOK.email}</span>
									</div>

									<div class="input-group mb-3">
										<span class="input-group-text" id="inputGroup-sizing-default">收件姓名：</span>
										<input type="text" value="${LoginOK.name}" value=""
											class="form-control" name="person"
											aria-label="Sizing example input"
											aria-describedby="inputGroup-sizing-default">
									</div>

									<!-- 電話 -->
									<div class="input-group mb-3">
										<span class="input-group-text" id="inputGroup-sizing-default">收件電話：</span>
										<input type="text" value="${LoginOK.phone}" name="phone"
											class="form-control" aria-label="Sizing example input"
											aria-describedby="inputGroup-sizing-default">
									</div>
									<div class="input-group mb-3">
										<span class="input-group-text" id="inputGroup-sizing-default">收件地址：</span>
										<input type="text" id='ShippingAddress' name="deladdress"
											value="${LoginOK.address}" class="form-control"
											aria-label="Sizing example input"
											aria-describedby="inputGroup-sizing-default"> <font
											color='red'>${errorMsg.ShippingAddress}</font>
									</div>
									<div class="input-group mb-3">
										<span class="input-group-text" id="inputGroup-sizing-default">訂單備註：</span>
										<input type="text" id='ShippingAddress' name="desc"
											value="" class="form-control" placeholder="ex.我最喜歡R.E.Z.新生了❤"
											aria-label="Sizing example input"
											aria-describedby="inputGroup-sizing-default"> <font
											color='red'>${errorMsg.ShippingAddress}</font>
									</div>
								</div>


								<!-- 付款方式 -->
								<div class="paypay"></div>
								<hr>
								<label for="paymethod">付款方式</label>
								<div class="pay">
									<div class="form-check">
										<input class="form-check-input" type="radio" value="貨到付款"
											name="payway" id="flexRadioDefault1"> <label
											class="form-check-label" for="flexRadioDefault1">
											貨到付款 </label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="radio"
											style="margin-left: auto;" name="payway" value="信用卡"
											id="flexRadioDefault2" checked> <label
											class="form-check-label" for="flexRadioDefault2"> 信用卡
										</label>
									</div>
								</div>
								
								<hr>
								<!-- ------------------ -->
								<div class="text-center">
									<input type="hidden" name="finalDecision" value=""> <input
										type="button" name="OrderBtn" value="確定送出" class="buttoncss btn"
										onclick="reconfirmOrder()"> <input type="button" class="buttoncss btn"
										name="CancelBtn" value="取消訂單" onclick="cancelOrder()">
								</div>

							</div>
						</div>
					</FORM>
				</div>
			</div>
		</div>
		<!-- 頁尾 -->
		<jsp:include page="/fragment/footer.jsp" />
	</div>

</body>

</html>