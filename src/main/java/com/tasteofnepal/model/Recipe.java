package com.tasteofnepal.model;

public class Recipe {
    private int id;
    private String name;
    private int prepTime;
    private int additionalTime;
    private int totalTime;
    private int serving;
    private String yieldDescription;

    public Recipe() {}

    public Recipe(int id, String name, int prepTime, int additionalTime, int totalTime, int serving, String yieldDescription) {
        this.id = id;
        this.name = name;
        this.prepTime = prepTime;
        this.additionalTime = additionalTime;
        this.totalTime = totalTime;
        this.serving = serving;
        this.yieldDescription = yieldDescription;
    }

    public Recipe(String name, int prepTime, int additionalTime, int totalTime, int serving, String yieldDescription) {
        this.name = name;
        this.prepTime = prepTime;
        this.additionalTime = additionalTime;
        this.totalTime = totalTime;
        this.serving = serving;
        this.yieldDescription = yieldDescription;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public int getPrepTime() { return prepTime; }
    public void setPrepTime(int prepTime) { this.prepTime = prepTime; }

    public int getAdditionalTime() { return additionalTime; }
    public void setAdditionalTime(int additionalTime) { this.additionalTime = additionalTime; }

    public int getTotalTime() { return totalTime; }
    public void setTotalTime(int totalTime) { this.totalTime = totalTime; }

    public int getServing() { return serving; }
    public void setServing(int serving) { this.serving = serving; }

    public String getYieldDescription() { return yieldDescription; }
    public void setYieldDescription(String yieldDescription) { this.yieldDescription = yieldDescription; }
}
