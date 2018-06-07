<script>
function formatar(mascara, documento){
  var i = documento.value.length;
  var saida = mascara.substring(0,1);
  var texto = mascara.substring(i)
  
  if (texto.substring(0,1) != saida){
            documento.value += texto.substring(0,1);
  }
  
}
</script>
<!------------------------------------ MODAL CADASTRAR ------------------------------------>
<div id="ModalCadastrarCliente" class="modal fade" role="dialog">
    <div class="modal-dialog">
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
                            <label for="inputNome" class="col-lg-2 control-label">Nome</label>
                            <div class="col-lg-5">
                                <input type="text" id="inputNome" name="nome" onKeypress="return letras(event)" placeholder="Digite seu nome" value="" class="form-control" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputUltNome" class="col-lg-2 control-label">CPF</label>
                            <div class="col-lg-5">
                                <input type="text" id="inputUltNome" name="CPF"  OnKeyPress="formatar('###.###.###-##', this)" placeholder="Digite seu CPF" value="" class="form-control" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputNomeMeio" class="col-lg-2 control-label">Endere�o</label>
                            <div class="col-lg-5">
                                <input type="text" id="inputNomeMeio" name="endereco"  placeholder="Digite seu endereco" value="" class="form-control" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputGenero" class="col-lg-2 control-label">G�nero</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div id="gender" class="btn-group" data-toggle="buttons">
                                    <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                        <input type="radio" name="gender" value="Masculino" data-parsley-multiple="gender" required> &nbsp; Masculino &nbsp;
                                    </label>
                                    <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                        <input type="radio" name="gender" value="Feminino" data-parsley-multiple="gender" required> Feminino
                                    </label>
                                </div>
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