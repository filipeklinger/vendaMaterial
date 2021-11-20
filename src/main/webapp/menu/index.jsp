<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Sistema - Venda de Material</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
        <!-- JavaScript -->
        <!-- jQuery first,then Bootstrap JS -->
        <script src="../bootstrap/js/jquery.min.js"></script>
        <script src="../bootstrap/js/bootstrap.js"></script>
    </head>
    <body>
        <%@ include file="./header.jsp"%>
        
        <h1 class="text-center">Sistema - Venda de Material</h1>
        <div class="container" style="padding-top: 64px;">
            <form class="form-horizontal" action="../CarrinhoServlet" method="POST" style="padding-top: 16px;">
                <fieldset>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="nome">Nome Do cliente</label>  
                        <div class="col-md-4">
                            <input id="nome" name="nome" type="text" placeholder="nome (opcional)" class="form-control input-md">
                        </div>
                    </div>

                    <!-- Button -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="venda"></label>
                        <div class="col-md-4">
                            <button type="submit" id="venda" name="venda" class="btn btn-primary btn-block">Iniciar nova Venda</button>
                        </div>
                    </div>

                </fieldset>
            </form>
        </div>
    </body>
</html>
