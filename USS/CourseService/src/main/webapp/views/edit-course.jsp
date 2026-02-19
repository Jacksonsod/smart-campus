<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Course</title>
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
            </ul>
        </div>
    </div>
</nav>

<div class="container main-content">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="glass-card">
                <h3 class="fw-bold text-primary mb-4">Update Course</h3>
                <form action="${pageContext.request.contextPath}/courses" method="post">
                    <input type="hidden" name="id" value="${course.id}">

                    <div class="mb-3">
                        <label class="form-label small fw-bold">Course Code</label>
                        <input type="text" name="courseCode" class="form-control" value="${course.courseCode}" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label small fw-bold">Module Name</label>
                        <input type="text" name="courseName" class="form-control" value="${course.courseName}" required>
                    </div>
                    <div class="row mb-3">
                        <div class="col"><label class="form-label small fw-bold">Credits</label><input type="number" name="credits" class="form-control" value="${course.credits}" required></div>
                        <div class="col"><label class="form-label small fw-bold">Dept ID</label><input type="number" name="deptId" class="form-control" value="${course.deptId}" required></div>
                    </div>
                    <div class="mb-4"><label class="form-label small fw-bold">Lecturer ID</label><input type="number" name="lecturerId" class="form-control" value="${course.lecturerId}" required></div>

                    <button type="submit" class="btn btn-warning btn-lg w-100 fw-bold">Save Changes</button>
                    <a href="${pageContext.request.contextPath}/courses" class="btn btn-link w-100 mt-2 text-decoration-none text-muted">Cancel</a>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>