/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import jakarta.json.bind.annotation.JsonbProperty;



public class AICareerResponse {
    
    @JsonbProperty("carrie")
    private String carrie;
    
    @JsonbProperty("paidment")
    private String paidment;
    
    @JsonbProperty("futureNote")
    private String futureNote;
    
    // Constructors
    public AICareerResponse() {
    }
    
    public AICareerResponse(String carrie, String paidment, String futureNote) {
        this.carrie = carrie;
        this.paidment = paidment;
        this.futureNote = futureNote;
    }
    
    // Getters and Setters
    public String getCarrie() {
        return carrie;
    }
    
    public void setCarrie(String carrie) {
        this.carrie = carrie;
    }
    
    public String getPaidment() {
        return paidment;
    }
    
    public void setPaidment(String paidment) {
        this.paidment = paidment;
    }
    
    public String getFutureNote() {
        return futureNote;
    }
    
    public void setFutureNote(String futureNote) {
        this.futureNote = futureNote;
    }
    
    @Override
    public String toString() {
        return "AICareerResponse{" +
                "carrie='" + carrie + '\'' +
                ", paidment='" + paidment + '\'' +
                ", futureNote='" + futureNote + '\'' +
                '}';
    }
}