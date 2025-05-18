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

@WebServlet("/recipes/update")
public class RecipeUpdateController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            RecipeDAO dao = new RecipeDAO();

            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            int prepTime = Integer.parseInt(request.getParameter("prepTime"));
            int additionalTime = Integer.parseInt(request.getParameter("additionalTime"));
            int totalTime = Integer.parseInt(request.getParameter("totalTime"));
            int serving = Integer.parseInt(request.getParameter("serving"));
            String yieldDescription = request.getParameter("yieldDescription");

            Recipe recipe = new Recipe(id, name, prepTime, additionalTime, totalTime, serving, yieldDescription);
            dao.updateRecipe(recipe);

            response.sendRedirect(request.getContextPath() + "/recipes");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Update failed.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/edit-recipe.jsp");
            dispatcher.forward(request, response);
        }
    }
}
