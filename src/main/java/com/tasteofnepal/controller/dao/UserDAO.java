package com.tasteofnepal.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
	 public List<User> getAllUsers() throws ClassNotFoundException {
		    List<User> users = new ArrayList<>();
		    String query = "SELECT * FROM users";

		    try (Connection conn = DatabaseConnection.getConnection();
		         PreparedStatement ps = conn.prepareStatement(query);
		         ResultSet rs = ps.executeQuery()) {

		        while (rs.next()) {
		            users.add(new User(
		                rs.getInt("id"),
		                rs.getString("name"),
		                rs.getString("email"),
		                rs.getString("password"),
		                rs.getString("role")
		            ));
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return users;
		}

		public boolean deleteUserById(int id) throws ClassNotFoundException {
		    String sql = "DELETE FROM users WHERE id = ?";
		    try (Connection conn = DatabaseConnection.getConnection();
		         PreparedStatement ps = conn.prepareStatement(sql)) {
		        ps.setInt(1, id);
		        return ps.executeUpdate() > 0;
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return false;
		}
		public boolean updateUser(User user) throws ClassNotFoundException {
		    String sql = "UPDATE users SET name = ?, email = ?, password = ?, role = ? WHERE id = ?";
		    try (Connection conn = DatabaseConnection.getConnection();
		         PreparedStatement stmt = conn.prepareStatement(sql)) {
		        stmt.setString(1, user.getName());
		        stmt.setString(2, user.getEmail());
		        stmt.setString(3, user.getPassword());
		        stmt.setString(4, user.getRole());
		        stmt.setInt(5, user.getid());
		        return stmt.executeUpdate() > 0;
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return false;
		}
		
		public User getUserById(int id) throws ClassNotFoundException {
		    String sql = "SELECT * FROM users WHERE id = ?";
		    try (Connection conn = DatabaseConnection.getConnection();
		         PreparedStatement stmt = conn.prepareStatement(sql)) {
		        stmt.setInt(1, id);
		        ResultSet rs = stmt.executeQuery();
		        if (rs.next()) {
		            return new User(
		                rs.getInt("id"),
		                rs.getString("name"),
		                rs.getString("email"),
		                rs.getString("password"),
		                rs.getString("role")
		            );
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return null;
		}


}
