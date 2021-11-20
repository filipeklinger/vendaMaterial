/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.DTO;

import java.util.ArrayList;

/**
 *
 * @author Filipe
 */
public class Venda {
    private int id;
    private int vendedorId;
    private int nomeCliente;
    private Carrinho carrinho;
    private Double total;
    private String formaPgamento;
    private boolean finalizada = false;
    
    public Venda(){
    }

    public Venda(String nomeCliente){
    }
    
}
