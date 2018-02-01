<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language="javascript" type="text/javascript">
	//FUNCION DENTRO DEL HEAD PARA LA EJECUCION CON EL CONTENIDO INICIAL DE LAPAGINA
	function inicio() {

	$.ajax({

		type : "GET",
		url : "http://localhost:8080/nuevo/rest/consultas/consultcoord",
		data : "{}",
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(response) {

		//$('#state_ref').remove();

		$.each(response, function(index, product) {
			$("<option></option>").attr("value",response[index].id_coord).text(response[index].nomb_grup)
			.appendTo('#grupo');

		});
		},
		error : function(response) {
			console.log("error");
		}
	});
	}// FIN DE LA FINCION DE INICIO

	//EJECUCION DE LA FUNCION INICIO
	window.onload = inicio;
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="./css/Styles_Formularios.css">
<title>Inscripción Joven</title>
</head>
<body>
<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">
</script>
	<script>
	
    //FUNCION DENTRO DEL BODY PARA CAPTURAR EL VALOR DE UN CAMPO DEL COMBOBOX DESPUES DE HABER CARGADO LOS 
    //VALORES CON LA REFERENCIA DE LA PAGINA - USANDO FUNCION CHANGE
    
	$(document).ready(function(){
		var ID_option;
		$("#grupo").on('change', function () {
			ID_option = $("#grupo :selected").text();
			//alert(ID_option);
			//ID_option = ID_option-1;
			$("#coord").val(ID_option);
		
			$.ajax({

		        type: "GET",
		        url: "http://localhost:8080/nuevo/rest/consultas/consultcoord",
		        data: "{}",
		        contentType: "application/json; charset=utf-8",
		        dataType: "json",
		        success: function (response) {

		        	//$('#state_ref').remove();
		        	
		$.each(response, function (index, product) {
            
			if(ID_option == (response[index].nomb_grup)){
			$("#coord").val(response[index].nombre.concat(response[index].apellido));
		    $("#dias").val(response[index].dia);
			$("#hora_ini").val(response[index].hora_ini);
			$("#hora_fin").val(response[index].hora_fin);
			}
		});
	
		        },
		        error: function (response) {
		        console.log("error");
		        	}
		    	}); //FIN AJAX	
		}); // FIN DE FUNCION CHANGE		
		}); // FIN DOCUMENT.READY
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
					<td><input type="date" name="fecha">
					</td>
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
					<td>Grupo</td>
					<td><select name="grupo" id="grupo">
							<option>-select-</option>
					</select>
					</td>

					<td>Nombre Coordinador</td>
					<td><input type="text" name="coord" id="coord"></td>
				</tr>
				<tr>
					<td>Dias</td>
					<td><input type="text" name="dias" id="dias" maxlength="6"></td>
					<td>Hora Inicio</td>
					<td><input name="hora_ini" id="hora_ini" maxlength="6">
					</td>
				</tr>
				<tr>

					<td>Hora Fin</td>
					<td><input name="hora_fin" id="hora_fin" maxlength="6"></td>
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