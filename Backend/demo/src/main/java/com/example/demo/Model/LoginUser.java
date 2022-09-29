package com.example.demo.Model;

public class LoginUser {

    private String email;
    private Boolean loggin;
    private String message;

    public LoginUser(String email, boolean logging, String message ) {
        this.email = email;
        this.loggin = logging;
        this.message = message;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Boolean getLoggin() {
        return loggin;
    }

    public void setLoggin(Boolean loggin) {
        this.loggin = loggin;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
