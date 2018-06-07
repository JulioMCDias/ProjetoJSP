<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="header.jsp"%>    
    </head>

    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <%@include file="sidebar.jsp"%>
                <%@include file="topmenu.jsp"%>
                <%@include file="view/v_listagemProduto.jsp"%>
                <%@include file="view/v_cadastrarProduto.jsp"%>
                <%@include file="view/v_editarProduto.jsp"%>
                <%@include file="view/v_excluir.jsp"%>
                <%@include file="footer.jsp"%>
                <%@include file="script.jsp"%>
            </div>
        </div>
    </body>
</html>
