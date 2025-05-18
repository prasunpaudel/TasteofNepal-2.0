<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Add Recipe - Taste of Nepal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
<div class="container my-5">
    <h1 class="mb-4 text-center">Add New Recipe</h1>

    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">${errorMessage}</div>
    </c:if>

    <form method="post" action="${pageContext.request.contextPath}/recipes/add" class="mx-auto" style="max-width:600px;">
        <div class="mb-3">
            <label for="name" class="form-label">Recipe Name</label>
            <input type="text" class="form-control" id="name" name="name" required />
        </div>
        <div class="mb-3">
            <label for="prepTime" class="form-label">Preparation Time (mins)</label>
            <input type="number" class="form-control" id="prepTime" name="prepTime" required min="0" />
        </div>
        <div class="mb-3">
            <label for="additionalTime" class="form-label">Additional Time (mins)</label>
            <input type="number" class="form-control" id="additionalTime" name="additionalTime" required min="0" />
        </div>
        <div class="mb-3">
            <label for="totalTime" class="form-label">Total Time (mins)</label>
            <input type="number" class="form-control" id="totalTime" name="totalTime" required min="0" />
        </div>
        <div class="mb-3">
            <label for="serving" class="form-label">Serving</label>
            <input type="number" class="form-control" id="serving" name="serving" required min="1" />
        </div>
        <div class="mb-3">
            <label for="yieldDescription" class="form-label">Yield Description</label>
            <input type="text" class="form-control" id="yieldDescription" name="yieldDescription" required />
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-success px-5">Add Recipe</button>
            <a href="${pageContext.request.contextPath}/recipes" class="btn btn-secondary ms-2">Cancel</a>
        </div>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
