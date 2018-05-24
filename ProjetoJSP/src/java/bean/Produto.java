/**
 * bean/Pessoa.java
 */
package bean;

import java.io.Serializable;

/**
 * Classe Bean da Pessoa
 */
public class Produto implements Serializable {

    // Atributos da classe
    private int id;
    private String nome;
    private String descricao;
    private int quantidade;
    private String tamanho;

    // Método construtor
    public Produto() {
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

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public String getTamanho() {
        return tamanho;
    }

    public void setTamanho(String tamanho) {
        this.tamanho = tamanho;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

   
}

