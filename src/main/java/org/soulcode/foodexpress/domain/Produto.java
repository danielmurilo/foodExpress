package org.soulcode.foodexpress.domain;

public class Produto {

    private Integer id;
    private String nome;
    private String descricao;
    private Double preco;
    private Boolean ativo;

    public Produto() {}

    public Produto(Integer id, String nome, String descricao, Double preco, Boolean ativo) {
        this.id = id;
        this.nome = nome;
        this.descricao = descricao;
        this.preco = preco;
        this.ativo = ativo;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        if (nome.trim().length() < 1) {
            this.nome = nome.trim();
        } else {
            throw new RuntimeException("Nome do produto precisa ser informado!");
        }
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao.trim();
    }

    public Double getPreco() {
        return preco;
    }

    public void setPreco(Double preco) {
        this.preco = preco;
    }

    public Boolean getAtivo() {
        return ativo;
    }

    public void setAtivo(Boolean ativo) {
        this.ativo = ativo;
    }
}
