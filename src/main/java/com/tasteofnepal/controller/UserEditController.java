package com.tasteofnepal.controller;

import com.tasteofnepal.controller.dao.UserDAO;
import com.tasteofnepal.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/edit-user")
public class UserEditController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("id"));
        UserDAO dao = new UserDAO();
        try {
            User user = dao.getUserById(userId);
            request.setAttribute("user", user);
            request.getRequestDispatcher("/admin/edit-user.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/user-list");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String role = request.getParameter("role");

        User updatedUser = new User(id, name, email, "", role); // password unchanged
        UserDAO dao = new UserDAO();

        try {
            dao.updateUser(updatedUser);
            response.sendRedirect(request.getContextPath() + "/admin/user-list");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Failed to update user.");
            request.getRequestDispatcher("/admin/edit-user.jsp").forward(request, response);
        }
    }
}
