<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% String context = request.getContextPath();
    if (request.getSession(false).getAttribute("user") != null){
        response.sendRedirect(context + "/view/home.jsp");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>La tienda del mapache</title>
    <link rel="shortcut icon" href="<%=context%>/src/img/app_icon.png" type="image/x-icon">
    <link rel="stylesheet" href="<%=context%>/src/css/generals.css">
    <link rel="stylesheet" href="<%=context%>/src/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=context%>/src/css/bootstrap-icons.min.css">
</head>
<body>
<nav class="px-5 pt-3 custom-nav">
    <div class="shadow p-2 bg-white d-flex align-items-center" style="border-radius: 8px">
        <img src="<%=context%>/src/img/app_icon.png" width="40" height="40">
        <span class="ms-2 me-auto fw-bold ">La tienda del mapache</span>
        <a href="" class="btn btn-dark me-2">Registrate</a>
        <a href="<%=context%>/RedirectFormLogin" class="btn btn-outline-dark">Iniciar sesión</a>
    </div>
</nav>
<main class="main">
    <div class="landing-container">
        <img src="<%=context%>/src/img/landing.png" style="object-fit: cover; height: 100%; width: 100%" alt="">
        <div class="landing-overlay d-flex flex-column justify-content-center text-light px-5">
            <h1 style="font-size: 90px">¡Bienvenido!</h1>
            <p>Lo mejor de las tiendas en un solo lugar y la seguridad de encontrar <br>productos de calidad</p>
            <a href="" class="mt-4 btn btn-primary col-4"><span>Comenzar a comprar <i class="bi bi-arrow-right"></i></span></a>
        </div>
    </div>
</main>
</body>
</html>