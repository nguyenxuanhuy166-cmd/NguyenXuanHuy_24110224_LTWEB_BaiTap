<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Khôi phục mật khẩu</title>
</head>
<body>
	<form action="reset-password" method="post">
		<h2>Nhập mã OTP và mật khẩu mới</h2>
		<c:if test="${alert != null}">
			<h3 style="color: red;">${alert}</h3>
		</c:if>
		<input type="text" name="otp" placeholder="Nhập OTP" required><br><br>
		<input type="password" name="newPassword" placeholder="Nhập mật khẩu mới" required><br><br>
		<button type="submit">Xác nhận</button>
	</form>
</body>
</html>
