package com.tasteofnepal.model;

public class Ingredient {
    private int id;
    private int recipeId;
    private String items;
    private String qnty;

    public Ingredient() {}

    public Ingredient(int recipeId, String items, String qnty) {
        this.recipeId = recipeId;
        this.items = items;
        this.qnty = qnty;
    }

    public Ingredient(int id, int recipeId, String items, String qnty) {
        this.id = id;
        this.recipeId = recipeId;
        this.items = items;
        this.qnty = qnty;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getRecipeId() { return recipeId; }
    public void setRecipeId(int recipeId) { this.recipeId = recipeId; }

    public String getItems() { return items; }
    public void setItems(String items) { this.items = items; }

    public String getQnty() { return qnty; }
    public void setQnty(String qnty) { this.qnty = qnty; }
}
