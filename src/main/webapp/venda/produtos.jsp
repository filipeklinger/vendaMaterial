<%@page import="model.DTO.ProdutoCarrinho"%>
<%@page import="model.DAO.CarrinhoDAO"%>
<%@page import="model.DTO.Carrinho"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.DTO.Produto"%>
<%@page import="model.DAO.ProdutoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Venda Produtos</title>
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
            <h1 class="text-center">Produtos disponíveis para compra</h1>
            <div class="row col-md-8 col-md-offset-2" style="padding-top: 15px;">
                <table class="table table-striped">
                    <thead>

                        <tr>
                            <th>Nome</th>
                            <th>Valor</th>
                            <th>Quantidade</th>
                            <th class="text-center">Ação</th>
                        </tr>
                    </thead>
                    <%
                        int carrinhoId = Integer.parseInt(request.getParameter("carrinho"));
                        try {
                            CarrinhoDAO cStorage = new CarrinhoDAO();
                            ArrayList<ProdutoCarrinho> pcLista = cStorage.getProduto(carrinhoId);
                            ProdutoDAO pStorage = new ProdutoDAO();
                            ArrayList<Produto> listaProduto = pStorage.getProdutos();

                            for (int i = 0; i < listaProduto.size(); i++) {
                                Produto p = listaProduto.get(i);
                                ProdutoCarrinho pc = new ProdutoCarrinho(p.getId(), 0, carrinhoId);
                                for (ProdutoCarrinho prodNoCarrinho : pcLista) {
                                    if (prodNoCarrinho.getProduto().equals(p)) {
                                        pc = prodNoCarrinho;
                                    }
                                }
                                out.println("<tr>");
                                out.println("<td>" + p.getNome() + "</td>");
                                out.println("<td>R$ " + p.getValor() + "</td>");
                                out.println("<td class='text-center'> "
                                        + "<form method=\"POST\" action=\"../CarrinhoServlet\">"
                                        + "<input type='hidden' name='action' value='add_produto'  />"
                                        + "<input type='hidden' name='carrinho_id' value='" + carrinhoId + "'  />"
                                        + "<input type='hidden' name='produto_id' value='" + p.getId() + "'  />"
                                        + "<input type='hidden' name='produto' value='" + p.getNome()+ "'  />"
                                        + "<input type='hidden' name='pc_id' value='" + pc.getId()+ "'  />"
                                        + "<input type='number' name='quantidade' placeholder='QTD' value='"+pc.getQuantidade()+"' />"
                                                + "</td>"+ "<td>"
                                        + "<button type='submit' class='btn btn-info btn-xs' ><span class='glyphicon glyphicon-plus'></span> Adicionar</button> "
                                        + " "
                                        + "</form>"
                                        + "</td>");
                                out.println("</tr>");
                            }
                            if (listaProduto.size() == 0) {
                                out.println("<td colspan='4' >Nenhum produto cadastrado</td>");
                            }
                        } catch (Exception e) {
                            System.err.println(e);
                            out.println("<h3>Erro ao obter Produtos</h3>");
                        }

                    %>


                </table>
                <a href="./cadastro.jsp" class="btn btn-primary btn-xs" style="margin-top: 16px;"><b>+</b> Finalizar Compra</a>
            </div>

        </div>

    </body>
</html>
