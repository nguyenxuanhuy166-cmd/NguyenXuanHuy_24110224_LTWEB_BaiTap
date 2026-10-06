<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Trang chủ</title>
</head>
<body>

<!-- Hero Section -->
<div class="p-5 text-center bg-white rounded-3 shadow-sm mb-5 mt-3">
    <h1 class="display-5 fw-bold text-primary mb-3">Chào mừng đến với E-Shop</h1>
    <p class="lead text-muted">Khám phá những sản phẩm công nghệ mới nhất với mức giá ưu đãi.</p>
    <a href="<c:url value='/product'/>" class="btn btn-primary btn-lg mt-3 px-4 rounded-pill">Khám phá ngay <i class="fa-solid fa-arrow-right ms-2"></i></a>
</div>

<div>
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3 class="fw-bold mb-0 text-dark border-start border-4 border-primary ps-3">Sản phẩm mới nhất</h3>
        <a href="<c:url value='/product'/>" class="text-decoration-none text-primary fw-semibold">Xem tất cả <i class="fa-solid fa-chevron-right ms-1"></i></a>
    </div>
    
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-5 g-4">
        <c:forEach items="${latestProducts}" var="prod">
            <div class="col">
                <div class="card h-100 product-card border-0">
                    <c:if test="${prod.image != null && prod.image.startsWith('http')}">
                        <c:url value="${prod.image}" var="imgUrl"></c:url>
                    </c:if>
                    <c:if test="${prod.image == null || !prod.image.startsWith('http')}">
                        <c:url value="/image?fname=${prod.image}" var="imgUrl"></c:url>
                    </c:if>
                    <div class="p-3 bg-white text-center">
                        <img class="card-img-top product-image rounded" src="${imgUrl}" alt="${prod.productName}" />
                    </div>
                    <div class="card-body d-flex flex-column bg-light rounded-bottom">
                        <h6 class="card-title text-truncate fw-bold mb-2" title="${prod.productName}">${prod.productName}</h6>
                        <p class="card-text text-danger fw-bold fs-5 mb-3">${prod.price} ₫</p>
                        <a href="<c:url value='/product/detail?id=${prod.productId}'/>" class="btn btn-outline-primary mt-auto w-100 fw-semibold rounded-pill">Xem chi tiết</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

</body>
</html>
