<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Edit Recipe</title>
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
<body>
<div class="container mt-5">
    <h2>Edit Recipe</h2>

    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">${errorMessage}</div>
    </c:if>

    <form method="post" action="${pageContext.request.contextPath}/admin/edit-recipe">
        <input type="hidden" name="id" value="${recipe.id}"/>

        <div class="mb-3">
            <label>Name:</label>
            <input type="text" name="name" value="${recipe.name}" class="form-control" required>
        </div>

        <div class="mb-3">
            <label>Category:</label>
            <input type="text" name="category" value="${recipe.category}" class="form-control">
        </div>

        <div class="mb-3">
            <label>Preparation Time:</label>
            <input type="number" name="prep_time" value="${recipe.prepTime}" class="form-control">
        </div>

        <div class="mb-3">
            <label>Additional Time:</label>
            <input type="number" name="additional_time" value="${recipe.additionalTime}" class="form-control">
        </div>

        <div class="mb-3">
            <label>Total Time:</label>
            <input type="number" name="total_time" value="${recipe.totalTime}" class="form-control">
        </div>

        <div class="mb-3">
            <label>Serving:</label>
            <input type="number" name="serving" value="${recipe.serving}" class="form-control">
        </div>

        <div class="mb-3">
            <label>Yield Description:</label>
            <input type="text" name="yield_description" value="${recipe.yieldDescription}" class="form-control">
        </div>

        <div class="mb-3">
            <label>Ingredients:</label>
            <div id="ingredients-container">
                <c:forEach var="i" items="${ingredients}">
                    <div class="row mb-2">
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="ingredientItem" value="${i.items}" required>
                        </div>
                        <div class="col-md-4">
                            <input type="text" class="form-control" name="ingredientQnty" value="${i.qnty}" required>
                        </div>
                        <div class="col-md-2">
                            <button type="button" class="btn btn-danger" onclick="this.parentElement.parentElement.remove()">X</button>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <button type="button" class="btn btn-sm btn-success mt-2" onclick="addIngredientRow()">+ Add Ingredient</button>
        </div>

        <div class="mb-3">
            <label>Nutrition Facts:</label>
            <textarea name="nutrition" class="form-control" rows="3" required>${nutrition.details}</textarea>
        </div>

        <div class="mb-3">
            <label>Guide/Instructions:</label>
            <textarea name="guide" class="form-control" rows="4" required>${guide.steps}</textarea>
        </div>

        <button type="submit" class="btn btn-primary">Update Recipe</button>
        <a href="recipe-list" class="btn btn-secondary">Cancel</a>
    </form>
</div>
</body>
</html>
