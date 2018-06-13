<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <%@include file="header.jsp"%>    
    </head>

    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <%@include file="sidebar.jsp"%>
                <%@include file="topmenu.jsp"%>
                <%@include file="view/cliente/v_listagemCliente.jsp"%>
                <%@include file="view/cliente/v_listagemCadCli.jsp"%>
                <%@include file="view/cliente/v_listagemEdiCli.jsp"%>
                <%@include file="view/cliente/v_listagemExcCli.jsp"%>
                <%@include file="footer.jsp"%>
                <%@include file="script.jsp"%>
            </div>
        </div>
    </body>
</html>
