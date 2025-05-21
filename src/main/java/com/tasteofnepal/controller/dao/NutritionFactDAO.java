package com.tasteofnepal.controller.dao;

import com.tasteofnepal.controller.database.DatabaseConnection;
import com.tasteofnepal.model.NutritionFact;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NutritionFactDAO {

    public void insert(NutritionFact fact) {
        String sql = "INSERT INTO nutrition_facts (recipe_id, details) VALUES (?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, fact.getRecipeId());
            stmt.setString(2, fact.getDetails());

            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public NutritionFact getByRecipeId(int recipeId) {
        String sql = "SELECT * FROM nutrition_facts WHERE recipe_id = ?";
        NutritionFact fact = null;

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, recipeId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                fact = new NutritionFact(
                    rs.getInt("id"),
                    rs.getInt("recipe_id"),
                    rs.getString("details")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return fact;
    }

    public boolean deleteByRecipeId(int recipeId) {
        String sql = "DELETE FROM nutrition_facts WHERE recipe_id = ?";

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
