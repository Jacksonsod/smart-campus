<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register Course</title>
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
                <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/views/add-course.jsp">Add Course</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container main-content">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="glass-card">
                <h3 class="fw-bold text-primary mb-4">Register New Course</h3>
                <form action="${pageContext.request.contextPath}/courses" method="post">
                    <div class="mb-3">
                        <label class="form-label small fw-bold">Course Code</label>
                        <input type="text" name="courseCode" class="form-control" placeholder="e.g. BIT301" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label small fw-bold">Module Name</label>
                        <input type="text" name="courseName" class="form-control" required>
                    </div>
                    <div class="row mb-3">
                        <div class="col"><label class="form-label small fw-bold">Credits</label><input type="number" name="credits" class="form-control" required></div>
                        <div class="col"><label class="form-label small fw-bold">Dept ID</label><input type="number" name="deptId" class="form-control" required></div>
                    </div>
                    <div class="mb-4"><label class="form-label small fw-bold">Lecturer ID</label><input type="number" name="lecturerId" class="form-control" required></div>
                    <button type="submit" class="btn btn-primary btn-lg w-100 fw-bold">Save Course</button>
                </form>
                <c:if test="${not empty error}">
                    <div class="alert alert-danger d-flex align-items-center" role="alert">
                        <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
                        <div>
                                ${error}
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</div>
</body>
</html>