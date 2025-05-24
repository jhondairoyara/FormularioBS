<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %> <%-- ¡IMPORTANTE: Esta línea activa JSTL! --%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error en el registro</title>
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
    <div class="container error-container">
        <h2>¡Error en el registro!</h2>
        <p>Hubo un problema al intentar registrar el usuario. Por favor, inténtalo de nuevo.</p>

        <c:if test="${not empty mensajeError}">
            <p><strong>Detalle del error:</strong> <c:out value="${mensajeError}"/></p>
        </c:if>

        <a href="<%= request.getContextPath() %>/">Volver al formulario</a> <%-- Cambiado a la raíz del contexto --%>
    </div>
</body>
</html>