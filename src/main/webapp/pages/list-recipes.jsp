<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Recipes List - Taste of Nepal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
<div class="container my-5">
    <h1 class="mb-4 text-center">All Recipes</h1>
    <div class="mb-3 text-end">
        <a href="${pageContext.request.contextPath}/recipes/add" class="btn btn-success">Add New Recipe</a>
    </div>
    
    <table class="table table-striped table-bordered shadow-sm">
        <thead class="table-dark">
            <tr>
                <th>Name</th>
                <th>Prep Time (mins)</th>
                <th>Additional Time (mins)</th>
                <th>Total Time (mins)</th>
                <th>Serving</th>
                <th>Yield Description</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="recipe" items="${recipeList}">
            <tr>
                <td>${recipe.name}</td>
                <td>${recipe.prepTime}</td>
                <td>${recipe.additionalTime}</td>
                <td>${recipe.totalTime}</td>
                <td>${recipe.serving}</td>
                <td>${recipe.yieldDescription}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/recipes/edit?id=${recipe.id}" class="btn btn-primary btn-sm">Edit</a>
                    <a href="${pageContext.request.contextPath}/recipes/delete?id=${recipe.id}" 
                       class="btn btn-danger btn-sm" 
                       onclick="return confirm('Are you sure you want to delete this recipe?');">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
