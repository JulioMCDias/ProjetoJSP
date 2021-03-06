/**
 * controller/Controle.java
 */
package controller;

import bean.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.UsuarioDAO;

/**
 *
 * Servlet ControleCliente
 */
public class ControleUsuario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
//        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Verifica se o botão de cadastrar foi acionado
        if (request.getParameter("acao").contains("cadastrar")) {

            // Cria um objeto Pessoa
            Usuario u = new Usuario();

            // Atribui os valores do fomulário ao objeto criado
            u.setUsuario(request.getParameter("usuario"));
            u.setSenha(request.getParameter("senha"));
            
            
            
            // Tratamento de erro para a conexão com o banco de dados
            try {
                // Cria uma instância do model - PessoaDAO
                UsuarioDAO uDao = new UsuarioDAO();

                /**
                 * Invoca o método inserir no pDao para realizar a inclusão do
                 * registro e armazena o resultado na variável resultado
                 */
                String resultado = uDao.inserir(u);

                /**
                 * Cria o atributo mensagem utilizando o objeto request para
                 * enviar para a página de mensagem
                 */
                request.setAttribute("mensagem", resultado);
                response.setHeader("Refresh", "2; url=\"ControleUsuario?acao=listar\"");

            } catch (SQLException e) {
                /**
                 * Cria o atributo mensagem utilizando o objeto request para
                 * enviar para a página de mensagem caso não conecte no banco
                 */
                if (e.getErrorCode() == 0) {
                    request.setAttribute("mensagem", "Não foi possível se comunicar com o banco de dados!");
                }
            }

            // Redireciona para a página de mensagem
            RequestDispatcher redireciona = request.getRequestDispatcher("mensagem.jsp");
            redireciona.forward(request, response);
        }

        // Verifica se o botão Pesquisar foi acionado
        if (request.getParameter("acao").contains("pesquisar")) {
            // Tratamento de erro para a conexão com o banco de dados
            try {
                // Cria um objeto Pessoa
                Usuario u = new Usuario();

                /**
                 * Atribui os valores do fomulário ao objeto com o símbolo de %
                 * para o operador LIKE
                 */
                u.setUsuario("%" + request.getParameter("usuario") + "%");

                // Cria uma instância do model - PessoaDAO
                UsuarioDAO uDao = new UsuarioDAO();

                // Cria uma lista para receber os registros retornados
                List usuario = new ArrayList();

                // Recebe os registros e coloca na lista
                usuario = uDao.pesquisar(u);

                // Verifica se algum registro foi encontrado
                if (usuario.isEmpty()) {
                    // Criar um atributo mensagem para o objeto request
                    request.setAttribute("mensagem", "Nenhuma ocorrência localizada!");
                    response.setHeader("Refresh", "2; url=\"pesquisarUsuario.jsp\"");

                    // Redireciona para a página de mensagem
                    RequestDispatcher redireciona = request.getRequestDispatcher("mensagem.jsp");
                    redireciona.forward(request, response);
                    
                    
                } else {
                    // Criar um atributo para o objeto request
                    request.setAttribute("listaUsuario", usuario);

                    // Redireciona para a página de mensagem 
                    RequestDispatcher redireciona = request.getRequestDispatcher("listagemUsuario.jsp");
                    redireciona.forward(request, response);
                }

            } catch (SQLException e) {
                /**
                 * Cria o atributo mensagem utilizando o objeto request para
                 * enviar para a página de mensagem caso não conecte no banco
                 */
                if (e.getErrorCode() == 0) {
                    request.setAttribute("mensagem", "Não foi possível se comunicar com o banco de dados!");
                    // Redirecionar para uma saída (view)
                    RequestDispatcher redireciona = request.getRequestDispatcher("mensagem.jsp");
                    redireciona.forward(request, response);
                }
            }
        }

        // Verifica se o registro foi selecionado para edição
        if (request.getParameter("acao").contains("editar")) {
            // Tratamento de erro para a conexão com o banco de dados
            try {

                // Cria um objeto Pessoa
                Usuario u = new Usuario();

                // Atribui o id ao objeto recuperado do formulário
                u.setId(Integer.parseInt(request.getParameter("id")));

                // Criar um instância do model (PessoaDAO)
                UsuarioDAO uDao = new UsuarioDAO();

                // Cria uma lista para receber o registro retornado
                List usuario = new ArrayList();

                // Recebe o registro e coloca na lista
                usuario = uDao.editar(u);

                // Cria um atributo para o objeto request e passa a lista de pessoas
                request.setAttribute("listaUsuario", usuario);

                // Redireciona para a página de edição (formulário)
                RequestDispatcher redireciona = request.getRequestDispatcher("editarUsuario.jsp");
                redireciona.forward(request, response);

            } catch (SQLException e) {
                /**
                 * Cria o atributo mensagem utilizando o objeto request para
                 * enviar para a página de mensagem caso não conecte no banco
                 */
                if (e.getErrorCode() == 0) {
                    request.setAttribute("mensagem", "Não foi possível se comunicar com o banco de dados!");

                    // Redireciona para a página de mensagem
                    RequestDispatcher redireciona = request.getRequestDispatcher("mensagem.jsp");
                    redireciona.forward(request, response);
                }
            }
        }

        // Verifica se o registro foi selecionado para exclusão
        if (request.getParameter("acao").contains("excluir")) {
            // Tratamento de erro para a conexão com o banco de dados
            try {
                // Cria um objeto Pessoa
                Usuario u = new Usuario();

                // Atribui o id ao objeto Pessoa recuperado do formulário
                u.setId(Integer.parseInt(request.getParameter("id")));

                // Cria uma instância do model - PessoaDAO
                UsuarioDAO uDao = new UsuarioDAO();

                // Recebe a mensagem da exclusão
                String mensagem = uDao.excluir(u);

                // Cria um atributo mensagem para o objeto request
                request.setAttribute("mensagem", mensagem);

                /**
                 * Configura uma atualização da página de mensagem para
                 * redirecionar para a página de listagem após cinco segundos
                 * utilizando uma escrita no cabeçalho HTTP
                 */
                response.setHeader("Refresh", "2; url=\"ControleUsuario?acao=listar\"");

                // Redireciona para a página de mensagem 
                RequestDispatcher redireciona = request.getRequestDispatcher("mensagem.jsp");
                redireciona.forward(request, response);

            } catch (SQLException e) {
                /**
                 * Cria o atributo mensagem utilizando o objeto request para
                 * enviar para a página de mensagem caso não conecte no banco
                 */
                if (e.getErrorCode() == 0) {
                    request.setAttribute("mensagem", "Não foi possível se comunicar com o banco de dados!");

                    // Redireciona para a página de mensagem
                    RequestDispatcher redireciona = request.getRequestDispatcher("mensagem.jsp");
                    redireciona.forward(request, response);
                }
            }
        }

        // Verifica se o botão Listar foi acionado
        if (request.getParameter("acao").contains("listar")) {
            // Tratamento de erro para a conexão com o banco de dados
            try {
                // Cria um instância do model (PessoaDAO)
                UsuarioDAO uDao = new UsuarioDAO();

                // Cria uma lista para receber os registros retornados
                List usuario = new ArrayList();

                // Recebe os registros e coloca na lista
                usuario = uDao.listar();

                // Verifica se existem registros para serem exibidos
                if (usuario.isEmpty()) {
                    // Cria um atributo mensagem para o objeto request
                    request.setAttribute("mensagem", "Não há registros para serem exibidos!");

                    // Redireciona para a página de mensagem
                    request.setAttribute("listaUsuario", usuario);
                    RequestDispatcher redireciona = request.getRequestDispatcher("listagemUsuario.jsp");
                    redireciona.forward(request, response);
                } else {
                    // Cria um atributo para o objeto request e passa a lista
                    request.setAttribute("listaUsuario", usuario);

                    // Redireciona para a página de listagem 
                    RequestDispatcher redireciona = request.getRequestDispatcher("listagemUsuario.jsp");
                    redireciona.forward(request, response);
                }
            } catch (SQLException e) {
                if (e.getErrorCode() == 0) {
                    /**
                     * Cria o atributo mensagem utilizando o objeto request para
                     * enviar para a página de mensagem caso não conecte no
                     * banco
                     */
                    request.setAttribute("mensagem", "Não foi possível se comunicar com o banco de dados!");

                    // Redireciona para a página de mensagem
                    RequestDispatcher redireciona = request.getRequestDispatcher("mensagem.jsp");
                    redireciona.forward(request, response);
                }
            }
        }

        // Verifica se o botão Alterar foi acionado
        if (request.getParameter("acao").contains("alterar")) {
            // Tratamento de erro para a conexão com o banco de dados
            try {
                // Cria um objeto Pessoa
                Usuario u = new Usuario();

                // Atribui os valores do fomulário ao objeto Pessoa
                u.setId(Integer.parseInt(request.getParameter("id")));
                u.setUsuario(request.getParameter("usuario"));
                u.setSenha(request.getParameter("senha"));
                
                        
                // Cria um instância do model (PessoaDAO)
                UsuarioDAO uDao = new UsuarioDAO();

                // Executa a atualização dos dados e recebe uma mensagem
                String mensagem = uDao.alterar(u);

                /**
                 * Configura uma atualização da página de mensagem para
                 * redirecionar para a página de listagem após cinco segundos
                 * utilizando uma escrita no cabeçalho HTTP
                 */
                response.setHeader("Refresh", "2; url=\"ControleUsuario?acao=listar\"");
                
                // Cria o atributo mensagem para o objeto request 
                request.setAttribute("mensagem", mensagem);

                // Redireciona para a página de mensagem 
                RequestDispatcher redireciona = request.getRequestDispatcher("mensagem.jsp");
                redireciona.forward(request, response);

            } catch (SQLException e) {
                /**
                 * Cria o atributo mensagem utilizando o objeto request para
                 * enviar para a página de mensagem caso não conecte no banco
                 */
                if (e.getErrorCode() == 0) {
                    request.setAttribute("mensagem", "Não foi possível se comunicar com o banco de dados!");

                    // Redireciona para a página de mensagem
                    RequestDispatcher redireciona = request.getRequestDispatcher("mensagem.jsp");
                    redireciona.forward(request, response);
                }
            }
        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(ControleCliente.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(ControleCliente.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private Object SimpleDateFormat(String ddMMyyyy) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
