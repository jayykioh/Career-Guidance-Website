package Model;

public class university_majors {
    public int university_majors_id;
    public int university_id;
    public int major_id;
    public int combination_subject_id;

    public university_majors() {
    }

    public university_majors(int university_majors_id, int university_id, int major_id, int combination_subject_id) {
        this.university_majors_id = university_majors_id;
        this.university_id = university_id;
        this.major_id = major_id;
        this.combination_subject_id = combination_subject_id;
    }

    public int getUniversity_majors_id() {
        return university_majors_id;
    }

    public void setUniversity_majors_id(int university_majors_id) {
        this.university_majors_id = university_majors_id;
    }

    public int getUniversity_id() {
        return university_id;
    }

    public void setUniversity_id(int university_id) {
        this.university_id = university_id;
    }

    public int getMajor_id() {
        return major_id;
    }

    public void setMajor_id(int major_id) {
        this.major_id = major_id;
    }

    public int getCombination_subject_id() {
        return combination_subject_id;
    }

    public void setCombination_subject_id(int combination_subject_id) {
        this.combination_subject_id = combination_subject_id;
    }
    
}
