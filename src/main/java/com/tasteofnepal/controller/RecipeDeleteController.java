package com.tasteofnepal.controller;

import com.tasteofnepal.controller.dao.RecipeDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/delete-recipe")
public class RecipeDeleteController extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int recipeId = Integer.parseInt(request.getParameter("id"));

            RecipeDAO dao = new RecipeDAO();
            boolean success = dao.deleteRecipe(recipeId);

            if (success) {
                response.sendRedirect("recipe-list");
            } else {
                request.setAttribute("errorMessage", "Failed to delete recipe.");
                request.getRequestDispatcher("/admin/recipe-list.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error occurred: " + e.getMessage());
            request.getRequestDispatcher("/admin/recipe-list.jsp").forward(request, response);
        }
    }
}
