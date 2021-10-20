<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0"
	crossorigin="anonymous">
<%-- <link rel="stylesheet" href="<c:url value='/css/main.css' />"> --%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script>
<meta charset="UTF-8">

<div class="col-12" style="text-align: center;">
	<div class="collapse multi-collapse" id="multiCollapseExample2"
		data-parent="row">
		<div class="card card-body"
			style="display: block; background: url(<c:url value='/images/others/flower2.png' />);">
			<div style="display: inline;">
				<span style="margin-right: 3%;"><a
					style="font-size: 1.5rem; font-family: DotGothic16;"
					href="<c:url value='/_04_shop/NewProducts' />">全新遊戲</a></span>
			</div>
			<div style="display: inline;">
				<span><a style="font-size: 1.5rem; font-family: DotGothic16;"
					href="<c:url value='/_04_shop/OldProducts' />">二手遊戲</a></span>
			</div>
		</div>
	</div>
</div>
<div class="col-12" style="text-align: center;">
	<div class="collapse multi-collapse" id="multiCollapseExample3"
		data-parent="row">
		<div class="card card-body"
			style="display: block; background: url(<c:url value='/images/others/flower2.png' />);">
			<span style="margin-right: 3%;"><a href="#"
				style="font-size: 1.5rem; font-family: DotGothic16;">NS遊戲片租借區</a></span><span>
				<a href="#" style="font-size: 1.5rem; font-family: DotGothic16;">PS遊戲片租借區</a>
			</span>
		</div>
	</div>
</div>
<div class="col-12" style="text-align: center;">
	<div class="collapse multi-collapse" id="multiCollapseExample4"
		data-parent="row">
		<div class="card card-body"
			style="display: block; background: url(<c:url value='/images/others/flower2.png' />);">
			<span style="margin-right: 3%;"><a
				href="<c:url value='/_03_raiders/raiders' />"
				style="font-size: 1.5rem; font-family: DotGothic16;">遊戲攻略</a></span><span><a
				href="<c:url value='/_03_raiders/wish' />"
				style="font-size: 1.5rem; font-family: DotGothic16;">許願池</a></span>
		</div>
	</div>
</div>
<div class="col-12" style="text-align: center;">
	<div class="collapse multi-collapse" id="multiCollapseExample5"
		data-parent="row">
		<div class="card card-body"
			style="display: block; background: url(<c:url value='/images/others/flower2.png' />);">
			<c:if test="${empty LoginOK}">
				<span style="margin-right: 3%;"><a
					href="<c:url value='/_01_register/memberRegister' />"
					style="font-size: 1.5rem; font-family: DotGothic16;">會員註冊</a></span>
				<span><a href="<c:url value='/_02_login/memberLogin' />"
					style="font-size: 1.5rem; font-family: DotGothic16;">會員登入</a></span>
			</c:if>
			<c:choose>
				<c:when test="${ ! empty LoginOK }">
					<img height='30px' width='30px'
						style="margin-right: 1%; border-radius: 100%;"
						src="<c:url value='/_00_init/getMemberImage?id=${LoginOK.memberId}' />">
					<span style="margin-right: 3%;"> <a
						href="<c:url value='/_01_register/Account' />"
						style="font-size: 1.5rem; font-family: DotGothic16;"> 我的帳號 </a>
					</span>
					<span style="margin-right: 3%;"> <a
						href="<c:url value='/_01_register/memberBuy' />"
						style="font-size: 1.5rem; font-family: DotGothic16;"> 新生收購 </a>
					</span>
					<span style="margin-right: 3%;"> <a
						href="<c:url value='/_01_register/memberChange' />"
						style="font-size: 1.5rem; font-family: DotGothic16;"> 交換心願 </a>
					</span>
					<span style="margin-right: 3%;"> <a
						href="<c:url value='/_07_love/loveContent' />"
						style="font-size: 1.5rem; font-family: DotGothic16;"> 我的收藏 </a>
					</span>
					<span style="margin-right: 3%;"> <a
						href="<c:url value='/_01_register/memberMail' />"
						style="font-size: 1.5rem; font-family: DotGothic16;"> 我的信件 </a>
					</span>
					<span style="margin-right: 3%;"> <a
						href="<c:url value='/_06_orderProcess/orderList' />"
						style="font-size: 1.5rem; font-family: DotGothic16;"> 我的訂單 </a>
					</span>
					<span style="margin-right: 3%;"> <a
						href="<c:url value='/_01_register/memberRaiders' />"
						style="font-size: 1.5rem; font-family: DotGothic16;"> 我的攻略 </a>
					</span>
					<span> <a href="<c:url value='/_02_login/logout' />"
						style="font-size: 1.5rem; font-family: DotGothic16;"> 登出 </a>
					</span>
				</c:when>
			</c:choose>
		</div>
	</div>
</div>