package Model;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;

public class TestHistory {

    private int historyId;
    private int userId;
    private String userName;
    private String testName;
    private LocalDateTime testDate;

    private int realisticScore;
    private int investigativeScore;
    private int artisticScore;
    private int socialScore;
    private int enterprisingScore;
    private int conventionalScore;

    private String hollandCode;

    public TestHistory() {
    }

    public TestHistory(int historyId, int userId, String userName, String testName, LocalDateTime testDate, int realisticScore, int investigativeScore, int artisticScore, int socialScore, int enterprisingScore, int conventionalScore, String hollandCode) {
        this.historyId = historyId;
        this.userId = userId;
        this.userName = userName;
        this.testName = testName;
        this.testDate = testDate;
        this.realisticScore = realisticScore;
        this.investigativeScore = investigativeScore;
        this.artisticScore = artisticScore;
        this.socialScore = socialScore;
        this.enterprisingScore = enterprisingScore;
        this.conventionalScore = conventionalScore;
        this.hollandCode = hollandCode;
    }
 
    public int getHistoryId() {
        return historyId;
    }

    public void setHistoryId(int historyId) {
        this.historyId = historyId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getTestName() {
        return testName;
    }

    public void setTestName(String testName) {
        this.testName = testName;
    }

    public LocalDateTime getTestDate() {
        return testDate;
    }

    public void setTestDate(LocalDateTime testDate) {
        this.testDate = testDate;
    }

    public int getRealisticScore() {
        return realisticScore;
    }

    public void setRealisticScore(int realisticScore) {
        this.realisticScore = realisticScore;
    }

    public int getInvestigativeScore() {
        return investigativeScore;
    }

    public void setInvestigativeScore(int investigativeScore) {
        this.investigativeScore = investigativeScore;
    }

    public int getArtisticScore() {
        return artisticScore;
    }

    public void setArtisticScore(int artisticScore) {
        this.artisticScore = artisticScore;
    }

    public int getSocialScore() {
        return socialScore;
    }

    public void setSocialScore(int socialScore) {
        this.socialScore = socialScore;
    }

    public int getEnterprisingScore() {
        return enterprisingScore;
    }

    public void setEnterprisingScore(int enterprisingScore) {
        this.enterprisingScore = enterprisingScore;
    }

    public int getConventionalScore() {
        return conventionalScore;
    }

    public void setConventionalScore(int conventionalScore) {
        this.conventionalScore = conventionalScore;
    }

    public String getHollandCode() {
        return hollandCode;
    }

    public void setHollandCode(String hollandCode) {
        this.hollandCode = hollandCode;
    }

    public String getFormattedDate() {
        if (testDate == null) {
            return "";
        }
        return testDate.format(DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm"));
    }

}
