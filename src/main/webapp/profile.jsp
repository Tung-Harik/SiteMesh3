<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.Part"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section class="py-4">
		<h2 class="mb-4">Cập nhật hồ sơ</h2>
		<c:if test="${updated}">
			<div class="alert alert-success" role="alert">Cập nhật thông
				tin thành công!</div>
		</c:if>
		<form method="post"
			action="${pageContext.request.contextPath}/profile"
			enctype="multipart/form-data" class="row g-3">
			<div class="col-md-6">
				<label class="form-label" for="fullname">Họ và tên</label> <input
					id="fullname" type="text" name="fullname" class="form-control"
					value="${fullname}" required>
			</div>
			<div class="col-md-6">
				<label class="form-label" for="phone">Số điện thoại</label> <input
					id="phone" type="text" name="phone" class="form-control"
					value="${phone}" required>
			</div>
			<div class="col-12">
				<label class="form-label" for="image">Ảnh đại diện</label> <input
					id="image" type="file" name="image" accept="image/*"
					class="form-control">
				<div class="form-text">Định dạng: JPG, PNG, GIF...</div>
			</div>
			<div class="col-12">
				<button class="btn btn-primary" type="submit">Lưu thông tin</button>
			</div>
		</form>
		<c:if
			test="${not empty fullname || not empty phone || not empty imagePath}">
			<hr class="my-4" />
			<h5 class="mb-3">Thông tin hiện tại</h5>
			<dl class="row mb-0">
				<c:if test="${not empty fullname}">
					<dt class="col-sm-3">Họ và tên</dt>
					<dd class="col-sm-9">${fullname}</dd>
				</c:if>
				<c:if test="${not empty phone}">
					<dt class="col-sm-3">Số điện thoại</dt>
					<dd class="col-sm-9">${phone}</dd>
				</c:if>
			</dl>
			<c:if test="${not empty imagePath}">
				<div class="mt-3">
					<img src="${pageContext.request.contextPath}/uploads/${imagePath}"
						alt="Ảnh hồ sơ" class="img-thumbnail" style="max-width: 220px;">
				</div>
			</c:if>
		</c:if>
	</section>
</body>
</html>