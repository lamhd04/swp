/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author hungl
 */
public class Slider {
    private int sliderID;
    private String title;
    private String image;
    private String backlink;
    private String note;
    private String status;

    public Slider() {
    }

    public Slider(int sliderID, String title, String image, String backlink, String note, String status) {
        this.sliderID = sliderID;
        this.title = title;
        this.image = image;
        this.backlink = backlink;
        this.note = note;
        this.status = status;
    }

    public int getSliderID() {
        return sliderID;
    }

    public void setSliderID(int sliderID) {
        this.sliderID = sliderID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getBacklink() {
        return backlink;
    }

    public void setBacklink(String backlink) {
        this.backlink = backlink;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Slider{" + "sliderID=" + sliderID + ", title=" + title + ", image=" + image + ", backlink=" + backlink + ", note=" + note + ", status=" + status + '}';
    }
    
    
    
}
