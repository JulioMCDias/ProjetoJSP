/**
 * controller/Controle.java
 */
package controller;

import bean.Pessoa;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.DatatypeConverter;
import model.PessoaDAO;

/**
 *
 * Servlet Controle
 */
public class ControleProduto extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Verifica se o botão de cadastrar foi acionado
        if (request.getParameter("acao").contains("cadastrar")) {

            // Cria um objeto Pessoa
            Pessoa p = new Pessoa();

            // Atribui os valores do fomulário ao objeto criado
            p.setNome(request.getParameter("nome"));
            p.setCPF(request.getParameter("last-name"));

            
            
            // Tratamento de erro para a conexão com o banco de dados
            try {
                // Cria uma instância do model - PessoaDAO
                PessoaDAO pDao = new PessoaDAO();

                /**
                 * Invoca o método inserir no pDao para realizar a inclusão do
                 * registro e armazena o resultado na variável resultado
                 */
                String resultado = pDao.inserir(p);

                /**
                 * Cria o atributo mensagem utilizando o objeto request para
                 * enviar para a página de mensagem
                 */
                request.setAttribute("mensagem", resultado);
                response.setHeader("Refresh", "2; url=\"ControleCliente?acao=listar\"");

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
                Pessoa p = new Pessoa();

                /**
                 * Atribui os valores do fomulário ao objeto com o símbolo de %
                 * para o operador LIKE
                 */
                p.setNome("%" + request.getParameter("nome") + "%");

                // Cria uma instância do model - PessoaDAO
                PessoaDAO pDao = new PessoaDAO();

                // Cria uma lista para receber os registros retornados
                List pessoas = new ArrayList();

                // Recebe os registros e coloca na lista
                pessoas = pDao.pesquisar(p);

                // Verifica se algum registro foi encontrado
                if (pessoas.isEmpty()) {
                    // Criar um atributo mensagem para o objeto request
                    request.setAttribute("mensagem", "Nenhuma ocorrência localizada!");
                    response.setHeader("Refresh", "2; url=\"v_pesquisarCliente.jsp\"");

                    // Redireciona para a página de mensagem
                    RequestDispatcher redireciona = request.getRequestDispatcher("mensagem.jsp");
                    redireciona.forward(request, response);
                    
                    
                } else {
                    // Criar um atributo para o objeto request
                    request.setAttribute("listaPessoas", pessoas);

                    // Redireciona para a página de mensagem 
                    RequestDispatcher redireciona = request.getRequestDispatcher("listagemCliente.jsp");
                    redireciona.forward(request, response);
                }

            } catch (SQLException e) {
                /*
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
                Pessoa p = new Pessoa();

                // Atribui o id ao objeto recuperado do formulário
                p.setId(Integer.parseInt(request.getParameter("id")));

                // Criar um instância do model (PessoaDAO)
                PessoaDAO pDao = new PessoaDAO();

                // Cria uma lista para receber o registro retornado
                List pessoas = new ArrayList();

                // Recebe o registro e coloca na lista
                pessoas = pDao.editar(p);

                // Cria um atributo para o objeto request e passa a lista de pessoas
                request.setAttribute("listaPessoas", pessoas);

                // Redireciona para a página de edição (formulário)
                /*RequestDispatcher redireciona = request.getRequestDispatcher("v_editarCliente.jsp");
                redireciona.forward(request, response);*/

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
                Pessoa p = new Pessoa();

                // Atribui o id ao objeto Pessoa recuperado do formulário
                p.setId(Integer.parseInt(request.getParameter("id")));

                // Cria uma instância do model - PessoaDAO
                PessoaDAO pDao = new PessoaDAO();

                // Recebe a mensagem da exclusão
                String mensagem = pDao.excluir(p);

                // Cria um atributo mensagem para o objeto request
                request.setAttribute("mensagem", mensagem);

                /**
                 * Configura uma atualização da página de mensagem para
                 * redirecionar para a página de listagem após cinco segundos
                 * utilizando uma escrita no cabeçalho HTTP
                 */
                response.setHeader("Refresh", "2; url=\"ControleCliente?acao=listar\"");

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
                PessoaDAO pDao = new PessoaDAO();

                // Cria uma lista para receber os registros retornados
                List pessoas = new ArrayList();

                // Recebe os registros e coloca na lista
                pessoas = pDao.listar();

                // Verifica se existem registros para serem exibidos
                if (pessoas.isEmpty()) {
                    // Cria um atributo mensagem para o objeto request
                    request.setAttribute("mensagem", "Não há registros para serem exibidos!");

                    // Redireciona para a página de mensagem
                    RequestDispatcher redireciona = request.getRequestDispatcher("cadastrarCliente.jsp");
                    redireciona.forward(request, response);
                } else {
                    // Cria um atributo para o objeto request e passa a lista
                    request.setAttribute("listaPessoas", pessoas);

                    // Redireciona para a página de listagem 
                    RequestDispatcher redireciona = request.getRequestDispatcher("listagemCliente.jsp");
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
                Pessoa p = new Pessoa();

                // Atribui os valores do fomulário ao objeto Pessoa
                p.setId(Integer.parseInt(request.getParameter("id")));
                p.setNome(request.getParameter("nome"));
                p.setCPF(request.getParameter("last-name"));
                p.setEndereco(request.getParameter("middle-name"));
                p.setGenero(request.getParameter("gender")); 
                p.setTelefone(request.getParameter("telefone"));
                p.setDatanasc(request.getParameter(DatatypeConverter.parseString("datanasci")));
                
                        
                // Cria um instância do model (PessoaDAO)
                PessoaDAO pDao = new PessoaDAO();

                // Executa a atualização dos dados e recebe uma mensagem
                String mensagem = pDao.alterar(p);

                /**
                 * Configura uma atualização da página de mensagem para
                 * redirecionar para a página de listagem após cinco segundos
                 * utilizando uma escrita no cabeçalho HTTP
                 */
                response.setHeader("Refresh", "2; url=\"ControleCliente?acao=listar\"");
                
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
