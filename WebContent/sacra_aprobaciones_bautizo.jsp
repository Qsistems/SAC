<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" href="../css/remove.ico" />
<link rel="stylesheet" type="text/css" href="./css/Styles_Formularios.css">
<link rel="stylesheet" type="text/css" href="">
<title>Registro de Bautizo</title>
</head>
<body>
	<form name="frmcomun" method="post" action="Insertbaut">
		<center>
		<h1>REGISTRO DE INSCRIPCIONES DE BAUTIZOS</h1>
			<table>
				<tr>
					<th COLSPAN="4">Datos Personales</th>
				</tr>
				<tr>
					<td>Estado</td>
					<td><select name="estado">
							<option value="">APROBADO</option>
							<option value="">REPROBADO</option>
					</select>
					</tr>
				<tr>
					<td>Fecha</td>
					<td><input type="date" name="fecha">
					</td>
					<td>N° de Registro:
					<td><input type="text" name="numregist"></td>
				</tr>
				<tr>
					<td>Nombre</td>
					<td><input type="text" name="names"></td>

					<td>Apellido</td>
					<td><input type="text" name="lastname"></td>
				</tr>
				<tr>
					<td>Fecha de Nacimiento</td>
					<td><input type="text" name="fnacimiento"></td>
					<td>Lugar de Nacimiento</td>
					<td><input type="text" name="lnacimiento">
					</d>
				</tr>
				<tr>
					<th COLSPAN="4">Datos del Registro Civil</th>
				</tr>
				<tr>
					<td>Fecha</td>
					<td><input type="text" name="fechR" >
					</td>
					<td>Tomo</td>
					<td><input type="text" name="tomo">
					</td>
				</tr>
				<tr>
					<td>Folio</td>
					<td><input type="text" name="folio">
					</td>
					<td>Acta</td>
					<td><input type="text" name="acta" >
					</td>

				</tr>
				<tr>
					<th COLSPAN="4">Datos de los Padres</th>
				</tr>
				<tr>
					<td>Nombre del Padre</td>
					<td><input type="text" name="padre">
					</td>
					<td>Apellido del Papá</td>
					<td><input type="text" name="padrino">
					</td>
				</tr>
				<tr>
					<td>Nombres del Mamá</td>
					<td><input type="text" name="padre">
					</td>
					<td>Apellido de la Mamá</td>
					<td><input type="text" name="padrino">
					</td>
				</tr>
				<tr>
					<tr><tr>
					<td>Nombre del Padrino</td>
					<td><input type="text" name="padre">
					</td>
					<td>Apellido del Padrino</td>
					<td><input type="text" name="padrino">
					</td>
				</tr>	<tr>
					<td>Nombres del Madrina</td>
					<td><input type="text" name="padre">
					</td>
					<td>Apellido de la Madrina</td>
					<td><input type="text" name="padrino">
					</td>
				</tr>
			</table>
		</center><center>
			<button type="submit" name="ngresar" value="ingresar"
				class="ingresar">INGRESAR</button>
		</center>
	</form>
</body>
</html>