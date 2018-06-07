<%@page import="java.util.List"%>
<%@page import="bean.TipoUsuario"%>
<%@page import="java.util.ArrayList"%>
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
                                    <label for="inputUser" class="col-lg-2 control-label">Nome</label>
                                    <div class="col-lg-5">
                                        <input type="text" id="inputUser" name="usuario" placeholder="Digite um nome de usuário" value="" class="form-control" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-lg-2 control-label">Cargo</label>
                                    <div class="col-lg-5">
                                      <select class="form-control" id="inputCargo" name="cargo">
                                        <% List<TipoUsuario> types = (ArrayList) session.getAttribute("listaTipoUser");
                                    // Percorre a lista dos registros e apresenta no navegador
                                    for (TipoUsuario u : types){%>
                                          <option value="<%out.print(u.getId());%>"><% out.print(u.getNome());%></option>
                                    <%}%>      
                                       </select>
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