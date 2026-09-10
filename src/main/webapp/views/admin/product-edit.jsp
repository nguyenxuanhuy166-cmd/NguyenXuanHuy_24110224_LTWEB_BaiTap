<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="activePage" value="product" scope="request" />
<c:set var="activeSubPage" value="edit-product" scope="request" />
<jsp:include page="/views/admin/includes/header.jsp" />

<div class="page-header">
    <h2>Sửa thông tin sản phẩm</h2>
    <p>Cập nhật thông tin cho sản phẩm</p>
</div>

<div class="card" style="max-width: 600px;">
    <div class="card-header">
        Thông tin sản phẩm
    </div>
    <div class="card-body">
        <c:if test="${not empty alert}">
            <div class="alert alert-danger" style="color: red; margin-bottom: 15px;">${alert}</div>
        </c:if>
        <form action="<c:url value='/admin/product/update'/>" method="post" enctype="multipart/form-data">
            
            <input type="hidden" name="productId" value="${prod.productId}">
            
            <div class="form-group" style="margin-bottom: 15px;">
                <label for="productName" style="display: block; margin-bottom: 5px;">Tên sản phẩm:</label>
                <input type="text" id="productName" name="productName" value="${prod.productName}" style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px;" required>
            </div>
            
            <div class="form-group" style="margin-bottom: 15px;">
                <label for="price" style="display: block; margin-bottom: 5px;">Giá sản phẩm:</label>
                <input type="number" step="0.01" id="price" name="price" value="${prod.price}" style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px;" required>
            </div>
            
            <div class="form-group" style="margin-bottom: 15px;">
                <label for="description" style="display: block; margin-bottom: 5px;">Mô tả:</label>
                <textarea id="description" name="description" rows="4" style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px;">${prod.description}</textarea>
            </div>
            
            <div class="form-group" style="margin-bottom: 15px;">
                <label for="categoryId" style="display: block; margin-bottom: 5px;">Danh mục:</label>
                <select id="categoryId" name="categoryId" style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px;" required>
                    <c:forEach items="${listcate}" var="cate">
                        <option value="${cate.categoryid}" ${prod.category.categoryid == cate.categoryid ? 'selected' : ''}>${cate.categoryname}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group" style="margin-bottom: 15px;">
                <label for="images" style="display: block; margin-bottom: 5px;">Link hình ảnh:</label>
                <input type="text" id="images" name="images" value="${prod.image}" style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px;">
            </div>
            
            <div class="form-group" style="margin-bottom: 15px;">
                <label for="images1" style="display: block; margin-bottom: 5px;">Tải ảnh lên (nếu muốn thay đổi):</label>
                <input type="file" id="images1" name="images1" style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px;">
            </div>
            
            <div style="margin-top: 20px;">
                <button type="submit" style="padding: 10px 15px; background-color: #007bff; color: white; border: none; border-radius: 4px; cursor: pointer;">Cập nhật</button>
                <a href="<c:url value='/admin/products'/>" style="padding: 10px 15px; background-color: #6c757d; color: white; text-decoration: none; border-radius: 4px; display: inline-block;">Hủy bỏ</a>
            </div>
        </form>
    </div>
</div>

<jsp:include page="/views/admin/includes/footer.jsp" />
