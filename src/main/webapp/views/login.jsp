	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<form action="login" method="post">
	<h2>Đăng Nhập Vào Hệ Thống</h2>
	<c:if test="${alert != null}">
		<h3 class="alert alert-danger">${alert}</h3>
	</c:if>
	<input type="text" name="username" placeholder="Tài khoản"> <input
		type="password" name="password" placeholder="Mật khẩu"> <input
		type="checkbox" name="remember"> Nhớ tôi
	<button type="submit">Đăng nhập</button>
</form>