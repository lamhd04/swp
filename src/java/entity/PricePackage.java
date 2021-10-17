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
public class PricePackage {

    private int id;
    private String packages;
    private int duration;
    private int listPrice;
    private int salePrice;
    private String status;
    private int subjectId;

    public PricePackage() {
    }

    public PricePackage(int id, String packages, int duration, int listPrice, int salePrice, String status, int subjectId) {
        this.id = id;
        this.packages = packages;
        this.duration = duration;
        this.listPrice = listPrice;
        this.salePrice = salePrice;
        this.status = status;
        this.subjectId = subjectId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPackages() {
        return packages;
    }

    public void setPackages(String packages) {
        this.packages = packages;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public int getListPrice() {
        return listPrice;
    }

    public void setListPrice(int listPrice) {
        this.listPrice = listPrice;
    }

    public int getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(int salePrice) {
        this.salePrice = salePrice;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(int subjectId) {
        this.subjectId = subjectId;
    }

    
     
    
}
