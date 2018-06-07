<%@page import="java.util.List"%>
<%@page import="bean.Pessoa"%>
<%@page import="java.util.ArrayList"%>

<!-- page content -->
<div class="right_col" role="main">
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>Listagem de Clientes</h3>
            </div>

            <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                    <div class="input-group">

                    </div>
                </div>
            </div>
        </div>

        <div class="clearfix"></div>

        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <table id="tblList" class="table table-striped">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nome</th>
                                    <th>CPF</th>
                                    <th>Endereço</th>
                                    <th>Gênero</th>
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
                                     * registros do atributo listaPessoas
                                     * originado do servlet Controle
                                     */
                                    List<Pessoa> pessoas = (ArrayList) request.getAttribute("listaPessoas");

                                    // Percorre a lista dos registros e apresenta no navegador
                                    for (Pessoa p : pessoas) {
                                %>
                                <tr>
                                    <td><%=p.getId()%></td>
                                    <td><%=p.getNome()%></td>
                                    <td><%=p.getCPF()%></td>
                                    <td><%=p.getEndereco()%></td>
                                    <td><%=p.getGenero()%></td>
                                    <td><%=p.getTelefone()%></td>
                                    <td><%=p.getDatanasc()%></td>                                
                                    <td>
                                        <button class="btn btn-info btn-xs" data-toggle="modal" data-target="#ModalEditarCliente" 
                                           data-Id="<%=p.getId()%>" 
                                           data-Nome="<%=p.getNome()%>"
                                           data-Ultnome="<%=p.getCPF()%>" 
                                           data-Nomemeio="<%=p.getEndereco()%>"
                                           data-Genero="<%=p.getGenero()%>"  
                                           data-Datanasc="<%=p.getDatanasc()%>"
                                           data-Telefone="<%=p.getTelefone()%>">
                                           
                                            <i class="fa fa-pencil"></i>&nbsp;Editar
                                        </button></td>

                                    </td>
                                    <td>
                                        <button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#ModalExcluirCliente"
                                           data-Id="<%=p.getId()%>">
                                           <i class="fa fa-trash"></i>&nbsp;Excluir
                                        </button>
                                    </td>
                                </tr>
                                <%
                                    } // Fim do laço de repetição
                                %>
                        </table>
                        <br>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalCadastrarCliente"><i class="fa fa-plus"></i>&nbsp; Adicionar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /page content -->