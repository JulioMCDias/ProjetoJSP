/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author julio
 */
@Entity
@Table(name = "produto")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Produto_1.findAll", query = "SELECT p FROM Produto_1 p")
    , @NamedQuery(name = "Produto_1.findById", query = "SELECT p FROM Produto_1 p WHERE p.id = :id")
    , @NamedQuery(name = "Produto_1.findByNome", query = "SELECT p FROM Produto_1 p WHERE p.nome = :nome")
    , @NamedQuery(name = "Produto_1.findByDescricao", query = "SELECT p FROM Produto_1 p WHERE p.descricao = :descricao")
    , @NamedQuery(name = "Produto_1.findByQuantidade", query = "SELECT p FROM Produto_1 p WHERE p.quantidade = :quantidade")
    , @NamedQuery(name = "Produto_1.findByTamanho", query = "SELECT p FROM Produto_1 p WHERE p.tamanho = :tamanho")})
public class Produto implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Size(max = 50)
    @Column(name = "nome")
    private String nome;
    @Size(max = 50)
    @Column(name = "descricao")
    private String descricao;
    @Column(name = "quantidade")
    private Integer quantidade;
    @Size(max = 5)
    @Column(name = "tamanho")
    private String tamanho;

    public Produto() {
    }

    public Produto(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Integer getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(Integer quantidade) {
        this.quantidade = quantidade;
    }

    public String getTamanho() {
        return tamanho;
    }

    public void setTamanho(String tamanho) {
        this.tamanho = tamanho;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Produto)) {
            return false;
        }
        Produto other = (Produto) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bean.Produto_1[ id=" + id + " ]";
    }
    
}
