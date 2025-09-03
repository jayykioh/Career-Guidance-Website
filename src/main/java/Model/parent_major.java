package Model;

import java.util.List;

public class parent_major {
    private int id;
    private String name;
    private List<majors> majors;

    public parent_major() {
    }

    public parent_major(int id, String name, List<majors> majors) {
        this.id = id;
        this.name = name;
        this.majors = majors;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<majors> getMajors() {
        return majors;
    }

    public void setMajors(List<majors> majors) {
        this.majors = majors;
    }
}
