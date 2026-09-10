<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="activePage" value="category" scope="request" />
<c:set var="activeSubPage" value="list-category" scope="request" />
<jsp:include page="/views/admin/includes/header.jsp" />

<div class="page-header">
    <h2>Cập nhật danh mục</h2>
    <p>Chỉnh sửa thông tin danh mục sản phẩm</p>
</div>

<div class="card" style="max-width: 600px;">
    <div class="card-header">
        Thông tin danh mục
    </div>
    <div class="card-body">
        <form action="<c:url value='/admin/category/update'/>" method="post" enctype="multipart/form-data">
            <input type="hidden" name="categoryid" value="${cate.categoryid}">
            
            <div class="form-group">
                <label for="categoryname">Tên danh mục (Category name):</label>
                <input type="text" id="categoryname" name="categoryname" value="${cate.categoryname}" class="form-control" required>
            </div>
            
            <div class="form-group">
                <label for="images">Link hình ảnh (Link images):</label>
                <input type="text" id="images" name="images" value="${cate.images}" class="form-control">
            </div>
            
            <div class="form-group">
                <label>Hình ảnh hiện tại:</label><br>
                <c:if test="${cate.images != null && cate.images.startsWith('http')}">
                    <c:url value="${cate.images }" var="imgUrl"></c:url>
                </c:if>
                <c:if test="${cate.images == null || !cate.images.startsWith('http')}">
                    <c:url value="/image?fname=${cate.images }" var="imgUrl"></c:url>
                </c:if>
                <img height="150" src="${imgUrl}" alt="${cate.categoryname}" style="border-radius: 4px; border: 1px solid #ddd; padding: 5px; margin-bottom: 10px;" />
            </div>
            
            <div class="form-group">
                <label for="images1">Tải ảnh mới (Upload new images):</label>
                <input type="file" id="images1" name="images1" class="form-control">
            </div>
            
            <div class="form-group">
                <label>Trạng thái (Status):</label>
                <div class="radio-group">
                    <label>
                        <input type="radio" name="status" value="1" ${cate.status==1?'checked':'' }>
                        Hoạt động
                    </label>
                    <label>
                        <input type="radio" name="status" value="0" ${cate.status!=1?'checked':'' }>
                        Khóa
                    </label>
                </div>
            </div>
            
            <div style="margin-top: 20px;">
                <button type="submit" class="btn btn-primary">Cập nhật (Update)</button>
                <a href="<c:url value='/admin/categories'/>" class="btn btn-secondary">Hủy bỏ</a>
            </div>
        </form>
    </div>
</div>

<jsp:include page="/views/admin/includes/footer.jsp" />