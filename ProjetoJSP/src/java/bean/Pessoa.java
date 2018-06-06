/**
 * bean/Pessoa.java
 */
package bean;

import java.io.Serializable;
import java.sql.Date;

/**
 * Classe Bean da Pessoa
 */
public class Pessoa implements Serializable {

   // Atributos da classe
    private int id;
    private String nome;
    private String ultnome;
    private String nomemeio;
    private String genero;
    private String telefone;
    private String datanasc;


    // Método construtor
    public Pessoa() {
    }

    // Métodos getters e setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }
    
    public String getUltnome() {
        return ultnome;
    }

    public void setUltnome(String ultnome) {
        this.ultnome = ultnome;
    }

    public String getNomemeio() {
        return nomemeio;
    }

    public void setNomemeio(String nomemeio) {
        this.nomemeio = nomemeio;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getDatanasc() {
        return datanasc;
    }

    public void setDatanasc(String datanasc) {
        this.datanasc = datanasc;
    }
}
