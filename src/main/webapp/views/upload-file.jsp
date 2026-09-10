<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload File Demo (Bài Tập 6)</title>
<style>
    body { font-family: Arial, sans-serif; margin: 20px; }
    h2 { color: #333; }
    .upload-container { border: 1px solid #ccc; padding: 20px; margin-bottom: 20px; border-radius: 5px; }
</style>
</head>
<body>
    <h1>Hướng dẫn upload file bằng Multipart (bt6)</h1>
    
    <div class="upload-container">
        <h2>1. Upload file lên server dùng @MultipartConfig</h2>
        <form method="post" action="${pageContext.request.contextPath}/uploadmulti" enctype="multipart/form-data">
            Select file to upload:<br />
            <input type="file" name="multiPartServlet" /><br /><br />
            Name:<br />
            <input type="text" name="name" size="100" /><br /><br />
            <input type="submit" value="Upload" />
        </form>
    </div>

    <div class="upload-container">
        <h2>2. Upload file lên server dùng thư viện Commons FileUpload</h2>
        <form method="post" action="${pageContext.request.contextPath}/uploadFile" enctype="multipart/form-data">
            Select file to upload:<br />
            <input type="file" name="uploadFile" /><br /><br />
            Name:<br />
            <input type="text" name="name" size="100" /><br /><br />
            <input type="submit" value="Upload" />
        </form>
    </div>
</body>
</html>
