package com.tasteofnepal.controller;

import com.tasteofnepal.controller.dao.UserDAO;
import com.tasteofnepal.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");

		HttpSession session = request.getSession();

		if (username == null || username.isEmpty() ||
			email == null || email.isEmpty() ||
			password == null || password.isEmpty() ||
			confirmPassword == null || confirmPassword.isEmpty()) {

			session.setAttribute("errorMessage", "All fields are required.");
			response.sendRedirect(request.getContextPath() + "/pages/register.jsp");
			return;
		}

		if (!password.equals(confirmPassword)) {
			session.setAttribute("errorMessage", "Passwords do not match.");
			response.sendRedirect(request.getContextPath() + "/pages/register.jsp");
			return;
		}

		// Save to database
		User user = new User();
		user.setName(username);
		user.setEmail(email);
		user.setPassword(password); 
		user.setRole("user");

		UserDAO userDAO = new UserDAO();
		boolean isRegistered = userDAO.registerUser(user);

		if (isRegistered) {
			// After successful registration, log in user automatically
			session.setAttribute("userWithSession", user);
			session.setMaxInactiveInterval(10 * 60); // 10 minutes
			session.setAttribute("successMessage", "Registration Successful!");
			response.sendRedirect(request.getContextPath() + "/pages/home.jsp");
		} else {
			session.setAttribute("errorMessage", "Failed to register. Please try again.");
			response.sendRedirect(request.getContextPath() + "/pages/register.jsp");
		}
	}
}
