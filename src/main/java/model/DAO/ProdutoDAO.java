package model.DAO;

import model.DTO.Produto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ProdutoDAO {

    Connection con;
    PreparedStatement pstm;

    public ProdutoDAO() throws ClassNotFoundException {
        con = new ConexaoDatabase().ConexaoDb();
    }

    public boolean cadastrar(Produto produto) {
        String sql = "INSERT INTO produto (nome,valor) VALUES (?,?)";
        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, produto.getNome());
            pstm.setDouble(2, produto.getValor());

            pstm.execute();
            pstm.close();
            return true;
        } catch (SQLException e) {
            System.err.println(e);
        }
        return false;
    }
}
