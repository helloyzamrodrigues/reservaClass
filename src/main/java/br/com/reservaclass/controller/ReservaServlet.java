package br.com.reservaclass.controller;

import br.com.reservaclass.model.Aula;
import br.com.reservaclass.model.Professor;
import br.com.reservaclass.model.Sala;
import br.com.reservaclass.repository.ClassRepository;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ReservaServlet")
public class ReservaServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            Professor prof = (Professor) request.getSession().getAttribute("professorLogado");
            if (prof == null) {
                response.sendRedirect("index.jsp");
                return;
            }

            int idSala = Integer.parseInt(request.getParameter("idSala"));
            String dataStr = request.getParameter("data");
            int hora = Integer.parseInt(request.getParameter("hora"));
            int duracao = Integer.parseInt(request.getParameter("duracao"));
            
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date data = sdf.parse(dataStr);
            
            Sala salaSelecionada = null;
            for (Sala s : ClassRepository.getInstance().salas) {
                if (s.getId() == idSala) {
                    salaSelecionada = s;
                    break;
                }
            }
            
            if (salaSelecionada != null) {
                ClassRepository repositorio = ClassRepository.getInstance();
                
                // Verifica conflito de horário
                for (Aula a : repositorio.aulas) {
                    if (a.getSala().getId() == idSala 
                        && a.getData().equals(data) 
                        && a.getHora() == hora) {
                        request.setAttribute("erro", "Já existe uma reserva para esta sala neste horário.");
                        request.getRequestDispatcher("reservarSala.jsp").forward(request, response);
                        return;
                    }
                }
                
                Aula novaAula = new Aula(repositorio.gerarIdAula(), data, hora, duracao, prof, salaSelecionada);
                repositorio.aulas.add(novaAula);
            }
            
            response.sendRedirect("homeProfessor.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("reservarSala.jsp?erro=true");
        }
    }
}