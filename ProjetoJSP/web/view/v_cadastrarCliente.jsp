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

                                <div class="form-group">
                                    <div class="col-lg-6 col-lg-offset-2">
                                        <button type="submit" name="acao" class="btn btn-primary" value="cadastrar">Cadastrar</button>
                                        <button class="btn btn-info" type="reset">Limpar</button>
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