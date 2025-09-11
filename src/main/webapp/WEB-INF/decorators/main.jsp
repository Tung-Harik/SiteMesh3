<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>Demo SiteMesh 3</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container">
    <a class="navbar-brand" href="<%=request.getContextPath()%>/">Trang chủ</a>
    <a class="btn btn-outline-light ms-auto" href="<%=request.getContextPath()%>/profile">Profile</a>
  </div>
</nav>
<div class="container py-4">
  <!-- SiteMesh sẽ tự chèn body của trang con -->
  <sitemesh:page/>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<h1>Main SiteMesh3</h1>
</body>
</html>
