<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mensaje</title>
</head>
<body>
<table border="2.0" cellpadding="3.0">
    <tr>
        <td colspan="2"><img src="<%=request.getAttribute("imagen")%>" /></td>
    </tr>
    <tr>
        <td>nombre:</td>
        <td><%=request.getAttribute("nombre")%></td>
    </tr>
    <tr>
        <td>tipo:</td>
        <td><%=request.getAttribute("tipo")%></td>
    </tr>
    <tr>
        <td>tamaño:</td>
        <td><%=request.getAttribute("tamanio")%> kb</td>
    </tr>
</table>
<br>
<br>
<table>
    <tr>
        <td>Nombres:</td>
        <td><%=request.getAttribute("txtNombres")%></td>
    </tr>
    <tr>
        <td>Apellidos:</td>
        <td><%=request.getAttribute("txtApellidos")%></td>
    </tr>
    <tr>
        <td>Direccion:</td>
        <td><%=request.getAttribute("txtDireccion")%></td>
    </tr>
    <tr>
        <td>Telefono:</td>
        <td><%=request.getAttribute("txtTelefono")%></td>
    </tr>
</table>
</body>
</html>