<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastre-se</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
        <!-- JavaScript -->
        <!-- jQuery first,then Bootstrap JS -->
        <script src="../bootstrap/js/jquery.min.js"></script>
        <script src="../bootstrap/js/bootstrap.js"></script>
    </head>
    <body>
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
        
        <div class="container" style="padding-top: 48px;">
            <a href="../" > <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> Voltar </a>
            <form class="form-horizontal" action="../UsuarioServlet" method="POST" style="padding-top: 16px;">
                <fieldset>

                    <!-- Form Name -->
                    <legend>Cadastre-se</legend>
                    
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="nome">Nome</label>  
                        <div class="col-md-4">
                            <input id="nome" name="nome" type="text" placeholder="nome" class="form-control input-md" required="">

                        </div>
                    </div>

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
                            <button type="submit" id="entrar" name="entrar" class="btn btn-primary btn-block">Cadastrar</button>
                        </div>
                    </div>

                </fieldset>
            </form>
            

        </div>
    </body>
</html>
