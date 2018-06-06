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
                                    <th>Último Nome</th>
                                    <th>Meio/Inicial</th>
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
                                    <td><%=p.getUltnome()%></td>
                                    <td><%=p.getNomemeio()%></td>
                                    <td><%=p.getGenero()%></td>
                                    <td><%=p.getTelefone()%></td>
                                    <td><%=p.getDatanasc()%></td>                                
                                    <td>
                                        <button class="btn btn-info btn-xs" data-toggle="modal" data-target="#ModalEditarCliente" 
                                           data-Id="<%=p.getId()%>" 
                                           data-Nome="<%=p.getNome()%>"
                                           data-Ultnome="<%=p.getUltnome()%>" 
                                           data-Nomemeio="<%=p.getNomemeio()%>"
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


<!--------------------------------------JANELAS MODAL---------------------------------------------------->

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
                            <label for="inputNome" class="col-lg-2 control-label">Primeiro Nome</label>
                            <div class="col-lg-5">
                                <input type="text" id="inputNome" name="nome" onKeypress="return letras(event)" placeholder="Digite seu nome" value="" class="form-control" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputUltNome" class="col-lg-2 control-label">Último Nome</label>
                            <div class="col-lg-5">
                                <input type="text" id="inputUltNome" name="last-name" onKeypress="return letras(event)" placeholder="Digite seu ultimo nome" value="" class="form-control" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputNomeMeio" class="col-lg-2 control-label">Nome do Meio / Inicial</label>
                            <div class="col-lg-5">
                                <input type="text" id="inputNomeMeio" name="middle-name" onKeypress="return letras(event)" placeholder="Digite seu nome do meio ou inicial" value="" class="form-control" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputGenero" class="col-lg-2 control-label">Gênero</label>
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
                            <label for="inputNome" class="col-lg-2 control-label">Primeiro Nome</label>
                            <div class="col-lg-5">
                                <input type="text" class="form-control" id="inputNome" name="nome" placeholder="Digite seu nome" value="">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputUltNome" class="col-lg-2 control-label">Último Nome</label>
                            <div class="col-lg-5">
                                <input type="text" id="inputUltNome" name="last-name" placeholder="Digite seu ultimo nome" value="" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputNomeMeio" class="col-lg-2 control-label">Nome do Meio / Inicial</label>
                            <div class="col-lg-5">
                                <input type="text" id="inputNomeMeio" name="middle-name" placeholder="Digite seu nome do meio ou inicial" value="" class="form-control">
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

<!------------------------------------ MODAL EXCLUIR ------------------------------------>
<div id="ModalExcluirCliente" class="modal fade" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Mensagem</h4>
            </div>
            <div class="modal-body">
                <form name="form_mvc" class="form-horizontal" action="ControleCliente" method="post">
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