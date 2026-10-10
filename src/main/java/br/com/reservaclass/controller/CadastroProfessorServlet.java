package br.com.reservaclass.controller;

import br.com.reservaclass.model.Professor;
import br.com.reservaclass.repository.ClassRepository;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/CadastroProfessorServlet")
public class CadastroProfessorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            int siape = Integer.parseInt(request.getParameter("siape"));
            String nome = request.getParameter("nome");
            String senha = request.getParameter("senha");
            
            ClassRepository repositorio = ClassRepository.getInstance();
            
            // Verifica se SIAPE já existe
            for (Professor p : repositorio.professores) {
                if (p.getSiape() == siape) {
                    request.setAttribute("erro", "SIAPE já cadastrado no sistema.");
                    request.getRequestDispatcher("cadastro.jsp").forward(request, response);
                    return;
                }
            }
            
            Professor novo = new Professor(siape, nome, senha);
            repositorio.professores.add(novo);
            
            request.setAttribute("sucesso", "Professor cadastrado com sucesso! Faça login.");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            
        } catch (NumberFormatException e) {
            request.setAttribute("erro", "SIAPE deve ser um número válido.");
            request.getRequestDispatcher("cadastro.jsp").forward(request, response);
        }
    }
}