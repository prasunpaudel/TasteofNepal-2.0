package com.tasteofnepal.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tasteofnepal.controller.dao.ReviewDAO;
import com.tasteofnepal.model.Review;

/**
 * Servlet implementation class AdminReviewListController
 */
@WebServlet("/admin/review-list")
public class AdminReviewListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        try {
	            List<Review> reviews = new ReviewDAO().getAllReviewsWithNames();
	            request.setAttribute("reviews", reviews);
	            request.getRequestDispatcher("/admin/review-list.jsp").forward(request, response);
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.sendRedirect("error.jsp");
	        }
	    }


}
