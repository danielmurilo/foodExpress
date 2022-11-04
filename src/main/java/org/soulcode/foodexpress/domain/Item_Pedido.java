package org.soulcode.foodexpress.domain;

public class Item_Pedido {

    private Integer id;
    private Pedido pedido;
    private Produto produto;
    private  Integer quantidade;
    private String observacao;
    private Double valor_venda;

    public Item_Pedido() {}

    public Item_Pedido(Integer id, Pedido pedido, Produto produto, Integer quantidade, String observacao, Double valor_venda) {
        this.id = id;
        this.pedido = pedido;
        this.produto = produto;
        this.quantidade = quantidade;
        this.observacao = observacao;
        this.valor_venda = valor_venda;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Pedido getPedido() {
        return pedido;
    }

    public void setPedido(Pedido pedido) {
        this.pedido = pedido;
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    public Integer getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(Integer quantidade) {
        if (quantidade > 0){
            this.quantidade = quantidade;
        } else {
            throw new SecurityException("Quantidade do Item_pedido deve ser maior que 0.");
        }
    }

    public String getObservacao() {
        return observacao;
    }

    public void setObservacao(String observacao) {
        this.observacao = observacao.trim();
    }

    public Double getValor_venda() {
        return valor_venda;
    }

    public void setValor_venda(Double valor_venda) {
        if (valor_venda >= 0.00) {
            this.valor_venda = valor_venda;
        } else {
            throw new RuntimeException("Venda não pode ter valor negativo!");
        }

    }
}
