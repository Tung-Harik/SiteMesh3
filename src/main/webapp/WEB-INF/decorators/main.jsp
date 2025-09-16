<%@ page contentType="text/html; charset=UTF-8" %>

<!doctype html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Demo SiteMesh 3</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
</head>

<body class="bg-light">
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="<%=request.getContextPath()%>/">Trang chủ</a>
			<div class="navbar-nav ms-auto">
				<a class="nav-link" href="<%=request.getContextPath()%>/profile">Profile</a>
			</div>
		</div>
	</nav>

	<main class="container py-5">
		<div class="row justify-content-center">
			<div class="col-lg-8">
				<sitemesh:write property="body" />
			</div>
		</div>
	</main>
	<footer class="bg-dark text-white-50 py-3">
		<div class="container text-center small">
			Demo SiteMesh 3 với Bootstrap &copy;
			<%=java.time.Year.now()%>
		</div>
	</footer>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
