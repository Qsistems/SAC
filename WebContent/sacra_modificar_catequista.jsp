x<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css"
	href="./css/Styles_Formularios.css">
<title>Registro</title>
</head>
<body>
	<div id="user">
		<CENTER>
			<h1>FICHA PERSONAL DEL CATEQUISTA</h1>
		</CENTER>
		<form name="frmuser" method="post" action="InsertUser">
			<center>
				<table>
					<tr>
						<th COLSPAN="4">DATOS DE LA PARROQUIA</th>
					</tr>
					<tr>
						<td>Fecha:</td>
						<td><input type="date" name="fecha">
					</tr>
					</td>
					<tr>
						<td>Vicaría:</td>
						<td><select name="vicaria">
								<option value=""></option>
								<option value=""></option>
						</select></td>
						<td>Parroquia:</td>
						<td><select name="parroq">
								<option value=""></option>
								<option value=""></option>
						</select></td>
					</tr>
					<tr>
						<td>Parroco:</td>
						<td><input type="text" name="parroco" maxlength="50" required>
						</td>

						<td>Direccion:</td>
						<td><input type="text" name="direc" maxlength="50" required>
						</td>
					</tr>
					<tr>
						<td>Teléfono:</td>
						<td><input type="text" name="telf" maxlength="50" required>
						</td>
						<td>E-mail:</td>
						<td><input type="text" name="email" maxlength="50" required>
						</td>
					</tr>
					<tr>
						<th COLSPAN="4">DATOS CATEQUISTA</th>
					</tr>
					<tr>
						<td>N° Registro</td>
						<td><input type="text" name="num_regist" maxlength="50"
							size="10" required></td>
							<td>Cedula:</td>
						<td><input type="text" name="cedula" maxlength="10" required>
						</td>
					</tr>
					<tr>
						<td>Nombre</td>
						<td><input type="text" name="nombre" maxlength="50" required>
						</td>
						<td>Apellido</td>
						<td><input type="text" name="apellido" maxlength="50"
							required></td>
					</tr>
					<tr>
						<td>Fecha de Nacimiento</td>
						<td><input type="text" name="edad" maxlength="2" required>
						</td>
						<td>Lugar de Nacimiento</td>
						<td><select name="sex">
								<option value="femenino">Femenino</option>
								<option value="masculino">Masculino</option>
						</select></td>
					</tr>
					<tr>
						<td>Dirección</td>
						<td><input type="text" name="telefono" maxlength="10"
							required></td>
						<td>Edad</td>
						<td><input type="text" name="email" required>
						</td>
					</tr>
					<tr>
						<td>Ocupación</td>
						<td><input type="text" name="telefono" maxlength="10"
							required></td>
						<td>Dirección de Trabajo</td>
						<td><input type="text" name="email" required>
						</td>
					</tr>
					<tr>
						<th COLSPAN="4"></th>
					</tr>
					<tr>
						<td>Fecha de Bautizo</td>
						<td><input type="date" name="fecha"></td>
						<td>Fecha de Confirmación:</td>
						<td><input type="date" name="fecha"></td>
					</tr>
					<tr>
						<td>Estado Civil:</td>
						<td><select name="estcivil">
								<option value="soltero">Solter@</option>
								<option value="casado">Casado por Igesia</option>
						</select></td>
						<td>Fecha Matrimonio Esclesiástico:</td>
						<td><input type="text" name="fme" maxlength="50" required>
						</td>
					</tr>
					<tr>
						<td>N° de Hijos:</td>
						<td><input type="text" name="hijos" maxlength="50" required>
						</td>
						<td>Fecha En la que Inicio como Catequista:</td>
						<td><input type="text" name="fechaCate" maxlength="50"
							required>
						</td>
					</tr>

					<tr>
						<td>Que le Motivo a ser Catequista:</td>
						<td COLSPAN="3"><input type="text" name="usuario" required></td>
					</tr>
					<tr>
						<td ROWSPAN="5">Recibe Formacion Continua:</td>
						<td COLSPAN="2">A Nivel</td>
						<td>Frecuencia</td>
					<tr>
						<td>Parroquial</td>
						<td><from> <input type="radio" name="gender"
								value="si"> Sí <input type="radio" name="gender"
								value="no"> No </from></td>
						<td><input type="text" name="frecuencia">
					</tr>
					<tr>
						<td>Vicarial</td>
						<td><from> <input type="radio" name="gender"
								value="si"> Sí <input type="radio" name="gender"
								value="no"> No </from></td>
						<td><input type="text" name="frecuencia">
					</tr>
					<tr>
						<td>Diocesano</td>
						<td><from> <input type="radio" name="gender"
								value="si"> Sí <input type="radio" name="gender"
								value="no"> No </from></td>
						<td><input type="text" name="frecuencia">
					</tr>
					<tr>
						<td>Nacional</td>
						<td><from> <input type="radio" name="gender"
								value="si"> Sí <input type="radio" name="gender"
								value="no"> No </from></td>
						<td><input type="text" name="frecuencia">
					</tr>
					<tr>
						<th COLSPAN="4"></th>
					</tr>
					<tr>
						<td>Catequista</td>
						<td COLSPAN="3"><input type="checkbox" name="catequista"
							value="comunion">Primera Comunión <input type="checkbox"
							name="catequista" value="confir">Confirmación <input
							type="checkbox" name="catequista" value="pfamilia">Padres
							de Familía</td>
					</tr>
					<tr>
						<td>Nivel</td>
						<td COLSPAN="3"><input type="checkbox" name="nivel"
							value="primero">Primero <input type="checkbox"
							name="nivel" value="segundo">Segundo <input
							type="checkbox" name="nivel" value="unico">Único</td>
					</tr>
					<tr>
						<td COLSPAN="2">Otras Responsabilidades Parroquiales</td>
						<td><input type="radio" name="respon" value="si"> Sí
							<input type="radio" name="respon" value="no"> No</td>
					</tr>
					<tr>
						<td>Especificar</td>
						<td><input type="text" name="espe" maxlength="50" required>
						</td>

					</tr>
				</table>
				<button type="submit" name="formusuario" value="ingresar">INGRESAR</button>
			</center>

		</form>
	</div>
</body>
</html>