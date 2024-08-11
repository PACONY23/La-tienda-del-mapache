<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String context = request.getContextPath();
    if (request.getSession(false).getAttribute("user") != null){
        response.sendRedirect(context + "/view/home.jsp");
    }
    boolean errorMessage = request.getAttribute("errorMessage") != null && !(boolean) request.getAttribute("errorMessage");
%>
<html>
<head>
    <title>Iniciar sesión</title>
    <link rel="shortcut icon" href="<%=context%>/src/img/app_icon.png" type="image/x-icon">
    <link rel="stylesheet" href="<%=context%>/src/css/generals.css">
    <link rel="stylesheet" href="<%=context%>/src/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=context%>/src/css/bootstrap-icons.min.css">
</head>
<body>
<main class="main d-flex flex-column align-items-center justify-content-center">
    <img src="<%=context%>/src/img/app_icon.png" height="90" width="90" alt="">
    <div class="card border-0 shadow" style="width: 350px">
        <div class="card-body">
            <p class="text-center fw-bold fs-5 mb-4">La tienda del mapache</p>
            <form action="<%=context%>/LoginServlet" method="post">
                <div class="row g-3">
                    <div class="col-12">
                        <label for="username"><small>Usuario o correo electrónico</small></label>
                        <input type="text" id="username" name="username" class="form-control" autocomplete="false">
                    </div>
                    <div class="col-12">
                        <label for="password"><small>Contraseña</small></label>
                        <input type="password" id="password" name="password" class="form-control" autocomplete="false">
                    </div>
                    <%if(errorMessage){%>
                        <div class="col-12">
                            <div class="alert alert-danger mb-0"> Contraseña y/o usuario incorrectos</div>
                        </div>
                    <%}%>
                    <div class="col-12 text-center">
                        <button class="my-3 btn btn-primary col-12">Iniciar sesión</button>
                        <a href="">¿Olvidaste tu constraseña?</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</main>
</body>
</html>
