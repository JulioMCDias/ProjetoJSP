<%@page import="java.util.List"%>
<%@page import="bean.Usuario"%>
<%@page import="java.util.ArrayList"%>

<!-- page content -->
<div class="right_col" role="main">
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>Listagem de Usuários</h3>
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
                                    <th>Usuário</th>
                                    <th>Senha</th>
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
                                        <button class="btn btn-info btn-xs" data-toggle="modal" data-target="#ModalEditarUsuario"
                                        data-Id="<%=u.getId()%>"
                                        data-Usuario="<%=u.getUsuario()%>"
                                        data-Senha="<%=u.getSenha()%>">
                                            
                                        <i class="fa fa-pencil"></i>&nbsp;Editar
                                        </button>
                                    <td>
                                        <button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#ModalExcluirUsuario"
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
                        <button type="button" id="btn-mymodal" class="btn btn-primary" data-toggle="modal" data-target="#ModalCadastrarUsuario"><i class="fa fa-plus"></i>&nbsp; Adicionar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /page content -->


<!------------------------------------ MODAL CADASTRAR ------------------------------------>
        <div id="ModalCadastrarUsuario" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Cadastrar</h4>
                    </div>
                    <div class="modal-body">
                        <form name="form_mvc" class="form-horizontal" action="ControleUsuario" method="post">
                            <fieldset>  
                                <div class="form-group">
                                    <label for="inputUsuario" class="col-lg-2 control-label">Usuário</label>
                                    <div class="col-lg-5">
                                        <input type="text" id="inputUser" name="usuario" placeholder="Digite um nome de usuário" value="" class="form-control" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="inputSenha" class="col-lg-2 control-label">Senha</label>
                                    <div class="col-lg-5">
                                        <input type="password" id="inputSenha" name="senha" placeholder="Digite sua senha" value="" class="form-control" required>
                                    </div>
                                </div>
                            </fieldset>   
                            <div class="modal-footer">
                                <button type="submit" name="acao" id="btn-cadastrar" class="btn btn-primary" value="cadastrar" data-content="remove">Cadastrar</button>
                                <button class="btn btn-info" type="reset">Limpar</button>
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
<!------------------------------------ FIM MODAL CADASTRAR ------------------------------------>

<!------------------------------------ MODAL EDITAR ------------------------------------>
<div id="ModalEditarUsuario" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Editar</h4>
                    </div>
                    <div class="modal-body">
                        <form name="form_mvc" class="form-horizontal" action="ControleUsuario" method="post">
                            <fieldset>
                                
                                <div class="form-group">
                                    <label for="inputId" class="col-lg-2 control-label">ID</label>
                                    <div class="col-lg-5">
                                        <input type="text" class="form-control" id="inputId" name="id" value="" readonly>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label for="inputUser" class="col-lg-2 control-label">Usuário</label>
                                    <div class="col-lg-5">
                                        <input type="text" id="inputUser" name="usuario" placeholder="Digite um nome de usuário" value="" class="form-control" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="inputSenha" class="col-lg-2 control-label">Senha</label>
                                    <div class="col-lg-5">
                                        <input type="password" id="inputSenha" name="senha" placeholder="Digite sua senha" value="" class="form-control" required>
                                    </div>
                                </div>
                            </fieldset>   
                            <div class="modal-footer">
                                <button type="submit" name="acao" class="btn btn-primary" value="alterar">Salvar</button>
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
<!------------------------------------ FIM MODAL EDITAR ------------------------------------>

<!------------------------------------ MODAL EXCLUIR ------------------------------------>
<div id="ModalExcluirUsuario" class="modal fade" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Mensagem</h4>
            </div>
            <div class="modal-body">
                <form name="form_mvc" class="form-horizontal" action="ControleUsuario" method="post">
                    <fieldset>
                        <input type="hidden" class="form-control" id="inputId" name="id" value="" readonly>
                        <div class="form-group">
                            <div class="col-lg-7">
                                <h4>Confirma a exclusão deste registro?</h4>
                            </div>
                        </div>
                    </fieldset>
                    <div class="modal-footer">
                        <button type="submit" name="acao" class="btn btn-primary" value="excluir">Sim</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Não</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!------------------------------------ FIM MODAL EXCLUIR ------------------------------------>