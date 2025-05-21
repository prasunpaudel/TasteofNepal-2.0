<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>About Us - Taste of Nepal</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #fff5e6;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
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
        .about-section, .find-on, .comment-section {
            padding: 40px 20px;
            margin-top: 30px;
            background-color: #f9f4e8;
            border-radius: 10px;
        }
        .about-section p, .find-on p {
            font-size: 1rem;
            line-height: 1.6;
        }
        .team-member img {
            width: 100%;
            border-radius: 8px;
            height: 450px;
            object-fit: cover;
        }
        .team-title {
            text-align: center;
            font-weight: bold;
            margin-top: 40px;
        }
        .feature-item {
            margin-bottom: 10px;
        }
        .comment-form input, .comment-form textarea {
            margin-bottom: 15px;
            border-radius: 5px;
            border: 1px solid #ced4da;
        }
        .submit-btn {
            background-color: #ff6347;
            color: white;
            border: none;
            padding: 8px 20px;
            border-radius: 20px;
            font-weight: 500;
        }
    </style>
</head>
<body>

<jsp:include page="navbar.jsp"/>

<!-- Hero Banner -->
<div class="hero">
    <h1>About Taste of Nepal</h1>
    <p>Preserving Nepal’s rich flavors and culinary stories</p>
</div>

<!-- About Us Content -->
<div class="container about-section">
    <div class="row">
        <div class="col-md-6">
            <img src="${pageContext.request.contextPath}/image/chef.png" class="img-fluid rounded" alt="Nepali Food">
        </div>
        <div class="col-md-6">
            <p>Welcome to <strong>Taste of Nepal</strong> – your ultimate destination for authentic and traditional Nepali recipes!</p>
            <p>We are a passionate group of food lovers, home cooks, and cultural enthusiasts dedicated to preserving and sharing the rich culinary heritage of Nepal.</p>
            <p>From the comforting Dal Bhat to festive favorites like Sel Roti and Yomari, we showcase a wide range of recipes that reflect the diversity, warmth, and heart of Nepali culture.</p>
            <p>Whether you're from Nepal or just discovering its vibrant cuisine, our guides, tips, and cultural insights make it easy to enjoy these dishes.</p>
        </div>
    </div>
</div>

<!-- Meet the Team -->
<div class="container my-5">
    <h3 class="team-title text-center mb-4">Meet Our Team</h3>
    <div class="row g-4">

        <div class="col-md-4">
            <div class="team-member text-center">
                <img src="${pageContext.request.contextPath}/image/team/prasun.jpg" alt="Prasun Paudel" class="img-fluid mb-2">
                <h5 class="mt-2">Prasun Paudel</h5>
                <p>LondonMet ID: 23048876</p>
            </div>
        </div>

        <div class="col-md-4">
            <div class="team-member text-center">
                <img src="${pageContext.request.contextPath}/image/team/diman.jpg" alt="Diman Pun" class="img-fluid mb-2">
                <h5 class="mt-2">Diman Pun</h5>
                <p>LondonMet ID: 23048792</p>
            </div>
        </div>

        <div class="col-md-4">
            <div class="team-member text-center">
                <img src="${pageContext.request.contextPath}/image/team/yogesh.jpg" alt="Yogesh Raj Thapa" class="img-fluid mb-2">
                <h5 class="mt-2">Yogesh Raj Thapa</h5>
                <p>LondonMet ID: 23048967</p>
            </div>
        </div>

        <div class="col-md-4">
            <div class="team-member text-center">
                <img src="${pageContext.request.contextPath}/image/team/david.jpg" alt="David Gadal" class="img-fluid mb-2">
                <h5 class="mt-2">David Gadal</h5>
                <p>LondonMet ID: 23048790</p>
            </div>
        </div>

        <div class="col-md-4">
            <div class="team-member text-center">
                <img src="${pageContext.request.contextPath}/image/team/lovish.jpg" alt="Lovish Karki" class="img-fluid mb-2">
                <h5 class="mt-2">Lovish Karki</h5>
                <p>LondonMet ID: 23048822</p>
            </div>
        </div>

        <div class="col-md-4">
            <div class="team-member text-center">
                <img src="${pageContext.request.contextPath}/image/team/santosh.jpg" alt="Santosh Kishan" class="img-fluid mb-2">
                <h5 class="mt-2">Santosh Kishan</h5>
                <p>LondonMet ID: 23048925</p>
            </div>
        </div>

    </div>
</div>


<!-- What You’ll Find -->
<div class="container find-on">
    <h4 class="text-center mb-3">What You’ll Find on Taste of Nepal</h4>
    <div class="row">
        <div class="col-md-6 feature-item">🍛 Authentic Nepali Recipes – From Dal Bhat to Yomari</div>
        <div class="col-md-6 feature-item">👨‍🍳 Step-by-Step Cooking Guides – Easy for beginners & pros</div>
        <div class="col-md-6 feature-item">🧂 Local Ingredients & Tips – Traditional spices & tools</div>
        <div class="col-md-6 feature-item">📚 Cultural Stories – Discover food history & meaning</div>
        <div class="col-md-6 feature-item">🔥 Modern Twists – Classic recipes for global kitchens</div>
    </div>
</div>

<!-- What You’ll Get -->
<div class="container find-on">
    <h4 class="text-center mb-3">What You’ll Get from Taste of Nepal</h4>
    <div class="row">
        <div class="col-md-6 feature-item">✅ Easy-to-follow instructions for all cooking levels</div>
        <div class="col-md-6 feature-item">✅ Traditional ingredients & techniques</div>
        <div class="col-md-6 feature-item">✅ Nutritional info, serving tips, and cook times</div>
        <div class="col-md-6 feature-item">✅ A celebration of Nepal’s food heritage</div>
    </div>
</div>



<jsp:include page="footer.jsp"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
