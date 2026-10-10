package br.com.reservaclass.model;

public class Professor {
    private int siape;
    private String nome;
    private String senha;

    public Professor(int siape, String nome, String senha) {
        this.siape = siape;
        this.nome = nome;
        this.senha = senha;
    }

    public int getSiape() { return siape; }
    public void setSiape(int siape) { this.siape = siape; }

    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }

    public String getSenha() { return senha; }
    public void setSenha(String senha) { this.senha = senha; }
}