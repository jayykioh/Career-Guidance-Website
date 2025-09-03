
package Model;

public class Career {
    private int id;
    private String careerName;
    private String primaryType;   // R, I, A, S, E, C
    private String secondaryType; // Có thể null
    private String description;

    public Career() {
    }

    public Career(int id, String careerName, String primaryType, String secondaryType, String description) {
        this.id = id;
        this.careerName = careerName;
        this.primaryType = primaryType;
        this.secondaryType = secondaryType;
        this.description = description;
    }

    // Getter và Setter
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCareerName() {
        return careerName;
    }

    public void setCareerName(String careerName) {
        this.careerName = careerName;
    }

    public String getPrimaryType() {
        return primaryType;
    }

    public void setPrimaryType(String primaryType) {
        this.primaryType = primaryType;
    }

    public String getSecondaryType() {
        return secondaryType;
    }

    public void setSecondaryType(String secondaryType) {
        this.secondaryType = secondaryType;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setName(String string) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
