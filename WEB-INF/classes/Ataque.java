public class Ataque{
    
    private int id;
    private String name;
    private String description;
    private int type;
    private int power;

    public Ataque(int id, String name, String description, int type, int power) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.type = type;
        this.power = power;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getPower() {
        return power;
    }

    public void setPower(int power) {
        this.power = power;
    }
    
}