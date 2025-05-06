package com.tasteofnepal.controller.dao;

import com.tasteofnepal.model.Recipe;
import com.tasteofnepal.controller.database.DatabaseConnection;

import java.sql.*;
import java.util.*;

public class RecipeDAO {

    public List<Recipe> getAllRecipes() throws SQLException, ClassNotFoundException {
        List<Recipe> list = new ArrayList<>();
        String sql = "SELECT * FROM recipes";

        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Recipe r = new Recipe(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getInt("prep_time"),
                        rs.getInt("additional_time"),
                        rs.getInt("total_time"),
                        rs.getInt("serving"),
                        rs.getString("yield_description")
                );
                list.add(r);
            }
        }
        return list;
    }

    public Recipe getRecipe(int id) throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM recipes WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return new Recipe(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getInt("prep_time"),
                        rs.getInt("additional_time"),
                        rs.getInt("total_time"),
                        rs.getInt("serving"),
                        rs.getString("yield_description")
                );
            }
        }
        return null;
    }

    public void insertRecipe(Recipe recipe) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO recipes (name, prep_time, additional_time, total_time, serving, yield_description) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, recipe.getName());
            stmt.setInt(2, recipe.getPrepTime());
            stmt.setInt(3, recipe.getAdditionalTime());
            stmt.setInt(4, recipe.getTotalTime());
            stmt.setInt(5, recipe.getServing());
            stmt.setString(6, recipe.getYieldDescription());
            stmt.executeUpdate();
        }
    }

    public void updateRecipe(Recipe recipe) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE recipes SET name=?, prep_time=?, additional_time=?, total_time=?, serving=?, yield_description=? WHERE id=?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, recipe.getName());
            stmt.setInt(2, recipe.getPrepTime());
            stmt.setInt(3, recipe.getAdditionalTime());
            stmt.setInt(4, recipe.getTotalTime());
            stmt.setInt(5, recipe.getServing());
            stmt.setString(6, recipe.getYieldDescription());
            stmt.setInt(7, recipe.getId());
            stmt.executeUpdate();
        }
    }

    public void deleteRecipe(int id) throws SQLException, ClassNotFoundException {
        String sql = "DELETE FROM recipes WHERE id=?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }
}
