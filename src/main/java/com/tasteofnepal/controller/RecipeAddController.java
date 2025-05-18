package com.tasteofnepal.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tasteofnepal.controller.dao.RecipeDAO;
import com.tasteofnepal.model.Recipe;

@WebServlet("/recipes/add")
public class RecipeAddController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Show add form
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/add-recipe.jsp");
        dispatcher.forward(request, response);
    }

    // Handle form submission and insert recipe
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            RecipeDAO dao = new RecipeDAO();

            String name = request.getParameter("name");
            int prepTime = Integer.parseInt(request.getParameter("prepTime"));
            int additionalTime = Integer.parseInt(request.getParameter("additionalTime"));
            int totalTime = Integer.parseInt(request.getParameter("totalTime"));
            int serving = Integer.parseInt(request.getParameter("serving"));
            String yieldDescription = request.getParameter("yieldDescription");

            Recipe recipe = new Recipe(name, prepTime, additionalTime, totalTime, serving, yieldDescription);
            dao.insertRecipe(recipe);

            response.sendRedirect(request.getContextPath() + "/recipes");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Invalid input or server error.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/add-recipe.jsp");
            dispatcher.forward(request, response);
        }
    }
}
