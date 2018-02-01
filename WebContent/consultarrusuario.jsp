<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="">
<title>Registros</title>


</head>

<body>
	<div id="user">

		<form name="frmuser" method="post" action="InsertUser">
			<center>
				<table>
					<tr>
						<td colspan=2>
							<h1 class="mycentre">Registro de usuarios</h1>
						</td>
					</tr>
					<tr>
						<td>Cedula:</td>
						<td><input type="text" name="cedula" maxlength="10" required>
						<td><button type="submit" name="formusuario" value="buscar">BUSCAR</button>
						</td>
					</tr>
					<tr>
						<td>Nombres:</td>
						<td><input type="text" name="nombre" maxlength="50" required>
						</td>
					</tr>
					<tr>
						<td>Apellidos:</td>
						<td><input type="text" name="apellido" maxlength="50"
							required></td>
					</tr>
					<tr>
						<td>Usuario:</td>
						<td><input type="text" name="usuario" required></td>
					</tr>
					<tr>
						<td>Contraseña:</td>
						<td><input type="text" name="contraseña" required>
						</td>
					</tr>
					<tr>
						<td>Edad:</td>
						<td><input type="text" name="edad" maxlength="2" required>
						</td>
					</tr>
					<tr>
						<td>Sexo: <select name="sex">
								<option value="femenino">Femenino</option>
								<option value="masculino">Masculino</option>
						</select>
						</td>
						<td>Estado Civil: <select name="estcivil">
								<option value="soltero">Solter@</option>
								<option value="casado">Casad@</option>
						</select>
						</td>
						<td>Cargo: <select name="cargo">
								<option value="secretaria">Secretaria</option>
								<option value="parroco">Parroco</option>
								<option value="catequista">Catequista</option>
								<option value="voluntario">Voluntario</option>
								<option value="parroco">Parroco</option>
								<option value="parroco">Parroco</option>
						</select></td>
					</tr>
					<tr>
						<td>
							<button type="submit" name="formusuario" value="consultar">CONSULTAR</button>
						</td>
					</tr>
				</table>
			</center>

		</form>
	</div>
</body>
</html>