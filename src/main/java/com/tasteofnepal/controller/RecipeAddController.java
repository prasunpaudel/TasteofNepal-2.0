package com.tasteofnepal.controller;

import com.tasteofnepal.controller.dao.*;
import com.tasteofnepal.model.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/add-recipe")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class RecipeAddController extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIR = "image";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Retrieve text fields
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String prepTime = request.getParameter("prep_time");
        String additionalTime = request.getParameter("additional_time");
        String totalTime = request.getParameter("total_time");
        String serving = request.getParameter("serving");
        String yield = request.getParameter("yield_description");
        String nutrition = request.getParameter("nutrition");
        String guide = request.getParameter("guide");

        // 2. Handle image upload
        Part imagePart = request.getPart("image");
        String fileName = new File(imagePart.getSubmittedFileName()).getName();
        String appPath = request.getServletContext().getRealPath("");
        String savePath = appPath + File.separator + UPLOAD_DIR;
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) fileSaveDir.mkdir();
        String imagePath = UPLOAD_DIR + "/" + fileName;
        imagePart.write(savePath + File.separator + fileName);

        // 3. Create Recipe object
        Recipe recipe = new Recipe();
        recipe.setName(name);
        recipe.setCategory(category);
        recipe.setImagePath(imagePath);
        recipe.setPrepTime(Integer.parseInt(prepTime));
        recipe.setAdditionalTime(Integer.parseInt(additionalTime));
        recipe.setTotalTime(Integer.parseInt(totalTime));
        recipe.setServing(Integer.parseInt(serving));
        recipe.setYieldDescription(yield);

        RecipeDAO recipeDAO = new RecipeDAO();
        int recipeId = 0;
		try {
			recipeId = recipeDAO.insertRecipeAndReturnId(recipe);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        // 4. Insert ingredients
        String[] items = request.getParameterValues("ingredientItem");
        String[] quantities = request.getParameterValues("ingredientQnty");
        IngredientDAO ingredientDAO = new IngredientDAO();
        if (items != null && quantities != null) {
            for (int i = 0; i < items.length; i++) {
                Ingredient ing = new Ingredient(recipeId, items[i], quantities[i]);
                ingredientDAO.insertIngredient(ing);
            }
        }

        // 5. Insert nutrition facts
        NutritionFactDAO nutritionDAO = new NutritionFactDAO();
        nutritionDAO.insert(new NutritionFact(recipeId, nutrition));

        // 6. Insert guide
        GuideDAO guideDAO = new GuideDAO();
        guideDAO.insert(new Guide(recipeId, guide));

        // 7. Redirect
        request.setAttribute("successMessage", "Recipe added successfully!");
        request.getRequestDispatcher("/admin/add-recipe.jsp").forward(request, response);
    }
}
