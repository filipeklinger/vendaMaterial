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
import model.DAO.CarrinhoDAO;
import model.DTO.Carrinho;
import model.DTO.ProdutoCarrinho;

/**
 *
 * @author Filipe
 */
public class CarrinhoServlet extends HttpServlet {

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
            out.println("<title>Servlet CarrinhoServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CarrinhoServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        processRequest(request, response);
    }

    protected void criarCarrinho(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();
        try {

            String nome = request.getParameter("nome");
            Carrinho c;
            if (nome != null) {
                c = new Carrinho(nome);
            } else {
                c = new Carrinho();
            }
            HttpSession session = request.getSession();
            int vendedorId = (int) session.getAttribute("usuario_id");
            out.print("Vendedor id: " + vendedorId);
            c.setVendedorId(vendedorId);

            CarrinhoDAO cStorage = new CarrinhoDAO();
            c = cStorage.criar(c);
            if (c.getId() > 0) {
                //criado 
                session.setAttribute("carrinho_id", c.getId());
                response.sendRedirect("./venda/produtos.jsp");
            } else {
                //erro
                session.setAttribute("msg", "Erro ao criar novo carrinho");
                response.sendRedirect("./menu");
            }
        } catch (Exception ex) {
            System.out.println(ex.getCause());
            System.out.println(ex.getMessage());
            out.print("<br>Erro!!!");
            out.print("<br>" + ex.getCause());
            out.print("<br>" + ex.getMessage());
            Logger.getLogger(CarrinhoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected void adicionarProduto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();
        try {

            int carrinhoId = Integer.parseInt(request.getParameter("carrinho_id"));
            int produtoId = Integer.parseInt(request.getParameter("produto_id"));
            int quantidade = Integer.parseInt(request.getParameter("quantidade"));
            String produto = request.getParameter("produto");
            
            ProdutoCarrinho pc = new ProdutoCarrinho(produtoId,quantidade, carrinhoId);
            
            CarrinhoDAO cStorage = new CarrinhoDAO();
            boolean criado = cStorage.adicionarProduto(pc);
            HttpSession session = request.getSession();
            if (criado) {
                session.setAttribute("msg", produto+" adicionado com sucesso.");
            } else {
                session.setAttribute("msg", "Erro ao adicionar "+produto);
            }
            response.sendRedirect("./venda/produtos.jsp");
        } catch (Exception ex) {
            System.out.println(ex.getCause());
            System.out.println(ex.getMessage());
            out.print("<br>Erro!!!");
            out.print("<br>" + ex.getCause());
            out.print("<br>" + ex.getMessage());
            Logger.getLogger(CarrinhoServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        String action = request.getParameter("action");
        if (action != null && action.equals("add_produto")) {
            adicionarProduto(request, response);
        } else {
            criarCarrinho(request, response);
        }
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
