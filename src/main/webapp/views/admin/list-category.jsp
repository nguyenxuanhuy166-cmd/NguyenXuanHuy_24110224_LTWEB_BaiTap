<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="activePage" value="category" scope="request" />
<c:set var="activeSubPage" value="list-category" scope="request" />
<jsp:include page="/views/admin/includes/header.jsp" />

<div class="page-header">
    <h2>Quản lý danh mục</h2>
    <p>Nơi bạn có thể quản lý danh mục của mình</p>
</div>

<div class="card">
    <div class="card-header">
        Danh sách danh mục
    </div>
    <div class="card-body">
        <div class="controls">
            <div>
                <select name="records">
                    <option value="10">10</option>
                    <option value="25">25</option>
                    <option value="50">50</option>
                    <option value="100">100</option>
                </select> records per page
            </div>
            <div>
                Search: <input type="text" name="search" />
            </div>
        </div>
        
        <table class="table" style="text-align: center;">
            <thead>
                <tr>
                    <th>STT</th>
                    <th>Hình ảnh</th>
                    <th>Tên danh mục</th>
                    <th>Trạng thái</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listcate}" var="cate" varStatus="STT">
                    <tr>
                        <td>${STT.index+1}</td>
                        <c:if test="${cate.images != null && cate.images.startsWith('http')}">
                            <c:url value="${cate.images }" var="imgUrl"></c:url>
                        </c:if>
                        <c:if test="${cate.images == null || !cate.images.startsWith('http')}">
                            <c:url value="/image?fname=${cate.images }" var="imgUrl"></c:url>
                        </c:if>
                        <td><img height="150" src="${imgUrl}" alt="${cate.categoryname}" /></td>
                        <td>${cate.categoryname}</td>
                        <td>
                            <c:if test="${cate.status==1}">Hoạt động</c:if>
                            <c:if test="${cate.status!=1}">Khóa</c:if>
                        </td>
                        <td class="action-links">
                            <a href="<c:url value='/admin/category/edit?id=${cate.categoryid }'/>">Sửa</a> | 
                            <a href="<c:url value='/admin/category/delete?id=${cate.categoryid }'/>" onclick="return confirm('Bạn có chắc chắn muốn xóa?');">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="/views/admin/includes/footer.jsp" />