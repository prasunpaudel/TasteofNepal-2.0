<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${recipe.name} - Taste of Nepal</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body { background-color: #f1ece1; font-family: 'Segoe UI', Tahoma, sans-serif; }
        .recipe-image img { width: 100%; height: auto; border-radius: 8px; }
        .recipe-details h3 { font-size: 1rem; font-weight: bold; }
        .recipe-details p, li { font-size: 0.95rem; }
        .review-box { background-color: #eaeaea; padding: 15px; border-radius: 5px; margin-bottom: 15px; }
        .add-review-btn { background-color: #4CAF50; color: white; border: none; padding: 8px 20px; }
    </style>
</head>
<body>

<jsp:include page="navbar.jsp"/>

<div class="container mt-5 mb-5">
    <div class="row">
        <!-- Image -->
        <div class="col-md-5">
            <div class="recipe-image mb-4">
                <img src="${pageContext.request.contextPath}/${recipe.imagePath}" alt="${recipe.name}">
            </div>
        </div>

        <!-- Details -->
        <div class="col-md-7">
            <div class="recipe-details">
                <h3>${recipe.name}</h3>
                <p><strong>Category:</strong> ${recipe.category}</p>
                <p><strong>Prep Time:</strong> ${recipe.prepTime} min</p>
                <p><strong>Additional Time:</strong> ${recipe.additionalTime} min</p>
                <p><strong>Total Time:</strong> ${recipe.totalTime} min</p>
                <p><strong>Serving:</strong> ${recipe.serving}</p>
                <p><strong>Yield:</strong> ${recipe.yieldDescription}</p>
                <h5 class="mt-4">Nutrition Facts</h5>
                <p>${nutrition.details}</p>
                <h5>Instructions</h5>
                <p>${guide.steps}</p>
            </div>
        </div>
    </div>

    <!-- Ingredients -->
    <div class="mt-4">
        <h4>Ingredients</h4>
        <ul>
            <c:forEach var="ing" items="${ingredients}">
                <li>${ing.items} – ${ing.qnty}</li>
            </c:forEach>
        </ul>
    </div>

    <!-- Reviews -->
    <div class="mt-5">
        <h4>User Reviews</h4>
        <c:forEach var="review" items="${reviews}">
            <div class="review-box">
                <strong>User ${review.userId}:</strong>
                <p>${review.description}</p>
            </div>
        </c:forEach>

        <!-- Submit Review -->
        <c:if test="${not empty sessionScope.userWithSession}">
            <h5 class="mt-4">Leave a Review</h5>
            <form method="post" action="${pageContext.request.contextPath}/submit-review">
                <input type="hidden" name="recipeId" value="${recipe.id}"/>
                <input type="hidden" name="userId" value="${sessionScope.userWithSession.id}"/>
                <div class="mb-3">
                    <textarea name="description" class="form-control" rows="3" required placeholder="Write your review..."></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Submit Review</button>
            </form>
        </c:if>
        <c:if test="${empty sessionScope.userWithSession}">
            <p class="text-muted mt-3">Please <a href="${pageContext.request.contextPath}/pages/login.jsp">login</a> to leave a review.</p>
        </c:if>
    </div>
</div>

<jsp:include page="footer.jsp"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
