<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
  <link rel="stylesheet" href="<c:url value='/css/main.css' />">
  <link rel="stylesheet" href="<c:url value='/css/index.css' />">
<%--   <link rel="icon" href="<c:url value='/images/R.E.Z.Logo/favicon.ico' />" type="image/x-icon"> --%>
<%--   <link rel="bookmark" href="<c:url value='/images/R.E.Z.Logo/favicon.ico' />" type="image/x-icon"> --%>
  <link rel="shortcut icon" href="<c:url value='/images/R.E.Z.Logo/favicon.ico' />" rel="external nofollow" type="image/x-icon" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script>
<meta charset="UTF-8">

  <div id="id_header">
			<!-- //選單功能 -->
			<div class="container-fluid" style="box-shadow: none;">
				<div class="row" style="height: 78px;">
					<div class="d-grid gap-2 col-md-4 " id="1"
						style="align-items: center;">
						<a href="<c:url value='/' />">
							<button class="btn btn-primary btn-lg"
								style="padding: 0; background-color: #00439c; box-shadow: none;"
								data-bs-toggle="collapse" role="button">
								<img height="40px"
									src="<c:url value='/images/R.E.Z.Logo/logoW3.png' />">
							</button>
						</a>
					</div>
					<div class="d-grid gap-2 col-md-2 " id="2">
						<button class="btn btn-primary btn-lg"
							style="background-color: #00439c; color: #fff; box-shadow: none;"
							type="button">
							<i class="fas fa-shopping-cart" style="font-size: 1.5rem;">購物專區</i>
						</button>
					</div>
					<div class="d-grid gap-2 col-md-2 " id="3">
						<button class="btn btn-primary btn-lg"
							style="background-color: #00439c; color: #fff; box-shadow: none;"
							type="button">
							<i class="fas fa-ghost" style="font-size: 1.5rem;">租借專區</i>
						</button>
					</div>
					<div class="d-grid gap-2 col-md-2 " id="4">
						<button class="btn btn-primary btn-lg"
							style="background-color: #00439c; color: #fff; box-shadow: none;"
							type="button">
							<i class="fas fa-gamepad" style="font-size: 1.5rem;">交流專區</i>
						</button>
					</div>
					<div class="d-grid gap-2 col-md-2 " id="5">
						<button class="btn btn-primary btn-lg"
							style="background-color: #00439c; color: #fff; box-shadow: none;"
							type="button">
							<i class="fas fa-user-circle" style="font-size: 1.5rem;" >會員專區</i>
						</button>
					</div>
				</div>
			</div>
		</div>

		<!-- JQuery.toggle-->
		<script>
			$("#2").click(function() {
				$('#multiCollapseExample1').hide(400);
				$('#multiCollapseExample2').toggle(400);
				$('#multiCollapseExample3').hide(400);
				$('#multiCollapseExample4').hide(400);
				$('#multiCollapseExample5').hide(400);
			});

			$("#3").click(function() {
				$('#multiCollapseExample1').hide(400);
				$('#multiCollapseExample2').hide(400);
				$('#multiCollapseExample3').toggle(400);
				$('#multiCollapseExample4').hide(400);
				$('#multiCollapseExample5').hide(400);
			});

			$("#4").click(function() {
				$('#multiCollapseExample1').hide(400);
				$('#multiCollapseExample2').hide(400);
				$('#multiCollapseExample3').hide(400);
				$('#multiCollapseExample4').toggle(400);
				$('#multiCollapseExample5').hide(400);
			});

			$("#5").click(function() {
				$('#multiCollapseExample1').hide(400);
				$('#multiCollapseExample2').hide(400);
				$('#multiCollapseExample3').hide(400);
				$('#multiCollapseExample4').hide(400);
				$('#multiCollapseExample5').toggle(400);
			});

// 			function test() {
// 				$.ajax({
// 					url : '${pageContext.request.contextPath}/_02_login/test',
// 					type : "POST",
// 					data : {
// 						test : "0.0",
//						
//						取該欄位的欄位值
// 						cnfileName : $("$XXX").val(); jquery
//						XXX: document.getElementById("test").value; javascript
// 					},
// 					success : function(response) {
// 						console.log(response);
// if(response != null){
// 	location.href ='${pageContext.request.contextPath}/XXXX';
// }
// 					}
// 				});
// 			}
		</script>

