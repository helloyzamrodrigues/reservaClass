package br.com.reservaclass.controller;

import br.com.reservaclass.model.Professor;
import br.com.reservaclass.repository.ClassRepository;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String siapeStr = request.getParameter("siape");
        String senha = request.getParameter("senha");
        
        try {
            int siape = Integer.parseInt(siapeStr);
            ClassRepository repositorio = ClassRepository.getInstance();
            
            for (Professor p : repositorio.professores) {
                if (p.getSiape() == siape && p.getSenha().equals(senha)) {
                    HttpSession session = request.getSession();
                    session.setAttribute("professorLogado", p);
                    response.sendRedirect("homeProfessor.jsp");
                    return;
                }
            }
            request.setAttribute("erro", "SIAPE ou senha inválidos.");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            
        } catch (NumberFormatException e) {
            request.setAttribute("erro", "SIAPE deve ser um número válido.");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}