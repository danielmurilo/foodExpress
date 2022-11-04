package org.soulcode.foodexpress.domain;

public class Endereco {

    private Integer id;
    private String logradouro;
    private String numero;
    private String bairro;
    private String cidade;
    private String uf;
    private String complemento;
    private String referencia;
    private String cep;

    public Endereco(){}

    public Endereco(Integer id, String logradouro, String numero, String bairro, String cidade, String uf, String complemento, String referencia, String cep) {
        this.id = id;
        this.logradouro = logradouro;
        this.numero = numero;
        this.bairro = bairro;
        this.cidade = cidade;
        this.uf = uf;
        this.complemento = complemento;
        this.referencia = referencia;
        this.cep = cep;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLogradouro() {
        return logradouro;
    }

    public void setLogradouro(String logradouro) {
        if(logradouro.trim().length() > 3){
            this.logradouro = logradouro.trim();
        } else {
            throw new RuntimeException("Logradouro precisa ter ao menos 3 caracteres");
        }

    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        if(numero.trim().length() > 1) {
            this.numero = numero.trim();
        } else {
            throw new RuntimeException("É preciso informar o número!");
        }
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        if(bairro.trim().length() > 1) {
            this.bairro = bairro.trim();
        } else {
            throw new RuntimeException("É preciso informar o bairro!");
        }
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        if(cidade.trim().length() > 1) {
            this.cidade = cidade.trim();
        } else {
            throw new RuntimeException("É preciso informar a cidade!");
        }
    }

    public String getUf() {
        return uf;
    }

    public void setUf(String uf) {
        if(uf.trim().length() > 2) {
            this.uf = uf.trim();
        } else {
            throw new RuntimeException("É preciso informar o Estado!");
        }
    }

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento; //campo não é obrigatório!
    }

    public String getReferencia() {
        return referencia;
    }

    public void setReferencia(String referencia){
        if(referencia.trim().length() > 2) {
            this.referencia = referencia.trim();
        } else {
            throw new RuntimeException("É preciso informar um ponto de referência!");
        }
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep; //campo não é obrigatório!
    }
}
