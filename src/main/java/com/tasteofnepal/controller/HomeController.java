package com.tasteofnepal.controller;

import com.tasteofnepal.controller.dao.RecipeDAO;
import com.tasteofnepal.model.Recipe;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/client/home")
public class HomeController extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RecipeDAO recipeDAO = new RecipeDAO();
        List<Recipe> allRecipes = null;
		try {
			allRecipes = recipeDAO.getAllRecipes();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        // Group recipes by category
        Map<String, List<Recipe>> categoryMap = new LinkedHashMap<>();
        for (Recipe r : allRecipes) {
            categoryMap
                .computeIfAbsent(r.getCategory(), k -> new ArrayList<>())
                .add(r);
        }

        request.setAttribute("categoryMap", categoryMap);
        request.getRequestDispatcher("/client/home.jsp").forward(request, response);
    }
}
