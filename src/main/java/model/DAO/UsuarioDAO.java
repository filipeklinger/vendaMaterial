package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.DTO.Usuario;

public class UsuarioDAO {

    Connection con;
    PreparedStatement pstm;
    ResultSet rs;

    public UsuarioDAO() throws ClassNotFoundException {
        con = new ConexaoDatabase().ConexaoDb();
    }

    public boolean cadastrar(Usuario usuario) {
        String sql = "INSERT INTO usuarios (nome,username,senha) VALUES (?,?,?)";
        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, usuario.getNome());
            pstm.setString(2, usuario.getUsername());
            pstm.setString(3, usuario.getSenha());

            pstm.execute();
            pstm.close();
            return true;
        } catch (SQLException e) {
            System.err.println(e);
            System.out.println(usuario);
        }
        return false;
    }

    public Usuario Login(Usuario usuario) {
        Usuario u = new Usuario();
        String sql = "SELECT FROM usuarios nome,username,senha WHERE usermane = ?";
        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, usuario.getUsername());

            rs = pstm.executeQuery(sql);
            pstm.close();
            while (rs.next()) {
                u.setNome(rs.getString("nome"));
                u.setUsername(rs.getString("username"));
                u.setSenha(rs.getString("senha"));
            }
        } catch (SQLException e) {
            System.err.println(e);
            System.out.println(usuario);
        }
        return u;
    }
}
