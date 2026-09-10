<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quên mật khẩu</title>
</head>
<body>
	<form action="forgot-password" method="post">
		<h2>Nhập email để lấy lại mật khẩu</h2>
		<c:if test="${alert != null}">
			<h3 style="color: red;">${alert}</h3>
		</c:if>
		<input type="email" name="email" placeholder="Nhập Email" required>
		<button type="submit">Gửi mã xác nhận</button>
	</form>
</body>
</html>
