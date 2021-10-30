<%@page import="com.projeto.vendamaterial.DAO.ProdutoDAO"%>
<%@page import="com.projeto.vendamaterial.DTO.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Produto prod = new Produto();
            prod.setNome(request.getParameter("nome"));
            prod.setValor(0.0);
            
            ProdutoDAO prodStorage = new ProdutoDAO();
            prodStorage.cadastrar(prod);
        %>
    </body>
</html>
