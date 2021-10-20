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
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item" role="presentation">
							<button class="nav-link active" id="hot-tab" data-bs-toggle="tab"
								data-bs-target="#hot" type="button" role="tab"
								aria-controls="hot" aria-selected="true">精選</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="ps_product-tab" data-bs-toggle="tab"
								data-bs-target="#ps_product" type="button" role="tab"
								aria-controls="ps_product" aria-selected="false">PS遊戲片</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="ns_product-tab" data-bs-toggle="tab"
								data-bs-target="#ns_product" type="button" role="tab"
								aria-controls="ns_product" aria-selected="false">NS遊戲片</button>
						</li>
					</ul>
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
				<FORM action="<c:url value='/_04_shop/OldproductSearch.do' />"
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
										items="${oldproducts_DPP}">
										<div class="col-md-3" style="margin-bottom: 2%;">
											<div class="card" style="width: 100%;">
												<a
													href="<c:url value='/_04_shop/Oldproduct?id=${entry.value.id}' />">
													<img  src="<c:url value='/_00_init/getOldGameImage?id=${entry.value.id}' />"
													class="card-img-top" alt="..."
													style="position: absolute;">
                                                    <img src="<c:url value='/images/others/secondhand.png' />"
                                                    class="card-img-top" style="position: relative;">
												</a>
												<div class="card-body" style="text-align: left;">
													<p class="card-text"
														style="display: flex; justify-content: center;">
														<span><img width="16%" style="float: left;"
															src="<c:url value='/_00_init/getOldLevelImage?id=${entry.value.id}' />"><img
															width="25%" style="float: right;"
															src="<c:url value='/_00_init/getOldCnImage?id=${entry.value.id}' />"></span>
													</p>
												</div>

											</div>

										</div>
									</c:forEach>


								</div>
								<!-- row end -->
							</div>
							<!--  contanier end -->

							<!-- 頁碼 -->
							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center"
									style="margin-top: 10px;">
									<c:if test="${oldpageNo > 1}">
										<li class="page-item"><a class="page-link"
											id="pagenoprev"
											href="<c:url value='/_04_shop/OldProducts?oldpageNo=${oldpageNo-1}' />"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a></li>
									</c:if>
									<li class="page-item"><a class="page-link"
										href="<c:url value='/_04_shop/OldProducts?oldpageNo=1' />">第${oldpageNo}頁
											/ 共${oldtotalPages}頁</a></li>
									<c:if test="${oldpageNo != oldtotalPages}">
										<li class="page-item"><a class="page-link"
											id="pagenonext"
											href="<c:url value='/_04_shop/OldProducts?oldpageNo=${oldpageNo+1}' />"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</c:if>
								</ul>
							</nav>
							<!-- 頁碼結束 -->
						</div>
						<!--第一個頁籤結束 -->

						<!-- 第二個頁籤開始 -->
						<div class="tab-pane fade" id="ps_product" role="tabpanel"
							aria-labelledby="ps_product-tab">
							<div class="contanier">
								<div class="row">

									<c:forEach varStatus="stVar" var="entry"
										items="${oldSonyproducts_DPP}">
										<div class="col-md-3" style="margin-bottom: 2%;">
											<div class="card" style="width: 100%;">
												<a href="<c:url value='/_04_shop/Oldproduct?id=${entry.value.id}' />"> <img
													src="<c:url value='/_00_init/getOldGameImage?id=${entry.value.id}' />"
													class="card-img-top" alt="..."
													style="position: absolute;">
                                                    <img src="<c:url value='/images/others/secondhand.png' />"
                                                    class="card-img-top" style="position: relative;">
												</a>
												<div class="card-body" style="text-align: left;">
													<p class="card-text"
														style="display: flex; justify-content: center;">
														<span><img width="16%" style="float: left;"
															src="<c:url value='/_00_init/getOldLevelImage?id=${entry.value.id}' />"
															alt=""><img width="25%" style="float: right;"
															src="<c:url value='/_00_init/getOldCnImage?id=${entry.value.id}' />"
															alt=""></span>
													</p>
												</div>

											</div>

										</div>
									</c:forEach>


								</div>
								<!-- row end -->
							</div>
							<!--  contanier end -->

							<!-- 頁碼 -->
							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center"
									style="margin-top: 10px;">
									<c:if test="${oldSpageNo > 1}">
										<li class="page-item"><a class="page-link"
											id="spagenoprev"
											href="<c:url value='/_04_shop/OldProducts?oldSpageNo=${oldSpageNo-1}' />"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a></li>
									</c:if>
									<li class="page-item"><a class="page-link"
										href="<c:url value='/_04_shop/OldProducts?oldSpageNo=1' />">第${oldSpageNo}頁
											/ 共${oldStotalPages}頁</a></li>
									<c:if test="${oldSpageNo != oldStotalPages}">
										<li class="page-item"><a class="page-link"
											id="spagenonext"
											href="<c:url value='/_04_shop/OldProducts?oldSpageNo=${oldSpageNo+1}' />"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</c:if>
								</ul>
							</nav>
							<!-- 頁碼結束 -->
						</div>
						<!--第二個頁籤結束-->

						<!-- 第三個頁籤開始 -->
						<div class="tab-pane fade" id="ns_product" role="tabpanel"
							aria-labelledby="ns_product-tab">
							<div class="contanier">
								<div class="row">

									<c:forEach varStatus="stVar" var="entry"
										items="${oldNintendoproducts_DPP}">
										<div class="col-md-3" style="margin-bottom: 2%;">
											<div class="card" style="width: 100%;">
												<a href="<c:url value='/_04_shop/Oldproduct?id=${entry.value.id}' />"> <img
													src="<c:url value='/_00_init/getOldGameImage?id=${entry.value.id}' />"
													class="card-img-top" alt="..."
													style="position: absolute;">
                                                    <img src="<c:url value='/images/others/secondhand.png' />"
                                                    class="card-img-top" style="position: relative;">
												</a>
												<div class="card-body" style="text-align: left;">
													<p class="card-text"
														style="display: flex; justify-content: center;">
														<span><img width="16%" style="float: left;"
															src="<c:url value='/_00_init/getOldLevelImage?id=${entry.value.id}' />"><img
															width="25%" style="float: right;"
															src="<c:url value='/_00_init/getOldCnImage?id=${entry.value.id}' />"></span>
													</p>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
								<!-- row end -->
							</div>
							<!--  contanier end -->

							<!-- 頁碼 -->
							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center"
									style="margin-top: 10px;">
									<c:if test="${oldNpageNo > 1}">
										<li class="page-item"><a class="page-link"
											id="spagenoprev"
											href="<c:url value='/_04_shop/OldProducts?oldNpageNo=${oldNpageNo-1}' />"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a></li>
									</c:if>
									<li class="page-item"><a class="page-link"
										href="<c:url value='/_04_shop/OldProducts?oldNpageNo=1' />">第${oldNpageNo}頁
											/ 共${oldNtotalPages}頁</a></li>
									<c:if test="${oldNpageNo != oldNtotalPages}">
										<li class="page-item"><a class="page-link"
											id="npagenonext"
											href="<c:url value='/_04_shop/OldProducts?oldNpageNo=${oldNpageNo+1}' />"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</c:if>
								</ul>
							</nav>
							<!-- 頁碼結束 -->
						</div>
						<!--第三個頁籤結束-->
					</div>
				</div>
			</div>
		</div>

		<!-- 頁尾 -->
		<jsp:include page="/fragment/footer.jsp" />
	</div>

	<script type="text/javascript">
		var url = window.location.href;

		if (url.indexOf('oldNpage') != -1) {
			$('#hot').removeClass("active");
			$('#hot').removeClass("show");
			$('#hot-tab').removeClass("active");
			$('#ps_product').removeClass("active");
			$('#ps_product').removeClass("show");
			$('#ps_product-tab').removeClass("active");
			$('#ns_product').addClass("active");
			$('#ns_product').addClass("show");
			$('#ns_product-tab').addClass("active");
		}

		

		if (url.indexOf('oldSpage') != -1) {
			$('#hot').removeClass("active");
			$('#hot').removeClass("show");
			$('#hot-tab').removeClass("active");
			$('#ns_product').removeClass("active");
			$('#ns_product').removeClass("show");
			$('#ns_product-tab').removeClass("active");
			$('#ps_product').addClass("active");
			$('#ps_product').addClass("show");
			$('#ps_product-tab').addClass("active");

		}
	</script>

</body>

</html>