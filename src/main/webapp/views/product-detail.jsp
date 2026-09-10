<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết sản phẩm</title>
<style>
    body { font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #f8f9fa; }
    .header { background-color: #343a40; color: white; padding: 15px 20px; text-align: center; }
    .nav { background-color: #007bff; padding: 10px; text-align: center; }
    .nav a { color: white; text-decoration: none; margin: 0 15px; font-weight: bold; }
    .container { max-width: 1000px; margin: 40px auto; padding: 0 15px; }
    
    .product-detail-card {
        background: white;
        border: 1px solid #ddd;
        border-radius: 8px;
        padding: 30px;
        display: flex;
        flex-wrap: wrap;
        box-shadow: 0 4px 8px rgba(0,0,0,0.05);
    }
    .product-image-container {
        flex: 1;
        min-width: 300px;
        padding-right: 30px;
        text-align: center;
    }
    .product-image {
        max-width: 100%;
        border-radius: 5px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    .product-info-container {
        flex: 1;
        min-width: 300px;
        display: flex;
        flex-direction: column;
    }
    .product-title { font-size: 28px; margin-top: 0; margin-bottom: 10px; color: #333; }
    .product-category { color: #6c757d; margin-bottom: 20px; font-size: 16px; }
    .product-price { color: #d9534f; font-weight: bold; font-size: 26px; margin-bottom: 20px; }
    .product-description { line-height: 1.6; color: #555; margin-bottom: 30px; flex-grow: 1; }
    
    .btn-buy {
        padding: 12px 20px;
        background-color: #28a745;
        color: white;
        text-decoration: none;
        border: none;
        border-radius: 5px;
        font-size: 18px;
        font-weight: bold;
        text-align: center;
        cursor: pointer;
        display: block;
        width: 100%;
    }
    .btn-buy:hover { background-color: #218838; }
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
    <div class="product-detail-card">
        <div class="product-image-container">
            <c:if test="${product.image != null && product.image.startsWith('http')}">
                <c:url value="${product.image}" var="imgUrl"></c:url>
            </c:if>
            <c:if test="${product.image == null || !product.image.startsWith('http')}">
                <c:url value="/image?fname=${product.image}" var="imgUrl"></c:url>
            </c:if>
            <img class="product-image" src="${imgUrl}" alt="${product.productName}" />
        </div>
        
        <div class="product-info-container">
            <h2 class="product-title">${product.productName}</h2>
            <div class="product-category">Danh mục: <strong>${product.category.categoryname}</strong></div>
            <div class="product-price">${product.price} VNĐ</div>
            
            <div class="product-description">
                <h3>Mô tả sản phẩm:</h3>
                <p>${product.description}</p>
            </div>
            
            <button class="btn-buy" onclick="alert('Đã thêm vào giỏ hàng!')">Thêm vào giỏ hàng</button>
        </div>
    </div>
</div>

</body>
</html>
