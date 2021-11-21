/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Usuario
 */
public class ConexaoDatabase {

    private final String HOST = "localhost";
    private final String PORTA = "3306";
    private final String BASE_DADOS = "venda_material";
    private final String USUARIO = "root";
    private final String SENHA = "";
    private static Connection connection;

    public Connection getConexao() throws ClassNotFoundException {
        if (connection != null) {
            return connection;
        } else {
            makeConnection();
            return connection;
        }
    }

    //singleton para não criar varias instancias durante execucao da aplicacao
    private void makeConnection() throws ClassNotFoundException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://"
                    + this.HOST + ":"
                    + this.PORTA + "/"
                    + this.BASE_DADOS
                    + "?useTimezone=true&serverTimezone=UTC&user="
                    + this.USUARIO
                    + "&password="
                    + this.SENHA;
            connection = DriverManager.getConnection(url);

        } catch (SQLException e) {
            System.err.println(e);
        }
    }
}
