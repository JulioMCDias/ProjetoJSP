/**
 * model/ClienteDAO.java
 */
package model;

import bean.Cliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.ConnectionFactory; 

/**
 * Classe Model para o objeto Cliente (CRUD)
 */
public class ClienteDAO {

    // Variável para receber a conexão do banco de dados
    private final Connection conexao;

    /**
     * Método construtor da classe que recebe uma conexão ao ser instanciada
     *
     * @throws java.sql.SQLException
     */
    public ClienteDAO() throws SQLException {
        // Recebe a conexão com o banco de dados
        this.conexao = ConnectionFactory.getInstance().getConnection();
    }

    /**
     * Método inserir - Insere um novo registro no banco de dados
     *
     * @param c Objeto Cliente
     * @return String Mensagem de sucesso ou erro na inclusão
     * @throws SQLException
     */
    public String inserir(Cliente c) throws SQLException {

        // Instrução SQL para inclusão do registro
        String sql = "INSERT INTO clientes (nome, endereco, cpf, email, telefone, datanasc) VALUES (?, ?, ?, ?, ?, ?);";

        try {
            try ( // Prepara a instrução SQL para ser enviada ao banco de dados
                    PreparedStatement ps = conexao.prepareStatement(sql)) {

                // Inclui os valores a serem atribuidos à instrução SQL
                ps.setString(1, c.getNome());
                ps.setString(2, c.getEndereco());
                ps.setString(3, c.getCpf());
                ps.setString(4, c.getEmail());
                ps.setString(5, c.getTelefone());
                ps.setString(6, c.getDatanasc());
                        
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
     * @param c Objeto Cliente
     * @return List Lista o registro encontrado
     * @throws java.sql.SQLException
     */
    public List<Cliente> editar(Cliente c) throws SQLException {

        // Instrução SQL para recuperar o registro
        String sql = "SELECT * FROM clientes "
                + "WHERE id = ?";

        // Lista para receber o registro recuperado
        List lstCliente = new ArrayList();

        try ( // Prepara a instrução SQL para ser enviada ao banco de dados
                PreparedStatement ps = conexao.prepareStatement(sql)) {

            // Inclui o id informado à instrução SQL
            ps.setInt(1, c.getId());

            // Avança o registro para recuperar os dados retornados do banco de dados
            try ( // Objeto que armazenará os dados recuperados (ResultSet)
                    ResultSet rs = ps.executeQuery()) {

                /**
                 * Avança o registro para recuperar os dados retornados do banco
                 * de dados
                 */
                rs.next();

                // Cria um objeto Cliente
                c = new Cliente();

                // Atribui ao objeto Cliente os valores retornados do banco

                c.setId(rs.getInt("id"));
                c.setNome(rs.getString("nome"));
                c.setEndereco(rs.getString("endereco"));
                c.setCpf(rs.getString("cpf"));
                c.setEmail(rs.getString("email"));
                c.setDatanasc(rs.getString("datanasc"));
                c.setTelefone(rs.getString("telefone"));

                // Adiciona o objeto cliente na lista
                lstCliente.add(c);
            }
        }

        // Fecha a conexão
        conexao.close();

        // Retorna a lista com o registro solicitado
        return lstCliente;
    }

    /**
     * Método excluir - Realiza a exclusão de um registro pelo ID informado
     *
     * @param c Objeto Cliente
     * @return String Mensagem de sucesso ou erro na exclusão
     * @throws java.sql.SQLException
     */
    public String excluir(Cliente c) throws SQLException {

        // Instrução SQL para recuperar os registros
        String sql = "DELETE FROM clientes "
                + "WHERE id = ?;";

        try {
            try ( // Prepara a instrução SQL para ser enviada ao banco de dados
                    PreparedStatement ps = conexao.prepareStatement(sql)) {

                // Inclui o valor informado a ser atribuido à instrução SQL
                ps.setInt(1, c.getId());

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
     * @param c Objeto Cliente
     * @return Mensagem de sucesso ou erro na alteração (salvamento do registro)
     */
    public String alterar(Cliente c) {
        // Instrução SQL para atualização do registro
        String sql = "UPDATE clientes SET "
                + "nome = ?, endereco = ?, cpf = ?, email = ?, telefone = ?, datanasc = ? "
                + "WHERE id = ?;";
        try {
            try ( // Prepara a instrução SQL para ser enviada ao banco de dados
                    PreparedStatement ps = conexao.prepareStatement(sql)) {

                // Inclui os valores a serem atribuidos à instrução SQL
                
                ps.setString(1, c.getNome());
                ps.setString(2, c.getEndereco());
                ps.setString(3, c.getCpf());
                ps.setString(4, c.getEmail());
                ps.setString(5, c.getTelefone());
                ps.setString(6, c.getDatanasc());
                ps.setInt(7, c.getId());
                
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
     * @param c Objeto Cliente
     * @return List Lista com registros encontrados
     * @throws java.sql.SQLException
     */
    public List<Cliente> pesquisar(Cliente c) throws SQLException {

        // Instrução SQL para recuperar os registros
        String sql = "SELECT * FROM clientes "
                + "WHERE nome like ? ORDER BY ID ASC;";

        // Lista para receber os registros recuperados
        List lstClientes = new ArrayList();

        try ( // Prepara a instrução SQL para ser enviada ao banco de dados
                PreparedStatement ps = conexao.prepareStatement(sql)) {
            // Inclui o valor informado a ser atribuido à instrução SQL
            ps.setString(1, c.getNome());

            try ( // Objeto que armazenará os dados recuperados (recordSet)
                    ResultSet rs = ps.executeQuery()) {
                /**
                 * Percorre os registros retornados do banco e coloca em uma
                 * lista
                 */
                while (rs.next()) {
                    // Cria um objeto Cliente (bean)
                    c = new Cliente();

                    // Atribui ao objeto Cliente os valores retornados do banco
                    c.setId(rs.getInt("id"));
                    c.setNome(rs.getString("nome"));
                    c.setEndereco(rs.getString("endereco"));
                    c.setCpf(rs.getString("cpf"));
                    c.setEmail(rs.getString("email"));
                    c.setTelefone(rs.getString("telefone"));
                    c.setDatanasc(rs.getString("datanasc"));

                    // Adiciona o objeto Cliente na lista de clientes
                    lstClientes.add(c);
                }
            }
        }

        // Fecha a conexão
        conexao.close();

        // Retorna a lista com os clientes encontrados
        return lstClientes;
    }

    /**
     * Método listar - Recupera todos os registros no banco de dados
     *
     * @return List Retorna todos os registros contidos no banco de dados
     * @throws java.sql.SQLException
     *
     */
    public List<Cliente> listar() throws SQLException {

        // Instrução SQL para recuperar os registros
        String sql = "SELECT * FROM clientes ORDER BY nome ASC;";

        // Lista para receber os registros recuperados
        List lstClientes = new ArrayList();

        try ( // Prepara a instrução SQL para ser enviada ao banco de dados
                PreparedStatement ps = conexao.prepareStatement(sql);
                // Objeto que armazenará os dados recuperados (ResultSet)
                ResultSet rs = ps.executeQuery()) {
            /**
             * Percorre os registros retornados do banco de dados e coloca em
             * uma lista (lstClientes)
             */
            while (rs.next()) {
                // Cria um objeto Cliente
                Cliente c = new Cliente();

                // Atribui ao objeto Cliente os valores retornados do banco
                c.setId(rs.getInt("id"));
                c.setNome(rs.getString("nome"));
                c.setEndereco(rs.getString("endereco"));
                c.setCpf(rs.getString("cpf"));
                c.setEmail(rs.getString("email"));
                c.setTelefone(rs.getString("telefone"));
                c.setDatanasc(rs.getString("datanasc"));

                // Adiciona o objeto Cliente na lista de clientes
                lstClientes.add(c);
            }
        }

        // Fecha a conexão
        conexao.close();

        // Retorna a lista com os clientes encontrados
        return lstClientes;
    }
}
