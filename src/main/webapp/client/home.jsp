<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Taste of Nepal - Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<jsp:include page="navbar.jsp"/>

<div class="container mt-5">
    <h2 class="mb-4">Our Nepali Recipes</h2>
    <div class="row">
        <c:forEach var="r" items="${recipes}">
            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <img src="${pageContext.request.contextPath}/${r.imagePath}" class="card-img-top" alt="${r.name}">
                    <div class="card-body">
                        <h5 class="card-title">${r.name}</h5>
                        <p class="card-text"><strong>Category:</strong> ${r.category}</p>
                        <a href="${pageContext.request.contextPath}/client/see-full-details?id=${r.id}" class="btn btn-outline-primary btn-sm">View Recipe</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<jsp:include page="footer.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
