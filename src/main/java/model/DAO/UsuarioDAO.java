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
        con = new ConexaoDatabase().getConexao();
    }

    public boolean cadastrar(Usuario usuario) {
        //TODO verificar se username já existe antes de inserir
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
        String sql = "SELECT * FROM usuarios WHERE username = ?";
        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, usuario.getUsername());

            rs = pstm.executeQuery();
            
            while (rs.next()) {
                u.setId(rs.getInt("id"));
                u.setNome(rs.getString("nome"));
                u.setUsername(rs.getString("username"));
                u.setSenha(rs.getString("senha"));
            }
            pstm.close();
        } catch (SQLException e) {
            System.out.println("==============Erro na Consulta ==========");
            System.err.println(e.getMessage());
            System.out.println("Username buscado: "+usuario.getUsername());
        }
        return u;
    }
}
