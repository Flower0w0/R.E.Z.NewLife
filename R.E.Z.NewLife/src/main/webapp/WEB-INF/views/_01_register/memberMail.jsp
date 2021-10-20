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
<link rel="stylesheet" href="<c:url value='/css/main.css' />">
<link rel="stylesheet" href="<c:url value='/css/personlist.css' />">
<link rel="stylesheet" href="<c:url value='/css/person.css.map' />">
<link rel="stylesheet" href="<c:url value='/css/text.css' />">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="shortcut icon" href="<c:url value='/images/R.E.Z.Logo/favicon.ico' />" rel="external nofollow" type="image/x-icon" />
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

					<div class="member_content">
						<div class="_2w2H6X" style="margin-bottom: 10px;">
							<h3 class="_3iiDCN">
								我的信件
								<button class="btn buttoncss" type="button"
									style="float: right; margin-left: 5px;"
									onclick="mailbox.delMail()">刪除信件</button>
								<button class="btn buttoncss" type="button"
									style="float: right;" data-bs-toggle="collapse"
									data-bs-target="#collapseExample" aria-expanded="false"
									aria-controls="collapseExample">撰寫信件</button>
							</h3>
						</div>
						<div>
							<div style="align-items: center;">
								<div class="collapse" id="collapseExample">
									<div class="card card-body"
										style="background-color: transparent;">
										<form>
											<table class="table">
												<thead>
													<tr>
														<th scope="col" style="width: 15%;">收件者</th>
														<th scope="col" style="width: 25%;">標題</th>
														<th scope="col">內容</th>
														<th scope="col" style="text-align: right;"><input
															class="buttoncss" type="submit" value="寄出"></th>
													</tr>
												</thead>
												<tbody style="vertical-align: middle;">
													<tr>
														<td><input type="text" style="width: 100%;"
															placeholder="ex.R.E.Z.新生"></td>
														<td><input type="text" style="width: 100%;"
															placeholder="ex.一個小秘密"></td>
														<td colspan="2"><textarea style="width: 100%;"
																placeholder="ex.我最喜歡R.E.Z.新生了❤"></textarea></td>
													</tr>
												</tbody>
											</table>
										</form>
									</div>
								</div>
								<p style="float: right;">
									<span>上一頁</span> <span>下一頁</span>
								</p>
							</div>
						</div>
						<table class="table" style="vertical-align: middle;">
							<thead>
								<tr>
									<th scope="col"></th>
									<th scope="col" style="width: 15%;">寄件者</th>
									<th scope="col">標題</th>
									<th scope="col" style="width: 5%;">時間</th>
									<th scope="col" style="width: 10%;"></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" style="width: 1%;"><input type="checkbox"></th>
									<td>R.E.Z.新生</td>
									<td>R.E.Z.新生會員-手機認證</td>
									<td>2021.09.06</td>
									<td style="text-align: right;">
										<button class="btn buttoncss" type="button"
											data-bs-toggle="collapse" data-bs-target="#collapseExample1"
											aria-expanded="false" aria-controls="collapseExample">查看
										</button>
									</td>
								</tr>
								<tr>
									<td colspan="5">
										<div class="collapse" id="collapseExample1">
											<div class="card card-body"
												style="background-color: transparent;">
												<table class="table">
													<tbody style="vertical-align: middle;">
														<tr>
															<td>..................................................................</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row"><input type="checkbox"></th>
									<td>無名666</td>
									<td>666666666666</td>
									<td>2021.09.06</td>
									<td style="text-align: right;">
										<button class="btn buttoncss" type="button"
											data-bs-toggle="collapse" data-bs-target="#collapseExample6"
											aria-expanded="false" aria-controls="collapseExample">查看
										</button>
									</td>
								</tr>
								<tr>
									<td colspan="5">
										<div class="collapse" id="collapseExample6">
											<div class="card card-body"
												style="background-color: transparent;">
												<table class="table">
													<tbody style="vertical-align: middle;">
														<tr>
															<td>..................................................................</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row"><input type="checkbox"></th>
									<td>無名777</td>
									<td>77777777</td>
									<td>2021.09.06</td>
									<td style="text-align: right;">
										<button class="btn buttoncss" type="button"
											data-bs-toggle="collapse" data-bs-target="#collapseExample7"
											aria-expanded="false" aria-controls="collapseExample">查看
										</button>
									</td>
								</tr>
								<tr>
									<td colspan="5">
										<div class="collapse" id="collapseExample7">
											<div class="card card-body"
												style="background-color: transparent;">
												<table class="table">
													<tbody style="vertical-align: middle;">
														<tr>
															<td>..................................................................</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						<!-- 						<input id="" type="checkbox" style="margin-left: 1%;"> -->
						<!-- 						<button class="buttoncss" type="button" -->
						<!-- 							onclick="mailbox.delMail()">刪除勾選的信件</button> -->
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