<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css"
	href="./css/StylesFormularios.css">
<title>Inscripción Niños</title>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js"></script>
<script type="text/javascript">
	jQuery(function($) {
		$.datepicker.regional['es'] = {
			closeText : 'Cerrar',
			prevText : '&#x3c;Ant',
			nextText : 'Sig&#x3e;',
			currentText : 'Hoy',
			monthNames : [ 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo',
					'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre',
					'Noviembre', 'Diciembre' ],
			monthNamesShort : [ 'Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun',
					'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic' ],
			dayNames : [ 'Domingo', 'Lunes', 'Martes', 'Mi&eacute;rcoles',
					'Jueves', 'Viernes', 'S&aacute;bado' ],
			dayNamesShort : [ 'Dom', 'Lun', 'Mar', 'Mi&eacute;', 'Juv', 'Vie',
					'S&aacute;b' ],
			dayNamesMin : [ 'Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'S&aacute;' ],
			weekHeader : 'Sm',
			dateFormat : 'dd/mm/yy',
			firstDay : 1,
			isRTL : false,
			showMonthAfterYear : false,
			yearSuffix : ''
		};
		$.datepicker.setDefaults($.datepicker.regional['es']);
	});

	$(document).ready(function() {
		$("#datepicker").datepicker({
			changeMonth : true
		});
	});
</script>
</head>
<body>
<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">
</script>
	<script>
$(document).ready(function(){
	
//llena el select de Grupo
$("#country_id").change(function() {
	$.ajax({

        type: "GET",
        url: "http://localhost:8080/nuevo/rest/consultas/consultcoord",
        data: "{}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
//alert(response[3].Cedula);


//var productt = response.Cedula;
$.each(response, function (index, product) {

	$("<option></option>")
	.attr("value", response[index].id_coord).text(response[index].nombre+" "+response[index].apellido)
	.appendTo('#grup');
	
    //$("#theList").append("<li><img src='pic/" + product.img1 + "'> <br /> " + product.name + " <br />" + product.descr + "</li>");
});


                          },
        error: function (response) {
       Alert("error");
        	}
    	});
	}); 
	
//llena el select de Coordinador
$("#grup").change(function() {
	$.ajax({

        type: "GET",
        url: "http://localhost:8080/nuevo/rest/consultas/consultcoord",
        data: "{}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
//alert(response[3].Cedula);


//var productt = response.Cedula;
$.each(response, function (index, product) {

	$("<option></option>")
	.attr("value", response[index].id_coord).text(response[index].nombre+" "+response[index].apellido)
	.appendTo('#coord');
	
    //$("#theList").append("<li><img src='pic/" + product.img1 + "'> <br /> " + product.name + " <br />" + product.descr + "</li>");
});


                          },
        error: function (response) {
       Alert("error");
        	}
    	});
	}); 
//llena el select de Horario
$("#grup").change(function() {
	$.ajax({

        type: "GET",
        url: "http://localhost:8080/nuevo/rest/consultas/consultcoord",
        data: "{}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
//alert(response[3].Cedula);


//var productt = response.Cedula;
$.each(response, function (index, product) {

	$("<option></option>")
	.attr("value", response[index].id_coord).text(response[index].nombre+" "+response[index].apellido)
	.appendTo('#horario');
	
    //$("#theList").append("<li><img src='pic/" + product.img1 + "'> <br /> " + product.name + " <br />" + product.descr + "</li>");
});

                          },
        error: function (response) {
       Alert("error");
        	}
    	});
	});
});
</script>

	<CENTER>
		<h1>REGISTRO DE PASTORAL PARA NIÑOS</h1>
	</CENTER>
	<form name="insniños" method="post" action="InsertInscNinos">
		<center>
			<table>
				<tr>
					<th COLSPAN="4">Datos Personales</th>
				</tr>
				<tr>
					<td>Fecha</td>
					<td><input type="text" name="datepicker" id="datepicker"
						readonly="readonly" size="10" /></td>
					<td>N° Registro</td>
					<td><input type="text" name="num_regist" maxlength="50"
						size="10" required></td>
				</tr>
				<tr>
					<td>Nombre</td>
					<td><input type="text" name="nombre" maxlength="50"
						"
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
					<td>Sexo</td>
					<td><select name="sex">
							<option value="femenino">Femenino</option>
							<option value="masculino">Masculino</option>
					</select></td>
				</tr>
				<tr>
					<td>Teléfono</td>
					<td><input type="text" name="telefono" maxlength="10" required>
					</td>
					<td>E-mail</td>
					<td><input type="text" name="email" required>
					</td>
				</tr>
				<tr>
					<td>Dirección:</td>
					<td><input type="text" name="direc">
					</td>
				</tr>
				<tr>

					<th COLSPAN="4">Datos Adicionales</th>
				</tr>

				<tr>
					<td>Elija la Opcion</td>
					<td><select name="country_id" id="country_id">
							<option>-select-</option>
							<option id="blabbb">GRUPO</option>
					</select></td>


					<td>Nombre Grupo</td>
					<td><select name="state_ref" id="grup">
							<option></option>
					</select>
					</td>
				</tr>
				<tr>
					<td>Coordinador:</td>
					<td><select name="state_ref1" id="coord">
							<option></option>
					</select></td>
					<td>Horario</td>
					<td><select name="state_ref" id="horario">
							<option></option>
					</select></td>

				</tr>
			</table>
			<br>

		</center>
		<center>
			<button type="submit" name="ngresar" value="ingresar"
				class="ingresar">INGRESAR</button>
		</center>
	</form>
</body>
</html>