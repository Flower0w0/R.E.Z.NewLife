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

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script>
<link rel="stylesheet" href="<c:url value='/css/talks.css' />">
<link rel="stylesheet" href="<c:url value='/css/main.css' />">
<link rel="stylesheet" href="<c:url value='/css/product.css' />">
<link rel="shortcut icon" href="<c:url value='/images/R.E.Z.Logo/favicon.ico' />" rel="external nofollow" type="image/x-icon" />
<title>R.E.Z.新生－遊戲第二人生</title>
</head>

<body background="<c:url value='/images/bg/repeated-square.png' />">
	<div id="id_wrapper">
		<jsp:include page="/fragment/top.jsp" />
		<div id="id_content">
			<div>
				<jsp:include page="/fragment/top2.jsp" />

				<!-- 內容 -->
				<div class="talk">

					<div
						style="grid-row: 1/2; grid-column: 3/4; display: grid; grid-template-columns: 35% 65%; grid-template-rows: 1fr; align-items: baseline;">
						<div>
							<a href="<c:url value='/_03_raiders/raiders' />"><button
									class="btn buttoncss" style="margin-right: 5px;">PS遊戲討論區</button></a>
							<a href="<c:url value='' />"><button class="btn buttoncss">NS遊戲討論區</button></a>
						</div>
						<div class="search">
							<nav class="navbar navbar-light" style="justify-content: end;">
								<div class="container-fluid_1">
									<form class="d">
										<input class="form-control me-2" type="search"
											placeholder="輸入遊戲名稱或攻略文章關鍵字" aria-label="Search"
											style="width: 400px; margin-bottom: 1%;">
										<button class="btn btn-outline-success" type="submit">
											<i class="fas fa-search"></i>
										</button>
									</form>
								</div>
							</nav>
						</div>
						<!-- 搜尋欄 -->

						<!-- 搜尋結束 -->
					</div>

					<div class="u2">
						<table class="table table-hover table-bordered">
							<thead>
								<tr>
									<th scope="col" colspan="2">心願列表</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><a href="<c:url value='/_03_raiders/news' />">置頂公告--"許願池使用需知"</a></td>
								</tr>
								<tr>
									<td><a href="<c:url value='/_03_raiders/wishContent' />">魔物獵人換巫師3👀</a></td>
								</tr>
								<tr>
									<td><a href="">【板主公告】禁止面連相關文章發佈。</a></td>
								</tr>
								<tr>
									<td><a href="">【討論】PC版冰原，遊戲執行/配備問題，各平台連線問題反應集中串</a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>


		<!-- 頁尾 -->
		<jsp:include page="/fragment/footer.jsp" />
	</div>

</body>

</html>