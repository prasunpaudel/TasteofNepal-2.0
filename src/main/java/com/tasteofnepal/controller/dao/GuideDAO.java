package com.tasteofnepal.controller.dao;

import com.tasteofnepal.controller.database.DatabaseConnection;
import com.tasteofnepal.model.Guide;

import java.sql.*;

public class GuideDAO {

    public void insert(Guide guide) {
        String sql = "INSERT INTO guides (recipe_id, steps) VALUES (?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, guide.getRecipeId());
            stmt.setString(2, guide.getSteps());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Guide getByRecipeId(int recipeId) {
        String sql = "SELECT * FROM guides WHERE recipe_id = ?";
        Guide guide = null;

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, recipeId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                guide = new Guide(
                        rs.getInt("id"),
                        rs.getInt("recipe_id"),
                        rs.getString("steps")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return guide;
    }

    public boolean deleteByRecipeId(int recipeId) {
        String sql = "DELETE FROM guides WHERE recipe_id = ?";

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
