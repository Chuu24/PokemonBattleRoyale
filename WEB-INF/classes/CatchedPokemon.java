public class CatchedPokemon{
    private int idPokemon;
    private int idTrainer;
    private int level;
    private String nickname;
    private int ability;
    private int attack1;
    private int attack2;
    private int attack3;
    private int attack4;
    private int health;

    public CatchedPokemon(int idPokemon, int idTrainer, int level, String nickname, int health) {
        this.idPokemon = idPokemon;
        this.idTrainer = idTrainer;
        this.level = level;
        this.nickname = nickname;
        this.health = health;
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

    public int getAbility() {
        return ability;
    }

    public void setAbility(int ability) {
        this.ability = ability;
    }

    public int getAttack1() {
        return attack1;
    }

    public void setAttack1(int attack1) {
        this.attack1 = attack1;
    }

    public int getAttack2() {
        return attack2;
    }

    public void setAttack2(int attack2) {
        this.attack2 = attack2;
    }

    public int getAttack3() {
        return attack3;
    }

    public void setAttack3(int attack3) {
        this.attack3 = attack3;
    }

    public int getAttack4() {
        return attack4;
    }

    public void setAttack4(int attack4) {
        this.attack4 = attack4;
    }

    public int getHealth() {
        return health;
    }

    public void setHealth(int health) {
        this.health = health;
    }
    
}