package model.DAO;

import model.DTO.Produto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.DTO.Venda;

public class VendaDAO {

    Connection con;
    PreparedStatement pstm;
    ResultSet rs;

    public VendaDAO() throws ClassNotFoundException {
        con = new ConexaoDatabase().ConexaoDb();
    }

    public boolean cadastrar(Venda venda) {
        String sql = "INSERT INTO venda (vendedor_id,nome_cliente) VALUES (?,?)";
//        try {
//            pstm = con.prepareStatement(sql);
//            pstm.setString(1, venda.ge);
//            pstm.setDouble(2, produto.getValor());
//
//            pstm.execute();
//            pstm.close();
//            return true;
//        } catch (SQLException e) {
//            System.err.println(e.getMessage());
//        }
        return false;
    }
    
    public ArrayList<Produto> getProdutos(){
        ArrayList<Produto> produtoList = new ArrayList();
        String sql = "SELECT * FROM produto ORDER BY nome ASC";
        try {
            pstm = con.prepareStatement(sql);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Produto p = new Produto();
                p.setId(rs.getInt("id"));
                p.setNome(rs.getString("nome"));
                p.setValor(rs.getDouble("valor"));
                produtoList.add(p);
            }
            pstm.close();
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return produtoList;
    }
    
    public Produto getProduto(int id){
        Produto p = new Produto();
        String sql = "SELECT * FROM produto WHERE id = ? LIMIT 1";
        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, id);
            
            rs = pstm.executeQuery();
            while (rs.next()) {
                p.setId(rs.getInt("id"));
                p.setNome(rs.getString("nome"));
                p.setValor(rs.getDouble("valor"));
            }
            pstm.close();
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return p;
    }
    
    public boolean deleteProduto(int id){
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