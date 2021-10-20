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
<link rel="stylesheet" href="<c:url value='/css/main.css' />">
<link rel="stylesheet" href="<c:url value='/css/index.css' />">
<link rel="shortcut icon" href="#" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="shortcut icon"
	href="<c:url value='/images/R.E.Z.Logo/favicon.ico' />"
	rel="external nofollow" type="image/x-icon" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script>
<title>R.E.Z.新生－遊戲第二人生</title>
</head>



<body background="<c:url value='/images/bg/repeated-square.png' />">
	<div id="id_wrapper">
		<jsp:include page="/fragment/top.jsp" />
		<div id="id_content">
			<div>
				<jsp:include page="/fragment/top2.jsp" />
				<!-- 第一個輪播功能 -->
				<div id="carouselExampleIndicators_1" class="carousel slide"
					data-bs-ride="carousel" style="margin-top: 2px;">
					<div class="carousel-indicators" id="indicators_1">
						<button type="button"
							data-bs-target="#carouselExampleIndicators_1"
							data-bs-slide-to="0" class="active" aria-current="true"
							aria-label="Slide 1"></button>
						<button type="button"
							data-bs-target="#carouselExampleIndicators_1"
							data-bs-slide-to="1" aria-label="Slide 2"></button>
						<button type="button"
							data-bs-target="#carouselExampleIndicators_1"
							data-bs-slide-to="2" aria-label="Slide 3"></button>
					</div>
					<div class="carousel-inner">
						<div class="carousel-item active" data-bs-interval="3000">
							<img src="<c:url value='/images/Carousel/Carousel1.jpg' />"
								class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item" data-bs-interval="3000">
							<img src="<c:url value='/images/Carousel/Carousel2.jpg' />"
								class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item" data-bs-interval="3000">
							<img src="<c:url value='/images/Carousel/Carousel3.jpg' />"
								class="d-block w-100" alt="...">
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleIndicators_1" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"
							style="background-image: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pg0KPCEtLSBHZW5lcmF0b3I6IEFkb2JlIElsbHVzdHJhdG9yIDE5LjAuMCwgU1ZHIEV4cG9ydCBQbHVnLUluIC4gU1ZHIFZlcnNpb246IDYuMDAgQnVpbGQgMCkgIC0tPg0KPHN2ZyB2ZXJzaW9uPSIxLjEiIGlkPSJDYXBhXzEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4Ig0KCSB2aWV3Qm94PSIwIDAgMzI3LjY4MiAzMjcuNjgyIiBzdHlsZT0iZW5hYmxlLWJhY2tncm91bmQ6bmV3IDAgMCAzMjcuNjgyIDMyNy42ODI7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxwYXRoIHN0eWxlPSJmaWxsOiNGRkU2MDA7IiBkPSJNMTI1LjYwNywyMzkuODc2YzUuNDY2LDUuMjU3LDUuNDY2LDEzLjc2NiwwLDE5LjAxNGMtNS40NjYsNS4yNS0xNC4zMzEsNS4yNS0xOS43OTYsMEw2LjgyNywxNjMuODQxDQoJbDk4Ljk4My05NS4wNDljNS40NjYtNS4yNSwxNC4zMjktNS4yNSwxOS43OTYsMGM1LjQ2Niw1LjI1LDUuNDY2LDEzLjc1NywwLDE5LjAwN0w0Ni40MiwxNjMuODQxTDEyNS42MDcsMjM5Ljg3NnoiLz4NCjxwYXRoIHN0eWxlPSJmaWxsOiM2MDJGNzU7IiBkPSJNMTE1LjcwNywyNjkuNjI1Yy01LjI5OSwwLTEwLjU5My0xLjkzNy0xNC42MjYtNS44MTFMMi4wOTksMTY4Ljc2NA0KCUMwLjc1OSwxNjcuNDc4LDAsMTY1LjY5OSwwLDE2My44NDFjMC0xLjg1OSwwLjc1OS0zLjYzNywyLjA5OS00LjkyNGw5OC45ODctOTUuMDQ5YzguMDU0LTcuNzQ3LDIxLjE4LTcuNzQ4LDI5LjI0Ny0wLjAwMg0KCWM0LDMuODQsNi4yLDguOTY1LDYuMiwxNC40M3MtMi4yLDEwLjU4OC02LjIsMTQuNDI2bC03NC4wNTksNzEuMTE4bDc0LjA2MSw3MS4xMWMwLDAuMDAyLDAuMDA3LDAuMDAzLDAuMDA3LDAuMDA1DQoJYzMuOTk0LDMuODQyLDYuMTkzLDguOTcsNi4xOTMsMTQuNDM3YzAsNS40NjMtMi4yLDEwLjU4NS02LjIsMTQuNDIxQzEyNi4zLDI2Ny42ODgsMTIxLjAwNiwyNjkuNjI1LDExNS43MDcsMjY5LjYyNXoNCgkgTTE2LjY3OSwxNjMuODQxbDkzLjg2LDkwLjEyN2MyLjgwNywyLjY5NSw3LjU0NywyLjY4NiwxMC4zNDEtMC4wMDJjMS4yODctMS4yMzksMi0yLjg2NSwyLTQuNTc5YzAtMS43MTctMC43MTMtMy4zNDctMi4wMDctNC41OTENCglsLTc5LjE3OS03Ni4wM2MtMS4zNC0xLjI4OS0yLjA5OS0zLjA2Ny0yLjA5OS00LjkyNWMwLTEuODU5LDAuNzU5LTMuNjM3LDIuMDk5LTQuOTI0bDc5LjE4Ni03Ni4wNDRjMS4yODctMS4yNDEsMi0yLjg2NSwyLTQuNTc5DQoJYzAtMS43MTUtMC43MTMtMy4zNDItMi00LjU4MmMtMi44MDctMi42ODUtNy41NC0yLjY5Ny0xMC4zMzQtMC4wMDJMMTYuNjc5LDE2My44NDF6Ii8+DQo8Zz4NCgk8cGF0aCBzdHlsZT0iZmlsbDojRUEzNDU3OyIgZD0iTTIyMS4xNzksMjM5Ljg3NmM1LjQ2Niw1LjI1Nyw1LjQ2NiwxMy43NjYsMCwxOS4wMTRjLTUuNDY2LDUuMjUtMTQuMzI5LDUuMjUtMTkuNzk2LDANCgkJTDEwMi40LDE2My44NDFsOTguOTgzLTk1LjA0OWM1LjQ2Ni01LjI1LDE0LjMyOS01LjI1LDE5Ljc5NiwwYzUuNDY2LDUuMjUsNS40NjYsMTMuNzU3LDAsMTkuMDA3bC03OS4xODYsNzYuMDQyTDIyMS4xNzksMjM5Ljg3NnoiDQoJCS8+DQoJPHBhdGggc3R5bGU9ImZpbGw6I0VBMzQ1NzsiIGQ9Ik0yMTEuMjgsMjY5LjYyM2MtNS4yOTksMC0xMC41OTMtMS45MzUtMTQuNjI2LTUuODA2bC05OC45OC05NS4wNTENCgkJYy0xLjM0LTEuMjg3LTIuMDk5LTMuMDY1LTIuMDk5LTQuOTI0YzAtMS44NTksMC43NTktMy42MzcsMi4wOTktNC45MjRsOTguOTgtOTUuMDQ5YzguMDY3LTcuNzQ3LDIxLjE4Ny03Ljc0NSwyOS4yNTQtMC4wMDINCgkJYzQsMy44NCw2LjIsOC45NjUsNi4yLDE0LjQzcy0yLjIsMTAuNTg4LTYuMiwxNC40MjZsLTc0LjA2MSw3MS4xMTdsNzQuMDYxLDcxLjExYzAsMC4wMDIsMC4wMDcsMC4wMDMsMC4wMDcsMC4wMDUNCgkJYzMuOTk0LDMuODQyLDYuMTkzLDguOTcsNi4xOTMsMTQuNDM3YzAsNS40NjMtMi4yLDEwLjU4NS02LjIsMTQuNDIxQzIyMS44NzMsMjY3LjY4OCwyMTYuNTc5LDI2OS42MjMsMjExLjI4LDI2OS42MjN6DQoJCSBNMTEyLjI1MywxNjMuODQxbDkzLjg1Myw5MC4xMjdjMi44MDEsMi42OSw3LjU0NywyLjY5MSwxMC4zNDYtMC4wMDJjMS4yODctMS4yMzksMi0yLjg2NSwyLTQuNTc5DQoJCWMwLTEuNzE3LTAuNzEzLTMuMzQ3LTIuMDA3LTQuNTkxbC03OS4xODEtNzYuMDNjLTEuMzQtMS4yODktMi4wOTktMy4wNjctMi4wOTktNC45MjVzMC43NTktMy42MzcsMi4wOTktNC45MjRsNzkuMTg2LTc2LjA0NA0KCQljMS4yODctMS4yNDEsMi0yLjg2NSwyLTQuNTc5YzAtMS43MTUtMC43MTMtMy4zNDItMi00LjU4MmMtMi44MDEtMi42OS03LjU0Ny0yLjY5MS0xMC4zNDYsMC4wMDJMMTEyLjI1MywxNjMuODQxeiIvPg0KPC9nPg0KPHBhdGggc3R5bGU9ImZpbGw6IzAwRTdGRjsiIGQ9Ik0zMTYuNzUyLDIzOS44NzZjNS40NjYsNS4yNTcsNS40NjYsMTMuNzY2LDAsMTkuMDE0Yy01LjQ2Niw1LjI1LTE0LjMyOSw1LjI1LTE5Ljc5NiwwDQoJbC05OC45ODMtOTUuMDQ5bDk4Ljk4My05NS4wNDljNS40NjYtNS4yNSwxNC4zMzEtNS4yNSwxOS43OTYsMGM1LjQ2Niw1LjI1LDUuNDY2LDEzLjc1NywwLDE5LjAwN2wtNzkuMTg2LDc2LjA0MkwzMTYuNzUyLDIzOS44NzZ6Ig0KCS8+DQo8cGF0aCBzdHlsZT0iZmlsbDojNjAyRjc1OyIgZD0iTTMwNi44NTQsMjY5LjYyMmMtNS4yOTQsMC0xMC41OTMtMS45MzUtMTQuNjI2LTUuODAzbC05OC45OC05NS4wNTMNCgljLTEuMzQtMS4yODctMi4wOTktMy4wNjUtMi4wOTktNC45MjRjMC0xLjg1OSwwLjc1OS0zLjYzNywyLjA5OS00LjkyNGw5OC45OC05NS4wNDljOC4wNjEtNy43MzUsMjEuMTkzLTcuNzQzLDI5LjI1NC0wLjAwMg0KCWM0LDMuODQsNi4yLDguOTY1LDYuMiwxNC40M3MtMi4yLDEwLjU4OC02LjIsMTQuNDI2bC03NC4wNjEsNzEuMTE3bDc0LjA2MSw3MS4xMWMwLDAuMDAyLDAuMDA3LDAuMDAzLDAuMDA3LDAuMDA1DQoJYzMuOTk0LDMuODQyLDYuMTkzLDguOTcsNi4xOTMsMTQuNDM3YzAsNS40NjMtMi4yLDEwLjU4NS02LjIsMTQuNDIxQzMxNy40NTQsMjY3LjY4NCwzMTIuMTUzLDI2OS42MjIsMzA2Ljg1NCwyNjkuNjIyeg0KCSBNMjA3LjgyNiwxNjMuODQxbDkzLjg1Myw5MC4xMjdjMi44NTQsMi43MzQsNy40OTQsMi43MzYsMTAuMzQ2LTAuMDAyYzEuMjg3LTEuMjM5LDItMi44NjUsMi00LjU3OQ0KCWMwLTEuNzE3LTAuNzEzLTMuMzQ3LTIuMDA3LTQuNTkxbC03OS4xODEtNzYuMDNjLTEuMzQtMS4yODktMi4wOTktMy4wNjctMi4wOTktNC45MjVzMC43NTktMy42MzcsMi4wOTktNC45MjRsNzkuMTg2LTc2LjA0NA0KCWMxLjI4Ny0xLjI0MSwyLTIuODY1LDItNC41NzljMC0xLjcxNS0wLjcxMy0zLjM0Mi0yLTQuNTgyYy0yLjg1NC0yLjczNC03LjQ5NC0yLjczNC0xMC4zNDYsMC4wMDNMMjA3LjgyNiwxNjMuODQxeiIvPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPC9zdmc+DQo=);"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleIndicators_1" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"
							style="background-image: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pg0KPCEtLSBHZW5lcmF0b3I6IEFkb2JlIElsbHVzdHJhdG9yIDE5LjAuMCwgU1ZHIEV4cG9ydCBQbHVnLUluIC4gU1ZHIFZlcnNpb246IDYuMDAgQnVpbGQgMCkgIC0tPg0KPHN2ZyB2ZXJzaW9uPSIxLjEiIGlkPSJDYXBhXzEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4Ig0KCSB2aWV3Qm94PSIwIDAgMzM0LjUwNSAzMzQuNTA1IiBzdHlsZT0iZW5hYmxlLWJhY2tncm91bmQ6bmV3IDAgMCAzMzQuNTA1IDMzNC41MDU7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxwYXRoIHN0eWxlPSJmaWxsOiNGRkU2MDA7IiBkPSJNMjA4Ljg5OSw5MS4yMWMtNS40NjYtNS4yNS01LjQ2Ni0xMy43NTcsMC0xOS4wMDdjNS40NjYtNS4yNSwxNC4zMzEtNS4yNSwxOS43OTYsMGw5OC45ODUsOTUuMDQ5DQoJbC05OC45ODMsOTUuMDQ5Yy01LjQ2Niw1LjI1LTE0LjMyOSw1LjI1LTE5Ljc5NiwwYy01LjQ2Ni01LjI1LTUuNDY2LTEzLjc1NywwLTE5LjAxNGw3OS4xODYtNzYuMDM1TDIwOC44OTksOTEuMjF6Ii8+DQo8cGF0aCBzdHlsZT0iZmlsbDojNjAyRjc1OyIgZD0iTTIxOC44LDI3My4wMzZjLTUuMjk0LDAuMDAyLTEwLjU5My0xLjkzNS0xNC42MjYtNS44MDhjLTQtMy44MzgtNi4yLTguOTYtNi4yLTE0LjQyMw0KCWMwLTUuNDY2LDIuMi0xMC41OTUsNi4xOTMtMTQuNDM3bDc0LjA2Ni03MS4xMTdsLTc0LjA2MS03MS4xMnYwLjAwMmMtNC0zLjgzOC02LjItOC45NjItNi4yLTE0LjQyNnMyLjItMTAuNTksNi4yLTE0LjQyOA0KCWM4LjA2Ny03Ljc0NywyMS4xODctNy43NDgsMjkuMjU0LDAuMDAybDk4Ljk4LDk1LjA0OGMxLjM0LDEuMjg3LDIuMDk5LDMuMDY1LDIuMDk5LDQuOTI0cy0wLjc1OSwzLjYzNy0yLjA5OSw0LjkyNGwtOTguOTg3LDk1LjA0OQ0KCUMyMjkuMzkzLDI3MS4wOTksMjI0LjA5NCwyNzMuMDM2LDIxOC44LDI3My4wMzZ6IE0yMTguOCw3NS4xMDdjLTEuODg2LDAtMy43NzMsMC42NzQtNS4xNzMsMi4wMjFjLTEuMjg3LDEuMjM5LTIsMi44NjYtMiw0LjU4MQ0KCWMwLDEuNzEzLDAuNzEzLDMuMzM4LDIsNC41Nzd2MC4wMDJsNzkuMTg2LDc2LjA0NGMxLjM0LDEuMjg3LDIuMDk5LDMuMDY1LDIuMDk5LDQuOTI0YzAsMS44NTktMC43NTksMy42MzctMi4wOTksNC45MjUNCglsLTc5LjE4Niw3Ni4wMzRjLTEuMjg3LDEuMjQyLTIsMi44NzItMiw0LjU4OGMwLDEuNzEzLDAuNzEzLDMuMzQsMiw0LjU4MWMyLjgwNywyLjY4NSw3LjU0LDIuNjk3LDEwLjMzNCwwLjAwMmw5My44NjctOTAuMTI5DQoJbC05My44NjItOTAuMTI5QzIyMi41NjYsNzUuNzgsMjIwLjY4MSw3NS4xMDcsMjE4LjgsNzUuMTA3eiIvPg0KPGc+DQoJPHBhdGggc3R5bGU9ImZpbGw6I0VBMzQ1NzsiIGQ9Ik0xMDYuNTAxLDkxLjIxYy01LjQ2Ni01LjI1LTUuNDY2LTEzLjc1NywwLTE5LjAwN2M1LjQ2Ni01LjI1LDE0LjMyOS01LjI1LDE5Ljc5NiwwbDk4Ljk4Myw5NS4wNDkNCgkJbC05OC45ODMsOTUuMDQ5Yy01LjQ2Niw1LjI1LTE0LjMyOSw1LjI1LTE5Ljc5NiwwYy01LjQ2Ni01LjI1LTUuNDY2LTEzLjc1NywwLTE5LjAxNGw3OS4xODYtNzYuMDM1TDEwNi41MDEsOTEuMjF6Ii8+DQoJPHBhdGggc3R5bGU9ImZpbGw6I0VBMzQ1NzsiIGQ9Ik0xMTYuNCwyNzMuMDM1Yy01LjI5OSwwLTEwLjU5My0xLjkzNS0xNC42MjYtNS44MDZjLTQtMy44MzgtNi4yLTguOTYtNi4yLTE0LjQyMw0KCQljMC01LjQ2NiwyLjItMTAuNTk1LDYuMTkzLTE0LjQzN2w3NC4wNjYtNzEuMTE3bC03NC4wNjEtNzEuMTJ2MC4wMDJjLTQtMy44MzgtNi4yLTguOTYyLTYuMi0xNC40MjZzMi4yLTEwLjU5LDYuMi0xNC40MjgNCgkJYzguMDY3LTcuNzQ3LDIxLjE4Ny03Ljc0NSwyOS4yNTQtMC4wMDJsOTguOTgsOTUuMDUxYzEuMzQsMS4yODcsMi4wOTksMy4wNjUsMi4wOTksNC45MjRzLTAuNzU5LDMuNjM3LTIuMDk5LDQuOTI0bC05OC45OCw5NS4wNDkNCgkJQzEyNi45OTMsMjcxLjA5OSwxMjEuNzAxLDI3My4wMzUsMTE2LjQsMjczLjAzNXogTTExNi40LDc1LjEwN2MtMS44ODYsMC0zLjc3MywwLjY3NC01LjE3MywyLjAyMWMtMS4yODcsMS4yMzktMiwyLjg2Ni0yLDQuNTgxDQoJCWMwLDEuNzEzLDAuNzEzLDMuMzM4LDIsNC41Nzd2MC4wMDJsNzkuMTg2LDc2LjA0NGMxLjM0LDEuMjg3LDIuMDk5LDMuMDY1LDIuMDk5LDQuOTI0YzAsMS44NTktMC43NTksMy42MzctMi4wOTksNC45MjUNCgkJbC03OS4xODYsNzYuMDM0Yy0xLjI4NywxLjI0Mi0yLDIuODcyLTIsNC41ODhjMCwxLjcxMywwLjcxMywzLjM0LDIsNC41ODFjMi44MDEsMi42OSw3LjU0NywyLjY5MSwxMC4zNDYtMC4wMDJsOTMuODU1LTkwLjEyOQ0KCQlsLTkzLjg1My05MC4xMjdDMTIwLjE3Myw3NS43OCwxMTguMjg3LDc1LjEwNywxMTYuNCw3NS4xMDd6Ii8+DQo8L2c+DQo8cGF0aCBzdHlsZT0iZmlsbDojMDBFN0ZGOyIgZD0iTTEwLjkyOCw5MS4yMWMtNS40NjYtNS4yNS01LjQ2Ni0xMy43NTcsMC0xOS4wMDdjNS40NjYtNS4yNSwxNC4zMjktNS4yNSwxOS43OTYsMGw5OC45ODMsOTUuMDQ5DQoJbC05OC45ODMsOTUuMDQ5Yy01LjQ2Niw1LjI1LTE0LjMzMSw1LjI1LTE5Ljc5NiwwYy01LjQ2Ni01LjI1LTUuNDY2LTEzLjc1NywwLTE5LjAxNGw3OS4xODYtNzYuMDM1TDEwLjkyOCw5MS4yMXoiLz4NCjxwYXRoIHN0eWxlPSJmaWxsOiM2MDJGNzU7IiBkPSJNMjAuODIsMjczLjAzMWMtNS4yOTQsMC4wMDItMTAuNTkzLTEuOTM0LTE0LjYxOS01LjgwM2MtNC0zLjgzOC02LjItOC45Ni02LjItMTQuNDIzDQoJYzAtNS40NjYsMi4yLTEwLjU5NSw2LjE5My0xNC40MzdsNzQuMDY2LTcxLjExN0w2LjE5OSw5Ni4xMzJ2MC4wMDJDMi4yLDkyLjI5NSwwLDg3LjE3MiwwLDgxLjcwN3MyLjItMTAuNTksNi4yLTE0LjQyOA0KCWM4LjA1NC03LjczNSwyMS4xODctNy43NDEsMjkuMjU0LTAuMDAzbDk4Ljk4LDk1LjA1M2MxLjM0LDEuMjg3LDIuMDk5LDMuMDY1LDIuMDk5LDQuOTI0cy0wLjc1OSwzLjYzNy0yLjA5OSw0LjkyNGwtOTguOTgsOTUuMDQ5DQoJQzMxLjQyLDI3MS4wOTYsMjYuMTIxLDI3My4wMzEsMjAuODIsMjczLjAzMXogTTIwLjgyNiw3NS4wNzVjLTEuODc0LDAtMy43NDYsMC42ODMtNS4xNzMsMi4wNTFjLTEuMjg3LDEuMjM5LTIsMi44NjUtMiw0LjU4MQ0KCWMwLDEuNzEzLDAuNzEzLDMuMzM4LDIsNC41Nzd2MC4wMDJsNzkuMTg2LDc2LjA0NGMxLjM0LDEuMjg3LDIuMDk5LDMuMDY1LDIuMDk5LDQuOTI0YzAsMS44NTktMC43NTksMy42MzctMi4wOTksNC45MjUNCglsLTc5LjE4Niw3Ni4wMzRjLTEuMjg3LDEuMjQyLTIsMi44NzItMiw0LjU4OGMwLDEuNzEzLDAuNzEzLDMuMzQsMiw0LjU4MWMyLjg1NCwyLjczNCw3LjQ5NCwyLjczNCwxMC4zNDYtMC4wMDNsOTMuODU1LTkwLjEyNg0KCUwyNS45OTksNzcuMTI2QzI0LjU3Myw3NS43NTksMjIuNyw3NS4wNzUsMjAuODI2LDc1LjA3NXoiLz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjwvc3ZnPg0K);"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>

				<!-- 中間廣告圖 -->
				<div class="advertise" style="text-align: center;">
					<div>
						<img style="width: 61.7%;"
							src="<c:url value='/images/publicity/long/3.jpg' />"
							class="img-fluid">
					</div>
					<div>
						<img style="display: inline-block; width: 30%;"
							src="<c:url value='/images/publicity/long/nsmad.png' />"
							class="img-fluid"> <img
							style="display: inline-block; width: 30%;"
							src="<c:url value='/images/publicity/long/6.jpg' />"
							class="img-fluid">
					</div>
				</div>

				<!--第二個輪播圖-->
				<div class="carousel_2" style="margin: 1% 0 5% 0;">
					<h2 style="text-align: center;">Nintendo</h2>
					<h4
						style="color: #737373; font-size: 12px; text-align: center; margin-bottom: 2%;">PICK
						UP</h4>
					<div id="carouselExampleIndicators" class="carousel slide"
						data-bs-ride="carousel" style="margin-top: 2px;">
						<div class="carousel-indicators">
							<button type="button" data-bs-target="#carouselExampleIndicators"
								data-bs-slide-to="0" class="active" aria-current="true"
								aria-label="Slide 1"></button>
							<button type="button" data-bs-target="#carouselExampleIndicators"
								data-bs-slide-to="1" aria-label="Slide 2"></button>
							<button type="button" data-bs-target="#carouselExampleIndicators"
								data-bs-slide-to="2" aria-label="Slide 3"></button>
						</div>
						<div class="carousel-inner">
							<div class="carousel-item active" data-bs-interval="3000"
								style="text-align: center;">
								<c:forEach var="entry" items="${Nintendoproduct}" begin="0"
									end="4">
									<div class="card" style="width: 12.5%; display: inline-block;">
										<a
											href="<c:url value='/_04_shop/Newproduct?id=${entry.id}' />">
											<img
											src="<c:url value='/_00_init/getGameImage?id=${entry.id}' />"
											class="card-img-top" alt="...">
										</a>
										<div class="card-body" style="text-align: left;">
											<p class="card-text"
												style="display: flex; justify-content: center;">
												<span><img width="16%" style="float: left;"
													src="<c:url value='/_00_init/getLevelImage?id=${entry.id}' />"
													alt=""><img width="25%" style="float: right;"
													src="<c:url value='/_00_init/getCnImage?id=${entry.id}' />"
													alt=""></span>
											</p>
										</div>
									</div>
								</c:forEach>
							</div>
							<!-- 第二個投影片                 -->

							<div class="carousel-item" data-bs-interval="3000"
								style="text-align: center;">
								<c:forEach var="entry" items="${Nintendoproduct}" begin="5"
									end="9">
									<div class="card" style="width: 12.5%; display: inline-block;">
										<a
											href="<c:url value='/_04_shop/Newproduct?id=${entry.id}' />">
											<img
											src="<c:url value='/_00_init/getGameImage?id=${entry.id}' />"
											class="card-img-top" alt="...">
										</a>
										<div class="card-body" style="text-align: left;">
											<p class="card-text"
												style="display: flex; justify-content: center;">
												<span><img width="16%" style="float: left;"
													src="<c:url value='/_00_init/getLevelImage?id=${entry.id}' />"
													alt=""><img width="25%" style="float: right;"
													src="<c:url value='/_00_init/getCnImage?id=${entry.id}' />"
													alt=""></span>
											</p>
										</div>
									</div>
								</c:forEach>
							</div>

							<!-- 第三個投影片 -->
							<div class="carousel-item" data-bs-interval="3000"
								style="text-align: center;">
								<c:forEach var="entry" items="${Nintendoproduct}" begin="10"
									end="14">
									<div class="card" style="width: 12.5%; display: inline-block;">
										<a
											href="<c:url value='/_04_shop/Newproduct?id=${entry.id}' />">
											<img
											src="<c:url value='/_00_init/getGameImage?id=${entry.id}' />"
											class="card-img-top" alt="...">
										</a>
										<div class="card-body" style="text-align: left;">
											<p class="card-text"
												style="display: flex; justify-content: center;">
												<span><img width="16%" style="float: left;"
													src="<c:url value='/_00_init/getLevelImage?id=${entry.id}' />"
													alt=""><img width="25%" style="float: right;"
													src="<c:url value='/_00_init/getCnImage?id=${entry.id}' />"
													alt=""></span>
											</p>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
						<button class="carousel-control-prev" type="button"
							data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"
								style="background-image: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pg0KPCEtLSBHZW5lcmF0b3I6IEFkb2JlIElsbHVzdHJhdG9yIDE5LjAuMCwgU1ZHIEV4cG9ydCBQbHVnLUluIC4gU1ZHIFZlcnNpb246IDYuMDAgQnVpbGQgMCkgIC0tPg0KPHN2ZyB2ZXJzaW9uPSIxLjEiIGlkPSJDYXBhXzEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4Ig0KCSB2aWV3Qm94PSIwIDAgMzI3LjY4MiAzMjcuNjgyIiBzdHlsZT0iZW5hYmxlLWJhY2tncm91bmQ6bmV3IDAgMCAzMjcuNjgyIDMyNy42ODI7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxwYXRoIHN0eWxlPSJmaWxsOiNGRkU2MDA7IiBkPSJNMTI1LjYwNywyMzkuODc2YzUuNDY2LDUuMjU3LDUuNDY2LDEzLjc2NiwwLDE5LjAxNGMtNS40NjYsNS4yNS0xNC4zMzEsNS4yNS0xOS43OTYsMEw2LjgyNywxNjMuODQxDQoJbDk4Ljk4My05NS4wNDljNS40NjYtNS4yNSwxNC4zMjktNS4yNSwxOS43OTYsMGM1LjQ2Niw1LjI1LDUuNDY2LDEzLjc1NywwLDE5LjAwN0w0Ni40MiwxNjMuODQxTDEyNS42MDcsMjM5Ljg3NnoiLz4NCjxwYXRoIHN0eWxlPSJmaWxsOiM2MDJGNzU7IiBkPSJNMTE1LjcwNywyNjkuNjI1Yy01LjI5OSwwLTEwLjU5My0xLjkzNy0xNC42MjYtNS44MTFMMi4wOTksMTY4Ljc2NA0KCUMwLjc1OSwxNjcuNDc4LDAsMTY1LjY5OSwwLDE2My44NDFjMC0xLjg1OSwwLjc1OS0zLjYzNywyLjA5OS00LjkyNGw5OC45ODctOTUuMDQ5YzguMDU0LTcuNzQ3LDIxLjE4LTcuNzQ4LDI5LjI0Ny0wLjAwMg0KCWM0LDMuODQsNi4yLDguOTY1LDYuMiwxNC40M3MtMi4yLDEwLjU4OC02LjIsMTQuNDI2bC03NC4wNTksNzEuMTE4bDc0LjA2MSw3MS4xMWMwLDAuMDAyLDAuMDA3LDAuMDAzLDAuMDA3LDAuMDA1DQoJYzMuOTk0LDMuODQyLDYuMTkzLDguOTcsNi4xOTMsMTQuNDM3YzAsNS40NjMtMi4yLDEwLjU4NS02LjIsMTQuNDIxQzEyNi4zLDI2Ny42ODgsMTIxLjAwNiwyNjkuNjI1LDExNS43MDcsMjY5LjYyNXoNCgkgTTE2LjY3OSwxNjMuODQxbDkzLjg2LDkwLjEyN2MyLjgwNywyLjY5NSw3LjU0NywyLjY4NiwxMC4zNDEtMC4wMDJjMS4yODctMS4yMzksMi0yLjg2NSwyLTQuNTc5YzAtMS43MTctMC43MTMtMy4zNDctMi4wMDctNC41OTENCglsLTc5LjE3OS03Ni4wM2MtMS4zNC0xLjI4OS0yLjA5OS0zLjA2Ny0yLjA5OS00LjkyNWMwLTEuODU5LDAuNzU5LTMuNjM3LDIuMDk5LTQuOTI0bDc5LjE4Ni03Ni4wNDRjMS4yODctMS4yNDEsMi0yLjg2NSwyLTQuNTc5DQoJYzAtMS43MTUtMC43MTMtMy4zNDItMi00LjU4MmMtMi44MDctMi42ODUtNy41NC0yLjY5Ny0xMC4zMzQtMC4wMDJMMTYuNjc5LDE2My44NDF6Ii8+DQo8Zz4NCgk8cGF0aCBzdHlsZT0iZmlsbDojRUEzNDU3OyIgZD0iTTIyMS4xNzksMjM5Ljg3NmM1LjQ2Niw1LjI1Nyw1LjQ2NiwxMy43NjYsMCwxOS4wMTRjLTUuNDY2LDUuMjUtMTQuMzI5LDUuMjUtMTkuNzk2LDANCgkJTDEwMi40LDE2My44NDFsOTguOTgzLTk1LjA0OWM1LjQ2Ni01LjI1LDE0LjMyOS01LjI1LDE5Ljc5NiwwYzUuNDY2LDUuMjUsNS40NjYsMTMuNzU3LDAsMTkuMDA3bC03OS4xODYsNzYuMDQyTDIyMS4xNzksMjM5Ljg3NnoiDQoJCS8+DQoJPHBhdGggc3R5bGU9ImZpbGw6I0VBMzQ1NzsiIGQ9Ik0yMTEuMjgsMjY5LjYyM2MtNS4yOTksMC0xMC41OTMtMS45MzUtMTQuNjI2LTUuODA2bC05OC45OC05NS4wNTENCgkJYy0xLjM0LTEuMjg3LTIuMDk5LTMuMDY1LTIuMDk5LTQuOTI0YzAtMS44NTksMC43NTktMy42MzcsMi4wOTktNC45MjRsOTguOTgtOTUuMDQ5YzguMDY3LTcuNzQ3LDIxLjE4Ny03Ljc0NSwyOS4yNTQtMC4wMDINCgkJYzQsMy44NCw2LjIsOC45NjUsNi4yLDE0LjQzcy0yLjIsMTAuNTg4LTYuMiwxNC40MjZsLTc0LjA2MSw3MS4xMTdsNzQuMDYxLDcxLjExYzAsMC4wMDIsMC4wMDcsMC4wMDMsMC4wMDcsMC4wMDUNCgkJYzMuOTk0LDMuODQyLDYuMTkzLDguOTcsNi4xOTMsMTQuNDM3YzAsNS40NjMtMi4yLDEwLjU4NS02LjIsMTQuNDIxQzIyMS44NzMsMjY3LjY4OCwyMTYuNTc5LDI2OS42MjMsMjExLjI4LDI2OS42MjN6DQoJCSBNMTEyLjI1MywxNjMuODQxbDkzLjg1Myw5MC4xMjdjMi44MDEsMi42OSw3LjU0NywyLjY5MSwxMC4zNDYtMC4wMDJjMS4yODctMS4yMzksMi0yLjg2NSwyLTQuNTc5DQoJCWMwLTEuNzE3LTAuNzEzLTMuMzQ3LTIuMDA3LTQuNTkxbC03OS4xODEtNzYuMDNjLTEuMzQtMS4yODktMi4wOTktMy4wNjctMi4wOTktNC45MjVzMC43NTktMy42MzcsMi4wOTktNC45MjRsNzkuMTg2LTc2LjA0NA0KCQljMS4yODctMS4yNDEsMi0yLjg2NSwyLTQuNTc5YzAtMS43MTUtMC43MTMtMy4zNDItMi00LjU4MmMtMi44MDEtMi42OS03LjU0Ny0yLjY5MS0xMC4zNDYsMC4wMDJMMTEyLjI1MywxNjMuODQxeiIvPg0KPC9nPg0KPHBhdGggc3R5bGU9ImZpbGw6IzAwRTdGRjsiIGQ9Ik0zMTYuNzUyLDIzOS44NzZjNS40NjYsNS4yNTcsNS40NjYsMTMuNzY2LDAsMTkuMDE0Yy01LjQ2Niw1LjI1LTE0LjMyOSw1LjI1LTE5Ljc5NiwwDQoJbC05OC45ODMtOTUuMDQ5bDk4Ljk4My05NS4wNDljNS40NjYtNS4yNSwxNC4zMzEtNS4yNSwxOS43OTYsMGM1LjQ2Niw1LjI1LDUuNDY2LDEzLjc1NywwLDE5LjAwN2wtNzkuMTg2LDc2LjA0MkwzMTYuNzUyLDIzOS44NzZ6Ig0KCS8+DQo8cGF0aCBzdHlsZT0iZmlsbDojNjAyRjc1OyIgZD0iTTMwNi44NTQsMjY5LjYyMmMtNS4yOTQsMC0xMC41OTMtMS45MzUtMTQuNjI2LTUuODAzbC05OC45OC05NS4wNTMNCgljLTEuMzQtMS4yODctMi4wOTktMy4wNjUtMi4wOTktNC45MjRjMC0xLjg1OSwwLjc1OS0zLjYzNywyLjA5OS00LjkyNGw5OC45OC05NS4wNDljOC4wNjEtNy43MzUsMjEuMTkzLTcuNzQzLDI5LjI1NC0wLjAwMg0KCWM0LDMuODQsNi4yLDguOTY1LDYuMiwxNC40M3MtMi4yLDEwLjU4OC02LjIsMTQuNDI2bC03NC4wNjEsNzEuMTE3bDc0LjA2MSw3MS4xMWMwLDAuMDAyLDAuMDA3LDAuMDAzLDAuMDA3LDAuMDA1DQoJYzMuOTk0LDMuODQyLDYuMTkzLDguOTcsNi4xOTMsMTQuNDM3YzAsNS40NjMtMi4yLDEwLjU4NS02LjIsMTQuNDIxQzMxNy40NTQsMjY3LjY4NCwzMTIuMTUzLDI2OS42MjIsMzA2Ljg1NCwyNjkuNjIyeg0KCSBNMjA3LjgyNiwxNjMuODQxbDkzLjg1Myw5MC4xMjdjMi44NTQsMi43MzQsNy40OTQsMi43MzYsMTAuMzQ2LTAuMDAyYzEuMjg3LTEuMjM5LDItMi44NjUsMi00LjU3OQ0KCWMwLTEuNzE3LTAuNzEzLTMuMzQ3LTIuMDA3LTQuNTkxbC03OS4xODEtNzYuMDNjLTEuMzQtMS4yODktMi4wOTktMy4wNjctMi4wOTktNC45MjVzMC43NTktMy42MzcsMi4wOTktNC45MjRsNzkuMTg2LTc2LjA0NA0KCWMxLjI4Ny0xLjI0MSwyLTIuODY1LDItNC41NzljMC0xLjcxNS0wLjcxMy0zLjM0Mi0yLTQuNTgyYy0yLjg1NC0yLjczNC03LjQ5NC0yLjczNC0xMC4zNDYsMC4wMDNMMjA3LjgyNiwxNjMuODQxeiIvPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPC9zdmc+DQo=);"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button"
							data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"
								style="background-image: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pg0KPCEtLSBHZW5lcmF0b3I6IEFkb2JlIElsbHVzdHJhdG9yIDE5LjAuMCwgU1ZHIEV4cG9ydCBQbHVnLUluIC4gU1ZHIFZlcnNpb246IDYuMDAgQnVpbGQgMCkgIC0tPg0KPHN2ZyB2ZXJzaW9uPSIxLjEiIGlkPSJDYXBhXzEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4Ig0KCSB2aWV3Qm94PSIwIDAgMzM0LjUwNSAzMzQuNTA1IiBzdHlsZT0iZW5hYmxlLWJhY2tncm91bmQ6bmV3IDAgMCAzMzQuNTA1IDMzNC41MDU7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxwYXRoIHN0eWxlPSJmaWxsOiNGRkU2MDA7IiBkPSJNMjA4Ljg5OSw5MS4yMWMtNS40NjYtNS4yNS01LjQ2Ni0xMy43NTcsMC0xOS4wMDdjNS40NjYtNS4yNSwxNC4zMzEtNS4yNSwxOS43OTYsMGw5OC45ODUsOTUuMDQ5DQoJbC05OC45ODMsOTUuMDQ5Yy01LjQ2Niw1LjI1LTE0LjMyOSw1LjI1LTE5Ljc5NiwwYy01LjQ2Ni01LjI1LTUuNDY2LTEzLjc1NywwLTE5LjAxNGw3OS4xODYtNzYuMDM1TDIwOC44OTksOTEuMjF6Ii8+DQo8cGF0aCBzdHlsZT0iZmlsbDojNjAyRjc1OyIgZD0iTTIxOC44LDI3My4wMzZjLTUuMjk0LDAuMDAyLTEwLjU5My0xLjkzNS0xNC42MjYtNS44MDhjLTQtMy44MzgtNi4yLTguOTYtNi4yLTE0LjQyMw0KCWMwLTUuNDY2LDIuMi0xMC41OTUsNi4xOTMtMTQuNDM3bDc0LjA2Ni03MS4xMTdsLTc0LjA2MS03MS4xMnYwLjAwMmMtNC0zLjgzOC02LjItOC45NjItNi4yLTE0LjQyNnMyLjItMTAuNTksNi4yLTE0LjQyOA0KCWM4LjA2Ny03Ljc0NywyMS4xODctNy43NDgsMjkuMjU0LDAuMDAybDk4Ljk4LDk1LjA0OGMxLjM0LDEuMjg3LDIuMDk5LDMuMDY1LDIuMDk5LDQuOTI0cy0wLjc1OSwzLjYzNy0yLjA5OSw0LjkyNGwtOTguOTg3LDk1LjA0OQ0KCUMyMjkuMzkzLDI3MS4wOTksMjI0LjA5NCwyNzMuMDM2LDIxOC44LDI3My4wMzZ6IE0yMTguOCw3NS4xMDdjLTEuODg2LDAtMy43NzMsMC42NzQtNS4xNzMsMi4wMjFjLTEuMjg3LDEuMjM5LTIsMi44NjYtMiw0LjU4MQ0KCWMwLDEuNzEzLDAuNzEzLDMuMzM4LDIsNC41Nzd2MC4wMDJsNzkuMTg2LDc2LjA0NGMxLjM0LDEuMjg3LDIuMDk5LDMuMDY1LDIuMDk5LDQuOTI0YzAsMS44NTktMC43NTksMy42MzctMi4wOTksNC45MjUNCglsLTc5LjE4Niw3Ni4wMzRjLTEuMjg3LDEuMjQyLTIsMi44NzItMiw0LjU4OGMwLDEuNzEzLDAuNzEzLDMuMzQsMiw0LjU4MWMyLjgwNywyLjY4NSw3LjU0LDIuNjk3LDEwLjMzNCwwLjAwMmw5My44NjctOTAuMTI5DQoJbC05My44NjItOTAuMTI5QzIyMi41NjYsNzUuNzgsMjIwLjY4MSw3NS4xMDcsMjE4LjgsNzUuMTA3eiIvPg0KPGc+DQoJPHBhdGggc3R5bGU9ImZpbGw6I0VBMzQ1NzsiIGQ9Ik0xMDYuNTAxLDkxLjIxYy01LjQ2Ni01LjI1LTUuNDY2LTEzLjc1NywwLTE5LjAwN2M1LjQ2Ni01LjI1LDE0LjMyOS01LjI1LDE5Ljc5NiwwbDk4Ljk4Myw5NS4wNDkNCgkJbC05OC45ODMsOTUuMDQ5Yy01LjQ2Niw1LjI1LTE0LjMyOSw1LjI1LTE5Ljc5NiwwYy01LjQ2Ni01LjI1LTUuNDY2LTEzLjc1NywwLTE5LjAxNGw3OS4xODYtNzYuMDM1TDEwNi41MDEsOTEuMjF6Ii8+DQoJPHBhdGggc3R5bGU9ImZpbGw6I0VBMzQ1NzsiIGQ9Ik0xMTYuNCwyNzMuMDM1Yy01LjI5OSwwLTEwLjU5My0xLjkzNS0xNC42MjYtNS44MDZjLTQtMy44MzgtNi4yLTguOTYtNi4yLTE0LjQyMw0KCQljMC01LjQ2NiwyLjItMTAuNTk1LDYuMTkzLTE0LjQzN2w3NC4wNjYtNzEuMTE3bC03NC4wNjEtNzEuMTJ2MC4wMDJjLTQtMy44MzgtNi4yLTguOTYyLTYuMi0xNC40MjZzMi4yLTEwLjU5LDYuMi0xNC40MjgNCgkJYzguMDY3LTcuNzQ3LDIxLjE4Ny03Ljc0NSwyOS4yNTQtMC4wMDJsOTguOTgsOTUuMDUxYzEuMzQsMS4yODcsMi4wOTksMy4wNjUsMi4wOTksNC45MjRzLTAuNzU5LDMuNjM3LTIuMDk5LDQuOTI0bC05OC45OCw5NS4wNDkNCgkJQzEyNi45OTMsMjcxLjA5OSwxMjEuNzAxLDI3My4wMzUsMTE2LjQsMjczLjAzNXogTTExNi40LDc1LjEwN2MtMS44ODYsMC0zLjc3MywwLjY3NC01LjE3MywyLjAyMWMtMS4yODcsMS4yMzktMiwyLjg2Ni0yLDQuNTgxDQoJCWMwLDEuNzEzLDAuNzEzLDMuMzM4LDIsNC41Nzd2MC4wMDJsNzkuMTg2LDc2LjA0NGMxLjM0LDEuMjg3LDIuMDk5LDMuMDY1LDIuMDk5LDQuOTI0YzAsMS44NTktMC43NTksMy42MzctMi4wOTksNC45MjUNCgkJbC03OS4xODYsNzYuMDM0Yy0xLjI4NywxLjI0Mi0yLDIuODcyLTIsNC41ODhjMCwxLjcxMywwLjcxMywzLjM0LDIsNC41ODFjMi44MDEsMi42OSw3LjU0NywyLjY5MSwxMC4zNDYtMC4wMDJsOTMuODU1LTkwLjEyOQ0KCQlsLTkzLjg1My05MC4xMjdDMTIwLjE3Myw3NS43OCwxMTguMjg3LDc1LjEwNywxMTYuNCw3NS4xMDd6Ii8+DQo8L2c+DQo8cGF0aCBzdHlsZT0iZmlsbDojMDBFN0ZGOyIgZD0iTTEwLjkyOCw5MS4yMWMtNS40NjYtNS4yNS01LjQ2Ni0xMy43NTcsMC0xOS4wMDdjNS40NjYtNS4yNSwxNC4zMjktNS4yNSwxOS43OTYsMGw5OC45ODMsOTUuMDQ5DQoJbC05OC45ODMsOTUuMDQ5Yy01LjQ2Niw1LjI1LTE0LjMzMSw1LjI1LTE5Ljc5NiwwYy01LjQ2Ni01LjI1LTUuNDY2LTEzLjc1NywwLTE5LjAxNGw3OS4xODYtNzYuMDM1TDEwLjkyOCw5MS4yMXoiLz4NCjxwYXRoIHN0eWxlPSJmaWxsOiM2MDJGNzU7IiBkPSJNMjAuODIsMjczLjAzMWMtNS4yOTQsMC4wMDItMTAuNTkzLTEuOTM0LTE0LjYxOS01LjgwM2MtNC0zLjgzOC02LjItOC45Ni02LjItMTQuNDIzDQoJYzAtNS40NjYsMi4yLTEwLjU5NSw2LjE5My0xNC40MzdsNzQuMDY2LTcxLjExN0w2LjE5OSw5Ni4xMzJ2MC4wMDJDMi4yLDkyLjI5NSwwLDg3LjE3MiwwLDgxLjcwN3MyLjItMTAuNTksNi4yLTE0LjQyOA0KCWM4LjA1NC03LjczNSwyMS4xODctNy43NDEsMjkuMjU0LTAuMDAzbDk4Ljk4LDk1LjA1M2MxLjM0LDEuMjg3LDIuMDk5LDMuMDY1LDIuMDk5LDQuOTI0cy0wLjc1OSwzLjYzNy0yLjA5OSw0LjkyNGwtOTguOTgsOTUuMDQ5DQoJQzMxLjQyLDI3MS4wOTYsMjYuMTIxLDI3My4wMzEsMjAuODIsMjczLjAzMXogTTIwLjgyNiw3NS4wNzVjLTEuODc0LDAtMy43NDYsMC42ODMtNS4xNzMsMi4wNTFjLTEuMjg3LDEuMjM5LTIsMi44NjUtMiw0LjU4MQ0KCWMwLDEuNzEzLDAuNzEzLDMuMzM4LDIsNC41Nzd2MC4wMDJsNzkuMTg2LDc2LjA0NGMxLjM0LDEuMjg3LDIuMDk5LDMuMDY1LDIuMDk5LDQuOTI0YzAsMS44NTktMC43NTksMy42MzctMi4wOTksNC45MjUNCglsLTc5LjE4Niw3Ni4wMzRjLTEuMjg3LDEuMjQyLTIsMi44NzItMiw0LjU4OGMwLDEuNzEzLDAuNzEzLDMuMzQsMiw0LjU4MWMyLjg1NCwyLjczNCw3LjQ5NCwyLjczNCwxMC4zNDYtMC4wMDNsOTMuODU1LTkwLjEyNg0KCUwyNS45OTksNzcuMTI2QzI0LjU3Myw3NS43NTksMjIuNyw3NS4wNzUsMjAuODI2LDc1LjA3NXoiLz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjwvc3ZnPg0K);"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>
				</div>

				<!--第三個輪播圖-->
				<div class="carousel_2" style="margin: 1% 0 5% 0;">
					<h2 style="text-align: center;">PlayStation</h2>
					<h4
						style="color: #737373; font-size: 12px; text-align: center; margin-bottom: 2%;">PICK
						UP</h4>
					<div id="carouselExampleIndicators_2" class="carousel slide"
						data-bs-ride="carousel" style="margin-top: 2px;">
						<div class="carousel-indicators">
							<button type="button"
								data-bs-target="#carouselExampleIndicators_2"
								data-bs-slide-to="0" class="active" aria-current="true"
								aria-label="Slide 1"></button>
							<button type="button"
								data-bs-target="#carouselExampleIndicators_2"
								data-bs-slide-to="1" aria-label="Slide 2"></button>
							<button type="button"
								data-bs-target="#carouselExampleIndicators_2"
								data-bs-slide-to="2" aria-label="Slide 3"></button>
						</div>
						<div class="carousel-inner">
							<div class="carousel-item active" data-bs-interval="3000"
								style="text-align: center;">
								<c:forEach var="entry" items="${Sonyproduct}" begin="0" end="4">
									<div class="card" style="width: 12.5%; display: inline-block;">
										<a
											href="<c:url value='/_04_shop/Newproduct?id=${entry.id}' />">
											<img
											src="<c:url value='/_00_init/getGameImage?id=${entry.id}' />"
											class="card-img-top" alt="...">
										</a>
										<div class="card-body" style="text-align: left;">
											<p class="card-text"
												style="display: flex; justify-content: center;">
												<span><img width="16%" style="float: left;"
													src="<c:url value='/_00_init/getLevelImage?id=${entry.id}' />"
													alt=""><img width="25%" style="float: right;"
													src="<c:url value='/_00_init/getCnImage?id=${entry.id}' />"
													alt=""></span>
											</p>
										</div>
									</div>
								</c:forEach>
							</div>
							<!-- 第二個投影片                 -->
							<div class="carousel-item" data-bs-interval="3000"
								style="text-align: center;">
								<c:forEach var="entry" items="${Sonyproduct}" begin="5" end="9">
									<div class="card" style="width: 12.5%; display: inline-block;">
										<a
											href="<c:url value='/_04_shop/Newproduct?id=${entry.id}' />">
											<img
											src="<c:url value='/_00_init/getGameImage?id=${entry.id}' />"
											class="card-img-top" alt="...">
										</a>
										<div class="card-body" style="text-align: left;">
											<p class="card-text"
												style="display: flex; justify-content: center;">
												<span><img width="16%" style="float: left;"
													src="<c:url value='/_00_init/getLevelImage?id=${entry.id}' />"
													alt=""><img width="25%" style="float: right;"
													src="<c:url value='/_00_init/getCnImage?id=${entry.id}' />"
													alt=""></span>
											</p>
										</div>
									</div>
								</c:forEach>
							</div>

							<!-- 第三個投影片 -->
							<div class="carousel-item" data-bs-interval="3000"
								style="text-align: center;">
								<c:forEach var="entry" items="${Sonyproduct}" begin="10"
									end="14">
									<div class="card" style="width: 12.5%; display: inline-block;">
										<a
											href="<c:url value='/_04_shop/Newproduct?id=${entry.id}' />">
											<img
											src="<c:url value='/_00_init/getGameImage?id=${entry.id}' />"
											class="card-img-top" alt="...">
										</a>
										<div class="card-body" style="text-align: left;">
											<p class="card-text"
												style="display: flex; justify-content: center;">
												<span><img width="16%" style="float: left;"
													src="<c:url value='/_00_init/getLevelImage?id=${entry.id}' />"
													alt=""><img width="25%" style="float: right;"
													src="<c:url value='/_00_init/getCnImage?id=${entry.id}' />"
													alt=""></span>
											</p>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
						<button class="carousel-control-prev" type="button"
							data-bs-target="#carouselExampleIndicators_2"
							data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"
								style="background-image: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pg0KPCEtLSBHZW5lcmF0b3I6IEFkb2JlIElsbHVzdHJhdG9yIDE5LjAuMCwgU1ZHIEV4cG9ydCBQbHVnLUluIC4gU1ZHIFZlcnNpb246IDYuMDAgQnVpbGQgMCkgIC0tPg0KPHN2ZyB2ZXJzaW9uPSIxLjEiIGlkPSJDYXBhXzEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4Ig0KCSB2aWV3Qm94PSIwIDAgMzI3LjY4MiAzMjcuNjgyIiBzdHlsZT0iZW5hYmxlLWJhY2tncm91bmQ6bmV3IDAgMCAzMjcuNjgyIDMyNy42ODI7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxwYXRoIHN0eWxlPSJmaWxsOiNGRkU2MDA7IiBkPSJNMTI1LjYwNywyMzkuODc2YzUuNDY2LDUuMjU3LDUuNDY2LDEzLjc2NiwwLDE5LjAxNGMtNS40NjYsNS4yNS0xNC4zMzEsNS4yNS0xOS43OTYsMEw2LjgyNywxNjMuODQxDQoJbDk4Ljk4My05NS4wNDljNS40NjYtNS4yNSwxNC4zMjktNS4yNSwxOS43OTYsMGM1LjQ2Niw1LjI1LDUuNDY2LDEzLjc1NywwLDE5LjAwN0w0Ni40MiwxNjMuODQxTDEyNS42MDcsMjM5Ljg3NnoiLz4NCjxwYXRoIHN0eWxlPSJmaWxsOiM2MDJGNzU7IiBkPSJNMTE1LjcwNywyNjkuNjI1Yy01LjI5OSwwLTEwLjU5My0xLjkzNy0xNC42MjYtNS44MTFMMi4wOTksMTY4Ljc2NA0KCUMwLjc1OSwxNjcuNDc4LDAsMTY1LjY5OSwwLDE2My44NDFjMC0xLjg1OSwwLjc1OS0zLjYzNywyLjA5OS00LjkyNGw5OC45ODctOTUuMDQ5YzguMDU0LTcuNzQ3LDIxLjE4LTcuNzQ4LDI5LjI0Ny0wLjAwMg0KCWM0LDMuODQsNi4yLDguOTY1LDYuMiwxNC40M3MtMi4yLDEwLjU4OC02LjIsMTQuNDI2bC03NC4wNTksNzEuMTE4bDc0LjA2MSw3MS4xMWMwLDAuMDAyLDAuMDA3LDAuMDAzLDAuMDA3LDAuMDA1DQoJYzMuOTk0LDMuODQyLDYuMTkzLDguOTcsNi4xOTMsMTQuNDM3YzAsNS40NjMtMi4yLDEwLjU4NS02LjIsMTQuNDIxQzEyNi4zLDI2Ny42ODgsMTIxLjAwNiwyNjkuNjI1LDExNS43MDcsMjY5LjYyNXoNCgkgTTE2LjY3OSwxNjMuODQxbDkzLjg2LDkwLjEyN2MyLjgwNywyLjY5NSw3LjU0NywyLjY4NiwxMC4zNDEtMC4wMDJjMS4yODctMS4yMzksMi0yLjg2NSwyLTQuNTc5YzAtMS43MTctMC43MTMtMy4zNDctMi4wMDctNC41OTENCglsLTc5LjE3OS03Ni4wM2MtMS4zNC0xLjI4OS0yLjA5OS0zLjA2Ny0yLjA5OS00LjkyNWMwLTEuODU5LDAuNzU5LTMuNjM3LDIuMDk5LTQuOTI0bDc5LjE4Ni03Ni4wNDRjMS4yODctMS4yNDEsMi0yLjg2NSwyLTQuNTc5DQoJYzAtMS43MTUtMC43MTMtMy4zNDItMi00LjU4MmMtMi44MDctMi42ODUtNy41NC0yLjY5Ny0xMC4zMzQtMC4wMDJMMTYuNjc5LDE2My44NDF6Ii8+DQo8Zz4NCgk8cGF0aCBzdHlsZT0iZmlsbDojRUEzNDU3OyIgZD0iTTIyMS4xNzksMjM5Ljg3NmM1LjQ2Niw1LjI1Nyw1LjQ2NiwxMy43NjYsMCwxOS4wMTRjLTUuNDY2LDUuMjUtMTQuMzI5LDUuMjUtMTkuNzk2LDANCgkJTDEwMi40LDE2My44NDFsOTguOTgzLTk1LjA0OWM1LjQ2Ni01LjI1LDE0LjMyOS01LjI1LDE5Ljc5NiwwYzUuNDY2LDUuMjUsNS40NjYsMTMuNzU3LDAsMTkuMDA3bC03OS4xODYsNzYuMDQyTDIyMS4xNzksMjM5Ljg3NnoiDQoJCS8+DQoJPHBhdGggc3R5bGU9ImZpbGw6I0VBMzQ1NzsiIGQ9Ik0yMTEuMjgsMjY5LjYyM2MtNS4yOTksMC0xMC41OTMtMS45MzUtMTQuNjI2LTUuODA2bC05OC45OC05NS4wNTENCgkJYy0xLjM0LTEuMjg3LTIuMDk5LTMuMDY1LTIuMDk5LTQuOTI0YzAtMS44NTksMC43NTktMy42MzcsMi4wOTktNC45MjRsOTguOTgtOTUuMDQ5YzguMDY3LTcuNzQ3LDIxLjE4Ny03Ljc0NSwyOS4yNTQtMC4wMDINCgkJYzQsMy44NCw2LjIsOC45NjUsNi4yLDE0LjQzcy0yLjIsMTAuNTg4LTYuMiwxNC40MjZsLTc0LjA2MSw3MS4xMTdsNzQuMDYxLDcxLjExYzAsMC4wMDIsMC4wMDcsMC4wMDMsMC4wMDcsMC4wMDUNCgkJYzMuOTk0LDMuODQyLDYuMTkzLDguOTcsNi4xOTMsMTQuNDM3YzAsNS40NjMtMi4yLDEwLjU4NS02LjIsMTQuNDIxQzIyMS44NzMsMjY3LjY4OCwyMTYuNTc5LDI2OS42MjMsMjExLjI4LDI2OS42MjN6DQoJCSBNMTEyLjI1MywxNjMuODQxbDkzLjg1Myw5MC4xMjdjMi44MDEsMi42OSw3LjU0NywyLjY5MSwxMC4zNDYtMC4wMDJjMS4yODctMS4yMzksMi0yLjg2NSwyLTQuNTc5DQoJCWMwLTEuNzE3LTAuNzEzLTMuMzQ3LTIuMDA3LTQuNTkxbC03OS4xODEtNzYuMDNjLTEuMzQtMS4yODktMi4wOTktMy4wNjctMi4wOTktNC45MjVzMC43NTktMy42MzcsMi4wOTktNC45MjRsNzkuMTg2LTc2LjA0NA0KCQljMS4yODctMS4yNDEsMi0yLjg2NSwyLTQuNTc5YzAtMS43MTUtMC43MTMtMy4zNDItMi00LjU4MmMtMi44MDEtMi42OS03LjU0Ny0yLjY5MS0xMC4zNDYsMC4wMDJMMTEyLjI1MywxNjMuODQxeiIvPg0KPC9nPg0KPHBhdGggc3R5bGU9ImZpbGw6IzAwRTdGRjsiIGQ9Ik0zMTYuNzUyLDIzOS44NzZjNS40NjYsNS4yNTcsNS40NjYsMTMuNzY2LDAsMTkuMDE0Yy01LjQ2Niw1LjI1LTE0LjMyOSw1LjI1LTE5Ljc5NiwwDQoJbC05OC45ODMtOTUuMDQ5bDk4Ljk4My05NS4wNDljNS40NjYtNS4yNSwxNC4zMzEtNS4yNSwxOS43OTYsMGM1LjQ2Niw1LjI1LDUuNDY2LDEzLjc1NywwLDE5LjAwN2wtNzkuMTg2LDc2LjA0MkwzMTYuNzUyLDIzOS44NzZ6Ig0KCS8+DQo8cGF0aCBzdHlsZT0iZmlsbDojNjAyRjc1OyIgZD0iTTMwNi44NTQsMjY5LjYyMmMtNS4yOTQsMC0xMC41OTMtMS45MzUtMTQuNjI2LTUuODAzbC05OC45OC05NS4wNTMNCgljLTEuMzQtMS4yODctMi4wOTktMy4wNjUtMi4wOTktNC45MjRjMC0xLjg1OSwwLjc1OS0zLjYzNywyLjA5OS00LjkyNGw5OC45OC05NS4wNDljOC4wNjEtNy43MzUsMjEuMTkzLTcuNzQzLDI5LjI1NC0wLjAwMg0KCWM0LDMuODQsNi4yLDguOTY1LDYuMiwxNC40M3MtMi4yLDEwLjU4OC02LjIsMTQuNDI2bC03NC4wNjEsNzEuMTE3bDc0LjA2MSw3MS4xMWMwLDAuMDAyLDAuMDA3LDAuMDAzLDAuMDA3LDAuMDA1DQoJYzMuOTk0LDMuODQyLDYuMTkzLDguOTcsNi4xOTMsMTQuNDM3YzAsNS40NjMtMi4yLDEwLjU4NS02LjIsMTQuNDIxQzMxNy40NTQsMjY3LjY4NCwzMTIuMTUzLDI2OS42MjIsMzA2Ljg1NCwyNjkuNjIyeg0KCSBNMjA3LjgyNiwxNjMuODQxbDkzLjg1Myw5MC4xMjdjMi44NTQsMi43MzQsNy40OTQsMi43MzYsMTAuMzQ2LTAuMDAyYzEuMjg3LTEuMjM5LDItMi44NjUsMi00LjU3OQ0KCWMwLTEuNzE3LTAuNzEzLTMuMzQ3LTIuMDA3LTQuNTkxbC03OS4xODEtNzYuMDNjLTEuMzQtMS4yODktMi4wOTktMy4wNjctMi4wOTktNC45MjVzMC43NTktMy42MzcsMi4wOTktNC45MjRsNzkuMTg2LTc2LjA0NA0KCWMxLjI4Ny0xLjI0MSwyLTIuODY1LDItNC41NzljMC0xLjcxNS0wLjcxMy0zLjM0Mi0yLTQuNTgyYy0yLjg1NC0yLjczNC03LjQ5NC0yLjczNC0xMC4zNDYsMC4wMDNMMjA3LjgyNiwxNjMuODQxeiIvPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPC9zdmc+DQo=);"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button"
							data-bs-target="#carouselExampleIndicators_2"
							data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"
								style="background-image: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pg0KPCEtLSBHZW5lcmF0b3I6IEFkb2JlIElsbHVzdHJhdG9yIDE5LjAuMCwgU1ZHIEV4cG9ydCBQbHVnLUluIC4gU1ZHIFZlcnNpb246IDYuMDAgQnVpbGQgMCkgIC0tPg0KPHN2ZyB2ZXJzaW9uPSIxLjEiIGlkPSJDYXBhXzEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4Ig0KCSB2aWV3Qm94PSIwIDAgMzM0LjUwNSAzMzQuNTA1IiBzdHlsZT0iZW5hYmxlLWJhY2tncm91bmQ6bmV3IDAgMCAzMzQuNTA1IDMzNC41MDU7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxwYXRoIHN0eWxlPSJmaWxsOiNGRkU2MDA7IiBkPSJNMjA4Ljg5OSw5MS4yMWMtNS40NjYtNS4yNS01LjQ2Ni0xMy43NTcsMC0xOS4wMDdjNS40NjYtNS4yNSwxNC4zMzEtNS4yNSwxOS43OTYsMGw5OC45ODUsOTUuMDQ5DQoJbC05OC45ODMsOTUuMDQ5Yy01LjQ2Niw1LjI1LTE0LjMyOSw1LjI1LTE5Ljc5NiwwYy01LjQ2Ni01LjI1LTUuNDY2LTEzLjc1NywwLTE5LjAxNGw3OS4xODYtNzYuMDM1TDIwOC44OTksOTEuMjF6Ii8+DQo8cGF0aCBzdHlsZT0iZmlsbDojNjAyRjc1OyIgZD0iTTIxOC44LDI3My4wMzZjLTUuMjk0LDAuMDAyLTEwLjU5My0xLjkzNS0xNC42MjYtNS44MDhjLTQtMy44MzgtNi4yLTguOTYtNi4yLTE0LjQyMw0KCWMwLTUuNDY2LDIuMi0xMC41OTUsNi4xOTMtMTQuNDM3bDc0LjA2Ni03MS4xMTdsLTc0LjA2MS03MS4xMnYwLjAwMmMtNC0zLjgzOC02LjItOC45NjItNi4yLTE0LjQyNnMyLjItMTAuNTksNi4yLTE0LjQyOA0KCWM4LjA2Ny03Ljc0NywyMS4xODctNy43NDgsMjkuMjU0LDAuMDAybDk4Ljk4LDk1LjA0OGMxLjM0LDEuMjg3LDIuMDk5LDMuMDY1LDIuMDk5LDQuOTI0cy0wLjc1OSwzLjYzNy0yLjA5OSw0LjkyNGwtOTguOTg3LDk1LjA0OQ0KCUMyMjkuMzkzLDI3MS4wOTksMjI0LjA5NCwyNzMuMDM2LDIxOC44LDI3My4wMzZ6IE0yMTguOCw3NS4xMDdjLTEuODg2LDAtMy43NzMsMC42NzQtNS4xNzMsMi4wMjFjLTEuMjg3LDEuMjM5LTIsMi44NjYtMiw0LjU4MQ0KCWMwLDEuNzEzLDAuNzEzLDMuMzM4LDIsNC41Nzd2MC4wMDJsNzkuMTg2LDc2LjA0NGMxLjM0LDEuMjg3LDIuMDk5LDMuMDY1LDIuMDk5LDQuOTI0YzAsMS44NTktMC43NTksMy42MzctMi4wOTksNC45MjUNCglsLTc5LjE4Niw3Ni4wMzRjLTEuMjg3LDEuMjQyLTIsMi44NzItMiw0LjU4OGMwLDEuNzEzLDAuNzEzLDMuMzQsMiw0LjU4MWMyLjgwNywyLjY4NSw3LjU0LDIuNjk3LDEwLjMzNCwwLjAwMmw5My44NjctOTAuMTI5DQoJbC05My44NjItOTAuMTI5QzIyMi41NjYsNzUuNzgsMjIwLjY4MSw3NS4xMDcsMjE4LjgsNzUuMTA3eiIvPg0KPGc+DQoJPHBhdGggc3R5bGU9ImZpbGw6I0VBMzQ1NzsiIGQ9Ik0xMDYuNTAxLDkxLjIxYy01LjQ2Ni01LjI1LTUuNDY2LTEzLjc1NywwLTE5LjAwN2M1LjQ2Ni01LjI1LDE0LjMyOS01LjI1LDE5Ljc5NiwwbDk4Ljk4Myw5NS4wNDkNCgkJbC05OC45ODMsOTUuMDQ5Yy01LjQ2Niw1LjI1LTE0LjMyOSw1LjI1LTE5Ljc5NiwwYy01LjQ2Ni01LjI1LTUuNDY2LTEzLjc1NywwLTE5LjAxNGw3OS4xODYtNzYuMDM1TDEwNi41MDEsOTEuMjF6Ii8+DQoJPHBhdGggc3R5bGU9ImZpbGw6I0VBMzQ1NzsiIGQ9Ik0xMTYuNCwyNzMuMDM1Yy01LjI5OSwwLTEwLjU5My0xLjkzNS0xNC42MjYtNS44MDZjLTQtMy44MzgtNi4yLTguOTYtNi4yLTE0LjQyMw0KCQljMC01LjQ2NiwyLjItMTAuNTk1LDYuMTkzLTE0LjQzN2w3NC4wNjYtNzEuMTE3bC03NC4wNjEtNzEuMTJ2MC4wMDJjLTQtMy44MzgtNi4yLTguOTYyLTYuMi0xNC40MjZzMi4yLTEwLjU5LDYuMi0xNC40MjgNCgkJYzguMDY3LTcuNzQ3LDIxLjE4Ny03Ljc0NSwyOS4yNTQtMC4wMDJsOTguOTgsOTUuMDUxYzEuMzQsMS4yODcsMi4wOTksMy4wNjUsMi4wOTksNC45MjRzLTAuNzU5LDMuNjM3LTIuMDk5LDQuOTI0bC05OC45OCw5NS4wNDkNCgkJQzEyNi45OTMsMjcxLjA5OSwxMjEuNzAxLDI3My4wMzUsMTE2LjQsMjczLjAzNXogTTExNi40LDc1LjEwN2MtMS44ODYsMC0zLjc3MywwLjY3NC01LjE3MywyLjAyMWMtMS4yODcsMS4yMzktMiwyLjg2Ni0yLDQuNTgxDQoJCWMwLDEuNzEzLDAuNzEzLDMuMzM4LDIsNC41Nzd2MC4wMDJsNzkuMTg2LDc2LjA0NGMxLjM0LDEuMjg3LDIuMDk5LDMuMDY1LDIuMDk5LDQuOTI0YzAsMS44NTktMC43NTksMy42MzctMi4wOTksNC45MjUNCgkJbC03OS4xODYsNzYuMDM0Yy0xLjI4NywxLjI0Mi0yLDIuODcyLTIsNC41ODhjMCwxLjcxMywwLjcxMywzLjM0LDIsNC41ODFjMi44MDEsMi42OSw3LjU0NywyLjY5MSwxMC4zNDYtMC4wMDJsOTMuODU1LTkwLjEyOQ0KCQlsLTkzLjg1My05MC4xMjdDMTIwLjE3Myw3NS43OCwxMTguMjg3LDc1LjEwNywxMTYuNCw3NS4xMDd6Ii8+DQo8L2c+DQo8cGF0aCBzdHlsZT0iZmlsbDojMDBFN0ZGOyIgZD0iTTEwLjkyOCw5MS4yMWMtNS40NjYtNS4yNS01LjQ2Ni0xMy43NTcsMC0xOS4wMDdjNS40NjYtNS4yNSwxNC4zMjktNS4yNSwxOS43OTYsMGw5OC45ODMsOTUuMDQ5DQoJbC05OC45ODMsOTUuMDQ5Yy01LjQ2Niw1LjI1LTE0LjMzMSw1LjI1LTE5Ljc5NiwwYy01LjQ2Ni01LjI1LTUuNDY2LTEzLjc1NywwLTE5LjAxNGw3OS4xODYtNzYuMDM1TDEwLjkyOCw5MS4yMXoiLz4NCjxwYXRoIHN0eWxlPSJmaWxsOiM2MDJGNzU7IiBkPSJNMjAuODIsMjczLjAzMWMtNS4yOTQsMC4wMDItMTAuNTkzLTEuOTM0LTE0LjYxOS01LjgwM2MtNC0zLjgzOC02LjItOC45Ni02LjItMTQuNDIzDQoJYzAtNS40NjYsMi4yLTEwLjU5NSw2LjE5My0xNC40MzdsNzQuMDY2LTcxLjExN0w2LjE5OSw5Ni4xMzJ2MC4wMDJDMi4yLDkyLjI5NSwwLDg3LjE3MiwwLDgxLjcwN3MyLjItMTAuNTksNi4yLTE0LjQyOA0KCWM4LjA1NC03LjczNSwyMS4xODctNy43NDEsMjkuMjU0LTAuMDAzbDk4Ljk4LDk1LjA1M2MxLjM0LDEuMjg3LDIuMDk5LDMuMDY1LDIuMDk5LDQuOTI0cy0wLjc1OSwzLjYzNy0yLjA5OSw0LjkyNGwtOTguOTgsOTUuMDQ5DQoJQzMxLjQyLDI3MS4wOTYsMjYuMTIxLDI3My4wMzEsMjAuODIsMjczLjAzMXogTTIwLjgyNiw3NS4wNzVjLTEuODc0LDAtMy43NDYsMC42ODMtNS4xNzMsMi4wNTFjLTEuMjg3LDEuMjM5LTIsMi44NjUtMiw0LjU4MQ0KCWMwLDEuNzEzLDAuNzEzLDMuMzM4LDIsNC41Nzd2MC4wMDJsNzkuMTg2LDc2LjA0NGMxLjM0LDEuMjg3LDIuMDk5LDMuMDY1LDIuMDk5LDQuOTI0YzAsMS44NTktMC43NTksMy42MzctMi4wOTksNC45MjUNCglsLTc5LjE4Niw3Ni4wMzRjLTEuMjg3LDEuMjQyLTIsMi44NzItMiw0LjU4OGMwLDEuNzEzLDAuNzEzLDMuMzQsMiw0LjU4MWMyLjg1NCwyLjczNCw3LjQ5NCwyLjczNCwxMC4zNDYtMC4wMDNsOTMuODU1LTkwLjEyNg0KCUwyNS45OTksNzcuMTI2QzI0LjU3Myw3NS43NTksMjIuNyw3NS4wNzUsMjAuODI2LDc1LjA3NXoiLz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjwvc3ZnPg0K);"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>
				</div>

				<!-- 底下廣告圖 -->
				<div class="advertise"
					style="margin: 1% 0% 2px 0%; text-align: center;">
					<span> <img
						src="<c:url value='/images/publicity/long/1.jpg' />"
						class="img-fluid" alt="...">
					</span> <span> <img
						src="<c:url value='/images/publicity/long/2.jpg' />"
						class="img-fluid" alt="...">
					</span>
				</div>
			</div>
		</div>

		<!-- 頁尾 -->
		<jsp:include page="/fragment/footer.jsp" />
	</div>

</body>

</html>