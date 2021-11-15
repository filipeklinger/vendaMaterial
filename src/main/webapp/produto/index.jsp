<%@page import="java.util.ArrayList"%>
<%@page import="model.DTO.Produto"%>
<%@page import="model.DAO.ProdutoDAO"%>
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
                <a href="./cadastro.jsp" class="btn btn-primary btn-xs" style="margin-bottom: 16px;"><b>+</b> Adicionar Novos produtos</a>
                <table class="table table-striped">
                    <thead>

                        <tr>
                            <th>Nome</th>
                            <th>Valor</th>
                            <th class="text-center">Ação</th>
                        </tr>
                    </thead>
                    <%                        
                        try {
                            ProdutoDAO pStorage = new ProdutoDAO();
                            ArrayList<Produto> listaProduto = pStorage.getProdutos();

                            for (int i = 0; i < listaProduto.size(); i++) {
                                Produto p = listaProduto.get(i);
                                out.println("<tr>");
                                //out.println("<td>" + p.getId() + "</td>");
                                out.println("<td>" + p.getNome() + "</td>");
                                out.println("<td>R$ " + p.getValor() + "</td>");
                                out.println("<td class='text-center'> "
                                        + "<a class='btn btn-info btn-xs' href='./editarProduto.jsp?id="+p.getId()+"'><span class='glyphicon glyphicon-edit'></span> Editar</a> "
                                        + "<a href='./excluirProduto.jsp?id="+p.getId()+"&nome="+p.getNome()+"' class='btn btn-danger btn-xs'><span class='glyphicon glyphicon-remove'></span> Remover</a> "
                                        + "</td>");
                                out.println("</tr>");
                            }
                            if (listaProduto.size() == 0) {
                                out.println("<td colspan='3' >Nenhum produto cadastrado</td>");
                            }
                        } catch (Exception e) {
                            System.err.println(e);
                            out.println("<h3>Erro ao obter Produtos</h3>");
                        }

                    %>
                    

                </table>
            </div>
        </div>

    </body>
</html>
