<%
    try {
        String user = (String) session.getAttribute("usuario");
        if (user.equals("")) {
            response.sendRedirect("login.jsp");
        }
    } catch (NullPointerException e) {
        response.sendRedirect("login.jsp");
    }
%>
    
<div class="col-md-3 left_col">
    <div class="left_col scroll-view">
        <div class="navbar nav_title" style="border: 0;">
            <a href="cliente.jsp" class="site_title"><i class="fa fa-paw"></i> <span>Sistema JSP</span></a>
        </div>

        <div class="clearfix"></div>

        <!-- menu profile quick info -->
        <div class="profile clearfix">
            <div class="profile_pic">
                <img src="images/img.jpg" alt="..." class="img-circle profile_img">
            </div>
            <div class="profile_info">
                <span>Bem vindo!</span>
                <h2>
                    <%
                        out.print(session.getAttribute("user"));
                    %>
                </h2>
            </div>
            <div class="clearfix"></div>
        </div>
        <!-- /menu profile quick info -->

        <br />

        <!-- sidebar menu -->
        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
            <div class="menu_section">
                <h3>GERAL</h3>
                <ul class="nav side-menu">

                    <li><a><i class="fa fa-edit"></i> Cadastar <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="v_cadastrarCliente.jsp">Cliente</a></li>
                            <li><a href="v_cadastrarProduto.jsp">Produto</a></li>
                            <li><a href="v_cadastrarFornecedor.jsp">Fornecedor</a></li>
                            <li><a href="v_cadastrarUsuario.jsp">Usuário</a></li>
                        </ul>
                    </li>
                    
                    
                    <li><a><i class="fa fa-search"></i> Pesquisar <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="v_pesquisarClientes.jsp">Clientes<span class="sr-only"></span></a></li> 
                            <li><a href="v_pesquisarProduto.jsp">Produto<span class="sr-only"></span></a></li> 
                            <li><a href="v_pesquisarFornecedor.jsp">Fornecedor<span class="sr-only"></span></a></li> 
                            <li><a href="v_pesquisarUsuario.jsp">Usuário<span class="sr-only"></span></a></li> 
                            <!--<li><a href="Controle?acao=listar">Todos Clientes<span class="sr-only"></span></a></li>-->
                        </ul>
                    </li>
                    
                    <li><a href="./Sair"><i class="fa fa-power-off"></i> SAIR </a>

                    </li>
                </ul>
            </div>


        </div>
        <!-- /sidebar menu -->

    </div>
</div>