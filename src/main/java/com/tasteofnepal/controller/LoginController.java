package com.tasteofnepal.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.tasteofnepal.controller.dao.UserDAO;
import com.tasteofnepal.model.User;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            UserDAO userdao = new UserDAO();
            User user = userdao.login(email, password);

            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("userWithSession", user);
                session.setMaxInactiveInterval(10 * 60); // 10 minutes
                session.setAttribute("successMessage", "Login SuccessFull! ");
                response.sendRedirect(request.getContextPath() + "/pages/home.jsp");
            } else {
                // Store error in session, redirect
                HttpSession session = request.getSession();
                session.setAttribute("errorMessage", "Invalid email or password. Please try again.");
                response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", "System error. Please try again later.");
            response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
        }
    }
}
