<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.reservaclass.model.*"%>
<%@page import="br.com.reservaclass.repository.ClassRepository"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>

<%
    Professor prof = (Professor) session.getAttribute("professorLogado");
    if (prof == null) {
        response.sendRedirect("index.jsp");
        return;
    }
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
%>

<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Minhas Reservas | IFPE</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
        <style>
            :root {
                --ifpe-verde-escuro: #1b5e20;
                --ifpe-verde: #2e7d32;
                --ifpe-verde-claro: #4caf50;
                --ifpe-verde-fundo: #e8f5e9;
            }
            body {
                background-color: var(--ifpe-verde-fundo);
                font-family: 'Segoe UI', Arial, sans-serif;
            }
            .navbar-ifpe {
                background: var(--ifpe-verde-escuro);
                color: white;
                box-shadow: 0 2px 10px rgba(0,0,0,0.2);
            }
            .navbar-ifpe .navbar-brand {
                color: white;
                font-weight: 700;
                font-size: 1.3rem;
            }
            .btn-ifpe {
                background: var(--ifpe-verde);
                color: white;
                border: none;
                font-weight: 600;
                transition: all 0.3s;
            }
            .btn-ifpe:hover {
                background: var(--ifpe-verde-escuro);
                color: white;
                transform: translateY(-2px);
            }
            .btn-ifpe-outline {
                border: 2px solid white;
                color: white;
                font-weight: 600;
            }
            .btn-ifpe-outline:hover {
                background: white;
                color: var(--ifpe-verde-escuro);
            }
            .card-reserva {
                border: none;
                border-left: 5px solid var(--ifpe-verde);
                border-radius: 10px;
                box-shadow: 0 4px 15px rgba(0,0,0,0.08);
                transition: transform 0.2s;
            }
            .card-reserva:hover {
                transform: translateY(-3px);
                box-shadow: 0 6px 20px rgba(0,0,0,0.15);
            }
            .badge-ifpe {
                background: var(--ifpe-verde-claro);
                color: white;
            }
            .table-ifpe thead {
                background: var(--ifpe-verde-escuro);
                color: white;
            }
            .empty-state {
                text-align: center;
                padding: 40px;
                color: #777;
            }
            .empty-state i {
                font-size: 4rem;
                color: var(--ifpe-verde-claro);
                opacity: 0.5;
            }
        </style>
    </head>
    <body>
        
        <!-- Navbar -->
        <nav class="navbar navbar-ifpe navbar-expand-lg">
            <div class="container">
                <span class="navbar-brand">
                    <i class="bi bi-building"></i> Reserva de Salas - IFPE
                </span>
                <div class="d-flex align-items-center gap-3">
                    <span class="text-white">
                        <i class="bi bi-person-circle"></i> 
                        <strong><%= prof.getNome() %></strong>
                        <small class="text-white-50">(SIAPE: <%= prof.getSiape() %>)</small>
                    </span>
                    <a href="LogoutServlet" class="btn btn-ifpe-outline btn-sm">
                        <i class="bi bi-box-arrow-right"></i> Sair
                    </a>
                </div>
            </div>
        </nav>

        <div class="container my-5">
            
            <!-- Cabeçalho -->
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div>
                    <h2 class="fw-bold" style="color: var(--ifpe-verde-escuro);">
                        <i class="bi bi-calendar-check"></i> Minhas Reservas
                    </h2>
                    <p class="text-muted mb-0">Gerencie suas reservas de salas</p>
                </div>
                <a href="reservarSala.jsp" class="btn btn-ifpe btn-lg">
                    <i class="bi bi-plus-circle"></i> Nova Reserva
                </a>
            </div>

            <!-- Lista de Reservas -->
            <div class="card shadow-sm">
                <div class="card-body">
                    <% 
                       List<Aula> aulas = ClassRepository.getInstance().aulas;
                       boolean temReserva = false;
                       for(Aula a : aulas) {
                           if(a.getProfessor().getSiape() == prof.getSiape()) {
                               temReserva = true;
                    %>
                    
                    <div class="card card-reserva mb-3">
                        <div class="card-body">
                            <div class="row align-items-center">
                                <div class="col-md-5">
                                    <h5 class="mb-1 fw-bold" style="color: var(--ifpe-verde-escuro);">
                                        <i class="bi bi-door-open"></i> <%= a.getSala().getNome() %>
                                    </h5>
                                    <small class="text-muted">
                                        <i class="bi bi-geo-alt"></i> <%= a.getSala().getLocalizacao() %>
                                        &nbsp;|&nbsp;
                                        <i class="bi bi-people"></i> <%= a.getSala().getCapacidade() %> lugares
                                    </small>
                                </div>
                                <div class="col-md-3">
                                    <span class="badge badge-ifpe me-2">
                                        <i class="bi bi-calendar"></i> <%= sdf.format(a.getData()) %>
                                    </span>
                                </div>
                                <div class="col-md-2">
                                    <span class="badge bg-dark">
                                        <i class="bi bi-clock"></i> <%= a.getHora() %>:00
                                    </span>
                                </div>
                                <div class="col-md-2 text-end">
                                    <span class="text-muted small">
                                        <i class="bi bi-hourglass-split"></i> <%= a.getDuracao() %> min
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <% 
                           }
                       } 
                       if(!temReserva) {
                    %>
                    
                    <div class="empty-state">
                        <i class="bi bi-calendar-x"></i>
                        <h5 class="mt-3">Nenhuma reserva encontrada</h5>
                        <p>Clique em "Nova Reserva" para começar.</p>
                    </div>
                    
                    <% } %>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>