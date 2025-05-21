package com.tasteofnepal.controller;

import com.tasteofnepal.controller.dao.RecipeDAO;
import com.tasteofnepal.model.Recipe;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/client/home")
public class HomeController extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RecipeDAO recipeDAO = new RecipeDAO();
        List<Recipe> recipes = null;
		try {
			recipes = recipeDAO.getAllRecipes();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        request.setAttribute("recipes", recipes);
        request.getRequestDispatcher("/client/home.jsp").forward(request, response);
    }
}
