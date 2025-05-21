<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>About Us - Taste of Nepal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .hero {
            background: linear-gradient(to right, #ffecd2, #fcb69f);
            padding: 80px 20px;
            text-align: center;
            color: #333;
        }
        .hero h1 {
            font-size: 3rem;
            font-weight: bold;
        }
        .hero p {
            font-size: 1.2rem;
            margin-top: 10px;
        }
    </style>
</head>
<body>

<jsp:include page="navbar.jsp"/>

<div class="hero">
    <h1>About Taste of Nepal</h1>
    <p>Preserving Nepal’s rich flavors and culinary stories.</p>
</div>

<div class="container py-5">
    <div class="row">
        <div class="col-md-6">
            <img src="${pageContext.request.contextPath}/image/about-nepal.jpg" class="img-fluid rounded" alt="Nepali Food">
        </div>
        <div class="col-md-6">
            <p class="lead">
                Taste of Nepal is your guide to discovering authentic Nepali recipes — passed down through generations, now beautifully shared with the world.
            </p>
            <p>
                This platform allows food lovers, Nepali families abroad, and culinary explorers to explore, review, and share traditional dishes from every region of Nepal.
            </p>
            <p>
                We are committed to preserving the culture of cooking — one dal-bhat, momo, or sel roti at a time.
            </p>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
