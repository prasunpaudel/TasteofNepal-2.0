package com.tasteofnepal.controller;

import com.tasteofnepal.controller.dao.RecipeDAO;
import com.tasteofnepal.model.Recipe;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/edit-recipe")
public class RecipeEditController extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int recipeId = Integer.parseInt(request.getParameter("id"));

        RecipeDAO dao = new RecipeDAO();
        Recipe recipe = null;
		try {
			recipe = dao.getRecipeById(recipeId);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        request.setAttribute("recipe", recipe);
        request.getRequestDispatcher("/admin/edit-recipe.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String category = request.getParameter("category");
            int prepTime = Integer.parseInt(request.getParameter("prep_time"));
            int additionalTime = Integer.parseInt(request.getParameter("additional_time"));
            int totalTime = Integer.parseInt(request.getParameter("total_time"));
            int serving = Integer.parseInt(request.getParameter("serving"));
            String yield = request.getParameter("yield_description");

            Recipe recipe = new Recipe(id, name, category, null, prepTime, additionalTime, totalTime, serving, yield);

            RecipeDAO dao = new RecipeDAO();
            boolean success = dao.updateRecipe(recipe);

            if (success) {
                response.sendRedirect("recipe-list");
            } else {
                request.setAttribute("errorMessage", "Update failed");
                doGet(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Something went wrong: " + e.getMessage());
            request.getRequestDispatcher("/admin/edit-recipe.jsp").forward(request, response);
        }
    }
}
