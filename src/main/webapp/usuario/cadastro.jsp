<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastre-se</title>
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
        <h1>Cadastre-se</h1>
        <form action="../UsuarioServlet" method="POST">
            <label>Nome</label>
            <input type="text" name="nome" />
            <br>
            <label>Usuario</label>
            <input type="text" name="usuario" />
            <br>
            <label>Senha</label>
            <input type="text" name="senha" />
            <br>
            <br>
            <button type="submit">Cadastrar</button>
        </form>
    </body>
</html>
