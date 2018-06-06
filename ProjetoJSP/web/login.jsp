<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="header.jsp"%>
    </head>
    <%
        try {
            String user = (String) session.getAttribute("usuario");
        } catch (NullPointerException e) {
            session.setAttribute("usuario", "");
        }
    %>
    <body class="login">
        <div>
            <a class="hiddenanchor" id="signup"></a>
            <a class="hiddenanchor" id="signin"></a>

            <div class="login_wrapper">
                <div class="animate form login_form">
                    <section class="login_content">
                        
                        <div class="login_box">
                            <form action="./Logar" method="post">
                                <h1>Login do Sistema</h1>
                                <div>
                                    <input type="text" name="user" id="user" class="form-control login-control" placeholder="Usuário" required autofocus/>
                                </div>
                                <div>
                                    <input type="password" name="senha" id="senha" class="form-control login-control" placeholder="Senha" required/>
                                </div>
                                <div>
                                    <input type="submit" class="btn btn-primary btn-logar" value="Logar"/> 
                                </div>
                        </div>
                        
                        <div class="clearfix"></div>
                        <div class="separator">
                        <div class="clearfix"></div>
                            <br/>
                        <div>
                            <h1><i class="fa fa-paw"></i> Sistema JSP!</h1>
                            <p>Criado por:</p>
                            <p>Francisco Renato Severiano<br>
                               Julio Marques Correa Dias<br>
                               Rafael Pinheiro Rocha
                            </p>
                        </div>
                        </div>
                        </form>
                    </section>
                </div>
            </div>
        </div>
    </body>
</html>
