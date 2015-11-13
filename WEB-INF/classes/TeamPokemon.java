public class TeamPokemon{
    
    private int idPokemon;
    private int idTrainer;
    private int level;
    private int health;
    private String nickname;
    private String imagen;

    public TeamPokemon(int idPokemon, int idTrainer, int level, int health, String nickname, String imagen) {
        this.idPokemon = idPokemon;
        this.idTrainer = idTrainer;
        this.level = level;
        this.health = health;
        this.nickname = nickname;
        this.imagen = imagen;
    }

    public int getIdPokemon() {
        return idPokemon;
    }

    public void setIdPokemon(int idPokemon) {
        this.idPokemon = idPokemon;
    }

    public int getIdTrainer() {
        return idTrainer;
    }

    public void setIdTrainer(int idTrainer) {
        this.idTrainer = idTrainer;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public int getHealth() {
        return health;
    }

    public void setHealth(int health) {
        this.health = health;
    }
    
}