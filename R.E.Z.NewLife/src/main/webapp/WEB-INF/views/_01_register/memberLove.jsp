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
<!-- <link rel="stylesheet" href="./css/main.css"> -->
<!-- <link rel="stylesheet" href="./css/product.css"> -->
<link rel="stylesheet" href="<c:url value='/css/personcol.css' />">
<link rel="stylesheet" href="<c:url value='/css/person.css.map' />">
<link rel="stylesheet" href="<c:url value='/css/main.css' />">
<link rel="stylesheet" href="<c:url value='/css/text.css' />">
<link rel="shortcut icon" href="<c:url value='/images/R.E.Z.Logo/favicon.ico' />" rel="external nofollow" type="image/x-icon" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<title>R.E.Z.新生－遊戲第二人生</title>

<script type="text/javascript">

function isNumberKey(evt)
{
   var charCode = (evt.which) ? evt.which : event.keyCode
   if (charCode > 31 && (charCode < 48 || charCode > 57)){
      return false;
   }
   return true;
}

function confirmDelete(id, member_id) {
	var result = confirm("確定取消追蹤?");
	if (result) {
		document.forms[0].putOrDelete.name = "_method";
		document.forms[0].putOrDelete.value = "DELETE";
		return true;
	}
	return false;
}
function confirmUpdate(id) {
	var result = confirm("確定送出此筆記錄(帳號:" + id.trim() + ")?");
	if (result) {
		// 		  document.forms[0].putOrDelete.name = "_method";
		// 		  document.forms[0].putOrDelete.value = "PUT";
		return true;
	}
	return false;
}

</script>

</head>

<body background="<c:url value='/images/bg/repeated-square.png' />">

	<div id="id_wrapper">
		<jsp:include page="/fragment/top.jsp" />
		<div id="id_content">
			<div>
				<jsp:include page="/fragment/top2.jsp" />
				<!-- 會員資料 -->

				<div class="container_1">
					<div class="member_content_2"
						style="text-align: center; align-items: center; grid-template-rows: repeat(6, minmax(0px, auto)); row-gap: 10px; grid-column: 3/4;">
						<div class="_2w2H6X"
							style="grid-row: 1/2; grid-column: 1/5; text-align: start;">
							<h3 class="_3iiDCN">我的收藏</h3>
						</div>
						<!-- 第一列收藏           -->
						<c:choose>
							<c:when test="${not empty memberLoves}">
								<!-- 						<div class="row justify-content-center py-5"> -->

								<!-- 							<div class="col-md-8"> -->
								<div style='text-align: center;'>
									<c:if test='${not empty OrderErrorMessage}'>
										<font color='red'>${OrderErrorMessage}</font>
										<c:remove var="OrderErrorMessage" />
									</c:if>
								</div>



								<c:forEach varStatus="vs" var="anEntry" items="${memberLoves}">
									<FORM method='POST'
										action="<c:url value='/_07_love/dmodifyLove' />">
										<input type="hidden" name="noname" id='putOrDelete' value="">
										<input value="${anEntry.id}" name="id" type="hidden">
										<input value="${anEntry.member_id}" name="member_id"
											type="hidden">

										<!-- 											商品 -->
										<div
											style="display: grid; text-align: center; align-items: center; grid-template-columns: 10% 10% 45% 10% 25%;">
											<c:choose>
												<c:when test="${not empty anEntry.newproduct_id}">
													<div class="detail" style="grid-column: 1/2; margin-top: 5px;">
														<span><img style="height: 100px;"
															src="<c:url value='/_00_init/getGameImage?id=${anEntry.newproduct_id}' />"
															alt=""></span>
													</div>
													<div class="detail" style="grid-column: 2/3; margin-top: 5px;">
														<span>${anEntry.type}</span>
													</div>
													<div class="detail"
														style="grid-column: 3/4; text-align: start; margin-top: 5px;">
														<span>${anEntry.newproduct_name}</span>
													</div>
													<div class="detail" style="grid-column: 4/5; margin-top: 5px;">
														<span>${anEntry.newproduct_price}</span>
													</div>
													<div class="detail" style="grid-column: 5/6; margin-top: 5px;">
														<span style="margin-top: 5px;"><a
															href="<c:url value='/_04_shop/Newproduct?id=${anEntry.newproduct_id}' />">
																<button style="margin-right: 5px; width: auto;"
																	type="button" class="btn buttoncss">前往購物</button>
														</a></span> <Input type="submit" name="deleteBtn" value="取消追蹤"
															class="buttoncss btn"
															onclick="return confirmDelete('${anEntry.id}', '${anEntry.member_id}');">
													</div>
												</c:when>
												<c:otherwise>
													<div class="detail" style="grid-column: 1/2; margin-top: 5px;">
														<span><img style="height: 100px;"
															src="<c:url value='/_00_init/getGameImage?id=${anEntry.oldproduct_id}' />"
															alt=""></span>
													</div>
													<div class="detail"
														style="grid-column: 2/3; margin-top: 5px;">
														<span>${anEntry.type}</span>
													</div>
													<div class="detail"
														style="grid-column: 3/4; text-align: start; margin-top: 5px;">
														<span>${anEntry.oldproduct_name}</span>
													</div>
													<div class="detail" style="grid-column: 4/5; margin-top: 5px;">
														<span>${anEntry.oldproduct_price}</span>
													</div>
													<div class="detail" style="grid-column: 5/6; margin-top: 5px;">
														<span style="margin-top: 5px;"><a
															href="<c:url value='/_04_shop/Oldproduct?id=${anEntry.oldproduct_id}' />"><button
																	style="margin-right: 5px; width: auto;" type="button"
																	class="btn buttoncss">前往購物</button></a></span> <Input
															type="submit" name="deleteBtn" value="取消追蹤"
															class="buttoncss btn"
															onclick="return confirmDelete('${anEntry.id}', '${anEntry.member_id}');">
													</div>
												</c:otherwise>
											</c:choose>
										</div>
										<!-- 										結束 -->
									</FORM>
								</c:forEach>

							</c:when>
							<c:otherwise>
								<div id="block" style="margin-top: 20%; color: #6c757d;">
									<h1>快將喜愛的遊戲加入收藏吧❤</h1>
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