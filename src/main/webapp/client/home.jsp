<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Taste of Nepal</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #fff5e6;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .food-card {
            border: none;
            border-radius: 10px;
            overflow: hidden;
            transition: transform 0.3s;
            margin-bottom: 20px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            position: relative;
        }
        .food-card:hover {
            transform: translateY(-5px);
        }
        .food-image {
            height: 150px;
            object-fit: cover;
        }
        .food-title {
            font-weight: 600;
            font-size: 0.9rem;
            text-align: center;
            padding: 8px;
            margin-bottom: 0;
        }
        .stretched-link {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            z-index: 1;
        }
    </style>
</head>
<body>

<jsp:include page="navbar.jsp"/>

<div class="container mt-4">
    <div class="featured-section mt-4 mb-4 d-flex bg-light p-4 rounded">
        <div class="featured-image w-50 pe-3">
            <img src="${pageContext.request.contextPath}/image/food-items/Momo.avif" alt="Featured Dish" class="img-fluid w-100 h-100">
        </div>
        <div class="featured-text nepali-text d-flex align-items-center justify-content-center w-50 text-center fw-bold fs-4">
            हाम्रो भान्साबाट तपाईंको भान्सासम्म
        </div>
    </div>

    <!-- Dynamic Category Sections -->
    <c:forEach var="category" items="${categoryMap}">
        <h2 class="section-title text-dark fw-bold">${category.key}</h2>
        <div class="row">
            <c:forEach var="recipe" items="${category.value}">
                <div class="col-md-4 col-sm-6">
                    <div class="card food-card">
                        <img src="${pageContext.request.contextPath}/${recipe.imagePath}" class="card-img-top food-image" alt="${recipe.name}">
                        <div class="card-body p-2">
                            <p class="food-title">${recipe.name}</p>
                            <a href="${pageContext.request.contextPath}/client/see-full-details?id=${recipe.id}" class="stretched-link"></a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:forEach>

    <!-- Optional Seasonal Section -->
    <div class="featured-section mt-5 mb-4 d-flex bg-light p-4 rounded">
        <div class="featured-text nepali-text d-flex align-items-center justify-content-center w-50 text-center fw-bold fs-4">
            रूचिका खाद्यहरू<br>सिजनअनुसार तरिकाले<br>पूरा गर्दै
        </div>
        <div class="featured-image w-50 ps-3">
            <img src="${pageContext.request.contextPath}/image/food-items/seasonal.jpg" alt="Seasonal Food" class="img-fluid w-100 h-100">
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
