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
                <%@include file="view/produto/v_listagemProduto.jsp"%>
                <%@include file="view/produto/v_listagemCadProd.jsp"%>
                <%@include file="view/produto/v_listagemEdiProd.jsp"%>
                <%@include file="view/produto/v_listagemExcProd.jsp"%>
                <%@include file="footer.jsp"%>
                <%@include file="script.jsp"%>
            </div>
        </div>
    </body>
</html>
