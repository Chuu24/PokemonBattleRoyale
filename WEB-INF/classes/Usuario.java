public class Usuario{
	protected String username;
	protected String name;
	protected int idperfil;
	protected String sprite;
	protected String mail;
        protected int edad;

    public Usuario(String username, String name, int idperfil, String sprite, String mail, int edad) {
        this.username = username;
        this.name = name;
        this.idperfil = idperfil;
        this.sprite = sprite;
        this.mail = mail;
        this.edad = edad;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getIdperfil() {
        return idperfil;
    }

    public void setIdperfil(int idperfil) {
        this.idperfil = idperfil;
    }

    public String getSprite() {
        return sprite;
    }

    public void setSprite(String sprite) {
        this.sprite = sprite;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }
      
}