/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.projeto.vendamaterial.DAO;

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
    private final String BASE_DADOS = "vendaMaterial";
    private final String USUARIO = "root";
    private final String SENHA = "";

    public Connection ConexaoDb() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://" + 
                    this.HOST + ":" + 
                    this.PORTA + "/" + 
                    this.BASE_DADOS + 
                    "?useTimezone=true&serverTimezone=UTC&user=" + 
                    this.USUARIO + 
                    "&password=" + 
                    this.SENHA;
            con = DriverManager.getConnection(url);

        } catch (ClassNotFoundException | SQLException e) {
            System.err.println(e);
        }
        return con;
    }
}
