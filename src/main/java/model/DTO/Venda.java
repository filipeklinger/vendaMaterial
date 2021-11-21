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
    private int carrinho_id;
    private String modo_pagamento;
    private double total;
    
    public Venda(){
    }

    public Venda(int carrinho_id, String modo_pagamento, double total) {
        this.carrinho_id = carrinho_id;
        this.modo_pagamento = modo_pagamento;
        this.total = total;
    }
    

    public Venda(String nomeCliente){
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the carrinho_id
     */
    public int getCarrinho_id() {
        return carrinho_id;
    }

    /**
     * @param carrinho_id the carrinho_id to set
     */
    public void setCarrinho_id(int carrinho_id) {
        this.carrinho_id = carrinho_id;
    }

    /**
     * @return the modo_pagamento
     */
    public String getModo_pagamento() {
        return modo_pagamento;
    }

    /**
     * @param modo_pagamento the modo_pagamento to set
     */
    public void setModo_pagamento(String modo_pagamento) {
        this.modo_pagamento = modo_pagamento;
    }

    /**
     * @return the total
     */
    public double getTotal() {
        return total;
    }

    /**
     * @param total the total to set
     */
    public void setTotal(double total) {
        this.total = total;
    }
    
}
