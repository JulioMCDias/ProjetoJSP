<%@page import="java.util.List"%>
<%@page import="bean.Cliente"%>
<%@page import="java.util.ArrayList"%>

<!-- page content -->
<div class="right_col" role="main">
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>Cadastro de Clientes</h3>
            </div>

            <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                    <div class="input-group">
                        <div id="marota"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    
                    <div class="x_content">
                        <table id="tblList" class="table table-striped">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nome</th>
                                    <th>Endereço</th>
                                    <th>CPF</th>
                                    <th>E-mail</th>
                                    <th>Telefone</th>
                                    <th>Data Nasc.</th>
                                    <th>&nbsp;</th>
                                    <th>&nbsp;</th>
                                </tr>
                            </thead>
                            
                            <tbody>                     
                                <%
                                    /**
                                     * Cria uma lista para receber os
                                     * registros do atributo listaClientes
                                     * originado do servlet Controle
                                     */
                                    List<Cliente> clientes = (ArrayList) request.getAttribute("listaClientes");

                                    // Percorre a lista dos registros e apresenta no navegador
                                    for (Cliente c : clientes) {
                                %>
                                <tr>
                                    <td><%=c.getId()%></td>
                                    <td><%=c.getNome()%></td>
                                    <td><%=c.getEndereco()%></td>
                                    <td><%=c.getCpf()%></td>
                                    <td><%=c.getEmail()%></td>
                                    <td><%=c.getTelefone()%></td>
                                    <td><%=c.getDatanasc()%></td>                                
                                    <td>
                                        <button class="btn btn-info btn-xs" data-toggle="modal" data-target="#ModalEditarCliente" 
                                           data-Id="<%=c.getId()%>" 
                                           data-Nome="<%=c.getNome()%>"
                                           data-Endereco="<%=c.getEndereco()%>" 
                                           data-Cpf="<%=c.getCpf()%>"
                                           data-Email="<%=c.getEmail()%>"  
                                           data-Datanasc="<%=c.getDatanasc()%>"
                                           data-Telefone="<%=c.getTelefone()%>">
                                            <i class="fa fa-pencil"></i>&nbsp;Editar
                                        </button></td>
                                    <td>
                                        <button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#ModalExcluirCliente"
                                           data-Id="<%=c.getId()%>">
                                           <i class="fa fa-trash"></i>&nbsp;Excluir
                                        </button>
                                          
                                    </td>
                                </tr>
                                <%
                                    } // Fim do laço de repetição
                                %>
                        </table>
                        
                        <br>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalCadastrarCliente">
                            <i class="fa fa-plus"></i>&nbsp; Adicionar
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /page content -->