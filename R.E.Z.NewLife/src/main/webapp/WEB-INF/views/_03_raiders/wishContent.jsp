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
<link rel="stylesheet" href="<c:url value='/css/main.css' />">
<link rel="stylesheet" href="<c:url value='/css/article.css' />">
<link rel="shortcut icon" href="<c:url value='/images/R.E.Z.Logo/favicon.ico' />" rel="external nofollow" type="image/x-icon" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script>
<title>R.E.Z.新生－遊戲第二人生</title>
</head>

<body background="<c:url value='/images/PSbg/PSbg14.jpg' />"
	style="background-color: rgba(0, 0, 0, 0.6);">
	<div id="id_wrapper">
		<jsp:include page="/fragment/top.jsp" />
		<div id="id_content">
			<div>
				<jsp:include page="/fragment/top2.jsp" />

				<!-- 內容 -->
				<div class="article" style="margin-top: 1rem;">
					<div class="blob" style="text-align: center;">

						<img src="<c:url value='/images/PSbg/PSbg8.png' />"
							class="img-thumbnail" alt="..." style="width: 80%;">
						<p style="color: #fff;">
							<i class="fas fa-crown"></i>神人玩家
						</p>
					</div>
					<div class="article_1">


						<h2>魔物獵人換巫師3👀</h2>
						<hr style="color: #fff;">
						<div class="blob" style="text-align: center; margin-bottom: 10px;">
							<img src="<c:url value='/images/others/cd1.jpg' />"
								class="img-thumbnail" alt="..." style="width: 32%;"> <img
								src="<c:url value='/images/others/cd2.jpg' />"
								class="img-thumbnail" alt="..." style="width: 32%;"> <img
								src="<c:url value='/images/others/cd3.jpg' />"
								class="img-thumbnail" alt="..." style="width: 32%;">
						</div>
						<p style="text-align: center;">如題 超新魔物獵人想換巫師3 意者請站內信 謝謝😆</p>
						<div class="b-tags" style="text-align: right; margin: 10px;">
							<a href="<c:url value='/_03_raiders/wish' />"><button
									class="btn buttoncss" style="margin-right: 5px;">回上一頁</button></a>
							<a href="<c:url value='/_01_register/memberMail' />"><button
									class="btn buttoncss" style="margin-right: 5px;">我要交換</button></a>
							<button class="btn buttoncss">追蹤心願</button>
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