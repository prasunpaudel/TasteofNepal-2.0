package com.tasteofnepal.controller;

import com.tasteofnepal.controller.dao.RecipeDAO;
import com.tasteofnepal.model.Recipe;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/recipes")
public class RecipeController extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private RecipeDAO recipeDAO;

    public void init() {
        recipeDAO = new RecipeDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            switch (action == null ? "list" : action) {
                case "new": showForm(request, response); break;
                case "insert": insert(request, response); break;
                case "edit": showEditForm(request, response); break;
                case "update": update(request, response); break;
                case "delete": delete(request, response); break;
                default: list(request, response); break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void list(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException, ClassNotFoundException {
        List<Recipe> recipes = recipeDAO.getAllRecipes();
        request.setAttribute("recipes", recipes);
        request.getRequestDispatcher("pages/list-recipes.jsp").forward(request, response);
    }

    private void showForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("pages/recipe-form.jsp").forward(request, response);
    }

    private void insert(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ClassNotFoundException {
        Recipe recipe = getRecipeFromRequest(request);
        recipeDAO.insertRecipe(recipe);
        response.sendRedirect("recipes");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException, ClassNotFoundException {
        int id = Integer.parseInt(request.getParameter("id"));
        Recipe recipe = recipeDAO.getRecipe(id);
        request.setAttribute("recipe", recipe);
        request.getRequestDispatcher("pages/recipe-form.jsp").forward(request, response);
    }

    private void update(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ClassNotFoundException {
        Recipe recipe = getRecipeFromRequest(request);
        recipe.setId(Integer.parseInt(request.getParameter("id")));
        recipeDAO.updateRecipe(recipe);
        response.sendRedirect("recipes");
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ClassNotFoundException {
        int id = Integer.parseInt(request.getParameter("id"));
        recipeDAO.deleteRecipe(id);
        response.sendRedirect("recipes");
    }

    private Recipe getRecipeFromRequest(HttpServletRequest request) {
        String name = request.getParameter("name");
        int prep = Integer.parseInt(request.getParameter("prep_time"));
        int add = Integer.parseInt(request.getParameter("additional_time"));
        int total = Integer.parseInt(request.getParameter("total_time"));
        int serving = Integer.parseInt(request.getParameter("serving"));
        String yield = request.getParameter("yield_description");
        return new Recipe(name, prep, add, total, serving, yield);
    }
}
