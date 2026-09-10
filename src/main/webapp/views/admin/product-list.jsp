<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="activePage" value="product" scope="request" />
<c:set var="activeSubPage" value="list-product" scope="request" />
<jsp:include page="/views/admin/includes/header.jsp" />

<div class="page-header">
    <h2>Quản lý sản phẩm</h2>
    <p>Danh sách các sản phẩm</p>
    <a href="<c:url value='/admin/product/add'/>" class="btn btn-primary" style="padding: 10px 15px; background-color: #007bff; color: white; text-decoration: none; border-radius: 5px; display: inline-block; margin-bottom: 15px;">Thêm sản phẩm mới</a>
</div>

<div class="card">
    <div class="card-header">
        Danh sách sản phẩm
    </div>
    <div class="card-body">
        <table class="table" style="text-align: center; width: 100%; border-collapse: collapse;">
            <thead>
                <tr>
                    <th style="padding: 10px; border-bottom: 1px solid #ddd;">STT</th>
                    <th style="padding: 10px; border-bottom: 1px solid #ddd;">Hình ảnh</th>
                    <th style="padding: 10px; border-bottom: 1px solid #ddd;">Tên sản phẩm</th>
                    <th style="padding: 10px; border-bottom: 1px solid #ddd;">Danh mục</th>
                    <th style="padding: 10px; border-bottom: 1px solid #ddd;">Giá</th>
                    <th style="padding: 10px; border-bottom: 1px solid #ddd;">Hành động</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listprod}" var="prod" varStatus="STT">
                    <tr>
                        <td style="padding: 10px; border-bottom: 1px solid #eee;">${STT.index+1}</td>
                        <td style="padding: 10px; border-bottom: 1px solid #eee;">
                            <c:if test="${prod.image != null && prod.image.startsWith('http')}">
                                <c:url value="${prod.image}" var="imgUrl"></c:url>
                            </c:if>
                            <c:if test="${prod.image == null || !prod.image.startsWith('http')}">
                                <c:url value="/image?fname=${prod.image}" var="imgUrl"></c:url>
                            </c:if>
                            <img height="100" src="${imgUrl}" alt="${prod.productName}" />
                        </td>
                        <td style="padding: 10px; border-bottom: 1px solid #eee;">${prod.productName}</td>
                        <td style="padding: 10px; border-bottom: 1px solid #eee;">${prod.category.categoryname}</td>
                        <td style="padding: 10px; border-bottom: 1px solid #eee;">${prod.price}</td>
                        <td class="action-links" style="padding: 10px; border-bottom: 1px solid #eee;">
                            <a href="<c:url value='/admin/product/edit?id=${prod.productId}'/>" style="color: blue; text-decoration: none;">Sửa</a> | 
                            <a href="<c:url value='/admin/product/delete?id=${prod.productId}'/>" onclick="return confirm('Bạn có chắc chắn muốn xóa?');" style="color: red; text-decoration: none;">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="/views/admin/includes/footer.jsp" />
