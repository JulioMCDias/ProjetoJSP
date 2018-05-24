/**
 * bean/Pessoa.java
 */
package bean;

import java.io.Serializable;

/**
 * Classe Bean da Pessoa
 */
public class Pessoa implements Serializable {

    // Atributos da classe
    private int id;
    private String nome;
    private String telefone;

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

}
