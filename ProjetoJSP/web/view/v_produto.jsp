<!-- page content -->
<div class="right_col" role="main">
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>Produtos</h3>
            </div>

            <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                    
                </div>
            </div>
        </div>

        <div class="clearfix"></div>
    
        <div class="row">
            <div class="col-md-12">
                <div class="x_panel">
                    <div class="x_title">
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">

                        <div class="row">
                            <!-- INICIO -->
                            <% for (int x = 1; x <= 5; x++) { %>

                            <div class="col-md-55">
                                <div class="thumbnail">
                                    <div class="image view view-first">
                                        <img style="width: 40%; display: block;" src= "<% out.print("images/prod-" + x + ".jpg"); %>" alt="image">
                                        <div class="mask">
                                            <p> Item <b><% out.print(x); %></b></p>
                                            <div class="tools tools-bottom">
                                                <a href="./item.jsp?n=<% out.print(x); %>"><i class="fa fa-link"></i></a>
                                                <a href="#"><i class="fa fa-pencil"></i></a>
                                                <a href="#"><i class="fa fa-times"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="caption">
                                        <p>Produto <b><% out.print(x); %></b></p>
                                    </div>
                                </div>
                            </div>

                            <% }%>
                            <!-- FIM -->
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<!-- /page content -->