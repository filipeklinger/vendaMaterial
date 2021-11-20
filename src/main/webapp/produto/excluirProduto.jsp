<%@page import="model.DTO.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Editar Produto</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
        <!-- JavaScript -->
        <!-- jQuery first,then Bootstrap JS -->
        <script src="../bootstrap/js/jquery.min.js"></script>
        <script src="../bootstrap/js/bootstrap.js"></script>
    </head>
    <body>
        <%@ include file="../menu/header.jsp"%>

        <div class="container">
            <a href="../produto" > <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> Voltar </a>
            <form class="form-horizontal" action="../ProdutoServlet" method="GET" style="padding-top: 16px;">
                <fieldset>
                    <!-- Form Name -->
                    <legend>Excluir Produto</legend>
                    <input id="id" name="id" type="hidden" value="<%=request.getParameter("id")%>">
                    <input id="action" name="action" type="hidden" value="delete">
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="nome">Nome</label>  
                        <div class="col-md-4">
                            <input id="nome" name="nome" type="text" placeholder="nome" class="form-control input-md" required=""
                                   readonly
                                   value="<%=request.getParameter("nome")%>">

                        </div>
                    </div>

                    <!-- Button -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="cadastrar"></label>
                        <div class="col-md-4">
                            <button type="submit" id="cadastrar" name="Cadastrar" class="btn btn-danger btn-block">Excluir</button>
                        </div>
                    </div>

                </fieldset>
            </form>
        </div>
    </body>
</html>
