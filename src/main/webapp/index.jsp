

<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ page language="java" import="com.uniovi.sdi.* , java.util.List"%>
<html lang="en">
<head>
    <title>Servlets</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

<!-- < jsp:useBean id="counter" class="com.uniovi.sdi.Counter"/ >  Esta implementacion usa el scope por defecto-> scope de pagina-->
<jsp:useBean id="counter" class="com.uniovi.sdi.Counter" scope="application"/>
<!--Cambiamos el scope a application para que el contador sea comun a todos los usuarios de la misma-->
<jsp:setProperty name="counter" property="increase" value="1"/>

<!--
Implementación del contador previa al uso de Java beans.
< %
    Integer counter = (Integer) application.getAttribute("counter");//obtiene el atributo contador de la aplicación
    if (counter == null) {//crea un nuevo contador si este no existía
        counter = new Integer(0);//inicializa el contador como un integer de valor 0
    }
    application.setAttribute("counter", counter.intValue() + 1);//añade una visita al contador
% > -->

<!-- Barra de Navegación superior -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="collapse navbar-collapse" id="my-navbarColor02">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item ">
                <a class="nav-link" href="AddToShoppingCart">Carrito<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="login.jsp">Login<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="admin.jsp">Administrar productos<span class="sr-only">(current)</span></a>
            </li>
        </ul>
        <div class="nav navbar-right">
            <!-- cambiar por el bean -->
            <%-- <%=counter%>Visitas --%>
            <jsp:getProperty name="counter" property="total"/> Visitas </div> <!--Lo añadimos a la barra de navegación-->
    </div>
</nav>
<!-- Contenido -->
<div class="container" id="main-container">
    <h2>Productos</h2>
    <div class="row ">
        <%
            List<Product> listProducts = new ProductsService().getProducts();
            for(Product product : listProducts){
        %>
        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
            <div>
                <img src="<%=product.getImage() %>" />
                <div><%=product.getName() %></div>
                <a href="AddToShoppingCart?product=<%=product.getName() %>" class="btn btn-default" >
                    <%=product.getPrice() %> €
                </a>
            </div>
        </div>
        <%
            }
        %>
    </div>
</div>
</body>
</html>
