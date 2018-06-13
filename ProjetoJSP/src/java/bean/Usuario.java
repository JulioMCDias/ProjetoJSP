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
    private String usuario;
    private String senha;
    
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
    
    
}
