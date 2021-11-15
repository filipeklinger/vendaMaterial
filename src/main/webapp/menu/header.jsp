<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">V.Mat</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="../menu">Início <span class="sr-only">(current)</span></a></li>
                <li><a href="../produto">Gerenciar Produtos</a></li>

            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        Olá, <% out.print(session.getAttribute("usuario"));%> 
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Meus Dados</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="../LoginServlet?logout=true">Sair</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
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