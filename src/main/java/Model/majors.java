package Model;

public class majors {
    private int id;
    private String name;

    public majors() {
    }

    public int getId() {
        return id;
    }

    public majors(int id, String name) {
        this.id = id;
        this.name = name;
    }

    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    
}
