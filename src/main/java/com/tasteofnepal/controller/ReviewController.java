package com.tasteofnepal.controller;

import com.tasteofnepal.controller.dao.ReviewDAO;
import com.tasteofnepal.model.Review;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/submit-review")
public class ReviewController extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int recipeId = Integer.parseInt(request.getParameter("recipeId"));
        int userId = Integer.parseInt(request.getParameter("userId"));
        String description = request.getParameter("description");

        Review review = new Review(recipeId, userId, description);
        ReviewDAO dao = new ReviewDAO();
        dao.insert(review);

        response.sendRedirect(request.getContextPath() + "/client/see-full-details?id=" + recipeId);
    }
}
