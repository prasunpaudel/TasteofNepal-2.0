<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/client/home">
            <img src="${pageContext.request.contextPath}/image/logo.png" alt="Logo" style="height: 40px;">
            Taste of Nepal
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">

                <!-- Always visible -->
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/client/home">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/client/about.jsp">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/client/contact.jsp">Contact</a>
                </li>
                <!-- Admin links -->
                <c:if test="${sessionScope.userWithSession != null && sessionScope.userWithSession.role == 'admin'}">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/recipe-list">Recipes</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/user-list">Users</a>
                    </li>
                </c:if>

                <!-- Login/Register or User Profile + Logout -->
                <c:choose>
                    <c:when test="${empty sessionScope.userWithSession}">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/pages/login.jsp">Login</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/pages/register.jsp">Register</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item d-flex align-items-center">
                            <a class="nav-link" href="${pageContext.request.contextPath}/client/user-profile.jsp">
                                ${sessionScope.userWithSession.name}
                            </a>
                        </li>
                        <li class="nav-item d-flex align-items-center">
                            <form action="${pageContext.request.contextPath}/LogoutController" method="post" class="m-0">
                                <button type="submit" class="btn btn-link nav-link text-danger px-2" style="text-decoration: none;">Logout</button>
                            </form>
                        </li>
                    </c:otherwise>
                </c:choose>

            </ul>
        </div>
    </div>
</nav>
