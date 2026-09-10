<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hồ sơ cá nhân</title>
</head>
<body>
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    <h4>Cập nhật hồ sơ cá nhân</h4>
                </div>
                <div class="card-body">
                    <c:if test="${not empty alert}">
                        <div class="alert alert-danger">${alert}</div>
                    </c:if>
                    <c:if test="${not empty message}">
                        <div class="alert alert-success">${message}</div>
                    </c:if>
                    
                    <form action="${pageContext.request.contextPath}/profile" method="post" enctype="multipart/form-data">
                        <div class="row mb-3">
                            <div class="col-md-4 text-center">
                                <c:if test="${empty sessionScope.account.avatar}">
                                    <img src="https://via.placeholder.com/150" class="img-fluid rounded-circle mb-2" alt="Avatar">
                                </c:if>
                                <c:if test="${not empty sessionScope.account.avatar}">
                                    <c:if test="${sessionScope.account.avatar.startsWith('http')}">
                                        <c:url value="${sessionScope.account.avatar}" var="avatarUrl"/>
                                    </c:if>
                                    <c:if test="${!sessionScope.account.avatar.startsWith('http')}">
                                        <c:url value="/image?fname=${sessionScope.account.avatar}" var="avatarUrl"/>
                                    </c:if>
                                    <img src="${avatarUrl}" class="img-fluid rounded-circle mb-2" alt="Avatar" style="width: 150px; height: 150px; object-fit: cover;">
                                </c:if>
                                
                                <div class="mt-2">
                                    <label for="avatarUpload" class="form-label">Đổi ảnh đại diện</label>
                                    <input class="form-control form-control-sm" type="file" id="avatarUpload" name="avatarUpload">
                                </div>
                            </div>
                            
                            <div class="col-md-8">
                                <div class="mb-3">
                                    <label for="username" class="form-label">Tên đăng nhập</label>
                                    <input type="text" class="form-control" id="username" value="${sessionScope.account.userName}" disabled>
                                </div>
                                <div class="mb-3">
                                    <label for="email" class="form-label">Email</label>
                                    <input type="email" class="form-control" id="email" value="${sessionScope.account.email}" disabled>
                                </div>
                                <div class="mb-3">
                                    <label for="fullName" class="form-label">Họ và tên</label>
                                    <input type="text" class="form-control" id="fullName" name="fullName" value="${sessionScope.account.fullName}" required>
                                </div>
                                <div class="mb-3">
                                    <label for="phone" class="form-label">Số điện thoại</label>
                                    <input type="text" class="form-control" id="phone" name="phone" value="${sessionScope.account.phone}">
                                </div>
                                
                                <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
