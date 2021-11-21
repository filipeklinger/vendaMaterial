/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.DTO;

import java.util.Objects;

/**
 *
 * @author Filipe
 */
public class ProdutoCarrinho {
    private int id;
    private int carrinhoId;
    private Produto produto;
    private int quantidade;
    
    public ProdutoCarrinho(Produto produto,int quantidade, int carrinhoId){
        this.produto = produto;
        this.quantidade = quantidade;
        this.carrinhoId = carrinhoId;
    }
    
    public ProdutoCarrinho(int produtoId,int quantidade, int carrinhoId){
        Produto p = new Produto();
        p.setId(produtoId);
        this.produto = p;
        this.quantidade = quantidade;
        this.carrinhoId = carrinhoId;
    }

    /**
     * @return the carrinhoId
     */
    public int getCarrinhoId() {
        return carrinhoId;
    }

    /**
     * @param carrinhoId the carrinhoId to set
     */
    public void setCarrinhoId(int carrinhoId) {
        this.carrinhoId = carrinhoId;
    }

    /**
     * @return the produto
     */
    public Produto getProduto() {
        return produto;
    }

    /**
     * @param produto the produto to set
     */
    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    /**
     * @return the quantidade
     */
    public int getQuantidade() {
        return quantidade;
    }

    /**
     * @param quantidade the quantidade to set
     */
    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 61 * hash + Objects.hashCode(this.produto);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final ProdutoCarrinho other = (ProdutoCarrinho) obj;
        if (!Objects.equals(this.produto.getNome(), other.produto.getNome())) {
            return false;
        }
        return true;
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
     * @return the subTotal
     */
    public double getSubTotal() {
        return produto.getValor()*quantidade;
    }
    
    
    
}
