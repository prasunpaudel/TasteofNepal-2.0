package com.tasteofnepal.controller.dao;

import com.tasteofnepal.controller.database.DatabaseConnection;
import com.tasteofnepal.model.Ingredient;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class IngredientDAO {

    public void insertIngredient(Ingredient ingredient) {
        String sql = "INSERT INTO ingredients (recipe_id, items, qnty) VALUES (?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, ingredient.getRecipeId());
            stmt.setString(2, ingredient.getItems());
            stmt.setString(3, ingredient.getQnty());

            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Ingredient> getIngredientsByRecipeId(int recipeId) {
        List<Ingredient> list = new ArrayList<>();
        String sql = "SELECT * FROM ingredients WHERE recipe_id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, recipeId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Ingredient ing = new Ingredient(
                    rs.getInt("id"),
                    rs.getInt("recipe_id"),
                    rs.getString("items"),
                    rs.getString("qnty")
                );
                list.add(ing);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean deleteByRecipeId(int recipeId) {
        String sql = "DELETE FROM ingredients WHERE recipe_id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, recipeId);
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
