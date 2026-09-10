<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        body { display: flex; height: 100vh; background-color: #f4f6f9; overflow: hidden; }
        
        /* Sidebar */
        .sidebar { width: 250px; background-color: #0088ff; color: white; display: flex; flex-direction: column; overflow-y: auto;}
        .sidebar-header { padding: 15px 20px; font-size: 28px; font-weight: bold; border-bottom: 1px solid rgba(255,255,255,0.1); text-align: left; }
        .user-panel { padding: 20px; text-align: center; border-bottom: 1px solid rgba(255,255,255,0.1); }
        .user-panel img { width: 90px; height: 90px; border-radius: 50%; object-fit: cover; margin-bottom: 10px; border: 2px solid white; background-color: white;}
        .user-panel p { font-size: 14px; }
        
        /* Menu */
        .menu { list-style: none; padding: 0; margin-top: 10px; }
        .menu li { margin-bottom: 0; }
        .menu > li > a { display: block; padding: 15px 20px; color: white; text-decoration: none; font-size: 16px; display: flex; align-items: center; gap: 12px; }
        .menu > li > a:hover { background-color: #0077e6; }
        .menu > li > a.active { background-color: #ff0000; }
        
        /* Submenu Active Styles */
        .menu > li.active-group > a { background-color: #1a1a1a; }
        
        .submenu { list-style: none; padding: 10px 0 10px 45px; background-color: #0088ff; }
        .menu > li.active-group .submenu { display: block; background-color: #0088ff; }
        .submenu a { display: block; padding: 8px 15px; color: white; text-decoration: none; font-size: 14px; position: relative; }
        .submenu a::before { content: ""; position: absolute; left: -15px; top: 50%; width: 12px; height: 1px; background: rgba(255,255,255,0.5); }
        .submenu a::after { content: ""; position: absolute; left: -15px; top: -15px; width: 1px; height: calc(50% + 15px); background: rgba(255,255,255,0.5); }
        .submenu li:first-child a::after { height: calc(50% + 8px); top: -8px; }
        .submenu a:hover, .submenu a.active { color: #fff; text-decoration: underline; }
        
        /* Main Content */
        .main-content { flex: 1; display: flex; flex-direction: column; overflow: hidden; }
        .topbar { background-color: #0088ff; color: white; padding: 12px 20px; display: flex; justify-content: flex-end; align-items: center; gap: 15px; height: 60px;}
        .topbar span { font-size: 15px; }
        .btn-logout { background-color: #ff4d4d; color: white; border: none; padding: 6px 12px; border-radius: 4px; cursor: pointer; text-decoration: none; font-size: 14px; display: inline-block; }
        .btn-logout:hover { background-color: #ff1a1a; }
        
        /* Content Area */
        .content-wrapper { flex: 1; padding: 20px; overflow-y: auto; background-color: #f8f9fa; }
        .page-header { background: white; padding: 20px 25px; border-bottom: 1px solid #ddd; margin: -20px -20px 20px -20px; box-shadow: 0 1px 3px rgba(0,0,0,0.05); }
        .page-header h2 { color: #e60000; margin-bottom: 5px; font-weight: 500; font-size: 24px; }
        .page-header p { color: #666; font-size: 14px; }
        
        /* Card / Table */
        .card { background: white; border: 1px solid #ddd; border-radius: 4px; box-shadow: 0 1px 2px rgba(0,0,0,0.05); margin-bottom: 20px;}
        .card-header { padding: 12px 15px; border-bottom: 1px solid #ddd; background-color: #f9f9f9; font-size: 14px; color: #333; }
        .card-body { padding: 15px; }
        
        .controls { display: flex; justify-content: space-between; margin-bottom: 15px; align-items: center; }
        .controls select, .controls input { padding: 5px; border: 1px solid #ccc; border-radius: 3px; font-size: 13px; }
        
        .table { width: 100%; border-collapse: collapse; font-size: 14px; }
        .table th, .table td { border: 1px solid #ddd; padding: 10px; text-align: left; vertical-align: middle;}
        .table th { background-color: #fff; font-weight: 600; color: #333; }
        .table td { background-color: #fff; }
        .table img { max-width: 120px; height: auto; border-radius: 5px; }
        
        .action-links a { color: #0088ff; text-decoration: none; margin: 0 3px;}
        .action-links a:hover { text-decoration: underline; }
        
        /* Form styling */
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 8px; font-weight: 500; font-size: 14px;}
        .form-control { width: 100%; padding: 8px 12px; border: 1px solid #ccc; border-radius: 4px; font-size: 14px; }
        .form-control:focus { outline: none; border-color: #0088ff; }
        
        .radio-group { display: flex; gap: 20px; align-items: center; margin-bottom: 15px; }
        .radio-group label { margin-bottom: 0; font-weight: normal; display: flex; align-items: center; gap: 5px; cursor: pointer;}
        
        .btn { padding: 8px 16px; border-radius: 4px; text-decoration: none; font-size: 14px; display: inline-block; cursor: pointer; border: none; font-weight: 500;}
        .btn-primary { background-color: #0088ff; color: white; }
        .btn-primary:hover { background-color: #0066cc; }
        .btn-success { background-color: #28a745; color: white; }
        .btn-success:hover { background-color: #218838; }
        .btn-danger { background-color: #dc3545; color: white; }
        .btn-danger:hover { background-color: #c82333; }
        .btn-secondary { background-color: #6c757d; color: white; }
        
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-header">
            Dashboard
        </div>
        <div class="user-panel">
            <img src="https://ui-avatars.com/api/?name=Nguyen+Xuan+Huy&background=0D8ABC&color=fff&size=128" alt="User Image">
            <p>Bạn là Admin</p>
        </div>
        <ul class="menu">
            <li>
                <a href="<c:url value='/admin/dashboard'/>" class="${activePage == 'dashboard' ? 'active' : ''}">
                    <i class="fas fa-tachometer-alt"></i> Dashboard
                </a>
            </li>
            <li class="has-submenu ${activePage == 'category' ? 'active-group' : ''}">
                <a href="#" onclick="toggleSubmenu(event, this)">
                    <i class="fas fa-folder-open"></i> Quản lý Danh mục
                </a>
                <ul class="submenu" style="${activePage == 'category' ? 'display:block;' : 'display:none;'}">
                    <li><a href="<c:url value='/admin/category/add'/>" class="${activeSubPage == 'add-category' ? 'active' : ''}">Thêm danh mục mới</a></li>
                    <li><a href="<c:url value='/admin/categories'/>" class="${activeSubPage == 'list-category' ? 'active' : ''}">Danh sách danh mục</a></li>
                </ul>
            </li>
            <li>
                <a href="<c:url value='/admin/products'/>" class="${activePage == 'product' ? 'active' : ''}">
                    <i class="fas fa-desktop"></i> Quản lý sản phẩm
                </a>
            </li>
            <li>
                <a href="<c:url value='#'/>" class="${activePage == 'account' ? 'active' : ''}">
                    <i class="fas fa-qrcode"></i> Quản lý tài khoản
                </a>
            </li>
        </ul>
    </div>
    
    <script>
        function toggleSubmenu(e, element) {
            e.preventDefault();
            const li = element.parentElement;
            const submenu = li.querySelector('.submenu');
            
            if (submenu.style.display === 'block') {
                submenu.style.display = 'none';
                li.classList.remove('active-group');
            } else {
                submenu.style.display = 'block';
                li.classList.add('active-group');
            }
        }
    </script>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Topbar -->
        <div class="topbar">
            <span>Xin chào Nguyễn Xuân Huy</span>
            <a href="<c:url value='/logout'/>" class="btn-logout">Đăng xuất</a>
        </div>

        <!-- Content Wrapper -->
        <div class="content-wrapper">
