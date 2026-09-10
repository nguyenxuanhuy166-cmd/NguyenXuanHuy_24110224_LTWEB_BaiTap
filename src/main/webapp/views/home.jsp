<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ - Cửa hàng</title>
<style>
    body { font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #f8f9fa; }
    .header { background-color: #343a40; color: white; padding: 15px 20px; text-align: center; }
    .nav { background-color: #007bff; padding: 10px; text-align: center; }
    .nav a { color: white; text-decoration: none; margin: 0 15px; font-weight: bold; }
    .container { max-width: 1200px; margin: 20px auto; padding: 0 15px; }
    .section-title { margin-bottom: 20px; border-bottom: 2px solid #007bff; padding-bottom: 10px; }
    
    .product-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
        gap: 20px;
    }
    .product-card {
        background: white;
        border: 1px solid #ddd;
        border-radius: 5px;
        padding: 15px;
        text-align: center;
        box-shadow: 0 2px 4px rgba(0,0,0,0.05);
        transition: transform 0.2s;
    }
    .product-card:hover { transform: translateY(-5px); box-shadow: 0 5px 15px rgba(0,0,0,0.1); }
    .product-image { max-width: 100%; height: 200px; object-fit: contain; margin-bottom: 15px; }
    .product-title { font-size: 16px; margin: 10px 0; font-weight: bold; color: #333; }
    .product-price { color: #d9534f; font-weight: bold; font-size: 18px; margin-bottom: 15px; }
    .product-link {
        display: inline-block;
        padding: 8px 15px;
        background-color: #007bff;
        color: white;
        text-decoration: none;
        border-radius: 4px;
        width: 100%;
        box-sizing: border-box;
    }
    .product-link:hover { background-color: #0056b3; }
</style>
</head>
<body>

<div class="header">
    <h1>Cửa Hàng Trực Tuyến</h1>
</div>
<div class="nav">
    <a href="<c:url value='/'/>">Trang chủ</a>
    <a href="<c:url value='/product'/>">Sản phẩm</a>
    <c:if test="${empty sessionScope.account}">
        <a href="<c:url value='/login'/>">Đăng nhập</a>
        <a href="<c:url value='/register'/>">Đăng ký</a>
    </c:if>
    <c:if test="${not empty sessionScope.account}">
        <a href="#">Chào, ${sessionScope.account.fullName}</a>
        <a href="<c:url value='/logout'/>">Đăng xuất</a>
    </c:if>
</div>

<div class="container">
    <h2 class="section-title">Sản phẩm mới nhất (Top 10)</h2>
    
    <div class="product-grid">
        <c:forEach items="${latestProducts}" var="prod">
            <div class="product-card">
                <c:if test="${prod.image != null && prod.image.startsWith('http')}">
                    <c:url value="${prod.image}" var="imgUrl"></c:url>
                </c:if>
                <c:if test="${prod.image == null || !prod.image.startsWith('http')}">
                    <c:url value="/image?fname=${prod.image}" var="imgUrl"></c:url>
                </c:if>
                <img class="product-image" src="${imgUrl}" alt="${prod.productName}" />
                
                <h3 class="product-title">${prod.productName}</h3>
                <div class="product-price">${prod.price} VNĐ</div>
                <a href="<c:url value='/product/detail?id=${prod.productId}'/>" class="product-link">Xem chi tiết</a>
            </div>
        </c:forEach>
    </div>
</div>

</body>
</html>
