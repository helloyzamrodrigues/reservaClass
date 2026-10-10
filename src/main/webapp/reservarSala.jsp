<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.reservaclass.model.Sala"%>
<%@page import="br.com.reservaclass.model.Professor"%>
<%@page import="br.com.reservaclass.repository.ClassRepository"%>

<%
    Professor prof = (Professor) session.getAttribute("professorLogado");
    if (prof == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Reservar Sala | IFPE</title>
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
            .card-form {
                border: none;
                border-radius: 16px;
                box-shadow: 0 10px 40px rgba(0,0,0,0.1);
                overflow: hidden;
            }
            .card-header-ifpe {
                background: var(--ifpe-verde-escuro);
                color: white;
                text-align: center;
                padding: 25px;
            }
            .card-header-ifpe i {
                font-size: 2.5rem;
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
            .form-control:focus, .form-select:focus {
                border-color: var(--ifpe-verde-claro);
                box-shadow: 0 0 0 0.25rem rgba(76, 175, 80, 0.25);
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
                    </span>
                    <a href="homeProfessor.jsp" class="btn btn-ifpe-outline btn-sm">
                        <i class="bi bi-arrow-left"></i> Voltar
                    </a>
                </div>
            </div>
        </nav>

        <div class="container my-5">
            <div class="row justify-content-center">
                <div class="col-md-7 col-lg-6">
                    <div class="card card-form">
                        <div class="card-header-ifpe">
                            <i class="bi bi-calendar-plus"></i>
                            <h4 class="mb-0 mt-2">Nova Reserva</h4>
                            <small>Preencha os dados abaixo</small>
                        </div>
                        <div class="card-body p-4">
                            
                            <% if(request.getAttribute("erro") != null) { %>
                                <div class="alert alert-danger d-flex align-items-center" role="alert">
                                    <i class="bi bi-exclamation-triangle-fill me-2"></i>
                                    <%= request.getAttribute("erro") %>
                                </div>
                            <% } %>
                            
                            <form action="ReservaServlet" method="post">
                                
                                <div class="mb-3">
                                    <label class="form-label fw-semibold">
                                        <i class="bi bi-door-open text-success"></i> Sala
                                    </label>
                                    <select name="idSala" class="form-select" required>
                                        <option value="">-- Selecione uma sala --</option>
                                        <% for(Sala s : ClassRepository.getInstance().salas) { %>
                                            <option value="<%=s.getId()%>">
                                                <%=s.getNome()%> - <%=s.getLocalizacao()%> (Cap: <%=s.getCapacidade()%>)
                                            </option>
                                        <% } %>
                                    </select>
                                </div>
                                
                                <div class="mb-3">
                                    <label class="form-label fw-semibold">
                                        <i class="bi bi-calendar text-success"></i> Data
                                    </label>
                                    <input type="date" name="data" class="form-control" required />
                                </div>
                                
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label fw-semibold">
                                            <i class="bi bi-clock text-success"></i> Hora
                                        </label>
                                        <input type="number" name="hora" class="form-control" 
                                               min="0" max="23" placeholder="Ex: 14" required />
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label fw-semibold">
                                            <i class="bi bi-hourglass-split text-success"></i> Duração (min)
                                        </label>
                                        <input type="number" name="duracao" class="form-control" 
                                               value="60" min="15" step="15" required />
                                    </div>
                                </div>
                                
                                <button type="submit" class="btn btn-ifpe w-100 py-2 mt-2">
                                    <i class="bi bi-check-circle"></i> Confirmar Reserva
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>