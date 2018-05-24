<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.Pessoa"%>

        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>Editar</h3>
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
                      <form name="form_mvc" class="form-horizontal" action="Controle" method="post">
                        <%
                            /**
                             * Cria uma lista para receber os registros do
                             * atributo listaPessoas originado do servlet
                             * Controle
                             */
                            List<Pessoa> pessoa = (ArrayList) request.getAttribute("listaPessoas");

                            // Percorre a lista dos registros e apresenta no navegador
                            for (Pessoa p : pessoa) {
                        %>                              
                        <fieldset>
                            <div class="form-group">
                                <label for="inputNome" class="col-lg-2 control-label">Nome</label>
                                <div class="col-lg-5">
                                    <input type="text" class="form-control" id="inputNome" name="nome" placeholder="Digite seu nome" value="<%=p.getNome()%>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputTelefone" class="col-lg-2 control-label">Telefone</label>
                                <div class="col-lg-5">
                                    <input type="text" class="form-control" id="inputTelefone" name="telefone" placeholder="Digite seu telefone" value="<%=p.getTelefone()%>">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-lg-6 col-lg-offset-2">
                                    <button type="submit" name="acao" class="btn btn-primary" value="alterar">Salvar</button>
                                </div>
                            </div>
                        </fieldset>
                        <input type="hidden" name="id" value="<%=p.getId()%>">
                        <%
                            } // Fim do laço de repetição
                        %>                        
                    </form>        


                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->