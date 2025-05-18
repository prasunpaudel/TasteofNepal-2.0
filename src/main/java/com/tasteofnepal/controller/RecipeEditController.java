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

@WebServlet("/recipes/edit")
public class RecipeEditController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            RecipeDAO dao = new RecipeDAO();
            Recipe recipe = dao.getRecipe(id);

            if (recipe == null) {
                response.sendRedirect(request.getContextPath() + "/recipes");
                return;
            }

            request.setAttribute("recipe", recipe);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/edit-recipe.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/recipes");
        }
    }
}
