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
<link rel="shortcut icon"
	href="<c:url value='/images/R.E.Z.Logo/favicon.ico' />"
	rel="external nofollow" type="image/x-icon" />

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

.article_1 p, .article_1 h5 {
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
						<img src="<c:url value='/images/R.E.Z.Logo/Logo3.png' />"
							class="img-thumbnail" alt="..." style="width: 80%;">
						<p style="color: #fff;">
							<i class="fas fa-crown"></i>R.E.Z.新生
						</p>
					</div>
					<div class="article_1">
						<h2>關於R.E.Z.新生</h2>
						<hr style="color: #fff;">
						<p>在舊日時光下，塵封的抽屜裡，</p>
						<p>擺放著一張張青澀的回憶，</p>
						<p>可能有著少女羞澀愛戀的怦然心動；</p>
						<p>可能有著少年未曾訴說的熱血心情。</p>
						<p>忘了有多久不曾重溫心的感動，</p>
						<p>它們伴你走過青春，</p>
						<p>也將陪伴更多人，</p>
						<p>讓感動持續蔓延，</p>
						<p>REZ!請賦予它們新生，</p>
						<p>開啟下一個遊戲第二人生.......</p>
						<br>
						<p>REZ</p>
						<p>是 resurrect 或者 resurrection 的縮寫，</p>
						<p>意為「復活」，</p>
						<p>是一個在遊戲中常用到的字彙。</p>
						<p>我們希望每片被遺忘在舊日時光，</p>
						<p>或被塵封在抽屜的遊戲片，</p>
						<p>都可以因我們而復活，</p>
						<p>重獲新生!</p>
						<br>
						<p>在R.E.Z.新生，</p>
						<p>你可以</p>
						<h5>
							<i class="far fa-hand-point-right"></i> 回收用不到的遊戲片!
						</h5>
						<h5>
							<i class="far fa-hand-point-right"></i> 實惠價格購買正版全新或二手遊戲片!
						</h5>
						<h5>
							<i class="far fa-hand-point-right"></i> 寄送取得短期租借遊戲片!
						</h5>
						<h5>
							<i class="far fa-hand-point-right"></i> 許願池交換遊戲片!
						</h5>
						<h5>
							<i class="far fa-hand-point-right"></i> 分享最愛遊戲攻略!
						</h5>
						<p>快加入會員，享受更多服務吧!</p>
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