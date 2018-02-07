package com.webchat;

public class UserInfo {
    private String loginId;
    private String name;
    private String email;
    private String type;

    public UserInfo() {
    }

    public UserInfo(String loginId, String name, String email, String type) {
        this.loginId = loginId;
        this.name = name;
        this.email = email;
        this.type = type;
    }
    
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getLoginId() {
        return loginId;
    }

    public void setLoginId(String loginId) {
        this.loginId = loginId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
    
}
