<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="activePage" value="category" scope="request" />
<c:set var="activeSubPage" value="add-category" scope="request" />
<jsp:include page="/views/admin/includes/header.jsp" />

<div class="page-header">
    <h2>Thêm danh mục mới</h2>
    <p>Nhập thông tin để tạo một danh mục sản phẩm mới</p>
</div>

<div class="card" style="max-width: 600px;">
    <div class="card-header">
        Thông tin danh mục
    </div>
    <div class="card-body">
        <form action="<c:url value='/admin/category/insert'/>" method="post" enctype="multipart/form-data">
            
            <div class="form-group">
                <label for="categoryname">Tên danh mục (Category name):</label>
                <input type="text" id="categoryname" name="categoryname" class="form-control" required>
            </div>
            
            <div class="form-group">
                <label for="images">Link hình ảnh (Link images):</label>
                <input type="text" id="images" name="images" class="form-control">
            </div>
            
            <div class="form-group">
                <label for="images1">Tải ảnh lên (Upload images):</label>
                <input type="file" id="images1" name="images1" class="form-control">
            </div>
            
            <div class="form-group">
                <label>Trạng thái (Status):</label>
                <div class="radio-group">
                    <label>
                        <input type="radio" name="status" value="1" checked>
                        Hoạt động
                    </label>
                    <label>
                        <input type="radio" name="status" value="0">
                        Khóa
                    </label>
                </div>
            </div>
            
            <div style="margin-top: 20px;">
                <button type="submit" class="btn btn-primary">Lưu danh mục (Insert)</button>
                <a href="<c:url value='/admin/categories'/>" class="btn btn-secondary">Hủy bỏ</a>
            </div>
        </form>
    </div>
</div>

<jsp:include page="/views/admin/includes/footer.jsp" />