<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>SmartCampus | Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-custom">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">SMARTCAMPUS</a>
        <div class="collapse navbar-collapse justify-content-end">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/courses">Catalog</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/views/add-course.jsp">Add Course</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container main-content text-center">
    <div class="glass-card mx-auto" style="max-width: 800px;">
        <h1 class="display-5 fw-bold text-primary mb-3">Course Management Service</h1>
        <p class="text-muted mb-5">Group 4 Microservice. Centralized management of academic modules, credits, and inter-service assignments.</p>
        <div class="row g-4">
            <div class="col-md-6">
                <a href="courses" class="btn btn-primary btn-lg w-100 py-4">Explore Catalog</a>
            </div>
            <div class="col-md-6">
                <a href="views/add-course.jsp" class="btn btn-success btn-lg w-100 py-4 text-white">Register New Course</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>