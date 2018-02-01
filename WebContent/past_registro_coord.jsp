<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registro Coordinador</title>
<link rel="stylesheet" type="text/css"	href="./css/StylesFormularios.css">
</head>
</head>
<body>
	<CENTER>
		<h1>REGISTRO DE COORDINADOR</h1>
	</CENTER>
	<form name="inscoord" method="post" action="Insert_Coordinador">
		<center>
			<table>
				<tr>
					<th COLSPAN="4">Datos Personales</th>
				</tr>
				<tr>
					<td>Fecha</td>
					<td><input type="text" name="fech" maxlength="50"
						size="50">
					</td>
				</tr>
				<tr>
					<td>N° Registro</td>
					<td><input type="text" name="registro" maxlength="50"
						size="50">
					</td>
					<td>Cedula</td>
					<td> <input type="text" id="textocedula" onchange="validarcedula()" name="cedula">
					</td>
				</tr>
				<tr>
					<td>Nombre</td>
					<td><input type="text" name="nombre" maxlength="50" size="50"
						required>
					</td>
					<td>Apellido</td>
					<td><input type="text" name="apellido" maxlength="50" required>
					</td>
				</tr>
				<tr>
					<td>Edad</td>
					<td><input type="text" name="edad" maxlength="2" required>
					</td>
					<td>Sexo:</td>
					<td><select name="sex">
							<option value="femenino">Femenino</option>
							<option value="masculino">Masculino</option>
					</select></td>
				</tr>
				<tr>
					<td>Teléfono:</td>
					<td><input type="text" name="telef" maxlength="10" required>
					</td>
					<td>E-mail:</td>
					<td><input type="text" name="email" required>
					</td>
				</tr>
				<tr>
					<td>Dirección:</td>
					<td><input type="text" name="direc">
					</td>
				</tr>

			</table>
			<br>
			<button type="submit" name="coordinsert" value="ingresar"
				class="ingresar">INGRESAR</button>
		</center>
	</form>
</body>
</html>