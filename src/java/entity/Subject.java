/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author lhquan1
 */
public class Subject {

    private int id;
    private String title;
    private String author;
    private String status;
    private String featured;
    private String category;
    private String name;
    private String description;

    public Subject() {
    }

    public Subject(int id, String title, String author, String status, String featured, String category, String name, String description) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.status = status;
        this.featured = featured;
        this.category = category;
        this.name = name;
        this.description = description;
    }
     public Subject(String title, String author, String status, String featured, String category, String name, String description) {
        this.title = title;
        this.author = author;
        this.status = status;
        this.featured = featured;
        this.category = category;
        this.name = name;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String isFeatured() {
        return featured;
    }

    public void setFeatured(String featured) {
        this.featured = featured;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    

   

}
