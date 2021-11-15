<%
    String usuario = (String) session.getAttribute("usuario");
    if(usuario != null) response.sendRedirect("./menu");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="./bootstrap/css/bootstrap.css">
        <!-- JavaScript -->
        <!-- jQuery first,then Bootstrap JS -->
        <script src="./bootstrap/js/jquery.min.js"></script>
        <script src="./bootstrap/js/bootstrap.js"></script>
    </head>
    <body>
        <h1 class="text-center">Sistema - Venda de Material</h1>
        <div class="container" style="padding-top: 64px;">
            <%
                String msg = (String) session.getAttribute("msg");
                if (!(msg == null)) {
                    if (msg.contains("sucesso")) {
                        out.print("<div class='alert alert-success alert-dismissible' role='alert'>");
                        out.print("<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>");
                        out.print("<strong> " + msg + " </strong>");
                        out.print("</div>");
                    } else {
                        out.print("<div class='alert alert-danger alert-dismissible' role='alert'>");
                        out.print("<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>");
                        out.print("<strong> " + msg + " </strong>");
                        out.print("</div>");
                    }
                    session.setAttribute("msg", null);
                }
            %>
            <form class="form-horizontal" action="LoginServlet" method="POST">
                <fieldset>

                    <!-- Form Name -->
                    <legend>Login</legend>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="usuario">Usuário</label>  
                        <div class="col-md-4">
                            <input id="usuario" name="usuario" type="text" placeholder="usuario" class="form-control input-md" required="">

                        </div>
                    </div>

                    <!-- Password input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="senha">Senha</label>
                        <div class="col-md-4">
                            <input id="senha" name="senha" type="password" placeholder="senha" class="form-control input-md" required="">

                        </div>
                    </div>

                    <!-- Button -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="entrar"></label>
                        <div class="col-md-4">
                            <button type="submit" id="entrar" name="entrar" class="btn btn-primary">Entrar</button>
                            ou
                            <a class="text-center" href="usuario/cadastro.jsp" >Cadastre-se</a>
                        </div>
                    </div>

                </fieldset>
            </form>


        </div>
    </body>
</html>
