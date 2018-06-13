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