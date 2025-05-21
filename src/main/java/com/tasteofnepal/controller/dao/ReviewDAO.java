package com.tasteofnepal.controller.dao;

import com.tasteofnepal.controller.database.DatabaseConnection;
import com.tasteofnepal.model.Review;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReviewDAO {

    public void insert(Review review) {
        String sql = "INSERT INTO reviews (recipe_id, user_id, description) VALUES (?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, review.getRecipeId());
            stmt.setInt(2, review.getUserId());
            stmt.setString(3, review.getDescription());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Review> getByRecipeId(int recipeId) {
        List<Review> list = new ArrayList<>();
        String sql = "SELECT * FROM reviews WHERE recipe_id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, recipeId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Review r = new Review(
                    rs.getInt("id"),
                    rs.getInt("recipe_id"),
                    rs.getInt("user_id"),
                    rs.getString("description")
                );
                list.add(r);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean deleteByRecipeId(int recipeId) {
        String sql = "DELETE FROM reviews WHERE recipe_id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, recipeId);
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
    public List<Review> getAllReviewsWithNames() throws ClassNotFoundException {
        List<Review> reviews = new ArrayList<>();
        String sql = "SELECT r.id, r.recipe_id, r.user_id, r.description, u.name AS user_name, rec.name AS recipe_name " +
                     "FROM reviews r " +
                     "JOIN users u ON r.user_id = u.id " +
                     "JOIN recipes rec ON r.recipe_id = rec.id";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                reviews.add(new Review(
                    rs.getInt("id"),
                    rs.getInt("recipe_id"),
                    rs.getInt("user_id"),
                    rs.getString("description"),
                    rs.getString("user_name"),
                    rs.getString("recipe_name")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviews;
    }


}
