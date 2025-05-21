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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            UserDAO userdao = new UserDAO();
            User user = userdao.login(email, password);

            HttpSession session = request.getSession();
            if (user != null) {
                session.setAttribute("userWithSession", user);
                session.setMaxInactiveInterval(10 * 60); // 10 minutes

                if ("admin".equals(user.getRole())) {
                    response.sendRedirect(request.getContextPath() + "/pages/home.jsp");
                } else {
                    response.sendRedirect(request.getContextPath() + "/client/home");
                }
            } else {
                session.setAttribute("errorMessage", "Invalid email or password.");
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
