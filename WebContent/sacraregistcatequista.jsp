x<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="">
<title>Registro</title>
</head>
<body>
	<div id="user">
<CENTER>
		<h1> DATOS DEL CATEQUISTA</h1>
	</CENTER>
		<form name="frmuser" method="post" action="InsertUser">
			<center>
				<table>
					<tr>
						<td colspan=2>
						<td>DATOS DE LA PARROQUIA</td>
					</tr>
					<tr>
						<td>Vicaría:</td>
						<td><select name="vicaria">
								<option value=""></option>
								<option value=""></option>
						</select>
						</td>
						<td>Parroquia:</td>
						<td><select name="parroq">
								<option value=""></option>
								<option value=""></option>
						</select>
						</td>
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
						<td>Fecha de Bautizo:</td>
						<td><input type="text" name="apellido" maxlength="50"
							required>
						</td>
						<td>Fecha de Confirmación:</td>
						<td><input type="text" name="fechnac" maxlength="50" required>
						</td>
					</tr>
					<tr>
						<td>Estado Civil:</td>
						<td><select name="estcivil">
								<option value="soltero">Solter@</option>
								<option value="casado">Casado por Igesia</option>
						</select>
						</td>
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
							required></td>
					</tr>

					<tr>
						<td>Que le Motivo a ser Catequista:</td>
						<td><input type="text" name="usuario" required>
						</td>
					</tr>
					<tr>
						<td ROWSPAN="5">Recibe Formacion Continua:</td>
						<td COLSPAN="2">A Nivel</td>
						<td>Frecuencia</td>
					<tr>
						<td>Parroquial</td>
						<td><from> <input type="radio" name="gender"
								value="si"> Sí <input type="radio" name="gender"
								value="no"> No </from>
						</td>
						<td><input type="text" name="frecuencia">
					</tr>
					<tr>
						<td>Vicarial</td>
						<td><from> <input type="radio" name="gender"
								value="si"> Sí <input type="radio" name="gender"
								value="no"> No </from>
						</td>
						<td><input type="text" name="frecuencia">
					</tr>
					<tr>
						<td>Diocesano</td>
						<td><from> <input type="radio" name="gender"
								value="si"> Sí <input type="radio" name="gender"
								value="no"> No </from>
						</td>
						<td><input type="text" name="frecuencia">
					</tr>
					<tr>
						<td>Nacional</td>
						<td><from> <input type="radio" name="gender"
								value="si"> Sí <input type="radio" name="gender"
								value="no"> No </from>
						</td>
						<td><input type="text" name="frecuencia">
					</tr>
					<tr>
						<td>Catequista</td>
						<td><from> <input type="checkbox" name="catequista"
								value="comunion">Primera Comunión <input type="checkbox"
								name="catequista" value="confir">Confirmación <input
								type="checkbox" name="catequista" value="pfamilia">Padres
							de Familía
							</form>
					</tr>
					<tr>
						<td>Nivel</td>
						<td><from> <input type="checkbox" name="nivel"
								value="Bike">Primero <input type="checkbox" name="nivel"
								value="Car">Segundo <input type="checkbox" name="nivel"
								value="Car">Único
							</form>
					</tr>
					<tr>
						<td>Otras Responsabilidades Parroquiales</td>

						<td><from> <input type="radio" name="respon"
								value="si"> Sí <input type="radio" name="respon"
								value="no"> No </from>
						</td>
						<td>Especificar</td>
						<td><input type="text" name="espe" maxlength="50" required>
						</td>
					</tr>


					<tr>
						<td>
							<button type="submit" name="formusuario" value="ingresar">INGRESAR</button>
						</td>
					</tr>
				</table>
			</center>

		</form>
	</div>
</body>
</html>