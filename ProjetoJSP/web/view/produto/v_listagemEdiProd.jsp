<!------------------------------------ MODAL EDITAR ------------------------------------>
<div id="ModalEditarProduto" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Editar Produto</h4>
            </div>
            <div class="modal-body">
                <form name="form_mvc" class="form-horizontal" action="ControleProduto" method="post">
                    <fieldset>
                        
                        <div class="form-group">
                            <label for="inputId" class="col-lg-2 control-label">ID</label>
                            <div class="col-lg-5">
                                <input type="text" class="form-control" id="inputId" name="id" value="" readonly>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="inputCodigo" class="col-lg-2 control-label">C�digo</label>
                            <div class="col-lg-5">
                                <input type="text" id="inputCodigo" name="codigo" placeholder="Digite o c�digo do produto" value="" class="form-control" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputDescricao" class="col-lg-2 control-label">Descri��o</label>
                            <div class="col-lg-5">
                                <input type="text" id="inputDescricao" name="descricao" placeholder="Digite a descri��o do produto" value="" class="form-control" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputUnidade" class="col-lg-2 control-label">Unidade</label>
                            <div class="col-lg-5">
                                <input type="text" id="inputUnidade" name="unidade" placeholder="Digite a unidade de medida" value="" class="form-control" required>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="inputDetalhes" class="col-lg-2 control-label">Detalhes</label>
                            <div class="col-lg-5">
                                <textarea class="form-control" id="inputDetalhes" name="detalhes" rows="5" cols="100" maxlength="80" value="" required></textarea>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="inputPreco" class="col-lg-2 control-label">Pre�o</label>
                            <div class="col-lg-5">
                                <input type="text" id="inputPreco" name="preco" placeholder="Digite o pre�o" value="" class="form-control" required>
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