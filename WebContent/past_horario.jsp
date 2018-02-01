<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="./css/Styles_Formularios.css">
<title>Horario</title>
</head>
<body>
	<CENTER>
		<h1>Registro de Horarios</h1>
	</CENTER>
	<form name="insadult" method="post" action="Insert_Horario">
		<center>
			<table>
				<tr>
					<th COLSPAN="4">Datos Adicionales</th>
				</tr>
				<tr>
					<td>Fecha:</td>
					<td><input type="date" name="fecha">
					</td>
				</tr>
				<tr>
					<td>Dias</td>
					<td><input type="text" name="dias" maxlength="50" required>
					</td>
				</tr>
				<tr>
					<td>Hora Inicio</td>
					<td><input type="time" name="hora_ini" maxlength="50" required>
					</td>
				</tr>
				<tr>
					<td>Hora Fin</td>
					<td><input type="time" name="hora_fin" maxlength="50"
						size="50" required></td>
				</tr>
			</table>
			<button type="submit" name="ingresar" value="ingr_horario"
				class="ingresar">INGRESAR</button>
		</center>
	</form>

</body>
</html>