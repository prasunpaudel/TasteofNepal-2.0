<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Welcome | Taste of Nepal</title>

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
    .logout-btn {
      position: absolute;
      top: 20px;
      right: 20px;
    }
  </style>
</head>
<body>

<%
    String successMessage = (String) session.getAttribute("successMessage");
    if (successMessage != null) {
        session.removeAttribute("successMessage");
        request.setAttribute("successMessage", successMessage);
    }
%>

<!-- Logout Button -->
<div class="logout-btn">
  <form action="${pageContext.request.contextPath}/LogoutController" method="post">
    <button type="submit" class="btn btn-outline-dark btn-sm">Logout</button>
  </form>
</div>

<div class="container mt-5">
    <c:if test="${not empty successMessage}">
        <div class="alert alert-success alert-dismissible fade show text-center" role="alert">
            ${successMessage}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>

    <div class="row">
        <div class="col-12 text-center">
            <h1>
                Welcome, <c:out value="${sessionScope.userWithSession.name}" />!
            </h1>
            <p class="lead">
                Welcome to <strong>Taste of Nepal</strong>. We are glad to have you here. 
                Explore the products and services we offer!
            </p>
        </div>
    </div>

    <!-- User Role -->
    <div class="row mt-3">
        <div class="col-12 text-center">
            <p>Your Role: <strong><c:out value="${sessionScope.userWithSession.role}" /></strong></p>
        </div>
    </div>
</div>

<!-- Bootstrap Bundle JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Optional Auto-Hide Script -->
<script>
  setTimeout(() => {
    const alert = document.querySelector('.alert');
    if (alert) {
      const bsAlert = bootstrap.Alert.getOrCreateInstance(alert);
      bsAlert.close();
    }
  }, 3000);
</script>

</body>
</html>
