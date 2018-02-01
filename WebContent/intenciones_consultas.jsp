<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" type="text/css"href="./css/stylestablaconsulta.css">
<title></title>
</head>
<body>
<h1>CONSULTA DE INSCRIPCIONES</h1>

	<table>
		<tr>
			<td>Desde</td>
			<td><input type="date" name="fecha"></td>
			<td>Hasta</td>
			<td><input type="date" name="fecha"></td>
			<td>Tipo de Inscripción</td>
			<td><select name="inscrip" id="inscrip">
							<option>Pastoral Niños</option>
							<option>Pastoral Jovenes</option>
							<option>Pastoral Adultos</option>
					</select>
					</td>
		</tr>
	</table>
	<br><br><br><br>
	<center class="CSSTableGenerator">
		<table>
			<tr>
				<td>N°</td>
				<td>FECHA</td>
				<td>NOMBRE Y APELLIDOS</td>
			</tr>
		
		</table>
	</center>
</body>
</html>