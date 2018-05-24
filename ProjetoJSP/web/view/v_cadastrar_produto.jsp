<%-- 
    Document   : v_cadastrar_produto
    Created on : 24/05/2018, 15:20:08
    Author     : julio
--%>

        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>Cadastro de Produtos</h3>
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
                      <form name="form_mvc" class="form-horizontal" action="ProdutoControle" method="post">
                        <fieldset>
                            <div class="form-group">
                                <label for="inputNome" class="col-lg-2 control-label">Nome</label>
                                <div class="col-lg-5">
                                    <input type="text" id="inputNome" name="nome" placeholder="Nome do produto" value="" class="form-control">
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="inputDescrição" class="col-lg-2 control-label">Descrição</label>
                                <div class="col-lg-5">
                                    <input type="text" class="form-control" id="inputDescrição" name="Descrição" placeholder="Digite a descrição do produto" value="">
                                </div>
                            </div>

                            
                            <div class="form-group">
                                <label for="inputQuantidade" class="col-lg-2 control-label">Quantidade</label>
                                <div class="col-lg-2">
                                    <input type="number" class="form-control" id="inputQuantidade" name="Quantidade" value="0">
                                </div>
                                <label for="inputTamanho" class="col-lg-1 control-label">Tamanho</label>
                                <div class="col-lg-2">
                                    <input type="text" class="form-control" id="inputTamanho" name="Quantidade" placeholder="Digite o tamanho" value="">
                                </div>
                            </div>
                             
                            <div class="form-group">
                                <div class="col-lg-6 col-lg-offset-2">
                                    <button type="submit" name="acao" class="btn btn-primary" value="cadastrarProduto">Cadastrar</button>
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
