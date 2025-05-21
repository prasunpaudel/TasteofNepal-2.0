<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/admin/recipe-list">TASTE OF NEPAL (Admin)</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#adminNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="adminNavbar">
            <ul class="navbar-nav ms-auto align-items-center">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/recipe-list">Recipes</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/add-recipe.jsp">Add Recipe</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/review-list">Review</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/user-list">Users</a>
                </li>
                <li class="nav-item">
                    <form action="${pageContext.request.contextPath}/LogoutController" method="post" class="nav-link p-0 m-0">
                        <button type="submit" class="btn btn-link text-danger p-0 m-0" style="text-decoration: none;">Logout</button>
                    </form>
                </li>
            </ul>
        </div>
    </div>
</nav>
