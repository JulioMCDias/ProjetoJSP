<!------------------------------------ MODAL EDITAR ------------------------------------>
<div id="ModalEditarCliente" class="modal fade" role="dialog">
    <div class="modal-dialog modal-dialog-centered">
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
                            <label for="inputNome" class="col-lg-2 control-label">Nome Completo</label>
                            <div class="col-lg-5">
                                <input type="text" class="form-control" id="inputNome" onKeypress="return letras(event)" name="nome" placeholder="Digite o nome" value="">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputEndereco" class="col-lg-2 control-label">Endereço</label>
                            <div class="col-lg-5">
                                <input type="text" id="inputEndereco" name="endereco" placeholder="Digite o endereço" value="" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputCpf" class="col-lg-2 control-label">CPF</label>
                            <div class="col-lg-5">
                                <input type="text" id="inputCpf" name="cpf" maxlength="14" OnKeyPress="formatar('###.###.###-##', this); return numeros(event);" placeholder="Digite o cpf" value="" class="form-control">
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

<!-- Modal -->
<div id="modal-mensagem" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Mensagem</h4>
      </div>
      <div class="modal-body">
          <p>                        
          <h4>
            <!-- A linha abaixo apresenta a mensagem gerada no Controle -->
            <%out.print(request.getAttribute("mensagem"));%>
          </h4>
          </p>     
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
      </div>
    </div>

  </div>
</div>           
