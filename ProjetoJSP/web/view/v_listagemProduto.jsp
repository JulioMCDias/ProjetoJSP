<%@page import="java.util.List"%>
<%@page import="bean.Usuario"%>
<%@page import="java.util.ArrayList"%>

<!-- page content -->
<div class="right_col" role="main">
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>Listagem dos Produtos</h3>
            </div>

            <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                    <div class="input-group">

                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <table id="tblList" class="table table-striped">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nome</th>
                                    <th>Discrição</th>
                                    <th>Quantidade</th>
                                    <th>&nbsp;</th>
                                    <th>&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody>                     
                                <%
                                    /**
                                     * Cria uma lista para receber os registros
                                     * do atributo listaPessoas originado do
                                     * servlet Controle
                                     */
                                    List<Usuario> usuario = (ArrayList) request.getAttribute("listaUsuario");

                                    // Percorre a lista dos registros e apresenta no navegador
                                    for (Usuario u : usuario) {
                                %>

                                <tr>
                                    <td><%=u.getId()%></td>
                                    <td><%=u.getUsuario()%></td>
                                    <td><%=u.getSenha()%></td>
                                    
                                    <td>
                                        <button class="btn btn-info btn-xs" data-toggle="modal" data-target="#ModalEditarProduto"
                                        data-Id="<%=u.getId()%>"
                                        data-Usuario="<%=u.getUsuario()%>"
                                        data-Senha="<%=u.getSenha()%>">
                                            
                                        <i class="fa fa-pencil"></i>&nbsp;Editar
                                        </button>
                                    <td>
                                        <button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#ModalExcluir"
                                           data-Id="<%=u.getId()%>">
                                           <i class="fa fa-trash"></i>&nbsp;Excluir
                                        </button>
                                    </td>
                                </tr>
                                <%
                                    } // Fim do laço de repetição
                                %>
                        </table>
                        <br>
                        <button type="button" id="btn-mymodal" class="btn btn-primary" data-toggle="modal" data-target="#ModalCadastrarProduto"><i class="fa fa-plus"></i>&nbsp; Adicionar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /page content -->