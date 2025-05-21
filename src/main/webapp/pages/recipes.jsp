<%@ page import="com.tasteofnepal.model.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
    Recipe recipe = (Recipe) request.getAttribute("recipe");
    List<?> rawIngredients = (List<?>) request.getAttribute("ingredients");
    List<Ingredient> ingredients = new ArrayList<>();
    if (rawIngredients != null) {
        for (Object obj : rawIngredients) {
            if (obj instanceof Ingredient) {
                ingredients.add((Ingredient) obj);
            }
        }
    }
    NutritionFact nutrition = (NutritionFact) request.getAttribute("nutrition");
    Guide guide = (Guide) request.getAttribute("guide");
%>
<!DOCTYPE html>
<html>
<head>
    <title><%= recipe.getName() %></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="container mt-4">
    <h1><%= recipe.getName() %></h1>
    <p><strong>Total Time:</strong> <%= recipe.getTotalTime() %> mins</p>
    <p><strong>Serving:</strong> <%= recipe.getServing() %></p>

    <h3>Ingredients</h3>
    <ul>
        <% for (Ingredient ing : ingredients) { %>
            <li><%= ing.getItems() %> — <%= ing.getQuantity() %></li>
        <% } %>
    </ul>

    <h3>Nutrition Facts</h3>
    <p><%= nutrition.getDetails() %></p>

    <h3>Steps</h3>
    <p><%= guide.getSteps() %></p>

    <a href="recipes.jsp" class="btn btn-secondary mt-3">Back to List</a>
</body>
</html>
