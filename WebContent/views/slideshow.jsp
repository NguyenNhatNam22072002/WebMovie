<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="slide-show" class="carousel slide" data-ride="carousel">

		<ul class="carousel-indicators">
			<li data-target="#slide-show" data-slide-to="0" class="active"></li>
			<li data-target="#slide-show" data-slide-to="1"></li>
			<li data-target="#slide-show" data-slide-to="2"></li>
		</ul>

		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="/WebMovie/slideShow/1.jpg" height="100%" width="100%">
				<div class="carousel-caption">
					<h1 class="display-2">ASSASSIN'S CREED 2</h1>
					<h3>Phim chiếu rạp bản đẹp</h3>
					<button type="button" class="btn btn-outline-light btn-lg">
						Xem chi tiết</button>
					<button type="button" class="btn btn-primary btn-lg">Xem
						Phim</button>
				</div>
			</div>
			<div class="carousel-item">
				<img src="/WebMovie/slideShow/2.jpg" height="100%" width="100%">
				<div class="carousel-caption">
					<h1 class="display-2">DISHONORED</h1>
					<h3>Phim chiếu rạp bản đẹp</h3>
					<button type="button" class="btn btn-outline-light btn-lg">
						Xem chi tiết</button>
					<button type="button" class="btn btn-primary btn-lg">Xem
						Phim</button>
				</div>
			</div>
			<div class="carousel-item">
				<img src="/WebMovie/slideShow/3.jpg" height="100%" width="100%">
				<div class="carousel-caption">
					<h1 class="display-2">TOM RAIDER</h1>
					<h3>Phim chiếu rạp bản đẹp</h3>
					<button type="button" class="btn btn-outline-light btn-lg">
						Xem chi tiết</button>
					<button type="button" class="btn btn-primary btn-lg">Xem
						Phim</button>
				</div>
			</div>
		</div>

		<a class="carousel-control-prev" href="#slide-show" data-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</a> <a class="carousel-control-next" href="#slide-show" data-slide="next">
			<span class="carousel-control-next-icon"></span>
		</a>
	</div>
</body>
</html>