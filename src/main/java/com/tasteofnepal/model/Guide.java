package com.tasteofnepal.model;

public class Guide {
    private int id;
    private int recipeId;
    private String steps;

    public Guide() {}

    public Guide(int recipeId, String steps) {
        this.recipeId = recipeId;
        this.steps = steps;
    }

    public Guide(int id, int recipeId, String steps) {
        this.id = id;
        this.recipeId = recipeId;
        this.steps = steps;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getRecipeId() { return recipeId; }
    public void setRecipeId(int recipeId) { this.recipeId = recipeId; }

    public String getSteps() { return steps; }
    public void setSteps(String steps) { this.steps = steps; }
}
