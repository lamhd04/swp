/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Nhat Anh PC
 */
public class Setting {
    private int settingId;
    private String type;
    private String settingValue;
    private int settingOrder;
    private String status;

    public Setting() {
    }

    public Setting(int settingId, String type, String settingValue, int settingOrder, String status) {
        this.settingId = settingId;
        this.type = type;
        this.settingValue = settingValue;
        this.settingOrder = settingOrder;
        this.status = status;
    }

    public int getSettingId() {
        return settingId;
    }

    public void setSettingId(int settingId) {
        this.settingId = settingId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getSettingValue() {
        return settingValue;
    }

    public void setSettingValue(String settingValue) {
        this.settingValue = settingValue;
    }

    public int getSettingOrder() {
        return settingOrder;
    }

    public void setSettingOrder(int settingOrder) {
        this.settingOrder = settingOrder;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
  
}
