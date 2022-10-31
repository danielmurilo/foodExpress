package org.soulcode.foodexpress.domain;

import java.time.LocalDateTime;
import java.util.Date;

public class Pedido {

    private Integer id;
    private LocalDateTime hora_pedido;
    private Cliente cliente;
    private Funcionario funcionario;

    public Pedido() {}

    public Pedido(Integer id, LocalDateTime hora_pedido, Cliente cliente, Funcionario funcionario) {
        this.id = id;
        this.hora_pedido = hora_pedido;
        this.cliente = cliente;
        this.funcionario = funcionario;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public LocalDateTime getHora_pedido() {
        return hora_pedido;
    }

    public void setHora_pedido(LocalDateTime hora_pedido) {
        this.hora_pedido = hora_pedido;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Funcionario getFuncionario() {
        return funcionario;
    }

    public void setFuncionario(Funcionario funcionario) {
        this.funcionario = funcionario;
    }
}
