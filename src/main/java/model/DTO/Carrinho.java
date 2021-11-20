/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.DTO;

import java.util.ArrayList;

public class Carrinho {
    private int id;
    private String nomeCliente;
    private int vendedorId;
    private ArrayList<ProdutoCarrinho> produtos;
    
    public Carrinho(){
        this.produtos = new ArrayList<>();
    }
    
    public Carrinho(String nomeCliente){
        this.produtos = new ArrayList<>();
        this.nomeCliente = nomeCliente;
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
     * @return the nomeCliente
     */
    public String getNomeCliente() {
        return nomeCliente;
    }

    /**
     * @param nomeCliente the nomeCliente to set
     */
    public void setNomeCliente(String nomeCliente) {
        this.nomeCliente = nomeCliente;
    }

    /**
     * @return the produtos
     */
    public ArrayList<ProdutoCarrinho> getProdutos() {
        return produtos;
    }

    /**
     * @param produto the produtos to set
     * @param quantidade quantidade do protudo
     */
    public void setProduto(Produto produto,int quantidade) {
        this.produtos.add(new ProdutoCarrinho(produto, quantidade,id));
    }
    
    /**
     *
     * @return total dos produtos selecionados
     */
    public double calculaTotal(){
        double total = 0.0;
        for (ProdutoCarrinho produto : produtos) {
            total += produto.getProduto().getValor();
        }
        return total;
    }

    /**
     * @return the vendedorId
     */
    public int getVendedorId() {
        return vendedorId;
    }

    /**
     * @param vendedorId the vendedorId to set
     */
    public void setVendedorId(int vendedorId) {
        this.vendedorId = vendedorId;
    }
    
}
