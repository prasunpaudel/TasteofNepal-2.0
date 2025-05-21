package com.tasteofnepal.model;

public class NutritionFact {
    private int id;
    private int recipeId;
    private String details;

    public NutritionFact() {}

    public NutritionFact(int recipeId, String details) {
        this.recipeId = recipeId;
        this.details = details;
    }

    public NutritionFact(int id, int recipeId, String details) {
        this.id = id;
        this.recipeId = recipeId;
        this.details = details;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getRecipeId() { return recipeId; }
    public void setRecipeId(int recipeId) { this.recipeId = recipeId; }

    public String getDetails() { return details; }
    public void setDetails(String details) { this.details = details; }
}
