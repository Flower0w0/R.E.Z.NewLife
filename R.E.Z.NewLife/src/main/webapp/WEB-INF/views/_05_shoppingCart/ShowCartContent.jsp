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
function confirmDelete(n) {
	if (confirm("確定刪除此項商品 ? ") ) {
		document.forms[0].action="<c:url value='/_05_shoppingCart/UpdateItem.do?cmd=DEL&id=" + n +"' />" ;
		document.forms[0].method="POST";
		document.forms[0].submit();
	} else {
	
	}
}
function modify(key, count, index) {
	var x = "newCount" + index;
	var newCount = document.getElementById(x).value;
	if  (newCount < 0 ) {
		window.alert ('數量不能小於 0');
		return ; 
	}
	if  (newCount == 0 ) {
		window.alert ("請執行刪除功能來刪除此項商品");
		document.getElementById(x).value = count;
		return ; 
	}
	if  (newCount == count ) {
		window.alert ("新、舊數量相同，不必修改");
		return ; 
	}
	if (confirm("確定將此商品的數量由" + count + " 改為 " + newCount + " ? ") ) {
		document.forms[0].action="<c:url value='/_05_shoppingCart/UpdateItem.do?cmd=MOD&id=" + key + "&newCount=" + newCount +"' />" ;
		document.forms[0].method="POST";
		document.forms[0].submit();
	} else {
		document.getElementById(x).value = count;
	}
}
function isNumberKey(evt)
{
   var charCode = (evt.which) ? evt.which : event.keyCode
   if (charCode > 31 && (charCode < 48 || charCode > 57)){
      return false;
   }
   return true;
}
function Checkout(count) {
	if (count == 0)  {
		alert("無購買任何商品，不需結帳");
		return false;
	}
	if (confirm("再次確認訂單內容 ? ") ) {
		return true;
	} else {
		return false;
	}
}
function Abort() {
	if (confirm("確定放棄購物 ? ") ) {
		return true;
	} else {
		return false;
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

input, textarea {
	caret-color: auto; /* 預設 */
	caret-color: transparent; /* 透明 */
	caret-color: #FF1744; /* 指定色 */
	outline: none; /* 外框效果 */
}
#block {
	color: #6c757d;
    position: absolute;
    top: 50%;
    left: 50%;
    margin-top: -24px;
    margin-left: -288px;
    display: flex;
}
</style>


<body background="<c:url value='/images/bg/repeated-square.png' />">
	<div id="id_wrapper">
		<jsp:include page="/fragment/top.jsp" />
		<div id="id_content">
			<div>
				<jsp:include page="/fragment/top2.jsp" />
				<!-- MODAL Start
    	================================================== -->
				<c:choose>
					<c:when test="${ShoppingCart.subtotal > 0}">
						<c:set var="subtotalMessage"
							value="金額小計:${ShoppingCart.subtotal} 元" />
						<c:set var="subtotal" value="${ShoppingCart.subtotal}" />
					</c:when>
					<c:otherwise>
						<c:set var="subtotalMessage" value="金額小計:  0 元" />
						<c:set var="subtotal" value="0" />
					</c:otherwise>
				</c:choose>

				<!-- ------------------ -->
				<div class="container main-contant py-5">
					<h1 class="text-center mb-3 text-secondary">R.E.Z.新生</h1>
					<div class="form-row text-center"
						style="background-image: url(<c:url value='/images/bg/struckaxiom.png' />); border-radius: 1rem;">
						<div class="col-3 col-sm"
							style="display: inline-block; margin: 0 5% 0 0;">
							<div class="alert alert-primary alert-rounded" role="alert"
								style="margin: 1rem 0;">1.確認商品</div>
						</div>
						<div class="col-3 col-sm"
							style="display: inline-block; margin: 0 5% 0 5%;">
							<div class="alert alert-light alert-rounded" role="alert"
								style="margin: 1rem 0;">2.輸入資訊</div>
						</div>
						<div class="col-3 col-sm"
							style="display: inline-block; margin: 0 0 0 5%;">
							<div class="alert alert-light alert-rounded" role="alert"
								style="margin: 1rem 0;">3.訂單完成</div>
						</div>
					</div>
					<!-- 購物車訂單縮放功能 -->
					<c:choose>
					<c:when test="${not empty ShoppingCart.content}">
					<div class="row justify-content-center py-5">

						<div class="col-md-8">
						<div style='text-align: center;'>
			<c:if test='${not empty OrderErrorMessage}'>
				<font color='red'>${OrderErrorMessage}</font>
				<c:remove var="OrderErrorMessage" />
			</c:if>
		</div>
		<h3 class="text-center pb-2 pt-2">訂單資訊</h3>
							<!-- 						訂單資訊 -->
							<table class="table table-sm text-center">
									<thead>
										<tr>
											<th width="20%">商品圖片</th>
											<th width="10%">商品類型</th>
											<th width="40%">商品名稱</th>
											<th width="10%">數量</th>
											<th width="10%"></th>
											<th width="10%">小計</th>
										</tr>
									</thead>
<tbody>
							<c:forEach varStatus="vs" var="anEntry"
								items="${ShoppingCart.content}">
								<tr>
										<c:choose>
											<c:when test="${not empty anEntry.value.newProductId}">
												<td class="align-middle"
															style="display: flex; justify-content: center; align-items: center;">
													<img style="height: auto; width: 70%;"
													src="<c:url value='/_00_init/getGameImage?id=${anEntry.value.newProductId}' />">
												</td>
												<td class="align-middle"
													style="margin-left: 10px;">
													${anEntry.value.type}
													</td>
												<td class="align-middle"
													style="margin-left: 10px;">
												${anEntry.value.newProductName}
												</td>
											</c:when>
											<c:otherwise>
												<td class="align-middle"
															style="display: flex; justify-content: center; align-items: center;">
													<img style="height: auto; width: 70%;"
													src="<c:url value='/_00_init/getGameImage?id=${anEntry.value.oldProductId}' />">
												</td>
												<td class="align-middle"
													style="margin-left: 10px;">
													${anEntry.value.type}
													</td>
												<td class="align-middle"
													style="margin-left: 10px;">
														${anEntry.value.oldProductName}
												</td>
											</c:otherwise>
										</c:choose>
										<td class="align-middle"
											>
											<Input id="newCount${vs.index}"
												style="width: 28px; text-align: right" name="newCount"
												type="text"
												value="<fmt:formatNumber value="${anEntry.value.count}" />"
												name="count" onkeypress="return isNumberKey(event)" />
										</td>
										<td  class="align-middle"
												>
											   <Input type="button"
												name="update" value="修改" class="buttoncss btn"
												onclick="modify(${anEntry.key}, ${anEntry.value.count}, ${vs.index})">
												<Input type="button" name="delete" value="刪除"
												class="buttoncss btn" 
												onclick="confirmDelete(${anEntry.key})">
										</td>
									

<%--                                         <td class="align-middle">${entry.value.count}</td> --%>
									<td class="align-middle text-right"><fmt:formatNumber
											value="${anEntry.value.price * anEntry.value.discount * anEntry.value.count}"
											pattern="#,###,###" />元</td>				
								<tr>
							</c:forEach>
							<tr>
											<td colspan="" style="text-align: center;">運費</td>
											<td></td>
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
											<td></td>
									<td class="align-middle text-right"><strong><fmt:formatNumber
											value="${subtotal}" pattern="#,###,###" />元</strong>
								</td>
							</tr>
</tbody>
</table>
							
							<!-- ------------------ -->
							<div class="text-center">
								<a href="<c:url value='/_05_shoppingCart/checkout.do' />"
									class="buttoncss btn" onClick="return Checkout(${subtotal + 100});">再次確認</a>
								<a href="<c:url value='/_05_shoppingCart/abort.do' />"
									class="buttoncss btn" onClick="return Abort();">放棄購物</a>
							</div>

						</div>
					</div>
					</c:when>
					<c:otherwise>
					<div id="block">
					<h1>快將喜愛的遊戲加入購物車吧❤</h1>	
					</div>
					</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		
		<form>
			<input type="hidden" name="a" />
		</form>

		<!-- 頁尾 -->
		<jsp:include page="/fragment/footer.jsp" />
	</div>

</body>

</html>