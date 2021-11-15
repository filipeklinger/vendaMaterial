<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Cadastrar Produtos</title>
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
            <form class="form-horizontal" action="../ProdutoServlet" method="POST" style="padding-top: 16px;">
                <fieldset>
                    <!-- Form Name -->
                    <legend>Cadastro de produto</legend>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="nome">Nome</label>  
                        <div class="col-md-4">
                            <input id="nome" name="nome" type="text" placeholder="nome" class="form-control input-md" required="">

                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="valor">Preço R$</label>  
                        <div class="col-md-4">
                            <input id="valor" name="valor" type="number" step="0.01" placeholder="1.99" class="form-control input-md" required="">

                        </div>
                    </div>


                    <!-- Button -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="cadastrar"></label>
                        <div class="col-md-4">
                            <button type="submit" id="cadastrar" name="Cadastrar" class="btn btn-primary btn-block">Cadastrar</button>
                        </div>
                    </div>

                </fieldset>
            </form>
        </div>
    </body>
</html>
