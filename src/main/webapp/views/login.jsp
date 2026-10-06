<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
	<title>Đăng nhập</title>
</head>
<body>
    <div class="row justify-content-center align-items-center" style="min-height: 70vh;">
        <div class="col-md-6 col-lg-4">
            <div class="card card-custom">
                <div class="text-center mb-4">
                    <h2 class="fw-bold text-primary">Đăng Nhập</h2>
                    <p class="text-muted">Vui lòng đăng nhập để tiếp tục</p>
                </div>
                
                <c:if test="${alert != null}">
                    <div class="alert alert-danger" role="alert">
                        <i class="fa-solid fa-triangle-exclamation me-2"></i>${alert}
                    </div>
                </c:if>
                <c:if test="${param.message == 'success'}">
                    <div class="alert alert-success" role="alert">
                        <i class="fa-solid fa-circle-check me-2"></i>Đăng ký thành công! Đăng nhập ngay.
                    </div>
                </c:if>
                <c:if test="${param.message == 'password_updated'}">
                    <div class="alert alert-success" role="alert">
                        <i class="fa-solid fa-circle-check me-2"></i>Đổi mật khẩu thành công! Đăng nhập ngay.
                    </div>
                </c:if>

                <form action="<c:url value='/login'/>" method="post">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="username" name="username" placeholder="Tài khoản" required>
                        <label for="username"><i class="fa-solid fa-user me-2"></i>Tài khoản</label>
                    </div>
                    
                    <div class="form-floating mb-3">
                        <input type="password" class="form-control" id="password" name="password" placeholder="Mật khẩu" required>
                        <label for="password"><i class="fa-solid fa-lock me-2"></i>Mật khẩu</label>
                    </div>
                    
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="remember" id="remember">
                            <label class="form-check-label" for="remember">Nhớ mật khẩu</label>
                        </div>
                        <a href="<c:url value='/forgot-password'/>" class="text-decoration-none small text-primary fw-semibold">Quên mật khẩu?</a>
                    </div>
                    
                    <button class="btn btn-primary w-100 py-2 fs-5" type="submit">Đăng nhập</button>
                    
                    <div class="text-center mt-4">
                        <span class="text-muted">Chưa có tài khoản?</span> 
                        <a href="<c:url value='/register'/>" class="text-decoration-none fw-bold ms-1">Đăng ký ngay</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>