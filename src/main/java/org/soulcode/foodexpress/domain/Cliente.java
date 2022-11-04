package org.soulcode.foodexpress.domain;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import java.time.LocalDate;

public class Cliente {

    private Integer id;
    private String nome;
    private String email;
    private String telefone;
    private LocalDate data_cadastro;
    private String senha;
    private Endereco endereco;

    public Cliente() {}

    public Cliente(Integer id, String nome, String email, String telefone, LocalDate data_cadastro, String senha, Endereco endereco) {
        this.id = id;
        this.nome = nome;
        this.email = email;
        this.telefone = telefone;
        this.data_cadastro = data_cadastro;
        this.senha = senha;
        this.endereco = endereco;
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
        if(nome.trim().length() > 5){
            this.nome = nome.trim();
        } else {
            throw new RuntimeException("Nome do cliente precisa ter ao menos 5 caracteres!");
        }
    }

    public String getEmail() {return email;}

    public void setEmail(String email) {
        try {
            InternetAddress emailAddr = new InternetAddress(email);
            emailAddr.validate();
        } catch (AddressException ex) {
            throw new RuntimeException("Informe um e-mail válido");
        }
        this.email = email.trim();
    }

    public String getTelefone() { return telefone;}

    public void setTelefone(String telefone) {
        if(telefone.trim().length() > 8){
            this.telefone = telefone.trim();
        } else {
            throw new RuntimeException("Telefone do cliente precisa ter ao menos 8 caracteres!");
        }
    }

    public LocalDate getData_cadastro() {
        return data_cadastro;
    }

    public void setData_cadastro(LocalDate data_cadastro) {
        if(!data_cadastro.isBefore(LocalDate.now())){
            this.data_cadastro = data_cadastro;
        } else {
            throw new RuntimeException("Data de Cadastro não pode ser inferior a data de hoje.");
        }

    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        if (senha.trim().length() > 6) {
            this.senha = senha.trim();
        } else {
            throw new RuntimeException("Senha precisa ter ao menos 6 caracteres!");
        }
    }

    public Endereco getEndereco() {
        return endereco;
    }

    public void setEndereco(Endereco endereco) {
        this.endereco = endereco;
    }
}
