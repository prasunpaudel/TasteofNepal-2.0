package com.tasteofnepal.model;

public class Review {
    private int id;
    private int recipeId;
    private int userId;
    private String description;

    private String userName;     // for display in admin
    private String recipeName;   // for display in admin

    public Review(int id, int recipeId, int userId, String description) {
        this.id = id;
        this.recipeId = recipeId;
        this.userId = userId;
        this.description = description;
    }

    // Full constructor for admin display
    public Review(int id, int recipeId, int userId, String description, String userName, String recipeName) {
        this.id = id;
        this.recipeId = recipeId;
        this.userId = userId;
        this.description = description;
        this.userName = userName;
        this.recipeName = recipeName;
    }

    // Getters and setters for all
    public int getId() { return id; }
    public int getRecipeId() { return recipeId; }
    public int getUserId() { return userId; }
    public String getDescription() { return description; }

    public String getUserName() { return userName; }
    public void setUserName(String userName) { this.userName = userName; }

    public String getRecipeName() { return recipeName; }
    public void setRecipeName(String recipeName) { this.recipeName = recipeName; }

    // other setters if needed
}
