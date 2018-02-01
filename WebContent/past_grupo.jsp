<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<script language="javascript" type="text/javascript">
	//EJECUCION DE LA FUNCION INICIO
	window.onload = inicio;
	//FUNCION DENTRO DEL HEAD PARA LA EJECUCION CON EL CONTENIDO INICIAL DE LAPAGINA
	function inicio() {

		$("#hora_fin").attr("disabled", "disabled");  // deshabilitar elemento textbox
		$("#hora_fin2").attr("disabled", "disabled");  // deshabilitar elemento textbox
		$('#hora_ini2').attr('disabled', 'disabled');
		//$('#id').removeAttr('disabled'); //habilitar combo
		
	$.ajax({

		type : "GET",
		url : "http://localhost:8080/nuevo/rest/consultas/consult_coord_grup",
		data : "{}",
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(response) {

		$.each(response, function(index, product) {
			var cont;
			$("<option></option>").attr("value",response[index].id_coord).text(response[index].nombre)
			.appendTo('#coord');

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
<title>Horario</title>
</head>
<body>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">
</script>
<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">
</script>
	<script>
	//--------------------------------------------------------------------
	//DECLARACION DE VARIABLES GLOBALES DE CAPTURA DE DATOS.
	
	var capturaNombreHorario; // variable que recoge el nombre del horario de curso disponible.
	var capturaIdNombreHorario; // captura la id de la base de datos para el registro.
	var capturaHorarioInicial; //captura el horario inicial seleccionado.
	var idcoordinador; // captura el id de la base de coordinador para registro.
    var idcategoriaInscripcion; // id de categoria de inscripcion.

 //--------------------------------------------------------------------
// CARGADO DE CATEGORIA DE INSCRIPCION
	
	$(document).ready(function(){
		//$('#categoria').clean();
		var clean;
		//$("#categoria").on('click', function () {
		$("#coord").on('change', function () {	
			$('#categoria').empty(); // elimina los duplicados 
			$.ajax({

		        type: "GET",
		        url: "http://localhost:8080/nuevo/rest/consultas/consultacategoria",
		        data: "{}",
		        contentType: "application/json; charset=utf-8",
		        dataType: "json",
		        success: function (response) {
		        
		        	// LIMPIADO DE ELEMENTOS POR CAMBIO POR SELECCION	
		        	$('#categoria').val('');
		        	$('#dias').val('');
		        	$('#hora_ini').val('');
		        	$("#hora_fin").val("");
		        	
		$.each(response, function (index, product) {

				$("<option></option>")
				.attr("value", response[index].cat_inscr_id).text(response[index].cat_inscr_tipo)
				.appendTo('#categoria'); 
				
		});
		        },
		        error: function (response) {
		       console.log("error");
		        	}
		    	});
			});
		});
	
	//--------------------------------------------------------------------------
	// CARGADO DE DISPONIBILIDAD DE HORARIOS
	
	$(document).ready(function(){
		var ID_option;
		
		$("#categoria").on('change', function () {
			//idcoordinador = $("#coord :selected").text();
			idcoordinador = $('#coord').val();
			idcategoriaInscripcion =$("#categoria :selected").val();
			
			// LIMPIADO DE ELEMENTOS POR CAMBIO POR SELECCION	
        	$('#dias').val('');
        	$('#hora_ini').val('');
        	$("#hora_fin").val("");
        	$('#dias').empty(); // elimina los duplicados
			$.ajax({

		        type: "GET",
		        url: "http://localhost:8080/nuevo/rest/consultas/consult_horario_grup2",
		        data: "{}",
		        contentType: "application/json; charset=utf-8",
		        dataType: "json",
		        success: function (response) {
		      var contador;  
		$.each(response, function (index, product) {
			if(response[index].categoria_id == idcategoriaInscripcion){
				
				$("<option></option>")
				.attr("value", contador++).text(response[index].horario_dia)
				.appendTo('#dias'); 
			}	
		});
		        },
		        error: function (response) {
		       console.log("error");
		        	}
		    	});
			});
		});
	
//--------------------------------------------------------------------	
	
// FUNCION DE LLAMADO CUANDO SELECCIONE LOS DIAS.
    
	$(document).ready(function(){
		$("#dias").on('change', function () {
			var ID_option;
			
			capturaNombreHorario = $("#dias :selected").text();
			ID_option = $("#hora_ini").val(ID_option);

			// LIMPIADO DE ELEMENTOS POR CAMBIO POR SELECCION	
        	$("#hora_fin").val("");
        	//$('#hora_ini').empty(); // elimina los duplicados
			$.ajax({

		        type: "GET",
		        url: "http://localhost:8080/nuevo/rest/consultas/consult_horario_grup2",
		        data: "{}",
		        contentType: "application/json; charset=utf-8",
		        dataType: "json",
		        success: function (response) {
		        	//alert(categoria_id);
		       $('hora_ini').empty();
		$.each(response, function (index, product) {
			if(capturaNombreHorario == (response[index].horario_dia) && response[index].categoria_id == idcategoriaInscripcion){
				
				$("<option></option>")
				.attr("value", response[index].horario_id).text(response[index].hora_ini)
				.appendTo('#hora_ini'); 
			}

		});
		        },
		        error: function (response) {
		       console.log("error");
		        	}
		    	});
			});
		});

//--------------------------------------------------------------------
// CUANDO SELECCIONA DIAS

$(document).ready(function(){
	
		$("#hora_ini").on('change', function () {
			capturaHorarioInicial = $("#hora_ini :selected").text();
			// LIMPIADO DE ELEMENTOS POR CAMBIO POR SELECCION	
        	$("#hora_fin").val("");
        	
			$.ajax({

		        type: "GET",
		        url: "http://localhost:8080/nuevo/rest/consultas/consult_horario_grup2",
		        data: "{}",
		        contentType: "application/json; charset=utf-8",
		        dataType: "json",
		        success: function (response) {
	
		        	// ESTE EACH BUSCA EL ID DE LA BASE DE DATOS Y LO ASIGNA A UNA VARIABLE PARA EL REGISTRO.
		        	$.each(response, function (index, product) {
		        		if(capturaNombreHorario == (response[index].horario_dia) && capturaHorarioInicial == (response[index].hora_ini)){
		        			capturaIdNombreHorario = response[index].horario_id;
		        		}
		        	});
		    			
		        	
		$.each(response, function (index, product) {
			if(capturaNombreHorario == (response[index].horario_dia) && capturaHorarioInicial == (response[index].hora_ini)){
				$("<option></option>")
				.attr("value", response[index].horario_id).text(response[index].hora_ini)
				.appendTo('#hora_ini'); 
				$("#hora_fin").val(response[index].hora_fin);
			}

		});
		alert("Sus valores son los siguientes persona_id : "+ idcoordinador + " horario_id : " + capturaIdNombreHorario + " idcategoriaInscripcion " + idcategoriaInscripcion );
		        },
		        error: function (response) {
		       console.log("error");
		        	}
		    	});
			});
		});

//--------------------------------------------------------------------

//--------------------------------------------------------------------
// CUANDO SELECCIONA DIAS

$(document).ready(function(){
	
		$("#horario_add").prop('checked', function () {
			alert("click");
			//$('#hora_ini2').removeAttr('disabled');
			});
		});

//--------------------------------------------------------------------

</script>
	<CENTER>
		<h1>Registro de Grupo</h1>
	</CENTER>
	<form name="insadult" method="post" action="InsertGrupo">
		<center>
			<table>
				<tr>
					<td>Fecha:</td>
					<td><input type="date" name="fecha"></td>
				</tr>
				<tr>
					<td>Nombre Grupo</td>
					<td><input type="text" name="grupo" maxlength="50" required></td>
				</tr>
				<tr>
					<td>N° de Intergrantes</td>
					<td><input type="text" name="integrantes" maxlength="50" required></td>
				</tr>
				<tr>
					<td>Coordinador</td>
					<td><select name="coord" id="coord">
							<option>-select-</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>Categoria</td>
					<td><select name="categoria" id="categoria" >
							<option>-select-</option>
					</select>
					</td>
				</tr>
				
				<tr>
					<td>Dias</td>
					<td><select name="dias" id="dias">
							<option>-select-</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>Hora Inicio</td>
					<td><select name="hora_ini" id="hora_ini">
							<option>-select-</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>Hora Fin</td>
					<td><input name="hora_fin" id="hora_fin">
					</td>
				
				</tr>
				<tr>
				<td>Horario Adicional</td> <td><input type="checkbox" name="horario_add" value="activar"></td>
				</tr>
				
				<td>Hora Inicio 2</td>
					<td><select name="hora_ini2" id="hora_ini2">
							<option>-select-</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>Hora Fin 2</td>
					<td><input name="hora_fin2" id="hora_fin2">
					</td>
				
				</tr>
				
			</table>
			<button type="submit" name="horario_id" value="ingresar"
				class="ingresar">INGRESAR</button>
		</center>
	</form>

</body>
</html>