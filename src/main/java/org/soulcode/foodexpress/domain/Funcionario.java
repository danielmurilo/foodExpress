package org.soulcode.foodexpress.domain;

public class Funcionario {

    private Integer id;
    private String nome;
    private String cargo;
    private String senha;

    public Funcionario() {}

    public Funcionario(Integer id, String nome, String cargo, String senha) {
        this.id = id;
        this.nome = nome;
        this.cargo = cargo;
        this.senha = senha;
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
        if (nome.trim().length() > 3) {
            this.nome = nome.trim();
        } else {
            throw  new RuntimeException("Nome do funcionário precisa ter ao menos 3 caracteres!");
        }
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        if (cargo.trim().length() > 3) {
            this.cargo = cargo.trim();
        } else {
            throw  new RuntimeException("Cargo do funcionário precisa ser informado!");
        }
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        if (senha.trim().length() > 6) {
            this.senha = senha.trim();
        } else {
            throw  new RuntimeException("Senha do funcionário deve ter ao menos 6 caracteres!");
        }
    }
}
