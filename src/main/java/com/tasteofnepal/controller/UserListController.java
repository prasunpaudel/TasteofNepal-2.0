package com.tasteofnepal.controller;

import com.tasteofnepal.controller.dao.UserDAO;
import com.tasteofnepal.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/user-list")
public class UserListController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            UserDAO dao = new UserDAO();
            List<User> users = dao.getAllUsers();
            request.setAttribute("users", users);
            request.getRequestDispatcher("/admin/user-list.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/recipe-list");
        }
    }
}
