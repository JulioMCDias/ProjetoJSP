<!------------------------------------ MODAL CADASTRAR ------------------------------------>
<div id="ModalCadastrarCliente" class="modal fade" role="dialog">
    <div class="modal-dialog modal-dialog-centered">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Cadastrar</h4>
            </div>
            <div class="modal-body">
                <form name="form_mvc" class="form-horizontal" action="ControleCliente" method="post">
                    <fieldset>
                        <div class="form-group">
                            <label for="inputNome" class="col-lg-2 control-label">Nome Completo</label>
                            <div class="col-lg-5">
                                <input type="text" id="inputNome" name="nome" onKeypress="return letras(event)" placeholder="Digite o nome completo" value="" class="form-control" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputEndereco" class="col-lg-2 control-label">Endereço</label>
                            <div class="col-lg-5">
                                <input type="text" id="inputEndereco" name="endereco" placeholder="Digite o endereço" value="" class="form-control" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputCpf" class="col-lg-2 control-label">CPF</label>
                            <div class="col-lg-5">
                                <input type="text" id="inputCpf" name="cpf" maxlength="14" OnKeyPress="formatar('###.###.###-##', this); return numeros(event);" placeholder="Digite o CPF" value="" class="form-control" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputEmail" class="col-lg-2 control-label">E-mail</label>
                            <div class="col-lg-5">
                                <input type="email" id="inputEmail" name="email"  placeholder="Digite o e-mail" value="" class="form-control" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputDataNasc" class="col-lg-2 control-label">Data de Nascimento</label>
                            <div class="col-lg-5">
                                <input type="date" id="inputDataNasc" name="datanasci" max="2999-12-31" placeholder="Digite sua data de nascimento" value="" class="form-control" required>
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