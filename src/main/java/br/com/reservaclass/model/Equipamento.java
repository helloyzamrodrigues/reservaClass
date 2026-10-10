package br.com.reservaclass.model;

public class Equipamento {
    private int id;
    private String nome;
    private String marca;
    private String tipo;
    private String utilidade;

    public Equipamento(int id, String nome, String marca, String tipo, String utilidade) {
        this.id = id;
        this.nome = nome;
        this.marca = marca;
        this.tipo = tipo;
        this.utilidade = utilidade;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }

    public String getMarca() { return marca; }
    public void setMarca(String marca) { this.marca = marca; }

    public String getTipo() { return tipo; }
    public void setTipo(String tipo) { this.tipo = tipo; }

    public String getUtilidade() { return utilidade; }
    public void setUtilidade(String utilidade) { this.utilidade = utilidade; }
}