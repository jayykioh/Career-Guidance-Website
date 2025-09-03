package Model;

public class admission_scores {

    private int universityId;
    private String universityName;
    private String location;
    private String majorName;
    private int year;
    private double score;
    private String combinationCode;

    public admission_scores() {
    }

    public admission_scores(int universityId, String universityName, String location,
            String majorName, int year, double score, String combinationCode) {
        this.universityId = universityId;
        this.universityName = universityName;
        this.location = location;
        this.majorName = majorName;
        this.year = year;
        this.score = score;
        this.combinationCode = combinationCode;
    }

    // Getters
    public int getUniversityId() {
        return universityId;
    }

    public String getUniversityName() {
        return universityName;
    }

    public String getLocation() {
        return location;
    }

    public String getMajorName() {
        return majorName;
    }

    public int getYear() {
        return year;
    }

    public double getScore() {
        return score;
    }

    public String getCombinationCode() {
        return combinationCode;
    }

    // Setters
    public void setUniversityId(int universityId) {
        this.universityId = universityId;
    }

    public void setUniversityName(String universityName) {
        this.universityName = universityName;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public void setMajorName(String majorName) {
        this.majorName = majorName;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public void setScore(double score) {
        this.score = score;
    }

    public void setCombinationCode(String combinationCode) {
        this.combinationCode = combinationCode;
    }
}
