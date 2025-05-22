package com.tasteofnepal.controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

public class LoginFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession(false);

        Object userObj = (session != null) ? session.getAttribute("userWithSession") : null;
        String role = null;

        if (userObj != null) {
            role = ((com.tasteofnepal.model.User) userObj).getRole();
        }

        String contextPath = req.getContextPath();
        String requestURI = req.getRequestURI();

        boolean isAdminPage = requestURI.startsWith(contextPath + "/admin");
        boolean isReviewSubmit = requestURI.equals(contextPath + "/submitReview");
        

        if (role == null) {
            // Not logged in user

            if (isAdminPage) {
                // Admin pages require login -> redirect to admin login page or general login page
                res.sendRedirect(contextPath + "/pages/login.jsp");
                return;
            }

            if (isReviewSubmit) {
                // Review submission requires login
                res.sendRedirect(contextPath + "/pages/login.jsp");
                return;
            }

            // All other client/public pages accessible without login
            chain.doFilter(request, response);
            return;
        }

        // User is logged in
        if ("admin".equals(role)) {
            // Admin logged in

            if (isAdminPage) {
                // Admin can access admin pages
                chain.doFilter(request, response);
                return;
            } else {
                // Admin trying to access client/public pages: deny, redirect to admin home
                res.sendRedirect(contextPath + "/admin/home.jsp");
                return;
            }
        } else if ("user".equals(role)) {
            // Normal user logged in

            if (isAdminPage) {
                // User cannot access admin pages
                res.sendRedirect(contextPath + "/pages/home.jsp");
                return;
            }

            // User can access any client page (including review submission)
            chain.doFilter(request, response);
            return;
        } else {
            // Unknown role - redirect to login
            res.sendRedirect(contextPath + "/pages/login.jsp");
            return;
        }
    }

    @Override
    public void destroy() {}
}
