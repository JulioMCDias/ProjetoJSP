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
@Table(name = "fornecedores")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Fornecedores.findAll", query = "SELECT f FROM Fornecedores f")
    , @NamedQuery(name = "Fornecedores.findById", query = "SELECT f FROM Fornecedores f WHERE f.id = :id")
    , @NamedQuery(name = "Fornecedores.findByNome", query = "SELECT f FROM Fornecedores f WHERE f.nome = :nome")
    , @NamedQuery(name = "Fornecedores.findByTelefone", query = "SELECT f FROM Fornecedores f WHERE f.telefone = :telefone")
    , @NamedQuery(name = "Fornecedores.findByEndereco", query = "SELECT f FROM Fornecedores f WHERE f.endereco = :endereco")
    , @NamedQuery(name = "Fornecedores.findByCidade", query = "SELECT f FROM Fornecedores f WHERE f.cidade = :cidade")
    , @NamedQuery(name = "Fornecedores.findByEstado", query = "SELECT f FROM Fornecedores f WHERE f.estado = :estado")
    , @NamedQuery(name = "Fornecedores.findByCep", query = "SELECT f FROM Fornecedores f WHERE f.cep = :cep")})
public class Fornecedores implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Size(max = 45)
    @Column(name = "nome")
    private String nome;
    @Size(max = 45)
    @Column(name = "telefone")
    private String telefone;
    @Size(max = 45)
    @Column(name = "endereco")
    private String endereco;
    @Size(max = 45)
    @Column(name = "cidade")
    private String cidade;
    @Size(max = 45)
    @Column(name = "estado")
    private String estado;
    @Size(max = 45)
    @Column(name = "cep")
    private String cep;

    public Fornecedores() {
    }

    public Fornecedores(Integer id) {
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

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
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
        if (!(object instanceof Fornecedores)) {
            return false;
        }
        Fornecedores other = (Fornecedores) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bean.Fornecedores[ id=" + id + " ]";
    }
    
}
