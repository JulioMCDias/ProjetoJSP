<!------------------------------------ MODAL EDITAR ------------------------------------>
<div id="ModalEditarCliente" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Editar</h4>
            </div>
            <div class="modal-body">
                <form name="form_mvc" class="form-horizontal" action="ControleCliente" method="post">
                    <fieldset>
                        
                        <div class="form-group">
                            <label for="inputId" class="col-lg-2 control-label">ID</label>
                            <div class="col-lg-5">
                                <input type="text" class="form-control" id="inputId" name="id" value="" readonly>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="inputNome" class="col-lg-2 control-label">Nome</label>
                            <div class="col-lg-5">
                                <input type="text" class="form-control" id="inputNome" name="nome" placeholder="Digite seu nome" value="">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputUltNome" class="col-lg-2 control-label">CPF</label>
                            <div class="col-lg-5">
                                <input type="text" id="inputUltNome" name="CPF" placeholder="Digite seu CPF" value="" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputNomeMeio" class="col-lg-2 control-label">Endereço</label>
                            <div class="col-lg-5">
                                <input type="text" id="inputNomeMeio" name="endereco" placeholder="Digite seu endereco" value="" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputGenero" class="col-lg-2 control-label">Gênero</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div id="gender" class="btn-group" data-toggle="buttons">
                                    <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                        <input type="radio" id="inputGenero" name="gender" value="Masculino" data-parsley-multiple="gender" required>&nbsp; Masculino &nbsp;
                                    </label>
                                    <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                        <input type="radio" id="inputGenero" name="gender" value="Feminino" data-parsley-multiple="gender" required> Feminino
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputDataNasc" class="col-lg-2 control-label">Data de Nascimento</label>
                            <div class="col-lg-5">
                                <input type="date" id="inputDataNasc" name="datanasci" placeholder="Digite sua data de nascimento" value="" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputTelefone" class="col-lg-2 control-label">Telefone</label>
                            <div class="col-lg-5">
                                <input type="text" maxlength="15" class="form-control" id="inputTelefone" name="telefone" placeholder="Digite seu telefone" value="" required>
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