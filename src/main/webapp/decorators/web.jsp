<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><sitemesh:write property='title'/> - Online Store</title>
    
    <!-- Google Fonts: Inter -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <sitemesh:write property='head'/>
    
    <style>
        body {
            font-family: 'Inter', sans-serif;
            padding-top: 76px;
            background-color: #f5f7fb;
            color: #333;
        }
        .navbar {
            box-shadow: 0 2px 15px rgba(0,0,0,0.08);
            background-color: #ffffff !important;
            transition: all 0.3s ease;
        }
        .navbar-brand {
            font-weight: 700;
            color: #4361ee !important;
            font-size: 1.5rem;
        }
        .nav-link {
            font-weight: 500;
            color: #555 !important;
            transition: color 0.2s;
        }
        .nav-link:hover {
            color: #4361ee !important;
        }
        .btn-primary {
            background-color: #4361ee;
            border-color: #4361ee;
            border-radius: 8px;
            font-weight: 500;
            padding: 8px 20px;
            transition: all 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #3a53d0;
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(67, 97, 238, 0.3);
        }
        .footer {
            background-color: #fff;
            padding: 25px 0;
            text-align: center;
            margin-top: 50px;
            border-top: 1px solid #eaeaea;
        }
        /* Product Cards */
        .product-card {
            background: #fff;
            border: none;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.04);
            transition: all 0.3s ease;
            overflow: hidden;
            height: 100%;
        }
        .product-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 25px rgba(0,0,0,0.1);
        }
        .product-image {
            width: 100%;
            height: 220px;
            object-fit: cover;
        }
        /* Forms & Containers */
        .form-control {
            border-radius: 8px;
            padding: 12px 15px;
            border: 1px solid #e0e0e0;
        }
        .form-control:focus {
            box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.15);
            border-color: #4361ee;
        }
        .card-custom {
            border: none;
            border-radius: 15px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.05);
            background: #fff;
            padding: 30px;
        }
    </style>
</head>
<body>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg fixed-top">
        <div class="container">
            <a class="navbar-brand" href="<c:url value='/home'/>">
                <i class="fa-solid fa-store me-2"></i>E-Shop
            </a>
            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-toggle="target" aria-controls="navbarResponsive">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value='/home'/>"><i class="fa-solid fa-house me-1"></i> Trang chủ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value='/product'/>"><i class="fa-solid fa-box-open me-1"></i> Sản phẩm</a>
                    </li>
                </ul>
                <ul class="navbar-nav ms-auto align-items-center">
                    <c:if test="${empty sessionScope.account}">
                        <li class="nav-item me-2"><a class="nav-link" href="<c:url value='/login'/>">Đăng nhập</a></li>
                        <li class="nav-item"><a class="btn btn-primary btn-sm" href="<c:url value='/register'/>">Đăng ký</a></li>
                    </c:if>
                    <c:if test="${not empty sessionScope.account}">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown">
                                <i class="fa-solid fa-circle-user fs-5 me-1 align-middle"></i> ${sessionScope.account.fullName}
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end border-0 shadow">
                                <li><a class="dropdown-item" href="<c:url value='/profile'/>"><i class="fa-solid fa-user-pen me-2"></i>Hồ sơ cá nhân</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item text-danger" href="<c:url value='/logout'/>"><i class="fa-solid fa-arrow-right-from-bracket me-2"></i>Đăng xuất</a></li>
                            </ul>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Page Content -->
    <div class="container min-vh-100 pb-5">
        <sitemesh:write property='body'/>
    </div>

    <!-- Footer -->
    <footer class="footer mt-auto">
        <div class="container">
            <p class="text-muted mb-0"><i class="fa-solid fa-code"></i> &copy; 2026 Online Store Project. All rights reserved.</p>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
