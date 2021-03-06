<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Intenciones</title>
<link rel="stylesheet" type="text/css" href="./css/StylesFormularios.css">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js"></script>
<script type="text/javascript">
jQuery(function($){
	$.datepicker.regional['es'] = {
		closeText: 'Cerrar',
		prevText: '&#x3c;Ant',
		nextText: 'Sig&#x3e;',
		currentText: 'Hoy',
		monthNames: ['Enero','Febrero','Marzo','Abril','Mayo','Junio',
		'Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
		monthNamesShort: ['Ene','Feb','Mar','Abr','May','Jun',
		'Jul','Ago','Sep','Oct','Nov','Dic'],
		dayNames: ['Domingo','Lunes','Martes','Mi&eacute;rcoles','Jueves','Viernes','S&aacute;bado'],
		dayNamesShort: ['Dom','Lun','Mar','Mi&eacute;','Juv','Vie','S&aacute;b'],
		dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','S&aacute;'],
		weekHeader: 'Sm',
		dateFormat: 'dd/mm/yy',
		firstDay: 1,
		isRTL: false,
		showMonthAfterYear: false,
		yearSuffix: ''};
	$.datepicker.setDefaults($.datepicker.regional['es']);
});    
 
$(document).ready(function() {
   $("#datepicker").datepicker();
 });
</script>
</head>
<body>
	<div id="user">

		<form name="frmuser" method="post" action="intenciones">
			<center>
				<table>
					<tr>
						<td colspan=2>
							<h1 class="mycentre">Agregar Intenciones</h1></td>
					</tr>
					<tr>
						<td>Nombre </td>
						<td><input type="text" name="nombre" maxlength="50" required>
						</td>
					</tr>
					<tr>
						<td>Apellido</td>
						<td><input type="text" name="apellido" maxlength="50"
							required>
						</td>
					</tr>
					<tr>
						<td>Motivo</td>
						<td><input type="text" name="motivo" required>
						</td>
					</tr>
					<tr>
						<td>Detalle</td>
						<td><input type="text" name="detalle" required></td>
					</tr>
					<tr>
						<td>Inicio:</td>
						<td> <input type="text" name="datepicker" id="datepicker" readonly="readonly" size="12" />
						</td>
					</tr>
					<tr>
						<td>Repetir:
						<td><input type="text" name="repetir" maxlength="2" required>
						</td>
						<td><select name="dias">
								<option value="femenino">DIA</option>
								<option value="masculino">SEMANA</option>
						</select></td>
					</tr>
					<tr>
						<td>
							<button type="submit" name="formusuario" value="consultar">GUARDAR</button>
						</td>
						<td>
							<button type="submit" name="formusuario" value="consultar">CANCELAR</button>
						</td>
					</tr>
				</table>
			</center>

		</form>
	</div>

</body>
</html>