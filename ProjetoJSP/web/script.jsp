<!-- jQuery -->
<script src="js/jquery.min.js"></script>
<script src="js/jquery-1.11.3.js"></script>
<script src="js/jquery-ui.min.js"></script>

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

<!-- DataTables Buttons Scripts -->
<script type="text/javascript" src="datatables/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="datatables/js/buttons.bootstrap.min.js"></script>
<script type="text/javascript" src="datatables/js/buttons.html5.min.js"></script>
<script type="text/javascript" src="datatables/js/jszip.min.js"></script>
<script type="text/javascript" src="datatables/js/pdfmake.min.js"></script>
<script type="text/javascript" src="datatables/js/vfs_fonts.js"></script>
<script type="text/javascript" src="datatables/js/buttons.print.min.js"></script>


<!-- Chamada Function DataTables -->
<script>
    $(document).ready(function () {
       var table = $("#tblList").DataTable({
            responsive: true,
            select: true,
            "language": 
            {
                select: {
                    rows: {
                        _: "Selecionado %d linhas",
                        0: "Clique em uma linha para selecioná-la",
                        1: "Selecionado 1 linha"
                    }
                },
                "sEmptyTable": "Nenhum registro encontrado",
                "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
                "sInfoEmpty": "Mostrando 0 até 0 de 0 registros",
                "sInfoFiltered": "(Filtrados de _MAX_ registros)",
                "sInfoPostFix": "",
                "sInfoThousands": ".",
                "sLengthMenu": "_MENU_ resultados por página",
                "sLoadingRecords": "Carregando...",
                "sProcessing": "Processando...",
                "sZeroRecords": "Nenhum registro encontrado",
                "sSearch": "Pesquisar",
                "oPaginate": {
                    "sNext": "Próximo",
                    "sPrevious": "Anterior",
                    "sFirst": "Primeiro",
                    "sLast": "Último"
                },
                
                "oAria": {
                    "sSortAscending": ": Ordenar colunas de forma ascendente",
                    "sSortDescending": ": Ordenar colunas de forma descendente"
                }
            }            
        });
        var buttons = new $.fn.dataTable.Buttons(table, {
                buttons: [
                'copy', 'excel', 'csv', 'pdf', 'print'
            ]
  }).container().appendTo($('#marota'));    
    });
</script> <!-- Fim Function DataTables -->

<script>
    $('#ModalEditarCliente').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget);
  var recipientId = button.data('id');
  var recipientNome = button.data('nome');
  var recipientEndereco = button.data('endereco');
  var recipientCpf = button.data('cpf');
  var recipientEmail = button.data('email');
  var recipientDataNasc = button.data('datanasc');
  var recipientTelefone = button.data('telefone');
  
//-------------------------------------------------------------------------
  
  var modal = $(this);
  modal.find('.modal-body #inputId').val(recipientId);
  modal.find('.modal-body #inputNome').val(recipientNome);
  modal.find('.modal-body #inputEndereco').val(recipientEndereco);
  modal.find('.modal-body #inputCpf').val(recipientCpf);
  modal.find('.modal-body #inputEmail').val(recipientEmail);
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

<script>
$('#ModalCadastrarCliente').draggable({
    handle: ".modal-header"
});
</script>

<script>
$('#ModalEditarCliente').draggable({
    handle: ".modal-header"
});
</script>

<script>
$('#ModalExcluirCliente').draggable({
    handle: ".modal-header"
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

<script>
$('#ModalCadastrarUsuario').draggable({
    handle: ".modal-header"
});
</script>

<script>
$('#ModalEditarUsuario').draggable({
    handle: ".modal-header"
});
</script>

<script>
$('#ModalExcluirUsuario').draggable({
    handle: ".modal-header"
});
</script>


<!--===============================================================================================================================-->

<script>
    $('#ModalEditarProduto').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget);
  var recipientId = button.data('id');
  var recipientCodigo = button.data('codigo');
  var recipientDescricao = button.data('descricao');
  var recipientUnidade = button.data('unidade');
  var recipientDetalhes = button.data('detalhes');
  var recipientPreco = button.data('preco');
    
//-------------------------------------------------------------------------
  
  var modal = $(this);
  modal.find('.modal-body #inputId').val(recipientId);
  modal.find('.modal-body #inputCodigo').val(recipientCodigo);
  modal.find('.modal-body #inputDescricao').val(recipientDescricao);
  modal.find('.modal-body #inputUnidade').val(recipientUnidade);
  modal.find('.modal-body #inputDetalhes').val(recipientDetalhes);
  modal.find('.modal-body #inputPreco').val(recipientPreco);
});
</script>

<script>
    $('#ModalExcluirProduto').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget);
  var recipientId = button.data('id');
  
//-------------------------------------------------------------------------
  
  var modal = $(this);
  modal.find('.modal-body #inputId').val(recipientId);
  
});
</script>

<script>
$('#ModalCadastrarProduto').draggable({
    handle: ".modal-header"
});
</script>

<script>
$('#ModalEditarProduto').draggable({
    handle: ".modal-header"
});
</script>

<script>
$('#ModalExcluirProduto').draggable({
    handle: ".modal-header"
});
</script>