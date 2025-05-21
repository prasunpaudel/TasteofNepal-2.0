<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="navbar.jsp"/>
<div class="container mt-5">
    <h2>Edit User</h2>
    <form method="post" action="${pageContext.request.contextPath}/admin/edit-user">
        <input type="hidden" name="id" value="${user.id}">
        <div class="mb-3">
            <label>Name:</label>
            <input type="text" name="name" class="form-control" value="${user.name}" required>
        </div>
        <div class="mb-3">
            <label>Email:</label>
            <input type="email" name="email" class="form-control" value="${user.email}" required>
        </div>
        <div class="mb-3">
            <label>Role:</label>
            <select name="role" class="form-control">
                <option value="user" ${user.role == 'user' ? 'selected' : ''}>User</option>
                <option value="admin" ${user.role == 'admin' ? 'selected' : ''}>Admin</option>
            </select>
        </div>
        <button type="submit" class="btn btn-success">Update User</button>
        <a href="${pageContext.request.contextPath}/admin/user-list" class="btn btn-secondary">Cancel</a>
    </form>
</div>
</body>
</html>
