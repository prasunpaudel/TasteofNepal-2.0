package com.tasteofnepal.model;

public class Review {
    private int id;
    private int recipeId;
    private int userId;
    private String description;

    public Review() {}

    public Review(int recipeId, int userId, String description) {
        this.recipeId = recipeId;
        this.userId = userId;
        this.description = description;
    }

    public Review(int id, int recipeId, int userId, String description) {
        this.id = id;
        this.recipeId = recipeId;
        this.userId = userId;
        this.description = description;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getRecipeId() { return recipeId; }
    public void setRecipeId(int recipeId) { this.recipeId = recipeId; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
}
