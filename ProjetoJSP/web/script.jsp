<!-- jQuery -->
<script src="js/jquery.min.js"></script>

<!-- Bootstrap -->
<script src="js/bootstrap.min.js"></script>

<!-- FastClick -->
<script src="js/fastclick.js"></script>

<!-- NProgress -->
<script src="js/nprogress.js"></script>

<!-- Custom Theme Scripts -->
<script src="js/custom.min.js"></script>

<!-- Field Restriction Script -->
<script src="js/restrictions.js"></script>

<!-- DataTables Scripts -->
<script type="text/javascript" src="datatables/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="datatables/js/dataTables.select.min.js"></script>
<script type="text/javascript" src="datatables/js/responsive.jqueryui.min.js"></script>
<script type="text/javascript" src="datatables/js/dataTables.responsive.min.js"></script>

<!-- Chamada Function DataTables -->
<script>
    $(document).ready(function () {
        $("#tblList").DataTable({
            responsive: true,
            select: true,
            "language": {
                "decimal": "",
                "emptyTable": "Não há dados disponíveis na tabela.",
                "info": "Mostrando _START_ de _END_ de _TOTAL_ entradas",
                "infoEmpty": "Mostrando 0 de 0 de 0 entradas",
                "infoFiltered": "(filtrado de _MAX_ total entradas)",
                "infoPostFix": "",
                "thousands": ",",
                "lengthMenu": "Mostrar _MENU_ entradas",
                "loadingRecords": "Carregando...",
                "processing": "Processando...",
                "search": "Pesquisar:",
                "zeroRecords": "Nenhuma ocorrência encontrada!",
                "paginate": {
                    "first": "Primeiro",
                    "last": "Último",
                    "next": "Próximo",
                    "previous": "Anteior"
                }
            }
        });
    });
</script> <!-- Fim Function DataTables -->

<script>
    $('#ModalEditarCliente').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget);
  var recipientId = button.data('id');
  var recipientNome = button.data('nome');
  var recipientUltNome = button.data('ultnome');
  var recipientNomeMeio = button.data('nomemeio');
  var recipientGenero = button.data('genero');
  var recipientDataNasc = button.data('datanasc');
  var recipientTelefone = button.data('telefone');
  
//-------------------------------------------------------------------------
  
  var modal = $(this);
  modal.find('.modal-body #inputId').val(recipientId);
  modal.find('.modal-body #inputNome').val(recipientNome);
  modal.find('.modal-body #inputUltNome').val(recipientUltNome);
  modal.find('.modal-body #inputNomeMeio').val(recipientNomeMeio);
  modal.find('.modal-body #inputGenero').val(recipientGenero);
  modal.find('.modal-body #inputDataNasc').val(recipientDataNasc);  
  modal.find('.modal-body #inputTelefone').val(recipientTelefone);
});
</script>

<script>
    $('#ModalExcluirCliente').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget);
  var recipientId = button.data('id');
  
//-------------------------------------------------------------------------
  
  var modal = $(this);
  modal.find('.modal-body #inputId').val(recipientId);
  
});
</script>

<!--===============================================================================================================================-->

<script>
    $('#ModalEditarUsuario').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget);
  var recipientId = button.data('id');
  var recipientUsuario = button.data('usuario');
  var recipientSenha = button.data('senha');
  
//-------------------------------------------------------------------------
  
  var modal = $(this);
  modal.find('.modal-body #inputId').val(recipientId);
  modal.find('.modal-body #inputUser').val(recipientUsuario);
  modal.find('.modal-body #inputSenha').val(recipientSenha);
  
});
</script>

<script>
    $('#ModalExcluirUsuario').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget);
  var recipientId = button.data('id');
  
//-------------------------------------------------------------------------
  
  var modal = $(this);
  modal.find('.modal-body #inputId').val(recipientId);
  
});
</script>