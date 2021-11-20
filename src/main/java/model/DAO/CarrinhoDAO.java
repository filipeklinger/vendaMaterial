package model.DAO;

import model.DTO.Produto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.DTO.Carrinho;
import model.DTO.ProdutoCarrinho;

public class CarrinhoDAO {

    Connection con;
    PreparedStatement pstm;
    ResultSet rs;

    public CarrinhoDAO() throws ClassNotFoundException {
        con = new ConexaoDatabase().ConexaoDb();
    }

    public Carrinho criar(Carrinho carrinho) {
        String sql = "INSERT INTO carrinho (nome_cliente,vendedor_id) VALUES (?,?)";
        try {
            pstm = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pstm.setString(1, carrinho.getNomeCliente());
            pstm.setInt(2, carrinho.getVendedorId());

            pstm.execute();
            rs = pstm.getGeneratedKeys();
            if (rs.next()) {
                carrinho.setId(rs.getInt(1));
            }
            pstm.close();
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
            Logger.getLogger(CarrinhoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return carrinho;
    }
    
    public boolean atualizarProdutoCarrinho(ProdutoCarrinho pc){
        String sql = "UPDATE produto_carrinho SET quantidade=? WHERE id=?";
        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, pc.getQuantidade());
            pstm.setInt(2, pc.getId());

            pstm.execute();
            pstm.close();
            return true;
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
            Logger.getLogger(CarrinhoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean adicionarProduto(ProdutoCarrinho pc) {
        String sql = "INSERT INTO produto_carrinho (carrinho_id,produto_id,quantidade) VALUES (?,?,?)";
        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, pc.getCarrinhoId());
            pstm.setInt(2, pc.getProduto().getId());
            pstm.setInt(3, pc.getQuantidade());

            pstm.execute();
            pstm.close();
            return true;
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
            Logger.getLogger(CarrinhoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public ArrayList<ProdutoCarrinho> getProduto(int carrinhoId) {
        ArrayList<ProdutoCarrinho> produtoList = new ArrayList();
        String sql = "SELECT p.*,pc.quantidade,pc.id AS prod_car_id FROM produto p INNER JOIN produto_carrinho pc ON pc.produto_id = p.id WHERE pc.carrinho_id = ? ORDER BY p.nome ASC";
        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, carrinhoId);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Produto p = new Produto();
                p.setId(rs.getInt("id"));
                p.setNome(rs.getString("nome"));
                p.setValor(rs.getDouble("valor"));
                ProdutoCarrinho pc = new ProdutoCarrinho(p, rs.getInt("quantidade"), carrinhoId);
                pc.setId(rs.getInt("prod_car_id"));
                produtoList.add(pc);
            }
            pstm.close();
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return produtoList;
    }

    public boolean deleteProduto(int id) {
        String sql = "DELETE FROM produto WHERE id = ?";
        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, id);

            pstm.execute();
            pstm.close();
            return true;
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return false;
    }

    public boolean atualizar(Produto produto) {
        String sql = "UPDATE produto SET nome=?,valor=? WHERE id=?";
        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, produto.getNome());
            pstm.setDouble(2, produto.getValor());
            pstm.setInt(3, produto.getId());

            pstm.execute();
            pstm.close();
            return true;
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return false;
    }
}
