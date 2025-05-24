<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro exitoso</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/styles/index.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/styles/fonts.css">
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/img/icon-blessing-store.png" type="image/x-icon">
    <style>
        * {
            font-family: 'Poppins-Medium';
            text-align: center;
            }
    </style>
</head>
<body>
    <div class="container success-container"> <%-- Se añadió la clase 'success-container' --%>
        <h2>¡Registro exitoso!</h2>
        <p>El nuevo usuario ha sido creado correctamente en la base de datos.</p>
        <a href="<%= request.getContextPath() %>/">Volver al formulario</a> <%-- ¡Aquí el pequeño cambio! --%>
    </div>
</body>
</html>