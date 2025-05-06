<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.tasteofnepal.model.Recipe" %>
<%
    Recipe recipe = (Recipe) request.getAttribute("recipe");
    boolean isEdit = recipe != null;
%>
<html>
<head>
    <title><%= isEdit ? "Edit" : "Add" %> Recipe</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fff9f0;
        }

        h2 {
            color: #333;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            max-width: 500px;
            margin: auto;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }

        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        input[type="submit"] {
            background-color: #ff9f1c;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #e38800;
        }
    </style>
</head>
<body>
<%@ include file="header.jspf" %>
<h2><%= isEdit ? "Edit" : "Add New" %> Recipe</h2>
<form action="recipes" method="get">
    <input type="hidden" name="action" value="<%= isEdit ? "update" : "insert" %>"/>
    <% if (isEdit) { %>
        <input type="hidden" name="id" value="<%= recipe.getId() %>"/>
    <% } %>
    Name: <input type="text" name="name" value="<%= isEdit ? recipe.getName() : "" %>"/><br/>
    Prep Time: <input type="number" name="prep_time" value="<%= isEdit ? recipe.getPrepTime() : "" %>"/><br/>
    Additional Time: <input type="number" name="additional_time" value="<%= isEdit ? recipe.getAdditionalTime() : "" %>"/><br/>
    Total Time: <input type="number" name="total_time" value="<%= isEdit ? recipe.getTotalTime() : "" %>"/><br/>
    Serving: <input type="number" name="serving" value="<%= isEdit ? recipe.getServing() : "" %>"/><br/>
    Yield Description: <input type="text" name="yield_description" value="<%= isEdit ? recipe.getYieldDescription() : "" %>"/><br/>
    <input type="submit" value="<%= isEdit ? "Update" : "Add" %>"/>
</form>
<%@ include file="footer.jspf" %>
</body>
</html>
