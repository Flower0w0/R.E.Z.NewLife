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
<link rel="stylesheet" href="<c:url value='/css/product.css' />">
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

				<!-- 商品圖片3x2 -->
				<div class="pt6">
					<span><img src="<c:url value='/images/publicity/1.jpg' />"
						class="img-thumbnail" alt="..."></span> <span><img
						src="<c:url value='/images/publicity/2.jpg' />"
						class="img-thumbnail" alt="..."></span> <span><img
						src="<c:url value='/images/publicity/3.jpg' />"
						class="img-thumbnail" alt="..."></span> <span><img
						src="<c:url value='/images/publicity/4.png' />"
						class="img-thumbnail" alt="..."></span> <span><img
						src="<c:url value='/images/publicity/5.jpg' />"
						class="img-thumbnail" alt="..."></span> <span><img
						src="<c:url value='/images/publicity/6.jpg' />"
						class="img-thumbnail" alt="..."></span>
				</div>

				<!-- 選項 -->
				<hr style="margin: 1% 20% 1% 20%;">
				<div class="product">
					<span style="color: black; font-size: 20px;">遊戲軟體</span>						
					<div class="loveshopping">
						<a href="<c:url value='/_07_love/loveContent' />"
							style="margin-right: 3px;"><i class="far fa-heart"></i></a> <a
							href="<c:url value='/_05_shoppingCart/ShowCartContent' />"><i
							class="fas fa-shopping-cart"></i></a>
					</div>

				</div>
				<hr style="margin: 1% 20% 1% 20%;">
				<!-- 選項結束 -->

				<!-- 搜尋欄 -->
				<FORM action="<c:url value='/_04_shop/NewproductSearch.do' />"
						method="POST">
				<div class="search">
					<nav class="navbar navbar-light justify-content-center">
						<div class="container-fluid_1">
							<div class="d-flex">
								<input class="form-control me-2" type="search" name="Name"
									placeholder="輸入遊戲名稱或相關商品關鍵字" aria-label="Search"
									style="width: 500px; margin-bottom: 1%;">
								<button class="btn btn-outline-success" type="submit">
									<i class="fas fa-search"></i>
								</button>
							</div>
						</div>
					</nav>
				</div>
				</FORM>
				<!-- 搜尋結束 -->


				<!-- 商品陳列框 -->

				<div class="products">
					<div class="tab-content" id="myTabContent">

						<!-- 第一個頁籤開始 -->

						<div class="tab-pane fade show active" id="hot" role="tabpanel"
							aria-labelledby="hot-tab">
							<!-- 商品排列-->
							<div class="contanier">
								<div class="row">

									<c:forEach varStatus="stVar" var="entry"
										items="${NewproductSearch}">
										<div class="col-md-3" style="margin-bottom: 2%;">
											<div class="card" style="width: 100%;">
												<a
													href="<c:url value='/_04_shop/Newproduct?id=${entry.value.id}' />">
													<img
													src="<c:url value='/_00_init/getGameImage?id=${entry.value.id}' />"
													class="card-img-top" alt="...">
												</a>
												<div class="card-body" style="text-align: left;">
													<p class="card-text"
														style="display: flex; justify-content: center;">
														<span><img width="16%" style="float: left;"
															src="<c:url value='/_00_init/getLevelImage?id=${entry.value.id}' />"><img
															width="25%" style="float: right;"
															src="<c:url value='/_00_init/getCnImage?id=${entry.value.id}' />"></span>
													</p>
												</div>

											</div>

										</div>
									</c:forEach>


								</div>
								<!-- row end -->
							</div>
							<!--  contanier end -->

						</div>
						<!--第一個頁籤結束 -->
					</div>
				</div>
			</div>
		</div>

		<!-- 頁尾 -->
		<jsp:include page="/fragment/footer.jsp" />
	</div>

</body>

</html>