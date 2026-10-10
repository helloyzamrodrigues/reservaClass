package br.com.reservaclass.model;

public class ItemEquipamento {
    private int id;
    private int quantidadeUsada;
    private Equipamento equipamento;

    public ItemEquipamento(int id, int quantidadeUsada, Equipamento equipamento) {
        this.id = id;
        this.quantidadeUsada = quantidadeUsada;
        this.equipamento = equipamento;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getQuantidadeUsada() { return quantidadeUsada; }
    public void setQuantidadeUsada(int quantidadeUsada) { this.quantidadeUsada = quantidadeUsada; }

    public Equipamento getEquipamento() { return equipamento; }
    public void setEquipamento(Equipamento equipamento) { this.equipamento = equipamento; }
}