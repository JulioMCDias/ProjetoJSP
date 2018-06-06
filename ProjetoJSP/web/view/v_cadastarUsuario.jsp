<!-- page content -->
<div class="right_col" role="main">
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>Cadastro de Usuários</h3>
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
                        <form name="form_mvc" class="form-horizontal" action="ControleUsuario" method="post">
                            <fieldset>  
                                <div class="form-group">
                                    <label for="inputNome" class="col-lg-2 control-label">Usuário</label>
                                    <div class="col-lg-5">
                                        <input type="text" id="inputUser" name="usuario" placeholder="Digite um nome de usuário" value="" class="form-control" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="inputNome" class="col-lg-2 control-label">Senha</label>
                                    <div class="col-lg-5">
                                        <input type="password" id="inputSenha" name="senha" placeholder="Digite sua senha" value="" class="form-control" required>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <div class="col-lg-6 col-lg-offset-2">
                                        <button type="submit" name="acao" class="btn btn-primary" value="cadastrar">Cadastrar</button>
                                        <button class="btn btn-info" type="reset">Limpar</button>
                                        <a href="pesquisarUsuario.jsp">
                                            <button type="button" class="btn btn-primary">
                                                Pesquisar
                                            </button>
                                        </a>
                                        <a href="ControleUsuario?acao=listar">
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