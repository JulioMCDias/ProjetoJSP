/**
 * model/UsuarioDAO.java
 */
package model;

import bean.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.ConnectionFactory; 

/**
 * Classe Model para o objeto Usuario (CRUD)
 */
public class ProdutoDAO {
    
    // Variável para receber a conexão do banco de dados
    private final Connection conexao;

    /**
     * Método construtor da classe que recebe uma conexão ao ser instanciada
     *
     * @throws java.sql.SQLException
     */
    public ProdutoDAO() throws SQLException {
        // Recebe a conexão com o banco de dados
        this.conexao = ConnectionFactory.getInstance().getConnection();
    }

    /**
     * Método inserir - Insere um novo registro no banco de dados
     *
     * @param u Objeto Pessoa
     * @return String Mensagem de sucesso ou erro na inclusão
     * @throws SQLException
     */
    public String inserir(Usuario u) throws SQLException {

        // Instrução SQL para inclusão do registro
        String sql = "INSERT INTO usuarios (usuario, senha) VALUES (?, ?)";

        try {
            try ( // Prepara a instrução SQL para ser enviada ao banco de dados
                    PreparedStatement ps = conexao.prepareStatement(sql)) {

                // Inclui os valores a serem atribuidos à instrução SQL
                ps.setString(1, u.getUsuario());
                ps.setString(2, u.getSenha());
                        
                // Executa a instrução de inclusão do registro
                ps.execute();
            }

            // Fecha a conexão
            conexao.close();

            // Retorna uma mensagem de sucesso
            return "Registro incluído com sucesso!";

        } catch (SQLException e) {

            // Retorna uma mensagem de erro
            return e.getMessage();
        }
    }

    /**
     * Método editar - Retorna o registro solicitado para edição
     *
     * @param u Objeto Usuário
     * @return List Lista o registro encontrado
     * @throws java.sql.SQLException
     */
    public List<Usuario> editar(Usuario u) throws SQLException {

        // Instrução SQL para recuperar o registro
        String sql = "SELECT * FROM usuarios "
                + "WHERE id = ?";

        // Lista para receber o registro recuperado
        List lstUsuario = new ArrayList();

        try ( // Prepara a instrução SQL para ser enviada ao banco de dados
                PreparedStatement ps = conexao.prepareStatement(sql)) {

            // Inclui o id informado à instrução SQL
            ps.setInt(1, u.getId());

            // Avança o registro para recuperar os dados retornados do banco de dados
            try ( // Objeto que armazenará os dados recuperados (ResultSet)
                    ResultSet rs = ps.executeQuery()) {

                /**
                 * Avança o registro para recuperar os dados retornados do banco
                 * de dados
                 */
                rs.next();

                // Cria um objeto Usuário
                u = new Usuario();

                // Atribui ao objeto Usuário os valores retornados do banco

                u.setId(rs.getInt("id"));
                u.setUsuario(rs.getString("usuario"));
                u.setSenha(rs.getString("senha"));
                
                // Adiciona o objeto usuario na lista
                lstUsuario.add(u);
            }
        }

        // Fecha a conexão
        conexao.close();

        // Retorna a lista com o registro solicitado
        return lstUsuario;
    }

    /**
     * Método excluir - Realiza a exclusão de um registro pelo ID informado
     *
     * @param u Objeto Usuário
     * @return String Mensagem de sucesso ou erro na exclusão
     * @throws java.sql.SQLException
     */
    public String excluir(Usuario u) throws SQLException {

        // Instrução SQL para recuperar os registros
        String sql = "DELETE FROM usuarios "
                + "WHERE id = ?;";

        try {
            try ( // Prepara a instrução SQL para ser enviada ao banco de dados
                    PreparedStatement ps = conexao.prepareStatement(sql)) {

                // Inclui o valor informado a ser atribuido à instrução SQL
                ps.setInt(1, u.getId());

                // Executa a exclusão
                ps.executeUpdate();
            }

            // Fecha a conexão
            conexao.close();

            // Retorna a mensagem de exclusão
            return "Registro excluído com sucesso!";

        } catch (SQLException e) {

            // Retorna o erro ocorrido caso ão consiga excluir
            return e.getMessage();
        }

    }

    /**
     * Método alterar - Realiza a gravação (alteração) do registro no banco de
     * dados
     *
     * @param u Objeto Usuário
     * @return Mensagem de sucesso ou erro na alteração (salvamento do registro)
     */
    public String alterar(Usuario u) {
        // Instrução SQL para atualização do registro
        String sql = "UPDATE usuarios SET "
                + "usuario = ?, senha = ? "
                + "WHERE id = ?;";
        try {
            try ( // Prepara a instrução SQL para ser enviada ao banco de dados
                    PreparedStatement ps = conexao.prepareStatement(sql)) {

                // Inclui os valores a serem atribuidos à instrução SQL
                
                ps.setString(1, u.getUsuario());
                ps.setString(2, u.getSenha());
                ps.setInt(3, u.getId());
                
                // Executa a instrução de atualização do registro
                ps.executeUpdate();
            }

            // Fecha a conexão
            conexao.close();

            // Retorna uma mensagem de sucesso
            return "Registro alterado com sucesso!";

        } catch (SQLException e) {

            // Retorna uma mensagem de erro
            return e.getMessage();
        }
    }

    /**
     * Método Pesquisar - Realiza a pesquisa de um registro específico pelo ID
     *
     * @param u Objeto Usuario
     * @return List Lista com registros encontrados
     * @throws java.sql.SQLException
     */
    public List<Usuario> pesquisar(Usuario u) throws SQLException {

        // Instrução SQL para recuperar os registros
        String sql = "SELECT * FROM usuarios "
                + "WHERE usuario like ? ORDER BY ID ASC;";

        // Lista para receber os registros recuperados
        List lstUsuario = new ArrayList();

        try ( // Prepara a instrução SQL para ser enviada ao banco de dados
                PreparedStatement ps = conexao.prepareStatement(sql)) {
            // Inclui o valor informado a ser atribuido à instrução SQL
            ps.setString(1, u.getUsuario());

            try ( // Objeto que armazenará os dados recuperados (recordSet)
                    ResultSet rs = ps.executeQuery()) {
                /**
                 * Percorre os registros retornados do banco e coloca em uma
                 * lista
                 */
                while (rs.next()) {
                    // Cria um objeto Usuario (bean)
                    u = new Usuario();

                    // Atribui ao objeto Usuario os valores retornados do banco
                    u.setId(rs.getInt("id"));
                    u.setUsuario(rs.getString("usuario"));
                    u.setSenha(rs.getString("senha"));
                    

                    // Adiciona o objeto Usuario na lista de usuarios
                    lstUsuario.add(u);
                }
            }
        }

        // Fecha a conexão
        conexao.close();

        // Retorna a lista com as usuarios encontradas
        return lstUsuario;
    }

    /**
     * Método listar - Recupera todos os registros no banco de dados
     *
     * @return List Retorna todos os registros contidos no banco de dados
     * @throws java.sql.SQLException
     *
     */
    public List<Usuario> listar() throws SQLException {

        // Instrução SQL para recuperar os registros
        String sql = "SELECT * FROM usuarios ORDER BY usuario ASC;";

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
                Usuario u = new Usuario();

                // Atribui ao objeto Usuario os valores retornados do banco
                u.setId(rs.getInt("id"));
                u.setUsuario(rs.getString("usuario"));
                u.setSenha(rs.getString("senha"));
                

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
