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