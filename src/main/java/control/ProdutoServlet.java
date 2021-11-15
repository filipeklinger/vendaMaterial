/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DAO.ProdutoDAO;
import model.DTO.Produto;

/**
 *
 * @author Filipe
 */
public class ProdutoServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProdutoServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProdutoServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    protected void processDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        boolean deletado = false;
        

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            ProdutoDAO pStorage = new ProdutoDAO();
            deletado = pStorage.deleteProduto(id);
        } catch (Exception e) {
            System.err.println(e.getCause());
            System.err.println(e.getMessage());
        }

        HttpSession session = request.getSession();
        if (deletado) {
            session.setAttribute("msg", "deletado com sucesso");
        } else {
            session.setAttribute("msg", "erro ao deletar");
        }
        response.sendRedirect("./produto");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null && action.equals("delete")) {
            processDelete(request, response);
        }else{
            processRequest(request, response);
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);

        Produto produto = new Produto();
        produto.setNome(request.getParameter("nome"));
        produto.setValor(Double.parseDouble(request.getParameter("valor")));

        boolean cadastrado = false;
        try {
            ProdutoDAO pStorage = new ProdutoDAO();
            cadastrado = pStorage.cadastrar(produto);
        } catch (Exception ex) {
            Logger.getLogger(UsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        String msg = "";
        if (cadastrado) {
            msg = "Cadastrado com sucesso";
        } else {
            msg = "Erro ao cadastrar";
        }
        HttpSession session = request.getSession();
        session.setAttribute("msg", msg);

        if (cadastrado) {
            response.sendRedirect("./produto");
        } else {
            response.sendRedirect("./produto/cadastro.jsp");
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPut(req, resp); //To change body of generated methods, choose Tools | Templates.
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
