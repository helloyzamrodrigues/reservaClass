package br.com.reservaclass.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Aula {
    private int id;
    private Date data;
    private int hora;
    private int duracao;
    private Professor professor;
    private Sala sala;
    private List<ItemEquipamento> itensEquipamento = new ArrayList<>();

    public Aula(int id, Date data, int hora, int duracao, Professor professor, Sala sala) {
        this.id = id;
        this.data = data;
        this.hora = hora;
        this.duracao = duracao;
        this.professor = professor;
        this.sala = sala;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public Date getData() { return data; }
    public void setData(Date data) { this.data = data; }

    public int getHora() { return hora; }
    public void setHora(int hora) { this.hora = hora; }

    public int getDuracao() { return duracao; }
    public void setDuracao(int duracao) { this.duracao = duracao; }

    public Professor getProfessor() { return professor; }
    public void setProfessor(Professor professor) { this.professor = professor; }

    public Sala getSala() { return sala; }
    public void setSala(Sala sala) { this.sala = sala; }

    public List<ItemEquipamento> getItensEquipamento() { return itensEquipamento; }
    public void setItensEquipamento(List<ItemEquipamento> itensEquipamento) { this.itensEquipamento = itensEquipamento; }
}