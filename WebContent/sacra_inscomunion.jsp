<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css"	href="./css/StylesFormularios.css">
<title>Registro de Comuniones</title>
</head>
<body>
	<h1>Inscripciones de Comunión</h1>
	<form name="frmcomun" method="post" action="SacraInscomu">
		<center>
			<table>
				<tr>
					<th COLSPAN="4">Datos Personales</th>
				</tr>
				<tr>
					<td>Nivel</td>
					<td><select name="nivel">
							<option value="">I NIVEL</option>
							<option value="">II NIVEL</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>Fecha</td>
					<td><input type="text" name="fecha" size="50"></td>
					<td>N° Registro</td>
					<td><input type="text" name="num"></td>
				</tr>
				<tr>
					<td>Nombre</td>
					<td><input type="text" name="names" size="50"></td>
					<td>Apellido</td>
					<td><input type="text" name="lastname" size="50"></td>
				</tr>
				<tr>
					<td>Fecha de Nacimiento</td>
					<td><input type="text" name="naci" size="50"></td>
					<td>Edad:</td>
					<td><input type="text" name="edad" size="50">
					</td>
				</tr>
				<tr>
					<td>Direccion</td>
					<td><input type="text" name="direc" size="20" /></td>
					<td>Telefono Convencional</td>
					<td><input type="text" name="convencional" size="20">
					</td>
				</tr>
				<tr>
					<th COLSPAN="4">Datos de Padres</th>
				</tr>
				<tr>
					<td>Nombre</td>
					<td><input type="text" name="papa" size="50">
					</td>
					<td>Apellido</td>
					<td><input type="text" name="papa" size="50">
					</td>
				</tr>
				<tr>
					<td>Celular</td>
					<td><input type="text" name="num" size="50">
					</td>
					<td>Parentesco</td>
					<td><select name="group">
							<option></option>
					</select></td>
				</tr>
				<tr>
					<td>Nombre</td>
					<td><input type="text" name="mama" size="50">
					</td>
					<td>Apellido</td>
					<td><input type="text" name="mama" size="50">
					</td>
				</tr>
				<tr>
					<td>Celular</td>
					<td><input type="text" name="num" size="50">
					</td>
					<td>Paresntesco</td>
					<td><select name="group">
							<option></option>
					</select></td>

				</tr>
				<tr>
					<th COLSPAN="4">Datos del Representante</th>
				</tr>
				<tr>
					<td>Nombre</td>
					<td><input type="text" name="nombre" size="50">
					</td>
					<td>Apellido</td>
					<td><input type="text" name="apellido" size="50">
					</td>
				</tr>
				<tr>
					<td>Celular</td>
					<td><input type="text" name="celu" size="10">
					</td>
					<td>Paresntesco</td>
					<td><select name="group">
							<option></option>
					</select></td>
				</tr>
				<tr>
					<th COLSPAN="4">Datos Adicionales</th>
				</tr>

				<tr>
					<td>Parroquia que fue Bautizmo</td>
					<td><input type="text" name="Pbautizo" size="50"></td>
					<td>Fé de Bautizo</td>
					<td><select name="group">
							<option>SI</option>
							<option>NO</option>
					</select></td>
				<tr>
					<td>Nombre del Grupo</td>
					<td><select name="grupo">
							<option value=""></option>
							<option value=""></option>
					</select></td>
					<td>Nombre del Catequista</td>
					<td><select name="grupo">
							<option value=""></option>
							<option value=""></option>
					</select></td>
				</tr>
				<tr>
					<td>Cancelado</td>
					<td><input name="si" type="checkbox" checked="checked" />Si <input
						name="no" type="checkbox" />No</td>
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