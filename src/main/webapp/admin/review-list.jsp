<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="navbar.jsp" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Reviews - Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .table thead th {
            background-color: #f1f1f1;
        }
        .review-desc {
            white-space: pre-wrap;
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <h2 class="mb-4">User Reviews</h2>

    <c:if test="${empty reviews}">
        <div class="alert alert-warning">No reviews found.</div>
    </c:if>

    <c:if test="${not empty reviews}">
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>#</th>
                    <th>User</th>
                    <th>Recipe</th>
                    <th>Review</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="r" items="${reviews}" varStatus="i">
                    <tr>
                        <td>${i.index + 1}</td>
                        <td>${r.userName}</td>
                        <td>${r.recipeName}</td>
                        <td class="review-desc">${r.description}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>

<jsp:include page="footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
