<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    com.tasteofnepal.model.User user = (com.tasteofnepal.model.User) session.getAttribute("userWithSession");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
        return;
    }
    String[] nameParts = user.getName().split(" ");
    String initials = nameParts.length > 1
        ? nameParts[0].substring(0, 1).toUpperCase() + nameParts[1].substring(0, 1).toUpperCase()
        : user.getName().substring(0, 1).toUpperCase();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Profile - <%= user.getName() %></title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f5f5f5;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .profile-wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 85vh;
            padding: 20px;
        }
        .profile-card {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            overflow: hidden;
        }
        .profile-header {
            padding: 30px 0;
            text-align: center;
            background-color: #f9f9f9;
            border-bottom: 1px solid #eee;
        }
        .avatar {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            background-color: #c2f0c2;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0 auto 15px;
        }
        .avatar-text {
            font-size: 28px;
            font-weight: bold;
            color: #333;
        }
        .username {
            font-size: 20px;
            font-weight: bold;
            color: #333;
            margin-bottom: 4px;
        }
        .role-badge {
            display: inline-block;
            background-color: #f2f2f2;
            color: #333;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 14px;
            margin-top: 5px;
        }
        .profile-body {
            padding: 20px;
        }
        .info-row {
            display: flex;
            padding: 12px 0;
            border-bottom: 1px solid #eee;
        }
        .info-label {
            width: 80px;
            color: #666;
            font-weight: bold;
        }
        .info-value {
            flex: 1;
            color: #333;
        }
        .button-row {
            display: flex;
            margin-top: 20px;
        }
        .profile-button {
            flex: 1;
            padding: 10px;
            border: none;
            background-color: #e9e9e9;
            color: #333;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.2s;
        }
        .profile-button:hover {
            background-color: #ddd;
        }
        .profile-button:first-child {
            border-right: 1px solid #ddd;
        }
    </style>
</head>
<body>

<jsp:include page="navbar.jsp" />

<div class="profile-wrapper">
    <div class="profile-card">
        <div class="profile-header">
            <div class="avatar">
                <div class="avatar-text"><%= initials %></div>
            </div>
            <div class="username"><%= user.getName() %></div>
            <div class="role-badge"><%= user.getRole() %></div>
        </div>

        <div class="profile-body">
            <div class="info-row">
                <div class="info-label">Name</div>
                <div class="info-value"><%= user.getName() %></div>
            </div>
            <div class="info-row">
                <div class="info-label">Email</div>
                <div class="info-value"><%= user.getEmail() %></div>
            </div>
            <div class="info-row">
                <div class="info-label">Role</div>
                <div class="info-value"><%= user.getRole() %></div>
            </div>
            <div class="button-row">
                <button class="profile-button" onclick="alert('Edit profile feature coming soon')">Edit</button>
                <button class="profile-button" onclick="alert('Settings coming soon')">Settings</button>
            </div>
        </div>
    </div>
</div>

</body>
</html>
