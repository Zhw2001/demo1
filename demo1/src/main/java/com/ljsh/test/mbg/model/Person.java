package com.ljsh.test.mbg.model;

import java.sql.Date;


public class Person {
    /*
    {id} 自增主键
     */
    private Long id;
    private String username;
    private String password;
    private String phone;
    private String email;
    private Date created;
    private Date latest_login;
    private String sex;
    private Integer state;
    private Float balance;


    @Override
    public String toString() {
        return "Person{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", created=" + created +
                ", latest_login=" + latest_login +
                ", sex='" + sex + '\'' +
                ", state=" + state +
                ", balance=" + balance +
                '}';
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Date getLatest_login() {
        return latest_login;
    }

    public void setLatest_login(Date latest_login) {
        this.latest_login = latest_login;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Float getBalance() {
        return balance;
    }

    public void setBalance(Float balance) {
        this.balance = balance;
    }



}