<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Intenciones</title>
<link rel="stylesheet" type="text/css"
	href="./css/Styles_Formularios.css">
</head>
<body>
	<div id="user">

		<form name="frmuser" method="post" action="Insert_intenciones">
			<center>
				<table>
					<tr>
						<td colspan=2>
							<h1 class="mycentre">Registrio de Intenciones</h1>
						</td>
					</tr>
					<tr>
						<td>Fecha:</td>
						<td><input type="date" name="fecha"></td>
					</tr>
					<tr>
						<td>Nombre</td>
						<td><input type="text" name="nombre" maxlength="50" required>
						</td>
					</tr>
					<tr>
						<td>Apellido</td>
						<td><input type="text" name="apellido" maxlength="50"
							required></td>
					</tr>
					<tr>
						<td>Motivo</td>
						<td><input type="text" name="motivo" required></td>
					</tr>
					<tr>
						<td>Detalle</td>
						<td><input type="text" name="detalle" required>
						</td>
					</tr>
					<tr>
						<td>Inicio</td>
						<td><input type="date" name="inicio"></td>
					</tr>
					<tr>
						<td>Repetir:
						<td><input type="text" name="repetir" maxlength="2" required>
						</td>
					</tr>
					<tr>
						<td><select name="dias">
								<option value="femenino">DIA</option>
								<option value="masculino">SEMANA</option>
						</select>
						</td>
					</tr>
					<tr>
						<td>
							<button type="submit" name="formusuario" value="consultar">GUARDAR</button>
						</td>
					</tr>
				</table>
			</center>

		</form>
	</div>

</body>
</html>