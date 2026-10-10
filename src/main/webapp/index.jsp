<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login - Reserva de Salas | IFPE</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
        <style>
            :root {
                --ifpe-verde-escuro: #1b5e20;
                --ifpe-verde: #2e7d32;
                --ifpe-verde-claro: #4caf50;
            }
            body {
                background: linear-gradient(135deg, var(--ifpe-verde-escuro), var(--ifpe-verde-claro));
                min-height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                font-family: 'Segoe UI', Arial, sans-serif;
            }
            .card-login {
                border: none;
                border-radius: 16px;
                box-shadow: 0 10px 40px rgba(0,0,0,0.3);
                overflow: hidden;
            }
            .card-header-ifpe {
                background: var(--ifpe-verde-escuro);
                color: white;
                text-align: center;
                padding: 30px 20px;
            }
            .card-header-ifpe i {
                font-size: 3rem;
                margin-bottom: 10px;
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
            .form-control:focus {
                border-color: var(--ifpe-verde-claro);
                box-shadow: 0 0 0 0.25rem rgba(76, 175, 80, 0.25);
            }
            .link-ifpe {
                color: var(--ifpe-verde);
                text-decoration: none;
                font-weight: 600;
            }
            .link-ifpe:hover {
                color: var(--ifpe-verde-escuro);
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-5 col-lg-4">
                    <div class="card card-login">
                        <div class="card-header-ifpe">
                            <i class="bi bi-building"></i>
                            <h4 class="mb-0">Reserva de Salas</h4>
                            <small>IFPE - Sistema Acadêmico</small>
                        </div>
                        <div class="card-body p-4">
                            
                            <% if(request.getAttribute("erro") != null) { %>
                                <div class="alert alert-danger d-flex align-items-center" role="alert">
                                    <i class="bi bi-exclamation-triangle-fill me-2"></i>
                                    <%= request.getAttribute("erro") %>
                                </div>
                            <% } %>
                            <% if(request.getAttribute("sucesso") != null) { %>
                                <div class="alert alert-success d-flex align-items-center" role="alert">
                                    <i class="bi bi-check-circle-fill me-2"></i>
                                    <%= request.getAttribute("sucesso") %>
                                </div>
                            <% } %>

                            <form action="LoginServlet" method="post">
                                <div class="mb-3">
                                    <label class="form-label fw-semibold">
                                        <i class="bi bi-person-badge text-success"></i> SIAPE
                                    </label>
                                    <input type="text" name="siape" class="form-control" placeholder="Digite seu SIAPE" required />
                                </div>
                                <div class="mb-3">
                                    <label class="form-label fw-semibold">
                                        <i class="bi bi-lock text-success"></i> Senha
                                    </label>
                                    <input type="password" name="senha" class="form-control" placeholder="Digite sua senha" required />
                                </div>
                                <button type="submit" class="btn btn-ifpe w-100 py-2">
                                    <i class="bi bi-box-arrow-in-right"></i> Entrar
                                </button>
                            </form>
                            
                            <hr class="my-4">
                            
                            <div class="text-center">
                                <a href="cadastro.jsp" class="link-ifpe">
                                    <i class="bi bi-person-plus-fill"></i> Cadastrar novo Professor
                                </a>
                            </div>
                            
                            <div class="alert alert-light border mt-3 mb-0 small text-muted">
                                <i class="bi bi-info-circle"></i> 
                                <strong>Dica de teste:</strong> SIAPE <code>123</code> | Senha <code>123</code>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>