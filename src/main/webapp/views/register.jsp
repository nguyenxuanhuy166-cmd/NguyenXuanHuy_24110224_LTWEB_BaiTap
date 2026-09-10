<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<form action="register" method="post">
    <h2>Tạo tài khoản mới</h2>
    <c:if test="${alert != null}">
        <h3 class="alert alert-danger">${alert}</h3>
    </c:if>
    <section>
        <label>Tài khoản:</label>
        <input type="text" name="username" placeholder="Tài khoản" required>
    </section>
    <section>
        <label>Mật khẩu:</label>
        <input type="password" name="password" placeholder="Mật khẩu" required>
    </section>
    <section>
        <label>Họ tên:</label>
        <input type="text" name="fullname" placeholder="Họ và tên" required>
    </section>
    <section>
        <label>Email:</label>
        <input type="email" name="email" placeholder="Email" required>
    </section>
    <section>
        <label>Số điện thoại:</label>
        <input type="text" name="phone" placeholder="Số điện thoại" required>
    </section>
    <button type="submit">Đăng ký</button>
    <p>Nếu bạn đã có tài khoản? <a href="${pageContext.request.contextPath}/login">Đăng nhập</a></p>
</form>