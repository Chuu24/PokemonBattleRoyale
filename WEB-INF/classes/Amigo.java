/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Cantucky
 */
public class Amigo {
    protected String nombre;
    protected String userName;
    protected int iD;
    protected String status;

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getiD() {
        return iD;
    }

    public void setiD(int iD) {
        this.iD = iD;
    }
    
    
    public Amigo(String nombre, String userName,int iD, String status) {
        this.nombre = nombre;
        this.userName=userName;
        this.iD = iD;
        this.status = status;
    }
    
}
