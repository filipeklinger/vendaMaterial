<%@page import="model.DTO.Produto"%>
<%@page import="model.DAO.ProdutoDAO"%>
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
            <%                
                Produto p = new Produto();
                try {
                    int id = Integer.parseInt(request.getParameter("id"));
                    if (id == 0) {
                        out.println("<h3>Identificador do produto inválido</h3>");
                    }
                    ProdutoDAO pStorage = new ProdutoDAO();
                    p = pStorage.getProduto(id);
                } catch (Exception e) {
                    out.println("<h3>Erro ao Obter Informações do Produto</h3>");
                }

            %>
            <a href="../produto" > <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> Voltar </a>
            <form class="form-horizontal" action="../ProdutoServlet" method="POST" style="padding-top: 16px;">
                <input id="id" name="id" type="hidden" value="<%=request.getParameter("id")%>">
                <input id="action" name="action" type="hidden" value="update">
                <fieldset>
                    <!-- Form Name -->
                    <legend>Editar Produto</legend>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="nome" >Nome</label>  
                        <div class="col-md-4">
                            <input id="nome" name="nome" type="text" placeholder="nome" class="form-control input-md" required="" value="<%=p.getNome()%>" >

                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="valor">Preço R$</label>  
                        <div class="col-md-4">
                            <input id="valor" name="valor" type="number" step="0.01" placeholder="1.99" class="form-control input-md" required="" value=<%= p.getValor()%> >

                        </div>
                    </div>


                    <!-- Button -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="atualizar"></label>
                        <div class="col-md-4">
                            <button type="submit" id="atualizar" name="atualizar" class="btn btn-primary btn-block">Atualizar</button>
                        </div>
                    </div>

                </fieldset>
            </form>
        </div>
    </body>
</html>
