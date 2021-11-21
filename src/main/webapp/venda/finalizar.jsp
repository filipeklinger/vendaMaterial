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
        <%            
            int carrinhoId = 0;
            try {
                carrinhoId = Integer.parseInt(request.getParameter("carrinho"));
            } catch (Exception e) {
                System.err.println(e.getMessage());
                out.println("<h3>Erro ao obter Produtos</h3>");
            }

        %>

        <div class="container">
            <div class="row">
            <a href="../venda/produtos.jsp?carrinho=<%=carrinhoId %>" > <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> Voltar </a>    
            </div>
            <h2 class="text-center">Pagamento</h2>
            <div class="row col-md-8 col-md-offset-2" style="padding-top: 15px;">
                <table class="table table-striped">
                    <thead>

                        <tr>
                            <th>Nome</th>
                            <th>Valor</th>
                            <th>Quantidade</th>
                            <th>Sub total</th>
                        </tr>
                    </thead>
                    <%  
                        double total = 0.0;    
                        try {

                            CarrinhoDAO cStorage = new CarrinhoDAO();
                            ArrayList<ProdutoCarrinho> pcLista = cStorage.getProduto(carrinhoId);
                            
                            for (int i = 0; i < pcLista.size(); i++) {
                                ProdutoCarrinho pc = pcLista.get(i);
                                Produto p = pc.getProduto();
                                out.println("<tr>");
                                out.println("<td>" + p.getNome() + "</td>");
                                out.println("<td>R$ " + p.getValor() + "</td>");
                                out.println("<td class='text-center'> " + pc.getQuantidade() + "</td>");
                                out.println("<td> R$" + pc.getSubTotal() + "</td>");
                                out.println("</tr>");
                                total+= pc.getSubTotal();
                            }
                            if (pcLista.size() == 0) {
                                out.println("<td colspan='4' >Nenhum produto no carrinho</td>");
                            }
                        } catch (Exception e) {
                            System.err.println(e.getMessage());
                            out.println("<h3>Erro ao obter Produtos</h3>");
                        }

                    %>


                </table>
                <%                    out.println("<h3>Total:"+total+"<h3>");
                %>

                <form class="form-horizontal" action="../VendaServlet" method="POST" style="padding-top: 16px;">
                    <fieldset>
                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="pagamento">Forma Pagamento</label>
                            <div class="col-md-4">
                                <select id="pagamento" name="pagamento" class="form-control">
                                    <option value="1">Dinheiro</option>
                                    <option value="2">Cartão Crédito</option>
                                    <option value="3">Cartão Débito</option>
                                </select>
                            </div>
                        </div>

                        <!-- Button -->
                        <div class="form-group">
                            <!--<label class="col-md-2 control-label" for="finalizar"></label>-->
                            <div class="col-md-12">
                                <button type="submit" id="finalizar" name="finalizar" class="btn btn-primary btn-block">Finalizar Compra</button>
                            </div>
                        </div>

                    </fieldset>
                </form>
            </div>

        </div>

    </body>
</html>
