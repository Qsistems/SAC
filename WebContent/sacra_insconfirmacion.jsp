 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="">
<title> Registro de Confirmaciones</title>
</head>
<body>
<h1>Libro de Confirmacion</h1>
	<form name="frmbconf" method="post" action="Insertbaut">
		<center>
			<table>
				<tr>
					<td>Cedula de Confirmacion N°:
					<td><input type="text" name="cedconfirmacion">
					</td>
				</tr>
				<tr>
					<td>Nombres del Confirmado</td>
					<td><input type="text" name="names"> 
					</td>
				<tr>
					<td>Apellidos del Confirmado</td>
					<td> <input type="text" name="lastname"> 
					</td>
				</tr>
				<tr>
					<td>Nombres del Padre:</td>
					<td><input type="text" name="padre"></td>
				</tr>
				<tr>
					<td>Nombre del Padrino:</td>
					<td><input type="text" name="padrino"></td>
				</tr>
				<tr>
					<td>Nombre del Padrino:</td>
					<td><input type="text" name="padrino" size="50"></td>
				</tr>
				<tr>
					<td>Nombre de Madrina:</td>
					<td><input type="text" name="madrina" size="50"></td>
				</tr>
				<tr>
					<td>Lugar de Nacimiento:</td>
					<td><input type="text" name="lnacimiento"></d>
				</tr>
				<tr>
					<td>Fecha de Nacimiento:</td>
					<td><input type="text" name="fnacimiento"> 
					</td>
				</tr>
				<tr>
					<td>Fecha del Bautizmo:</td>
					<td><input type="text" name="fbautizo">
					</td>
				</tr>
				<tr>
					<td>Lugar e Iglesia de Butizmo:</td>
					<td><input type="text" name="lugar">
					</td>
				</tr>
				<tr>
					<td>Ministro de la Confirmacion:</td>
					<td><input type="text" name="ministroc">
					</td>
				</tr>
				<tr>
					<td>Fecha de Confirmacion:</td>
					<td><input type="text" name="fconfirmacion">
					</td>
				</tr>
				<tr>
					<td>
						<button type="button">INGRESAR</button></td>
				</tr>
			</table>
		</center>
	</form>
</body>
</html>