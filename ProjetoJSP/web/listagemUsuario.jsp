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
                <%@include file="view/usuario/v_listagemUsuario.jsp"%>
                <%@include file="view/usuario/v_listagemCadUsu.jsp"%>
                <%@include file="view/usuario/v_listagemEdiUsu.jsp"%>
                <%@include file="view/usuario/v_listagemExcUsu.jsp"%>                
                <%@include file="footer.jsp"%>
                <%@include file="script.jsp"%>
            </div>
        </div>
    </body>
</html>
