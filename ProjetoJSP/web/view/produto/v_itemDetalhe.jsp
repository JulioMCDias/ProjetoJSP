<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.Produto"%>

<!-- page content -->
<div class="right_col" role="main">
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>Detalhes do Produto</h3>
            </div>
            <div class="title_right"></div>
        </div>
        
        <div class="clearfix"></div>
        
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_content">
                        
                        <%
                            /**
                             * Cria uma lista para receber os registros do
                             * atributo listaPessoas originado do servlet
                             * Controle
                             */
                            List<Produto> produtos = (ArrayList) request.getAttribute("listaProdutos");
                            // Percorre a lista dos registros e apresenta no navegador
                            for (Produto p : produtos) {
                        %>                              
                                                
                        <!-- DIV IMAGEM GRANDE-->
                        <div class="col-md-7 col-sm-7 col-xs-12">
                            <div class="product-image">
                               <img src= "<%out.print("images/"+ p.getCodigo() + "-1" + ".jpg");%>">
                            </div>
                        </div>
                        <!-- FIM DIV IMAGEM GRANDE -->
                        
                        <div class="col-md-5 col-sm-5 col-xs-12" style="border:0px solid #e5e5e5;">

                            <!--Codigo do Produto-->
                            <h3 class="prod_title">Código do produto: <% out.print(p.getCodigo());%></h3>
                            
                            <!--Descrição do Produto-->
                            <h3 class="prod_title"> <% out.print(p.getDescricao());%></h3>

                            <!--Detalhes do Produto-->
                            <p><h4><% out.print(p.getDetalhes());%></h4></p>
                            <br>
                            
                            <!--Imagens do Produto-->
                            <!--INÍCIO-->
                            <% for (int x = 2; x <= 5; x++) { %>
                            <div class="">
                                <div class="product_gallery">
                                    <a class>
                                        <img src="<%out.print("images/" + p.getCodigo() + "-" + x + ".jpg");%>" alt="...">
                                    </a>
                                </div>
                            </div>
                            <%}%>
                            <!--FIM-->
                            
                            <br>
                            <div class="clearfix"></div>
                            <br>

                            <div class="">
                                <div class="product_price">
                                    <span class="price-tax">Preço</span>
                                    <h1 class="price"><%out.print(NumberFormat.getCurrencyInstance().format(p.getPreco()));%></h1>
                                    <br>
                                </div>
                            </div>
                            
                            <br>
                            <div class="clearfix"></div>
                            <br>        
                                    
                            <div class="">
                                <a href="ControleProduto?acao=listar" class="btn btn-dark btn-lg" role="button">
                                    <i class="fa fa-arrow-left"></i>&nbsp;Voltar
                                </a>
                            </div>

                            <div class="product_social">
                                <ul class="list-inline">
                                    <li><a href="#"><i class="fa fa-facebook-square"></i></a>
                                    </li>
                                    <li><a href="#"><i class="fa fa-twitter-square"></i></a>
                                    </li>
                                    <li><a href="#"><i class="fa fa-envelope-square"></i></a>
                                    </li>
                                    <li><a href="#"><i class="fa fa-rss-square"></i></a>
                                    </li>
                                </ul>
                            </div>
                            
                            
                            
                        </div>
                        <input type="hidden" name="id" value="<%=p.getId()%>">
                        <%
                            } // Fim do laço de repetição
                        %>                        
                    </div> <!-- FIM CONTENT-->                
                </div>
            </div>
        </div>

    </div>
</div>
<!-- /page content -->