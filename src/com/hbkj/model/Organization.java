package com.hbkj.model;

//依托单位
public class Organization {

    private int id;

    private String name;

    private String usci;

    private String farenName;

    private String telephone;

    private String type;

    public Organization(){

    }

    public Organization(String name, String usci, String farenName, String telephone, String type) {
        this.name = name;
        this.usci = usci;
        this.farenName = farenName;
        this.telephone = telephone;
        this.type = type;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsci() {
        return usci;
    }

    public void setUsci(String usci) {
        this.usci = usci;
    }

    public String getFarenName() {
        return farenName;
    }

    public void setFarenName(String farenName) {
        this.farenName = farenName;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
