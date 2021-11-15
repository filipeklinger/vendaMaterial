<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Gerenciar Produtos</title>
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
            <h1 class="text-center">Gerenciar Produtos</h1>
            <div class="row col-md-8 col-md-offset-2" style="padding-top: 15px;">
                <table class="table table-striped">
                    <thead>
                    <a href="./cadastro.jsp" class="btn btn-primary btn-xs" style="margin-bottom: 16px;"><b>+</b> Adicionar Novos produtos</a>
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Valor</th>
                        <th class="text-center">Ação</th>
                    </tr>
                    </thead>
                    <tr>
                        <td>1</td>
                        <td>Teste</td>
                        <td>R$ 3,50</td>
                        <td class="text-center">
                            <a class='btn btn-info btn-xs' href="#">
                                <span class="glyphicon glyphicon-edit"></span> Editar</a> 
                            <a href="#" class="btn btn-danger btn-xs">
                                <span class="glyphicon glyphicon-remove"></span> Remover</a>
                        </td>
                    </tr>

                </table>
            </div>
        </div>

    </body>
</html>
