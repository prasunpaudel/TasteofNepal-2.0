<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>All Recipes</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fff9f0;
        }

        h2 {
            color: #333;
        }

        a {
            background-color: #ff9f1c;
            color: white;
            padding: 8px 12px;
            text-decoration: none;
            border-radius: 5px;
            margin-bottom: 10px;
            display: inline-block;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #ffe4b5;
        }

        td a {
            color: #0077cc;
            text-decoration: none;
        }

        td a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<%@ include file="header.jspf" %>
<h2>Recipes</h2>
<a href="recipes?action=new">Add New Recipe</a>
<table>
    <tr>
        <th>Name</th><th>Prep</th><th>Additional</th><th>Total</th><th>Serving</th><th>Yield</th><th>Actions</th>
    </tr>
    <c:forEach var="r" items="${recipes}">
        <tr>
            <td>${r.name}</td>
            <td>${r.prepTime}</td>
            <td>${r.additionalTime}</td>
            <td>${r.totalTime}</td>
            <td>${r.serving}</td>
            <td>${r.yieldDescription}</td>
            <td>
                <a href="recipes?action=edit&id=${r.id}">Edit</a> |
                <a href="recipes?action=delete&id=${r.id}">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
<%@ include file="footer.jspf" %>
</body>
</html>
