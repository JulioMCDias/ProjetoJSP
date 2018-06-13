/**
 * controller/ControleProduto.java
 */
package controller;

import bean.Produto;
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
import model.ProdutoDAO;

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
//        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Verifica se o botão de cadastrar foi acionado
        if (request.getParameter("acao").contains("cadastrar")) {

            // Cria um objeto Produto
            Produto p = new Produto();

            // Atribui os valores do fomulário ao objeto criado
            p.setCodigo(request.getParameter("codigo"));
            p.setDescricao(request.getParameter("descricao"));
            p.setUnidade(request.getParameter("unidade"));
            p.setDetalhes(request.getParameter("detalhes"));
            p.setPreco(Float.parseFloat(request.getParameter("preco")));

            
            
            // Tratamento de erro para a conexão com o banco de dados
            try {
                // Cria uma instância do model - ProdutoDAO
                ProdutoDAO pDao = new ProdutoDAO();

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
                response.setHeader("Refresh", "2; url=\"ControleProduto?acao=listar\"");

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
                // Cria um objeto Produto
                Produto p = new Produto();

                /**
                 * Atribui os valores do fomulário ao objeto com o símbolo de %
                 * para o operador LIKE
                 */
                p.setCodigo("%" + request.getParameter("codigo") + "%");

                // Cria uma instância do model - ProdutoDAO
                ProdutoDAO pDao = new ProdutoDAO();

                // Cria uma lista para receber os registros retornados
                List produto = new ArrayList();

                // Recebe os registros e coloca na lista
                produto = pDao.pesquisar(p);

                // Verifica se algum registro foi encontrado
                if (produto.isEmpty()) {
                    // Criar um atributo mensagem para o objeto request
                    request.setAttribute("mensagem", "Nenhuma ocorrência localizada!");
                    response.setHeader("Refresh", "2; url=\"v_pesquisarProduto.jsp\"");

                    // Redireciona para a página de mensagem
                    RequestDispatcher redireciona = request.getRequestDispatcher("mensagem.jsp");
                    redireciona.forward(request, response);
                    
                    
                } else {
                    // Criar um atributo para o objeto request
                    request.setAttribute("listaProdutos", produto);

                    // Redireciona para a página de mensagem 
                    RequestDispatcher redireciona = request.getRequestDispatcher("listagemProduto.jsp");
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

                // Cria um objeto Produto
                Produto p = new Produto();

                // Atribui o id ao objeto recuperado do formulário
                p.setId(Integer.parseInt(request.getParameter("id")));

                // Criar um instância do model (ProdutoDAO)
                ProdutoDAO pDao = new ProdutoDAO();

                // Cria uma lista para receber o registro retornado
                List produtos = new ArrayList();

                // Recebe o registro e coloca na lista
                produtos = pDao.editar(p);

                // Cria um atributo para o objeto request e passa a lista de produtos
                request.setAttribute("listaProdutos", produtos);

                // Redireciona para a página de edição (formulário)
                RequestDispatcher redireciona = request.getRequestDispatcher("listagemItem.jsp");
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
                // Cria um objeto Produto
                Produto p = new Produto();

                // Atribui o id ao objeto Produto recuperado do formulário
                p.setId(Integer.parseInt(request.getParameter("id")));

                // Cria uma instância do model - ProdutoDAO
                ProdutoDAO pDao = new ProdutoDAO();

                // Recebe a mensagem da exclusão
                String mensagem = pDao.excluir(p);

                // Cria um atributo mensagem para o objeto request
                request.setAttribute("mensagem", mensagem);

                /**
                 * Configura uma atualização da página de mensagem para
                 * redirecionar para a página de listagem após cinco segundos
                 * utilizando uma escrita no cabeçalho HTTP
                 */
                response.setHeader("Refresh", "2; url=\"ControleProduto?acao=listar\"");

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
                // Cria um instância do model (ProdutoDAO)
                ProdutoDAO pDao = new ProdutoDAO();

                // Cria uma lista para receber os registros retornados
                List produtos = new ArrayList();

                // Recebe os registros e coloca na lista
                produtos = pDao.listar();

                // Verifica se existem registros para serem exibidos
                if (produtos.isEmpty()) {
                    // Cria um atributo mensagem para o objeto request
                    request.setAttribute("mensagem", "Não há registros para serem exibidos!");

                    // Redireciona para a página de mensagem
                    RequestDispatcher redireciona = request.getRequestDispatcher("listagemProduto.jsp");
                    redireciona.forward(request, response);
                } else {
                    // Cria um atributo para o objeto request e passa a lista
                    request.setAttribute("listaProdutos", produtos);

                    // Redireciona para a página de listagem 
                    RequestDispatcher redireciona = request.getRequestDispatcher("listagemProduto.jsp");
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
                // Cria um objeto Produto
                Produto p = new Produto();

                // Atribui os valores do fomulário ao objeto Produto
                p.setId(Integer.parseInt(request.getParameter("id")));
                p.setCodigo(request.getParameter("codigo"));
                p.setDescricao(request.getParameter("descricao"));
                p.setUnidade(request.getParameter("unidade"));
                p.setDetalhes(request.getParameter("detalhes"));
                p.setPreco(Float.parseFloat(request.getParameter("preco")));
                
                        
                // Cria um instância do model (ProdutoDAO)
                ProdutoDAO pDao = new ProdutoDAO();

                // Executa a atualização dos dados e recebe uma mensagem
                String mensagem = pDao.alterar(p);

                /**
                 * Configura uma atualização da página de mensagem para
                 * redirecionar para a página de listagem após cinco segundos
                 * utilizando uma escrita no cabeçalho HTTP
                 */
                response.setHeader("Refresh", "2; url=\"ControleProduto?acao=listar\"");
                
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
            Logger.getLogger(ControleProduto.class
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
            Logger.getLogger(ControleProduto.class
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
