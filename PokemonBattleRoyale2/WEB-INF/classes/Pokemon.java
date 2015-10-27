public class Pokemon{
    
    private int id;
    private String name;
    private String descripcion;
    private int level;

    public Pokemon(int id, String name, String descripcion, int level) {
        this.id = id;
        this.name = name;
        this.descripcion = descripcion;
        this.level = level;
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

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    @Override
    public String toString() {
        return "{\"id\": " + id + ", \"name\": \"" + name + "\", \"descripcion\": \"" + descripcion + "\", \"level\": " + level + "}";
    }
    
}