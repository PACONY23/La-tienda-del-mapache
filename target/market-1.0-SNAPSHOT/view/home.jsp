<%@ page import="java.util.List" %>
<%@ page import="utez.edu.mx.market.daos.CategoryDao" %>
<%@ page import="utez.edu.mx.market.entities.Category" %>
<%@ page import="utez.edu.mx.market.daos.ProductDao" %>
<%@ page import="utez.edu.mx.market.entities.Product" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% String context = request.getContextPath();
    if (request.getSession(false).getAttribute("user") == null){
        response.sendRedirect(context + "/view/login.jsp");
    }
    List<Category> categories = new CategoryDao().findAllCategories();
    List<Product> products = new ProductDao().findAllProducts();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Inicio | La tienda del mapache</title>
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
        <span><%=request.getSession(false).getAttribute("user")%></span>
        <form action="<%=context%>/LogoutServlet" method="post" class="ms-2 mb-0">
            <button type="submit" class="btn btn-outline-danger">Cerrar sesión</button>
        </form>
    </div>
</nav>
<main class="px-5" style="margin-top: 100px">
    <section>
        <div class="d-flex align-items-center">
            <h4 class="me-auto mb-0">Gestión de productos</h4>
            <button class="btn btn-outline-success" data-bs-target="#createProductModal" data-bs-toggle="modal"><i class="bi bi-plus-lg"></i> Registrar</button>
        </div>
        <hr>
        <div class="row g-3">
            <%for(Product p : products){%>
                <div class="col-12 col-md-6 col-lg-4">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <h5 class="me-auto"><%=p.getName()%></h5>
                            <%if(p.isOnSale()) {%>
                            <i class="bi bi-circle-fill text-success fs-4"></i>
                            <%} else {%>
                            <i class="bi bi-circle-fill text-danger fs-4"></i>
                            <%}%>
                        </div>
                        <span class="badge bg-dark"><%=p.getCategory().getName()%>></span>
                        <span class="badge bg-secondary">En stock: <%=p.getStock()%></span>
                        <div class="col-12 text-end mt-3">
                            <button class="btn btn-outline-danger" onclick="putIdOnForm(<%=p.getId()%>, false)" data-bs-target="#DeleteProductModal" data-bs-toggle="modal"><i class="bi bi-trash"></i></button>
                            <button class="btn btn-outline-primary" onclick="putIdOnForm(<%=p.getId()%>, true)" data-bs-target="#ChangeProductStatusModal" data-bs-toggle="modal"><i class="bi bi-arrow-repeat"></i></button>
                            <button class="btn btn-outline-primary" onclick="putProductInformation(<%=p.getId()%>)" data-bs-target="#updateProductModal" data-bs-toggle="modal"><i class="bi bi-pencil"></i></button>
                        </div>
                    </div>
                </div>
            </div>
            <%}%>
        </div>
    </section>
</main>

<!-- Create Product -->
<div class="modal fade" id="createProductModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-body">
                <h4>Registrar producto</h4>
                <hr>
                <form action="<%=context%>/CreateProductServlet" method="post" class="mb-0">
                    <div class="row g-3">
                        <div class="col-12">
                            <label for="name"><small>Nombre del prodcuto</small></label>
                            <input type="text" id="name" name="name" autocomplete="false" class="form-control">
                        </div>
                        <div class="col-6">
                            <label for="stock"><small>En stock</small></label>
                            <input type="number" id="stock" min="1" name="stock" autocomplete="false" class="form-control">
                        </div>
                        <div class="col-6">
                            <label for="category"><small>Categoria</small></label>
                            <select type="text" id="category" name="category" class="form-control">
                                <%for (Category c: categories) {%>
                                <option value="<%=c.getId()%>"><%=c.getName()%></option>
                                <%}%>
                            </select>
                        </div>
                        <div class="col-12">
                            <label for="description"><small>Descripcion</small></label>
                            <input id="description" name="description" autocomplete="false" rows="3" class="form-control">
                        </div>
                        <div class="col-12 text-end">
                            <button type ="reset" class="btn btn-outline-secondary" data-bs-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-outline-success">Registrar</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Create Product -->
<div class="modal fade" id="updateProductModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-body">
                <h4>Actualizar producto</h4>
                <hr>
                <form action="<%=context%>/UpdateProductServlet" method="post" class="mb-0">
                    <input type="hidden" id="u_id" name="id"></input>
                    <div class="row g-3">
                        <div class="col-12">
                            <label for="name"><small>Nombre del prodcuto</small></label>
                            <input type="text" id="u_name" name="name" autocomplete="false" class="form-control">
                        </div>
                        <div class="col-6">
                            <label for="stock"><small>En stock</small></label>
                            <input type="number" id="u_stock" min="1" name="stock" autocomplete="false" class="form-control">
                        </div>
                        <div class="col-6">
                            <label for="category"><small>Categoria</small></label>
                            <select type="text" id="u_category" name="category" class="form-control">
                                <%for (Category c: categories) {%>
                                <option value="<%=c.getId()%>"><%=c.getName()%></option>
                                <%}%>
                            </select>
                        </div>
                        <div class="col-12">
                            <label for="description"><small>Descripcion</small></label>
                            <input id="u_description" name="description" autocomplete="false" rows="3" class="form-control">
                        </div>
                        <div class="col-12 text-end">
                            <button type ="reset" class="btn btn-outline-secondary" data-bs-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-outline-primary">Actualizar</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Change Product Status -->
<div class="modal fade" id="ChangeProductStatusModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-body">
                <h4>Cambiar estatus del producto</h4>
                <hr>
                <form action="<%=context%>/ChangeProductStatusServlet" method="post" class="mb-0">
                    <input type="hidden" id="ch_id" name="id"></input>
                    <div class="col-12">
                        ¿Estas seguro de cambiar el estatus del producto?
                    </div>
                    <div class="col-12 mt-3 text-end">
                            <button type ="reset" class="btn btn-outline-secondary" data-bs-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-outline-primary">Cambiar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Delete Product -->
<div class="modal fade" id="DeleteProductModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-body">
                <h4>Eliminar producto</h4>
                <hr>
                <form action="<%=context%>/DeleteProductServlet" method="post" class="mb-0">
                    <input type="hidden" id="d_id" name="id"></input>
                    <div class="col-12">
                        ¿Estas seguro que desea eliminar el producto?
                    </div>
                    <div class="col-12 mt-3 text-end">
                        <button type="submit" class="btn btn-outline-danger">Eliminar</button>
                        <button type ="reset" class="btn btn-outline-secondary" data-bs-dismiss="modal">Cancelar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="<%=context%>/src/js/bootstrap.bundle.min.js"></script>
<script src="<%=context%>/src/js/main.js"></script>
</body>
</html>