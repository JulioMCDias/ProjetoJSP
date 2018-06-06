        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>Pesquisar Clientes</h3>
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
                    <form name="form_mvc" class="form-horizontal" action="ControleCliente" method="post">
                        <fieldset>
                            <div class="form-group">
                                <label for="inputNome" class="col-lg-2 control-label">Nome</label>
                                    <div class="col-lg-5">
                                        <input type="text" class="form-control" id="inputNome" name="usuario" placeholder="Digite um nome ou parte dele" value="">
                                    </div>
                            </div>
                            <div class="form-group">
                                <div class="col-lg-6 col-lg-offset-2">
                                    <button type="submit" name="acao" class="btn btn-primary" value="pesquisar">Pesquisar</button>
									<a href="v_cadastrarCliente.jsp">
                                        <button type="button" class="btn btn-primary">
                                            Cadastrar
                                        </button>
                                    </a>
                                    <a href="ControleCliente?acao=listar.jsp">
                                        <button type="button" class="btn btn-primary">
                                            Listar
                                        </button>
                                    </a>
                                </div>
                            </div>
                        </fieldset>
                    </form>        
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->