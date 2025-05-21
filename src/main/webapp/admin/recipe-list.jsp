<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Recipe List - Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<!-- Include Admin Navbar -->
<jsp:include page="navbar.jsp" />

<!-- Main Content -->
<div class="container mt-5">
    <h2 class="mb-4">All Recipes</h2>

    <table class="table table-bordered">
        <thead class="table-light">
        <tr>
            <th>ID</th>
            <th>Image</th>
            <th>Name</th>
            <th>Category</th>
            <th>Total Time</th>
            <th>Servings</th>
            <th>Yield</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="r" items="${recipes}">
            <tr>
                <td>${r.id}</td>
                <td>
                    <img src="${pageContext.request.contextPath}/${r.imagePath}" width="60" height="60"/>
                </td>
                <td>${r.name}</td>
                <td>${r.category}</td>
                <td>${r.totalTime} min</td>
                <td>${r.serving}</td>
                <td>${r.yieldDescription}</td>
                <td>
                    <a class="btn btn-sm btn-warning" href="edit-recipe?id=${r.id}">Edit</a>
                    <a class="btn btn-sm btn-danger" href="delete-recipe?id=${r.id}" onclick="return confirm('Delete this recipe?')">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- Include Footer -->
<jsp:include page="footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
