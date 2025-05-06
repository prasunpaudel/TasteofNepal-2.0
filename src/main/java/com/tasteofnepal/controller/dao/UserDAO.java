package com.tasteofnepal.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tasteofnepal.controller.database.DatabaseConnection;
import com.tasteofnepal.model.User;

public class UserDAO {
	public User login(String emailToCheck, String passwordToCheck) {
	    User user = null;
	    String query = "SELECT * FROM users WHERE email = ? AND password = ?";
	
	    try (Connection conn = DatabaseConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(query)) {
	
	        ps.setString(1, emailToCheck);
	        ps.setString(2, passwordToCheck); // Reminder: hash passwords in production
	
	        ResultSet userSet = ps.executeQuery();
	
	        if (userSet.next()) {
	            user = new User(
	                userSet.getInt("id"), 
	                userSet.getString("name"), 
	                userSet.getString("email"),
	                userSet.getString("password"),
	                userSet.getString("role"));
	        }
	
	    } catch (SQLException | ClassNotFoundException e) {
	        e.printStackTrace();
	    }
	
	    return user;
	}
	 public boolean registerUser(User user) {
	        String query = "INSERT INTO users (name, email, password, role) VALUES (?, ?, ?, ?)";
	        try (Connection conn = DatabaseConnection.getConnection();
	             PreparedStatement stmt = conn.prepareStatement(query)) {

	            stmt.setString(1, user.getName());
	            stmt.setString(2, user.getEmail());
	            stmt.setString(3, user.getPassword());
	            stmt.setString(4, user.getRole());

	            return stmt.executeUpdate() > 0;

	        } catch (SQLException | ClassNotFoundException e) {
	            System.out.println("Error in registerUser(): " + e.getMessage());
	            return false;
	        }
	    }
}
