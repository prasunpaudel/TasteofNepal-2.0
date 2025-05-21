<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${recipe.name} - Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<jsp:include page="navbar.jsp"/>

<div class="container mt-5">
    <h2>${recipe.name}</h2>
    <img src="${pageContext.request.contextPath}/${recipe.imagePath}" class="img-fluid rounded mb-4" style="max-height: 300px;">

    <div class="row mb-4">
        <div class="col-md-6">
            <p><strong>Category:</strong> ${recipe.category}</p>
            <p><strong>Prep Time:</strong> ${recipe.prepTime} min</p>
            <p><strong>Additional Time:</strong> ${recipe.additionalTime} min</p>
            <p><strong>Total Time:</strong> ${recipe.totalTime} min</p>
            <p><strong>Serving:</strong> ${recipe.serving}</p>
            <p><strong>Yield:</strong> ${recipe.yieldDescription}</p>
        </div>
        <div class="col-md-6">
            <h5>Nutrition Facts</h5>
            <p>${nutrition.details}</p>

            <h5>Guide / Instructions</h5>
            <p>${guide.steps}</p>
        </div>
    </div>

    <h4>Ingredients</h4>
    <ul>
        <c:forEach var="i" items="${ingredients}">
            <li>${i.items} – ${i.qnty}</li>
        </c:forEach>
    </ul>

    <h4 class="mt-5">User Reviews</h4>
    <c:forEach var="r" items="${reviews}">
        <div class="border rounded p-3 mb-2 bg-light">
            <strong>User ID ${r.userId}:</strong>
            <p>${r.description}</p>
        </div>
    </c:forEach>

    <c:if test="${not empty sessionScope.userId}">
        <h5 class="mt-4">Leave a Review</h5>
        <form method="post" action="${pageContext.request.contextPath}/submit-review">
            <input type="hidden" name="recipeId" value="${recipe.id}"/>
            <input type="hidden" name="userId" value="${sessionScope.userId}"/>
            <div class="mb-3">
                <textarea name="description" class="form-control" rows="3" required placeholder="Write your review..."></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Submit Review</button>
        </form>
    </c:if>
    <c:if test="${empty sessionScope.userId}">
        <p class="text-muted mt-3">Please <a href="${pageContext.request.contextPath}/pages/client/login.jsp">login</a> to leave a review.</p>
    </c:if>
</div>

<jsp:include page="footer.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
