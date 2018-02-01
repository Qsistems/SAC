<%@ page languag e="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Matrimonio</title>
</head>
<body>
<CENTER>
		<h1> REGISTRO MATRIMONIAL</h1>
	</CENTER>
	<form name="frmbconf" method="post" action="Insertbaut">
		<center>
			<table>
				<tr>
					<td>Numero: <input type="text" name="numero" size="5"
						maxlength="5"></td>
				</tr>
				<tr>
					<td>Sr: <input type="text" name="sr" size="50"></td>
				<tr>
					<td>con la Srta: <input type="text" name="srta" size="50">
					</td>
				</tr>
				<tr>
					<td>Lugar: <input type="text" name="lugar" size="5"
						maxlength="5">
					</td>
					<td>Año: <input type="text" name="año" size="5">
					</td>
					<td>Tomo: <input type="text" name="tomo" size="5">
					</td>
				</tr>
				<tr>
					<td>Acta: <input type="text" name="acta" size="5">
					</td>
				</tr>
				<tr>
					<td>Ciudad: <input type="text" name="ciudad" size="10">
					</td>
				</tr>
				<tr>
				<td>Dia: <input type="text" name="dia" size="10"></td>
				</tr>
				<tr>
					<td>Mes: <select>
							<option value="enero" selected>ENERO</option>
							<option value="febrero">FEBRERO</option>
							<option value="marzo">MARZO</option>
							<option value="abril">ABRIL</option>
							<option value="mayo">MAYO</option>
							<option value="junio">JUNIO</option>
							<option value="julio">JULIO</option>
							<option value="agosto">AGOSTO</option>
							<option value="septiembre">SEPTIEMBRE</option>
							<option value="octubre">OCTUBRE</option>
							<option value="noviembre">NOVIEMBRE</option>
							<option value="Diciembre">DICIEMBRE</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>Año: <input type="text" name="año" size="10">
					</td>
					<td>El <input type="text" name="el" size="10">
					</td>
					<td>de la arquidiosis de Guayaquil previa las ????? <input
						type="text" name="txtinscr" size="10">
					</td>
				</tr>
				<tr>
					<td>y mas tramites prescritos <input type="text"
						name="madrina"></td>
				</tr>
				<tr>
					<td>por los sagrados ????? presencio y bendijo el matrimonio
						de Sr <input type="text" name="lnacimiento" size="10"></td>
				</tr>
				<tr>
					<td>Hijo legitimo del Sr <input type="text" name="hijol"
						size="50"></td>
				</tr>
				<tr>
					<td>y la Sra <input type="text" name="nombadre" size="50">
					</td>
				</tr>
				<tr>
					<td>Hija legitima del Sr <input type="text" name="hijol"
						size="50">
					</td>
				</tr>
				<tr>
					<td>y la Sra <input type="text" name="nombmadre" size="50">
					</td>
				</tr>
				<tr>
					<td>Fueron Testigos del matrimonio el Sr: <input type="text"
						name="testigos" size="50"></td>
				</tr>
				<tr>
					<td>NOTA MARGINAL: <textarea name="comentarios" rows="5"
							cols="50"></textarea></td>
				</tr>
				<tr>
					<td>LEGITIMINACION DE LOS HIJOS:<textarea name="comentarios"
							rows="5" cols="50"></textarea>
					</td>
				</tr>
			</table>
		</center>
	</form>
</body>
</html>