<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Formulario para crear un nuevo usuario en Blessing Store.">
    <title>Nuevo usuario</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/styles/index.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/styles/fonts.css">
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/img/icon-blessing-store.png" type="image/x-icon">
</head>
<body>
<div class="container">
    <h2>Crear nuevo usuario</h2>

    <%-- INICIO DEL CÓDIGO PARA MOSTRAR MENSAJES DE ERROR --%>
    <% 
        // Recupera el mensaje de error del modelo si existe
        String mensajeError = (String) request.getAttribute("mensajeError");
        if (mensajeError != null && !mensajeError.isEmpty()) {
    %>
        <p style="color: red; font-weight: bold; margin-bottom: 15px;">
            <%= mensajeError %>
        </p>
    <%
        }
    %>
    <%-- FIN DEL CÓDIGO PARA MOSTRAR MENSAJES DE ERROR --%>

    <form action="<%= request.getContextPath() %>/crearUsuario" method="post">
        <div class="form-group">
            <label for="nombres">Nombres:</label>
            <input type="text" id="nombres" name="nombres" placeholder="Noah" required>
        </div>
        <div class="form-group">
            <label for="apellidos">Apellidos:</label>
            <input type="text" id="apellidos" name="apellidos" placeholder="Johnson" required>
        </div>
        <div class="form-group">
            <label for="telefono">Teléfono:</label>
            <input type="text" id="telefono" name="telefono" placeholder="3101234567">
        </div>
        <div class="form-group">
            <label for="direccion">Dirección:</label>
            <input type="text" id="direccion" name="direccion" placeholder="Calle 10 # 5-20">
        </div>
        <div class="form-group">
            <label for="id_ciudad">ID Ciudad:</label>
            <input type="number" id="id_ciudad" name="idCiudad" placeholder="21 - 52" required>
            <%-- CAMBIO AQUÍ: de name="id_ciudad" a name="idCiudad" --%>
        </div>
        <div class="form-group">
            <label for="fecha_nacimiento">Fecha de Nacimiento:</label>
            <input type="date" id="fecha_nacimiento" name="fechaNacimiento" placeholder="AAAA-MM-DD" required>
            <%-- CAMBIO AQUÍ: de name="fecha_nacimiento" a name="fechaNacimiento" --%>
        </div>
        <input type="submit" value="Crear Usuario">
    </form>
    <a href="<%= request.getContextPath() %>/#">Volver</a>
</div>
</body>
</html>