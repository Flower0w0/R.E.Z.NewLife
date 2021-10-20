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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script>
<meta charset="UTF-8">

<div class="sideMenu">
	<nav>
		<a href="<c:url value='/_01_register/Account' />"><i
			class="fas fa-sitemap"></i>我的帳號</a> <a
			href="<c:url value='/_01_register/memberBuy' />"><i
			class="fas fa-trophy"></i>新生收購</a> <a
			href="<c:url value='/_01_register/memberChange' />"><i
			class="fas fa-trophy"></i>交換心願</a> <a
			href="<c:url value='/_01_register/memberLove' />"><i
			class="fas fa-user-graduate"></i> 我的收藏</a> <a
			href="<c:url value='/_01_register/memberMail' />"><i
			class="fas fa-book-reader"></i> 我的信件</a> <a
			href="<c:url value='/_06_orderProcess/orderList' />"><i
			class="fas fa-chalkboard"></i>我的訂單</a> <a
			href="<c:url value='/_01_register/memberRaiders' />"><i
			class="fas fa-trophy"></i>我的攻略</a>
	</nav>
</div>