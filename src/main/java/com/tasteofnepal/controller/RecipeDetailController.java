package com.tasteofnepal.controller;

import com.tasteofnepal.controller.dao.*;
import com.tasteofnepal.model.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/client/see-full-details")
public class RecipeDetailController extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int recipeId = Integer.parseInt(request.getParameter("id"));

        RecipeDAO recipeDAO = new RecipeDAO();
        IngredientDAO ingredientDAO = new IngredientDAO();
        NutritionFactDAO nutritionDAO = new NutritionFactDAO();
        GuideDAO guideDAO = new GuideDAO();
        ReviewDAO reviewDAO = new ReviewDAO();

        Recipe recipe = null;
		try {
			recipe = recipeDAO.getRecipeById(recipeId);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        List<Ingredient> ingredients = ingredientDAO.getIngredientsByRecipeId(recipeId);
        NutritionFact nutrition = nutritionDAO.getByRecipeId(recipeId);
        Guide guide = guideDAO.getByRecipeId(recipeId);
        List<Review> reviews = reviewDAO.getByRecipeId(recipeId);

        request.setAttribute("recipe", recipe);
        request.setAttribute("ingredients", ingredients);
        request.setAttribute("nutrition", nutrition);
        request.setAttribute("guide", guide);
        request.setAttribute("reviews", reviews);

        request.getRequestDispatcher("/client/see-full-details.jsp").forward(request, response);
    }
}
