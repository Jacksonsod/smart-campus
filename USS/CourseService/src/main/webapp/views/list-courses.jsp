<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Academic Catalog</title>
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
                <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/courses">Catalog</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/views/add-course.jsp">Add Course</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container main-content">
    <div class="glass-card">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="fw-bold text-primary m-0">Course Catalog</h2>
            <a href="${pageContext.request.contextPath}/courses?format=json" target="_blank" class="btn btn-sm btn-outline-secondary">JSON API</a>
        </div>
        <table class="table table-hover align-middle">
            <thead>
            <tr>
                <th>Code</th>
                <th>Module Name</th>
                <th>Credits</th>
                <th>Lecturer</th>
                <th class="text-center">Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="c" items="${courses}">
                <tr>
                    <td><span class="badge bg-primary-subtle text-primary border px-3 py-2">${c.courseCode}</span></td>
                    <td class="fw-semibold">${c.courseName}</td>
                    <td>${c.credits} CR</td>
                    <td><small class="text-muted">ID: ${c.lecturerId}</small></td>
                    <td class="text-center">
                        <a href="courses?action=edit&id=${c.id}" class="btn btn-sm btn-warning me-2">Update</a>
                        <a href="courses?action=delete&id=${c.id}" class="btn btn-sm btn-danger" onclick="return confirm('Delete this course?')">Delete</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>