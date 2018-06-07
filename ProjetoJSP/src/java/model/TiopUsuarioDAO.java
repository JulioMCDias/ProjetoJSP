/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import bean.TipoUsuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.ConnectionFactory;

/**
 *
 * @author Julio
 */
public class TiopUsuarioDAO {
        // Variável para receber a conexão do banco de dados
    private final Connection conexao;

    /**
     * Método construtor da classe que recebe uma conexão ao ser instanciada
     *
     * @throws java.sql.SQLException
     */
    public TiopUsuarioDAO() throws SQLException {
        // Recebe a conexão com o banco de dados
        this.conexao = ConnectionFactory.getInstance().getConnection();
    }
    
    
    public List<TipoUsuario> listar() throws SQLException {

        // Instrução SQL para recuperar os registros
        String sql = "SELECT * FROM tipoUsuario;";

        // Lista para receber os registros recuperados
        List lstUsuario = new ArrayList();

        try ( // Prepara a instrução SQL para ser enviada ao banco de dados
                PreparedStatement ps = conexao.prepareStatement(sql);
                // Objeto que armazenará os dados recuperados (ResultSet)
                ResultSet rs = ps.executeQuery()) {
            /**
             * Percorre os registros retornados do banco de dados e coloca em
             * uma lista (lstUsuario)
             */
            while (rs.next()) {
                // Cria um objeto Usuario
                TipoUsuario u = new TipoUsuario();

                // Atribui ao objeto Usuario os valores retornados do banco
                u.setId(rs.getInt("id"));
                u.setNome(rs.getString("nome"));
                

                // Adiciona o objeto usuario na lista de usuarios
                lstUsuario.add(u);
            }
        }

        // Fecha a conexão
        conexao.close();

        // Retorna a lista com as usuarios encontradas
        return lstUsuario;
    }
}
