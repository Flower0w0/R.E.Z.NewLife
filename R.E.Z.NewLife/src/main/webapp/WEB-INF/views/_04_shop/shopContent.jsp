<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<link rel="stylesheet" href="<c:url value='/css/product_bg.css' />">
<link rel="shortcut icon" href="<c:url value='/images/R.E.Z.Logo/favicon.ico' />" rel="external nofollow" type="image/x-icon" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script>
<title>R.E.Z.新生－遊戲第二人生</title>
</head>

<script type="text/javascript">

window.onload = function (){
	var stock = '';
	var i;
	var option = document.querySelector('.stock');

	for (i = 1; i <= ${product.stock}; i++) {
		stock += "<option value=" + i + ">" + i + "</option>";
	}
	option.innerHTML = stock;	
}


</script>

<style>
#love:hover, #shopping:hover {
	color: coral;
}

#love {
	margin-right: 3px;
	color: #fff;
}

#shopping {
	color: #fff;
}
</style>

<body
	background="<c:url value='/_04_shop/getBgpicture/${product.id}' />"
	style="background-color: rgba(0, 0, 0, 0.6);">
	<div id="id_wrapper">
		<jsp:include page="/fragment/top.jsp" />
		<div id="id_content">
			<div>
				<jsp:include page="/fragment/top2.jsp" />

				<!-- 購物車圖示 -->

				<div class="cart_icon">
					<div class="breadcrumb_1">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb" style="margin: 8px 0;">
								<li class="breadcrumb-item"><a href="<c:url value='/' />"
									style="font-size: 1rem;"><i class="fas fa-home"></i>首頁</a></li>
								<li class="breadcrumb-item"><a style="font-size: 1rem;"
									href="<c:url value='/_04_shop/NewProducts' />">商品區</a></li>
								<li class="breadcrumb-item active" aria-current="page">${product.name}</li>
							</ol>
						</nav>
					</div>

					<div class="loveshopping">
						<a id="love" href="<c:url value='/_07_love/loveContent' />"><i
							class="far fa-heart"></i></a> <a
							href="<c:url value='/_05_shoppingCart/ShowCartContent' />"
							id="shopping"><i class="fas fa-shopping-cart"></i></a>
					</div>
				</div>


				<!-- 商品細節 -->
				<!-- 麵包屑 -->

				<div class="product_detail">
					<div class="main_img">
						<img src="<c:url value='/_04_shop/getPicture/${product.id}' />"
							style="height: auto; width: 80%;">
					</div>
					<div class="game_title" style="height: auto; width: 100%;">
						<h1 style="font-size: 36px; color: #fff;">${product.name}</h1>

						<c:forEach varStatus="stVar" var="entry" items="${copy}">
							<ul style="margin-top: 5%;">
								<li><i class="far fa-hand-point-right"></i>${entry.value}</li>
							</ul>
						</c:forEach>

						<hr>

						<h2 class="product_price">
							<span style="font-size: medium;">會員價 </span> <strong
								style="font-weight: 700; line-height: inherit;">
								$${product.price}</strong>
						</h2>

						<div style="margin-top: 20px;">
							<c:choose>
								<c:when test="${product.stock > 0}">
									<!-- 
                        FORM表單的資料會送後端的 
                        _03_listBooks.controller.BuyBookServlet.java來處理 
                   -->

									<FORM action="<c:url value='/_04_shop/NewProducts.do' />"
										method="POST" style="color: #fff; display: inline-block; margin-right: 20px;">
										購買數量 <select class="stock" name='count'
											style="margin: 0 20px 0 20px;">
										</select>
										<!-- 這些隱藏欄位都會送到後端 -->
											<Input class="buttoncss btn" type='submit' value='加入購物車'>
											<Input type='hidden' name='id' value='${product.id}'>
											<Input type='hidden' name='pageNo' value='${param.pageNo}'>
											<Input type='hidden' name='NpageNo' value='${param.NpageNo}'>
											<Input type='hidden' name='SpageNo' value='${param.SpageNo}'>
									</FORM>

								</c:when>
								<c:otherwise>
									<h3 style="color: #fff;">抱歉此產品目前無庫存</h3>
								</c:otherwise>
							</c:choose>
							<FORM action="<c:url value='/_07_love/Love.do' />" method="POST"
								style="color: #fff; display: inline-block;">
								<!-- 這些隱藏欄位都會送到後端 -->
								<Input class="buttoncss btn" type='submit' name="addLove"
									value='加入收藏'> <Input type='hidden' name='id'
									value='${product.id}'> <Input type='hidden'
									name='pageNo' value='${param.pageNo}'> <Input
									type='hidden' name='NpageNo' value='${param.NpageNo}'>
								<Input type='hidden' name='SpageNo' value='${param.SpageNo}'>
							</FORM>
						</div>
					</div>
					<!-- 格線 -->

					<!-- 商品描述 -->
					<div class="product_detail_1">
						<h5>${product.name}</h5>
						<c:forEach varStatus="stVar" var="entry" items="${desc}">
							<p>${entry.value}</p>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<!-- 頁尾 -->
		<jsp:include page="/fragment/footer.jsp" />
	</div>
</body>

</html>