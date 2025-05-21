package com.tasteofnepal.controller.dao;

import com.tasteofnepal.model.Recipe;
import com.tasteofnepal.controller.database.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RecipeDAO {

    public int insertRecipeAndReturnId(Recipe recipe) throws ClassNotFoundException {
        int generatedId = -1;
        String sql = "INSERT INTO recipes (name, category, image_path, prep_time, additional_time, total_time, serving, yield_description) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setString(1, recipe.getName());
            stmt.setString(2, recipe.getCategory());
            stmt.setString(3, recipe.getImagePath());
            stmt.setInt(4, recipe.getPrepTime());
            stmt.setInt(5, recipe.getAdditionalTime());
            stmt.setInt(6, recipe.getTotalTime());
            stmt.setInt(7, recipe.getServing());
            stmt.setString(8, recipe.getYieldDescription());

            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                generatedId = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return generatedId;
    }

    public List<Recipe> getAllRecipes() throws ClassNotFoundException {
        List<Recipe> list = new ArrayList<>();
        String sql = "SELECT * FROM recipes";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Recipe r = new Recipe();
                r.setId(rs.getInt("id"));
                r.setName(rs.getString("name"));
                r.setCategory(rs.getString("category"));
                r.setImagePath(rs.getString("image_path"));
                r.setPrepTime(rs.getInt("prep_time"));
                r.setAdditionalTime(rs.getInt("additional_time"));
                r.setTotalTime(rs.getInt("total_time"));
                r.setServing(rs.getInt("serving"));
                r.setYieldDescription(rs.getString("yield_description"));
                list.add(r);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Recipe getRecipeById(int id) throws ClassNotFoundException {
        Recipe r = null;
        String sql = "SELECT * FROM recipes WHERE id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                r = new Recipe();
                r.setId(rs.getInt("id"));
                r.setName(rs.getString("name"));
                r.setCategory(rs.getString("category"));
                r.setImagePath(rs.getString("image_path"));
                r.setPrepTime(rs.getInt("prep_time"));
                r.setAdditionalTime(rs.getInt("additional_time"));
                r.setTotalTime(rs.getInt("total_time"));
                r.setServing(rs.getInt("serving"));
                r.setYieldDescription(rs.getString("yield_description"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return r;
    }

    public boolean updateRecipe(Recipe recipe) throws ClassNotFoundException {
        String sql = "UPDATE recipes SET name=?, category=?, image_path=?, prep_time=?, additional_time=?, total_time=?, serving=?, yield_description=? WHERE id=?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, recipe.getName());
            stmt.setString(2, recipe.getCategory());
            stmt.setString(3, recipe.getImagePath());
            stmt.setInt(4, recipe.getPrepTime());
            stmt.setInt(5, recipe.getAdditionalTime());
            stmt.setInt(6, recipe.getTotalTime());
            stmt.setInt(7, recipe.getServing());
            stmt.setString(8, recipe.getYieldDescription());
            stmt.setInt(9, recipe.getId());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteRecipe(int id) throws ClassNotFoundException {
        String sql = "DELETE FROM recipes WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
