<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css"
	href="./css/Styles_Formularios.css">
<title>Incripcion de Confirmación</title>
</head>
<body>
	<form name="frmcomun" method="post" action="SacraInscomu">
		<center>
			<h1>Inscripciones de Comunión</h1>
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
					<td>Nivel</td>
					<td><select name="nivel">
							<option value="">I NIVEL</option>
							<option value="">II NIVEL</option>
					</select></td>
				</tr>
				<tr>
					<td>Fecha</td>
					<td><input type="date" name="fecha"></td>
					<td>N° Registro</td>
					<td><input type="text" name="num">
					</td>
				</tr>
				<tr>
					<td>Nombre</td>
					<td><input type="text" name="names">
					</td>
					<td>Apellido</td>
					<td><input type="text" name="lastname">
					</td>
				</tr>
				<tr>
					<td>Fecha de Nacimiento</td>
					<td><input type="text" name="naci">
					</td>
					<td>Edad:</td>
					<td><input type="text" name="edad"></td>
				</tr>
				<tr>
					<td>Direccion</td>
					<td><input type="text" name="direc" />
					</td>
					<td>Telefono Convencional</td>
					<td><input type="text" name="convencional"></td>
				</tr>
				<tr>
					<th COLSPAN="4">Datos de Padres</th>
				</tr>
				<tr>
					<td>Nombre</td>
					<td><input type="text" name="papa"></td>
					<td>Apellido</td>
					<td><input type="text" name="papa"></td>
				</tr>
				<tr>
					<td>Celular</td>
					<td><input type="text" name="num"></td>
					<td>Parentesco</td>
					<td><select name="group">
							<option></option>
					</select>
					</td>
				</tr>
				<tr>
					<td>Nombre</td>
					<td><input type="text" name="mama"></td>
					<td>Apellido</td>
					<td><input type="text" name="mama"></td>
				</tr>
				<tr>
					<td>Celular</td>
					<td><input type="text" name="num"></td>
					<td>Paresntesco</td>
					<td><select name="group">
							<option></option>
					</select>
					</td>

				</tr>
				<tr>
					<th COLSPAN="4">Datos del Representante</th>
				</tr>
				<tr>
					<td>Nombre</td>
					<td><input type="text" name="nombre"></td>
					<td>Apellido</td>
					<td><input type="text" name="apellido"></td>
				</tr>
				<tr>
					<td>Celular</td>
					<td><input type="text" name="celu"></td>
					<td>Paresntesco</td>
					<td><select name="group">
							<option></option>
					</select>
					</td>
				</tr>
				<tr>
					<th COLSPAN="4">Datos Adicionales</th>
				</tr>

				<tr>
					<td>Parroquia que fue Bautizmo</td>
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
					<td>Grupo</td>
					<td><select name="grupo" id="grupo">
							<option>-select-</option>
					</select></td>

					<td>Nombre Coordinador</td>
					<td><input type="text" name="coord" id="coord">
					</td>
				</tr>
				<tr>
					<td>Dias</td>
					<td><input type="text" name="dias" id="dias" maxlength="6">
					</td>
					<td>Hora Inicio</td>
					<td><input name="hora_ini" id="hora_ini" maxlength="6">
					</td>
				</tr>
				<tr>

					<td>Hora Fin</td>
					<td><input name="hora_fin" id="hora_fin" maxlength="6">
					</td>
				</tr>
				<tr>
					<td>Cancelado</td>
					<td><input name="si" type="checkbox" checked="checked" />Si <input
						name="no" type="checkbox" />No</td>
				</tr>
			</table>
			<button type="button">INGRESAR</button>
			</td>
		</center>
	</form>
</body>

</html>