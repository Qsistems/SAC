<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" href="../css/remove.ico" />
<link rel="stylesheet" type="text/css"
	href="./css/Styles_Formularios.css">
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
					<td><input type="date" name="fecha1"></td>
					<td>Lugar de Nacimiento</td>
					<td><input type="text" name="lnacimiento"></td>
				</tr>
				<tr>
					<th COLSPAN="4">Datos del Registro Civil</th>
				</tr>
				<tr>
					<td>Fecha</td>
					<td><input type="date" name="fecha2">
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
					<td><input type="text" name="acta">
					</td>

				</tr>
				<tr>
					<th COLSPAN="4">Datos de los Padres</th>
				</tr>
				<tr>
					<td>Nombre</td>
					<td><input type="text" name="padre">
					</td>
					<td>Apellido</td>
					<td><input type="text" name="padrino">
					</td>
				</tr>
				<tr>
					<td>Parentesco</td>
					<td><select name="group">
							<option></option>
					</select></td>
				</tr>
				<tr>
					<td>Nombres</td>
					<td><input type="text" name="padre">
					</td>
					<td>Apellido</td>
					<td><input type="text" name="padrino">
					</td>
				</tr>
				<tr>
					<td>Parentesco</td>
					<td><select name="group">
							<option></option>
					</select></td>
				</tr>
				<tr>
					<th COLSPAN="4">Datos de los Padrinos</th>
				</tr>
				<tr>
					<td>Nombre</td>
					<td><input type="text" name="padre">
					</td>
					<td>Apellido</td>
					<td><input type="text" name="padrino">
					</td>
				</tr>
				<tr>
					<td>Parentesco</td>
					<td><select name="group">
							<option></option>
					</select></td>
				</tr>
				<tr>
					<td>Nombre</td>
					<td><input type="text" name="padre">
					</td>
					<td>Apellido</td>
					<td><input type="text" name="padrino">
					</td>
				</tr>
				<tr>
					<td>Parentesco</td>
					<td><select name="group">
							<option></option>
					</select></td>
				</tr>
				<tr>
					<th COLSPAN="4">Datos Adicionales</th>
				</tr>

				<tr>
					<td>Parroquia de Bautizmo</td>
					<td><input type="text" name="Pbautizo">
					</td>
					<td>Fé de Bautizo</td>
					<td><select name="group">
							<option>SI</option>
							<option>NO</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>Catequista</td>
					<td><input type="text" name="coord" id="coord">
					</td>
					<td>Dias</td>
					<td><input type="text" name="dias" id="dias" maxlength="6"></td>
				</tr>
				<tr>		
					<td>Hora Inicio</td>
					<td><input name="hora_ini" id="hora_ini" maxlength="6">
					</td>
					<td>Hora Fin</td>
					<td><input name="hora_fin" id="hora_fin" maxlength="6">
					</td>
				</tr>
			</table>
		</center>
		<center>
			<button type="submit" name="ngresar" value="ingresar"
				class="ingresar">INGRESAR</button>
		</center>
	</form>
</body>
</html>