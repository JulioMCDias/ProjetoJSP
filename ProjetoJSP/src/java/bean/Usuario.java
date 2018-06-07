/**
 * bean/Usuario.java
 */
package bean;

import java.io.Serializable;

/**
 * Classe Bean do Usuario
 */
public class Usuario implements Serializable {
    
    // Atributos da classe
    private int id;
    private int tipoUsuarioId;
    private String usuario;
    private String senha;
    private String cargo;
    
    //método construtor
    public Usuario() {
    }
    
    //métodos getters e setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTipoUsuarioId() {
        return tipoUsuarioId;
    }

    public void setTipoUsuarioId(int tipoUsuarioId) {
        this.tipoUsuarioId = tipoUsuarioId;
    }

    
    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }
    
    
}
