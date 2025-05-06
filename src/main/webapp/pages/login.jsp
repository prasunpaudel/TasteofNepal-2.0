<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Taste of Nepal - Login</title>

  <!-- Bootstrap 5 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet">

  <style>
    body {
      margin: 0;
      padding: 0;
      background: #e5e5e5;
      font-family: 'Montserrat', Arial, sans-serif;
    }
    .login-wrapper {
      display: flex;
      height: 100vh;
      width: 100vw;
    }
    .login-left {
      flex: 1.1;
      background: #e5e5e5;
      display: flex;
      align-items: center;
      justify-content: flex-end;
    }
    .login-left img {
      width: 100%;
      height: 100%;
      object-fit: cover;
      border-top-left-radius: 12px;
      border-bottom-left-radius: 12px;
    }
    .login-right {
      flex: 1;
      background: #f9eddc;
      display: flex;
      align-items: center;
      justify-content: center;
      border-top-right-radius: 12px;
      border-bottom-right-radius: 12px;
    }
    .login-box {
      width: 370px;
    }
    .logo-block {
      text-align: center;
      margin-bottom: 24px;
    }
    .logo-icon {
      font-size: 2.7rem;
      margin-bottom: 5px;
    }
    .logo-text {
      font-family: serif;
      font-size: 1.6rem;
      font-weight: 700;
      line-height: 1.2;
    }
    .login-title {
      font-size: 2rem;
      font-weight: 700;
      color: #181818;
      text-align: center;
      margin-bottom: 20px;
    }
    .custom-input {
      padding: 14px 16px;
      border-radius: 30px;
      background: #e7e7e7;
      border: none;
      margin-bottom: 18px;
      font-size: 1rem;
      width: 100%;
    }
    .custom-input:focus {
      background: #e0dbdb;
      box-shadow: none;
      outline: none;
    }
    .custom-btn-dark {
      border-radius: 30px;
      padding: 14px;
      font-weight: 500;
      font-size: 1rem;
      width: 100%;
      background-color: #181818;
      color: white;
      border: none;
      margin-bottom: 10px;
      letter-spacing: 1px;
    }
    .custom-btn-dark:hover {
      background-color: #333333;
    }
    .custom-btn-outline {
      border-radius: 30px;
      padding: 14px;
      font-weight: 500;
      font-size: 1rem;
      width: 100%;
      background-color: transparent;
      color: #181818;
      border: 2px solid #181818;
      letter-spacing: 1px;
    }
    .custom-btn-outline:hover {
      background-color: #181818;
      color: white;
    }
    .forgot-link {
      display: block;
      text-align: center;
      margin-top: 12px;
      color: #636363;
      text-decoration: none;
      font-weight: 400;
    }
    @media (max-width: 1060px) {
      .login-wrapper { flex-direction: column; }
      .login-left, .login-right { width: 100%; border-radius: 0; }
    }
  </style>
</head>
<body>

<%
    String errorMessage = (String) session.getAttribute("errorMessage");
    if (errorMessage != null) {
        session.removeAttribute("errorMessage");
        request.setAttribute("errorMessage", errorMessage);
    }
%>

<div class="login-wrapper">
  <div class="login-left">
    <img src="${pageContext.request.contextPath}/image/index.jpeg" alt="Taste of Nepal" />
  </div>

  <div class="login-right">
    <form class="login-box" action="${pageContext.request.contextPath}/LoginController" method="post">
      <div class="logo-block">
        <div class="logo-icon">🍲</div>
        <div class="logo-text">TASTE OF<br>NEPAL</div>
      </div>

      <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
          ${errorMessage}
          <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
      </c:if>

      <div class="login-title">Log In</div>
      <input class="custom-input" name="email" type="email" placeholder="Email" required>
      <input class="custom-input" name="password" type="password" placeholder="Password" required>
      <button type="submit" class="custom-btn-dark">LOG IN</button>
      <a href="${pageContext.request.contextPath}/pages/register.jsp" class="forgot-link">SIGN UP</a>
      <div class="text-center mt-2">-------- OR --------</div>
      <a href="#" class="forgot-link">Forgot Password?</a>
    </form>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
