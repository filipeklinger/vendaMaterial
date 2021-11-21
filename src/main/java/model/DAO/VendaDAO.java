package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.DTO.Venda;

public class VendaDAO {

    Connection con;
    PreparedStatement pstm;
    ResultSet rs;

    public VendaDAO() throws ClassNotFoundException {
        con = new ConexaoDatabase().getConexao();
    }

    public boolean cadastrar(Venda venda) {
        String sql = "INSERT INTO venda (carrinho_id,modo_pagamento,total) VALUES (?,?,?)";
        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, venda.getCarrinho_id());
            pstm.setString(2, venda.getModo_pagamento());
            pstm.setDouble(3, venda.getTotal());

            pstm.execute();
            pstm.close();
            return true;
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return false;
    }
}
