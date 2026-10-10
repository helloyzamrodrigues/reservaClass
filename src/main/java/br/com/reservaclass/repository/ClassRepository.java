package br.com.reservaclass.repository;

import br.com.reservaclass.model.Aula;
import br.com.reservaclass.model.Equipamento;
import br.com.reservaclass.model.Professor;
import br.com.reservaclass.model.Sala;
import br.com.reservaclass.model.TipoSala;
import java.util.ArrayList;
import java.util.List;

public class ClassRepository {
    private static ClassRepository instance;
    
    public List<Professor> professores = new ArrayList<>();
    public List<Sala> salas = new ArrayList<>();
    public List<Equipamento> equipamentos = new ArrayList<>();
    public List<Aula> aulas = new ArrayList<>();
    
    private int proximoIdSala = 1;
    private int proximoIdAula = 1;
    private int proximoIdEquipamento = 1;
    private int proximoIdItem = 1;

    private ClassRepository() {
        // Professores pré-cadastrados
        professores.add(new Professor(123, "Admin", "123"));
        professores.add(new Professor(456, "João Silva", "456"));
        
        // Salas pré-cadastradas
        salas.add(new Sala(proximoIdSala++, "Sala 101", "Bloco A", 30, TipoSala.SALA_AULA));
        salas.add(new Sala(proximoIdSala++, "Sala 102", "Bloco A", 25, TipoSala.SALA_AULA));
        salas.add(new Sala(proximoIdSala++, "Lab Informática", "Bloco B", 20, TipoSala.LABORATORIO));
        salas.add(new Sala(proximoIdSala++, "Auditório Principal", "Bloco C", 100, TipoSala.AUDITORIO));
        
        // Equipamentos pré-cadastrados
        equipamentos.add(new Equipamento(proximoIdEquipamento++, "Projetor", "Epson", "Multimídia", "Apresentações"));
        equipamentos.add(new Equipamento(proximoIdEquipamento++, "Notebook", "Dell", "Informática", "Aulas práticas"));
        equipamentos.add(new Equipamento(proximoIdEquipamento++, "Microfone", "JBL", "Áudio", "Palestras"));
    }

    public static synchronized ClassRepository getInstance() {
        if (instance == null) {
            instance = new ClassRepository();
        }
        return instance;
    }
    
    public int gerarIdAula() { return proximoIdAula++; }
    public int gerarIdSala() { return proximoIdSala++; }
    public int gerarIdEquipamento() { return proximoIdEquipamento++; }
    public int gerarIdItem() { return proximoIdItem++; }
}