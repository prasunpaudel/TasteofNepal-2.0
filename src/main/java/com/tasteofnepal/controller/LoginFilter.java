package com.tasteofnepal.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class LoginFilter implements Filter {

    public void init(FilterConfig filterConfig) throws ServletException {}

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession(false);

        boolean loggedIn = (session != null && session.getAttribute("userWithSession") != null);

        String loginURI = req.getContextPath() + "/pages/login.jsp";
        String registerURI = req.getContextPath() + "/pages/register.jsp";
        String homeURI = req.getContextPath() + "/pages/home.jsp";

        String requestURI = req.getRequestURI();

        boolean isLoginRequest = requestURI.equals(loginURI);
        boolean isRegisterRequest = requestURI.equals(registerURI);

        if (loggedIn && (isLoginRequest || isRegisterRequest)) {
            // Redirect logged-in users away from login or register page
            res.sendRedirect(homeURI);
        } else if (loggedIn || isLoginRequest || isRegisterRequest) {
            // Allow access if logged in or trying to log in/register
            chain.doFilter(request, response);
        } else {
            // Not logged in and trying to access a protected page
            res.sendRedirect(loginURI);
        }
    }

    public void destroy() {}
}
