<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add Recipe - Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script>
        function addIngredientRow() {
            const container = document.getElementById("ingredients-container");
            const row = document.createElement("div");
            row.classList.add("row", "mb-2");

            row.innerHTML = `
                <div class="col-md-6">
                    <input type="text" class="form-control" name="ingredientItem" placeholder="Ingredient Name" required>
                </div>
                <div class="col-md-4">
                    <input type="text" class="form-control" name="ingredientQnty" placeholder="Quantity" required>
                </div>
                <div class="col-md-2">
                    <button type="button" class="btn btn-danger" onclick="this.parentElement.parentElement.remove()">X</button>
                </div>
            `;
            container.appendChild(row);
        }
    </script>
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2 class="mb-4">Add New Recipe</h2>

    <c:if test="${not empty successMessage}">
        <div class="alert alert-success">${successMessage}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/admin/add-recipe" method="post" enctype="multipart/form-data">
        <div class="mb-3">
            <label>Name:</label>
            <input type="text" name="name" class="form-control" required>
        </div>

        <div class="mb-3">
            <label>Category:</label>
            <input type="text" name="category" class="form-control">
        </div>

        <div class="mb-3">
            <label>Upload Image:</label>
            <input type="file" name="image" accept="image/*" class="form-control">
        </div>

        <div class="mb-3">
            <label>Preparation Time (minutes):</label>
            <input type="number" name="prep_time" class="form-control" required>
        </div>

        <div class="mb-3">
            <label>Additional Time (minutes):</label>
            <input type="number" name="additional_time" class="form-control" required>
        </div>

        <div class="mb-3">
            <label>Total Time (minutes):</label>
            <input type="number" name="total_time" class="form-control" required>
        </div>

        <div class="mb-3">
            <label>Serving:</label>
            <input type="number" name="serving" class="form-control" required>
        </div>

        <div class="mb-3">
            <label>Yield Description:</label>
            <input type="text" name="yield_description" class="form-control">
        </div>

        <div class="mb-3">
            <label>Ingredients:</label>
            <div id="ingredients-container">
                <!-- Initial row -->
                <div class="row mb-2">
                    <div class="col-md-6">
                        <input type="text" class="form-control" name="ingredientItem" placeholder="Ingredient Name" required>
                    </div>
                    <div class="col-md-4">
                        <input type="text" class="form-control" name="ingredientQnty" placeholder="Quantity" required>
                    </div>
                    <div class="col-md-2">
                        <button type="button" class="btn btn-success" onclick="addIngredientRow()">+</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="mb-3">
            <label>Nutrition Facts:</label>
            <textarea name="nutrition" class="form-control" rows="3" required></textarea>
        </div>

        <div class="mb-3">
            <label>Cooking Guide:</label>
            <textarea name="guide" class="form-control" rows="4" required></textarea>
        </div>

        <button type="submit" class="btn btn-primary">Save Recipe</button>
    </form>
</div>
</body>
</html>
