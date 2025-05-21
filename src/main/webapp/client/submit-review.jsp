<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Submit Review - Taste of Nepal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .section-header {
            background-color: #fdf0d5;
            padding: 60px 20px;
            text-align: center;
        }
        .section-header h1 {
            font-size: 2.5rem;
            color: #a0522d;
        }
    </style>
</head>
<body>

<jsp:include page="navbar.jsp"/>

<div class="section-header">
    <h1>Share Your Experience</h1>
    <p>Your feedback helps others discover real Nepali taste!</p>
</div>

<div class="container py-5">
    <c:if test="${empty sessionScope.userId}">
        <div class="alert alert-warning text-center">
            Please <a href="${pageContext.request.contextPath}/pages/client/login.jsp">log in</a> to submit a review.
        </div>
    </c:if>

    <c:if test="${not empty sessionScope.userId}">
        <form method="post" action="${pageContext.request.contextPath}/submit-review" class="shadow p-4 bg-white rounded">
            <div class="mb-3">
                <label class="form-label">Recipe ID</label>
                <input type="number" class="form-control" name="recipeId" required placeholder="Enter Recipe ID">
            </div>
            <input type="hidden" name="userId" value="${sessionScope.userId}">
            <div class="mb-3">
                <label class="form-label">Your Review</label>
                <textarea name="description" rows="5" class="form-control" required placeholder="Write something delicious..."></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Submit Review</button>
        </form>
    </c:if>
</div>

<jsp:include page="footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
