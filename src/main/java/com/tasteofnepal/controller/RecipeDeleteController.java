package com.tasteofnepal.controller;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tasteofnepal.controller.dao.RecipeDAO;

@WebServlet("/recipes/delete")
public class RecipeDeleteController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            RecipeDAO dao = new RecipeDAO();
            dao.deleteRecipe(id);
            response.sendRedirect(request.getContextPath() + "/recipes");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/recipes");
        }
    }
}
