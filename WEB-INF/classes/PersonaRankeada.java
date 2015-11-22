public class PersonaRankeada {
    protected int posicion;
    protected int iD;

    public int getiD() {
        return iD;
    }

    public void setiD(int iD) {
        this.iD = iD;
    }
    protected String nombre;
    protected int pkmnsCatched;

    public void setPosicion(int posicion) {
        this.posicion = posicion;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setPkmnsCatched(int pkmnsCatched) {
        this.pkmnsCatched = pkmnsCatched;
    }

    public int getPosicion() {
        return posicion;
    }

    public String getNombre() {
        return nombre;
    }

    public int getPkmnsCatched() {
        return pkmnsCatched;
    }

    public PersonaRankeada(int posicion, int iD, String nombre, int pkmnsCatched) {
        this.posicion = posicion;
        this.iD=iD;
        this.nombre = nombre;
        this.pkmnsCatched = pkmnsCatched;
    }
}
