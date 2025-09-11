<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.Part"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Cập nhật Profile</h2>
	<
	<h2 class="mb-3">Cập nhật Profile</h2>

	<form method="post" action="<%=request.getContextPath()%>/profile"
		enctype="multipart/form-data" class="row g-3">
		<div class="col-md-6">
			<label class="form-label">Fullname</label> <input type="text"
				name="fullname" class="form-control" required>
		</div>
		<div class="col-md-6">
			<label class="form-label">Phone</label> <input type="text"
				name="phone" class="form-control" required>
		</div>
		<div class="col-12">
			<label class="form-label">Image</label> <input type="file"
				name="image" accept="image/*" class="form-control">
		</div>
		<div class="col-12">
			<button class="btn btn-primary">Update</button>
		</div>
	</form>

	<%
	if (request.getAttribute("fullname") != null) {
	%>
	<hr />
	<h5>Kết quả</h5>
	<p>
		Fullname:
		<%=request.getAttribute("fullname")%></p>
	<p>
		Phone:
		<%=request.getAttribute("phone")%></p>
	<%
	String img = (String) request.getAttribute("imagePath");
	if (img != null) {
	%>
	<img src="<%=request.getContextPath()%>/uploads/<%=img%>" width="160"
		class="rounded" />
	<%
	}
	%>
	<%
	}
	%>
</body>
</html>