<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Xác minh OTP</title>
</head>
<body>
	<form action="verify-otp" method="post">
		<h2>Nhập mã OTP đã được gửi vào email của bạn</h2>
		<c:if test="${alert != null}">
			<h3 style="color: red;">${alert}</h3>
		</c:if>
		<input type="text" name="otp" placeholder="Nhập OTP" required>
		<button type="submit">Xác nhận</button>
	</form>
</body>
</html>
