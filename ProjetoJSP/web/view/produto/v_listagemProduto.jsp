<%@page import="java.util.List"%>
<%@page import="bean.Produto"%>
<%@page import="java.util.ArrayList"%>

<!-- page content -->
<div class="right_col" role="main">
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>Cadastro de Produtos</h3>
            </div>

            <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                    <div class="input-group">
                        <div id="marota"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    
                    <div class="x_content">
                        <table id="tblList" class="table table-striped">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Código</th>
                                    <th>Descrição</th>
                                    <th>Unidade</th>
                                    <th>Detalhes</th>
                                    <th>Preço</th>
                                    <th>&nbsp;</th>
                                    <th>&nbsp;</th>
                                    <th>&nbsp;</th>
                                </tr>
                            </thead>
                            
                            <tbody>                     
                                <%
                                    /**
                                     * Cria uma lista para receber os
                                     * registros do atributo listaClientes
                                     * originado do servlet Controle
                                     */
                                    List<Produto> produtos = (ArrayList) request.getAttribute("listaProdutos");

                                    // Percorre a lista dos registros e apresenta no navegador
                                    for (Produto p : produtos) {
                                %>
                                <tr>
                                    <td><%=p.getId()%></td>
                                    <td><%=p.getCodigo()%></td>
                                    <td><%=p.getDescricao()%></td>
                                    <td><%=p.getUnidade()%></td>
                                    <td><%=p.getDetalhes()%></td>
                                    <td><%=p.getPreco()%></td>
                                    <td>
                                        <button class="btn btn-info btn-xs" data-toggle="modal" data-target="#ModalEditarProduto" 
                                           data-Id="<%=p.getId()%>" 
                                           data-Codigo="<%=p.getCodigo()%>"
                                           data-Descricao="<%=p.getDescricao()%>" 
                                           data-Unidade="<%=p.getUnidade()%>"
                                           data-Detalhes="<%=p.getDetalhes()%>"
                                           data-Preco="<%=p.getPreco()%>"> 
                                           <i class="fa fa-pencil"></i>&nbsp;Editar
                                        </button>
                                    </td>
                                    <td>
                                        <button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#ModalExcluirProduto"
                                           data-Id="<%=p.getId()%>">
                                           <i class="fa fa-trash"></i>&nbsp;Excluir
                                        </button>
                                    </td>
                                    <td>
                                        <a href="ControleProduto?acao=editar&id=<%=p.getId()%>" class="btn btn-dark btn-xs" role="button">
                                           <i class="fa fa-link"></i>&nbsp;Detalhes
                                        </a>
                                    </td>
                                </tr>
                                <%
                                    } // Fim do laço de repetição
                                %>
                        </table>
                        
                        <br>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalCadastrarProduto">
                            <i class="fa fa-plus"></i>&nbsp; Adicionar
                        </button>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /page content -->

