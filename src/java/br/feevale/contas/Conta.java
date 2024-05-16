package br.feevale.contas;


public class Conta {
    private Integer id;
    private String data;
    private Integer conta;
    private Integer tipoTransacao;
    private Double valor;
    
    public Integer getId() {
        return id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    
    
    public String getData() {
        return data;
    }
    
    public void setData(String data) {
        this.data = data;
    }
    
    
    public Integer getConta() {
        return conta;
    }
    
    public void setConta(Integer conta) {
        this.conta = conta;
    }
    
    
    public Integer getTipoTransacao() {
        return tipoTransacao;
    }
    
    public void setTipoTransacao(Integer tipoTransacao) {
        this.tipoTransacao = tipoTransacao;
    }
    
    
    public Double getValor() {
        return valor;
    }
    
    public void setValor(Double valor) {
        this.valor = valor;
    }
    
    
    @Override
    public String toString() {
        return id + " - " + conta + " - " + tipoTransacao + " - " + valor;
    }
}