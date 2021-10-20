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
<link rel="shortcut icon" href="<c:url value='/images/R.E.Z.Logo/favicon.ico' />" rel="external nofollow" type="image/x-icon" />

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script>
<title>R.E.Z.新生－遊戲第二人生</title>
</head>

<style>
.article {
	display: grid;
	grid-template-columns: 20% 15% 45% 10% 10%;
	grid-template-rows: 1fr;
	z-index: 9999;
}

.article_1 {
	grid-column: 2/3;
	grid-column: 3/4;
	border: 1px dashed #fff;
	/* height: 100%; */
	z-index: 999;
	margin-bottom: 2%;
}

.blob {
	grid-row: 1/2;
	grid-column: 2/3;
}

.article_1 h2 {
	margin-top: 2%;
	margin-left: 4%;
	margin-right: 4%;
	z-index: 999;
	color: #FFF;
}

.article_1 p {
	margin-left: 4%;
	margin-right: 4%;
	z-index: 999;
	color: #FFF;
}

.talk {
	display: grid;
	grid-template-columns: 1fr 1fr 50% 1fr 1fr;
	grid-template-rows: 20% 80%;
}

.b-tags {
	list-style: none;
	margin: 1% 0 0 -3%;
	grid-column: 3/4;
	grid-row: 1/2;
}

.b-tags_items a {
	display: block;
	padding: 8px 4px;
	border-radius: 3px;
	background: #FFF;
	font-size: 13px;
	line-height: 1.2;
	text-align: center;
	-webkit-box-shadow: 0 1px 3px 0 rgb(0 0 0/ 15%);
	box-shadow: 0 1px 3px 0 rgb(0 0 0/ 15%);
	width: 100%;
	border: 1px solid #8895B3;
	color: royalblue;
	text-decoration: none;
	margin-top: 5%;
}

.b-tags_items a:hover {
	background-color: #8895B3;
	transform: 0.5;
}

.b-tags_items {
	/* float: left; */
	display: inline-block;
	/* padding: 2px 3px; */
	/* width: 9.09%; */
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

body {
	background-attachment: fixed;
	background-position: center;
	/* background-position:20%20%; */
	/* 透明度 0.6 的黑色半透明遮罩 */
	/*background-color: rgba(0, 0, 0, 0.3);*/
	/* 設置背景混和模式為相乘模式 */
	background-blend-mode: multiply;
	/* background-image: url(/images/162169802718880_P7481939.jpg); */
	z-index: -10;
}
</style>

<body background="<c:url value='/images/bg/repeated-square.png' />"
	style="background-color: rgba(0, 0, 0, 0.3);">
	<div id="id_wrapper">
		<jsp:include page="/fragment/top.jsp" />
		<div id="id_content">
			<div>
				<jsp:include page="/fragment/top2.jsp" />

				<!-- 內容 -->
				<div class="article" style="margin-top: 1rem;">
					<div class="blob" style="text-align: center;">
						<!-- 上下頁按鈕 -->

						<img src="<c:url value='/images/R.E.Z.Logo/Logo3.png' />"
							class="img-thumbnail" alt="..." style="width: 80%;">
						<p style="color: #fff;">
							<i class="fas fa-crown"></i>R.E.Z.新生
						</p>
					</div>
					<div class="article_1">
						<h2>許願池使用需知</h2>
						<hr style="color: #fff;">
						<p>目前許願池</p>
						<p>是R.E.Z唯一開放給會員進行交換的區域</p>
						<p>但是有一點需跟各位特別提出聲明</p>
						<p>任何在本區內進行的交換行為都是會員自己的問題</p>
						<p>所以交換上的細節請各位務必要多加留意跟小心確認</p>
						<p>R.E.Z不會負任何的法律責任或交易衍生的問題協助</p>
						<p>嚴禁利用本區進行色情援交的行為</p>
						<p>或刻意宣傳其他的營利網站及論壇</p>
						<p>違者將被禁權處分</p>
						<p>如果不同意以上的聲明</p>
						<p>請勿在本區內進行任何交換行為</p>
						<div class="b-tags" style="text-align: right; margin: 10px;">
							<a href="<c:url value='/_03_raiders/raiders' />"><button
									class="btn buttoncss" style="margin-right: 5px;">回上一頁</button></a>
							<%-- 							<a href="<c:url value='' />"><button class="btn buttoncss">收藏文章</button></a> --%>
						</div>
						<div
							style="width: 100%; height: 40px; background: url(<c:url value='/images/others/smallf.png' />);">
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