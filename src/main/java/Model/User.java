/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.time.LocalDate;

/**
 *
 * @author FPT
 */
public class User {

    private int id;
    private String username;
    private String fullName;
    private String email;
    private LocalDate membershipExpiry;

    public User() {
    }

    public User(int id, String username, String fullName, String email, LocalDate membershipExpiry) {
        this.id = id;
        this.username = username;
        this.fullName = fullName;
        this.email = email;
        this.membershipExpiry = membershipExpiry;
    }

    public User(String username, String fullName, String email) {
        this.username = username;
        this.fullName = fullName;
        this.email = email;
        this.membershipExpiry = null;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public LocalDate getMembershipExpiry() {
        return membershipExpiry;
    }

    public void setMembershipExpiry(LocalDate membershipExpiry) {
        this.membershipExpiry = membershipExpiry;
    }

    public boolean isMembershipActive() {
        return membershipExpiry != null && membershipExpiry.isAfter(LocalDate.now());
    }

}
