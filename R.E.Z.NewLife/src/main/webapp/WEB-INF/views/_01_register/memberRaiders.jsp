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
<link rel="stylesheet" href="<c:url value='/css/personari.css' />">
<link rel="stylesheet" href="<c:url value='/css/person.css.map' />">
<link rel="stylesheet" href="<c:url value='/css/main.css' />">
<link rel="stylesheet" href="<c:url value='/css/text.css' />">
<link rel="shortcut icon" href="<c:url value='/images/R.E.Z.Logo/favicon.ico' />" rel="external nofollow" type="image/x-icon" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<title>R.E.Z.新生－遊戲第二人生</title>
</head>

<style>
input, textarea {
	caret-color: auto; /* 預設 */
	caret-color: transparent; /* 透明 */
	caret-color: #FF1744; /* 指定色 */
	outline: none; /* 外框效果 */
}
</style>

<body background="<c:url value='/images/bg/repeated-square.png' />">

	<div id="id_wrapper">
		<jsp:include page="/fragment/top.jsp" />
		<div id="id_content">
			<div>
				<jsp:include page="/fragment/top2.jsp" />
				<!-- 會員資料 -->
				<div class="container_1">

					<div class="member_content"
						style="text-align: center; align-items: center; grid-template-rows: repeat(13, minmax(0px, auto)); row-gap: 10px;">
						<div class="_2w2H6X"
							style="grid-row: 1/2; grid-column: 1/5; text-align: start;">
							<h3 class="_3iiDCN">
								我的攻略
								<button class="btn buttoncss" type="button"
									style="float: right;" data-bs-toggle="collapse"
									data-bs-target="#collapseExample1" aria-expanded="false"
									aria-controls="collapseExample">發文列表</button>
							</h3>
						</div>
						<div class="collapse" id="collapseExample1"
							style="grid-row: 2/3; grid-column: 1/5;">
							<div class="card card-body"
								style="background-color: transparent;">
								<table class="table">
									<thead>
										<tr>
											<th scope="col" style="width: 85%; text-align: left;">標題</th>
											<th scope="col" style="text-align: right;">
												<button class="btn buttoncss" type="button"
													data-bs-toggle="collapse" data-bs-target="#collapseExample"
													aria-expanded="false" aria-controls="collapseExample">撰寫文章</button>
											</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td colspan="2">
												<div class="collapse" id="collapseExample">
													<div class="card card-body"
														style="grid-row: 1/2; grid-column: 1/5; background-color: transparent;">
														<form>
															<input type="text" style="width: 90%; float: left;"
																placeholder="文章標題"> <input style="float: right;"
																class="buttoncss" type="submit" value="送出">
															<hr style="margin-top: 47px;">
															<textarea style="width: 100%; height: 300px;"
																placeholder="文章內容"></textarea>
														</form>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td style="text-align: left; vertical-align: middle;">文章標題</td>
											<td style="text-align: right;">
												<button class="btn buttoncss" type="button"
													data-bs-toggle="collapse"
													data-bs-target="#collapseExample6" aria-expanded="false"
													aria-controls="collapseExample">查看</button>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<div class="collapse" id="collapseExample6">
													<div class="card card-body"
														style="background-color: transparent;">
														<form>
															<input type="text" style="width: 80%; float: left;"
																placeholder="文章標題"> <input
																style="float: right; margin-left: 2px;"
																class="buttoncss" type="submit" value="刪除"> <input
																style="float: right;" class="buttoncss" type="submit"
																value="儲存">
															<hr style="margin-top: 47px;">
															<textarea style="width: 100%; height: 300px;"
																placeholder="文章內容"></textarea>
														</form>
													</div>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

						<!-- 						<span>我的攻略</span><span>文章名稱</span><span></span> -->
						<!-- 第一列收藏           -->
						<div class="detail"
							style="grid-row: 3/4; grid-column: 1/2; text-align: start;">
							<span>【討論】PC版冰原，遊戲執行/配備問題，各平台連線問題反應集中串</span>
						</div>
						<div class="detail" style="grid-row: 3/4; grid-column: 2/3;">
							<span><a
								href="<c:url value='/_03_raiders/raidersContent' />"><button
										style="margin-right: 5px;" type="button" class="btn buttoncss">前往文章</button></a>
								<button type="button" class="btn buttoncss">取消收藏</button></span>
						</div>
						<!-- 第二列收藏 -->
						<div class="detail"
							style="grid-row: 4/5; grid-column: 1/2; text-align: start;">
							<span>【討論】PC版冰原，遊戲執行/配備問題，各平台連線問題反應集中串</span>
						</div>
						<div class="detail" style="grid-row: 4/5; grid-column: 2/3;">
							<span><a
								href="<c:url value='/_03_raiders/raidersContent' />"><button
										style="margin-right: 5px;" type="button" class="btn buttoncss">前往文章</button></a>
								<button type="button" class="btn buttoncss">取消收藏</button></span>
						</div>
						<!-- 第三列收藏 -->
						<div class="detail"
							style="grid-row: 5/6; grid-column: 1/2; text-align: start;">
							<span>【討論】PC版冰原，遊戲執行/配備問題，各平台連線問題反應集中串</span>
						</div>
						<div class="detail" style="grid-row: 5/6; grid-column: 2/3;">
							<span><a
								href="<c:url value='/_03_raiders/raidersContent' />"><button
										style="margin-right: 5px;" type="button" class="btn buttoncss">前往文章</button></a>
								<button type="button" class="btn buttoncss">取消收藏</button></span>
						</div>
						<!-- 第四列收藏 -->
						<div class="detail"
							style="grid-row: 6/7; grid-column: 1/2; text-align: start;">
							<span>【討論】PC版冰原，遊戲執行/配備問題，各平台連線問題反應集中串</span>
						</div>
						<div class="detail" style="grid-row: 6/7; grid-column: 2/3;">
							<span><a
								href="<c:url value='/_03_raiders/raidersContent' />"><button
										style="margin-right: 5px;" type="button" class="btn buttoncss">前往文章</button></a>
								<button type="button" class="btn buttoncss">取消收藏</button></span>
						</div>
						<!-- 第五列收藏 -->
						<div class="detail"
							style="grid-row: 7/8; grid-column: 1/2; text-align: start;">
							<span>【討論】PC版冰原，遊戲執行/配備問題，各平台連線問題反應集中串</span>
						</div>
						<div class="detail" style="grid-row: 7/8; grid-column: 2/3;">
							<span><a
								href="<c:url value='/_03_raiders/raidersContent' />"><button
										style="margin-right: 5px;" type="button" class="btn buttoncss">前往文章</button></a>
								<button type="button" class="btn buttoncss">取消收藏</button></span>
						</div>
						<!-- 第六列收藏 -->
						<div class="detail"
							style="grid-row: 8/9; grid-column: 1/2; text-align: start;">
							<span>【討論】PC版冰原，遊戲執行/配備問題，各平台連線問題反應集中串</span>
						</div>
						<div class="detail" style="grid-row: 8/9; grid-column: 2/3;">
							<span><a
								href="<c:url value='/_03_raiders/raidersContent' />"><button
										style="margin-right: 5px;" type="button" class="btn buttoncss">前往文章</button></a>
								<button type="button" class="btn buttoncss">取消收藏</button></span>
						</div>
						<!-- 第七列收藏 -->
						<div class="detail"
							style="grid-row: 9/10; grid-column: 1/2; text-align: start;">
							<span>【討論】PC版冰原，遊戲執行/配備問題，各平台連線問題反應集中串</span>
						</div>
						<div class="detail" style="grid-row: 9/10; grid-column: 2/3;">
							<span><a
								href="<c:url value='/_03_raiders/raidersContent' />"><button
										style="margin-right: 5px;" type="button" class="btn buttoncss">前往文章</button></a>
								<button type="button" class="btn buttoncss">取消收藏</button></span>
						</div>
						<!-- 第八列收藏 -->
						<div class="detail"
							style="grid-row: 10/11; grid-column: 1/2; text-align: start;">
							<span>【討論】PC版冰原，遊戲執行/配備問題，各平台連線問題反應集中串</span>
						</div>
						<div class="detail" style="grid-row: 10/11; grid-column: 2/3;">
							<span><a
								href="<c:url value='/_03_raiders/raidersContent' />"><button
										style="margin-right: 5px;" type="button" class="btn buttoncss">前往文章</button></a>
								<button type="button" class="btn buttoncss">取消收藏</button></span>
						</div>
						<!-- 第九列收藏 -->
						<div class="detail"
							style="grid-row: 11/12; grid-column: 1/2; text-align: start;">
							<span>【討論】PC版冰原，遊戲執行/配備問題，各平台連線問題反應集中串</span>
						</div>
						<div class="detail" style="grid-row: 11/12; grid-column: 2/3;">
							<span><a
								href="<c:url value='/_03_raiders/raidersContent' />"><button
										style="margin-right: 5px;" type="button" class="btn buttoncss">前往文章</button></a>
								<button type="button" class="btn buttoncss">取消收藏</button></span>
						</div>
						<!-- 第十列收藏 -->
						<div class="detail"
							style="grid-row: 12/13; grid-column: 1/2; text-align: start;">
							<span>【討論】PC版冰原，遊戲執行/配備問題，各平台連線問題反應集中串</span>
						</div>
						<div class="detail" style="grid-row: 12/13; grid-column: 2/3;">
							<span><a
								href="<c:url value='/_03_raiders/raidersContent' />"><button
										style="margin-right: 5px;" type="button" class="btn buttoncss">前往文章</button></a>
								<button type="button" class="btn buttoncss">取消收藏</button></span>
						</div>
						<!-- 第十列收藏 -->
						<div class="detail"
							style="grid-row: 13/14; grid-column: 1/2; text-align: start;">
							<span>【討論】PC版冰原，遊戲執行/配備問題，各平台連線問題反應集中串</span>
						</div>
						<div class="detail" style="grid-row: 13/14; grid-column: 2/3;">
							<span><a
								href="<c:url value='/_03_raiders/raidersContent' />"><button
										style="margin-right: 5px;" type="button" class="btn buttoncss">前往文章</button></a>
								<button type="button" class="btn buttoncss">取消收藏</button></span>
						</div>


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