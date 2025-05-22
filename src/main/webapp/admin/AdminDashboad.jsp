<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - Recipe Haven</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">

    <!-- Add Bootstrap CSS for navbar styling (since your navbar uses bootstrap classes) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: #f0f2f5;
            color: #333;
        }

        .container {
            width: 100%;
            max-width: 1100px;
            margin: 50px auto;
            padding: 20px;
        }

        h1 {
            text-align: center;
            font-size: 36px;
            font-weight: 700;
            margin-bottom: 50px;
            color: #2c3e50;
        }

        .dashboard-grid {
            display: grid;
            grid-template-columns: 1fr;
            row-gap: 25px;
        }

        .card {
            background-color: #ffffff;
            border-radius: 16px;
            padding: 40px;
            text-align: center;
            font-size: 22px;
            font-weight: 600;
            color: #1a1a1a;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
            transition: all 0.3s ease;
            cursor: pointer;
            position: relative;
        }

        .card:hover {
            background-color: #eaf4ff;
            transform: translateY(-5px);
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.15);
        }

        .card::after {
            content: '';
            display: block;
            height: 4px;
            width: 100%;
            background: linear-gradient(to right, #00c6ff, #0072ff);
            position: absolute;
            bottom: 0;
            left: 0;
            border-bottom-left-radius: 16px;
            border-bottom-right-radius: 16px;
        }

        @media (min-width: 768px) {
            .dashboard-grid {
                grid-template-columns: repeat(2, 1fr);
                column-gap: 25px;
            }
        }

        @media (min-width: 1024px) {
            .dashboard-grid {
                grid-template-columns: repeat(2, 1fr);
                column-gap: 40px;
            }

            .card {
                font-size: 24px;
                padding: 50px;
            }
        }

        footer.bg-light {
            margin-top: 50px;
        }


        /* === ADDED STYLES TO REDUCE NAVBAR AND FOOTER HEIGHT === */

        /* Navbar height adjustment */
        .navbar {
            padding-top: 0.25rem;   /* smaller vertical padding */
            padding-bottom: 0.25rem;
            min-height: 40px;       /* reduced min-height */
        }

        .navbar-brand {
            padding-top: 0;
            padding-bottom: 0;
            line-height: 40px;      /* vertically center brand */
            font-size: 1.25rem;
        }

        .nav-link {
            padding-top: 0.25rem;
            padding-bottom: 0.25rem;
            font-size: 0.9rem;
        }

        /* Footer height adjustment */
        footer.bg-light {
            padding-top: 0.5rem;   /* reduce vertical padding */
            padding-bottom: 0.5rem;
            font-size: 0.9rem;
        }

    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/admin/AdminDashboard.jsp">TASTE OF NEPAL (Admin)</a>
        
        <form action="${pageContext.request.contextPath}/LogoutController" method="post" class="ms-auto m-0 p-0">
            <button type="submit" class="btn btn-link text-danger p-0 m-0" style="text-decoration: none;">Logout</button>
        </form>
    </div>
</nav>



   <!-- Main content -->
<div class="container">
    <h1>🍽️ Admin Dashboard</h1>

 <div class="dashboard-grid">
    <div class="card" onclick="location.href='${pageContext.request.contextPath}/admin/recipe-list'">
        📖 Manage Recipes
    </div>
    <div class="card" onclick="location.href='${pageContext.request.contextPath}/admin/add-recipe.jsp'">
        ➕ Add Recipe
    </div>
    <div class="card" onclick="location.href='${pageContext.request.contextPath}/admin/user-list'">
        👤 Manage Users
    </div>
    
    <div class="card" onclick="location.href='${pageContext.request.contextPath}/admin/review-list'">
        📝 Manage Reviews
    </div>
</div>

   


    <!-- Footer -->
    <footer class="bg-light mt-5 py-3">
        <div class="container text-center">
            <p class="mb-0">2025 Taste of Nepal. Built with love in Nepal.</p>
        </div>
    </footer>

    <!-- Bootstrap JS (for navbar toggling) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
