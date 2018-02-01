<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="modelo.Qp_calificador"%>

<html>
<head>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script language="javascript" type="text/javascript" >


	//EJECUCION DE LA FUNCION INICIO
	//window.onload = inicio;
	//FUNCION DENTRO DEL HEAD PARA LA EJECUCION CON EL CONTENIDO INICIAL DE LAPAGINA
	function start(){
		
		//$("#represnt1").checked(true);
		//$("#represnt1").selected(true);
		//$('.represnt1').attr('checked', true);
		//$('#represnt1').checked = true;
		
		// $('#represnt1').click(function() {
		 //       if (!$(this).is(':checked')) {
		  //          return alert("Are you sure?");
		   //     }
		    //});
//		$("#represnt1").attr('checked', true); // Deprecated
//$("#represnt1").prop('checked', true);

		$.ajax({
		type : "GET",
		url : "http://localhost:8080/nuevo/rest/consultas/consult_catequista_grup",
		data : "{}",
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(response) {

		$.each(response, function(index, product) {
			var cont;
			$("<option></option>").attr("value",response[index].id_coord).text(response[index].nombre)
			.appendTo('#catequist');

		});
		},
		error : function(response) {
			console.log("error");
		}
	});
	}// FIN DE LA FINCION DE INICIO

	//EJECUCION DE LA FUNCION INICIO
	window.onload = start;
	
///VALIDA SOLO EL INGRESO DE LETRAS 
	function validar(e) { // 1
		tecla = (document.all) ? e.keyCode : e.which; // 2
		if (tecla==8) return true; // 3
		patron =/[A-Za-zñÑ]/;/; // 4
		te = String.fromCharCode(tecla); // 5
		return patron.test(te); // 6
		}
//VALIDA EL INGRESO SOLO DE NUMEROS 		
	function ValidaSoloNumeros() {
		 if ((event.keyCode < 48) || (event.keyCode > 57)) 
		  event.returnValue = false;
		}
//VALIDA QUE SE INGRESE UN EMAIL CORRECTP
	function validarEmail(valor) {
		if (/^w+([.-]?w+)*@w+([.-]?w+)*(.w{2,3})+$/.test(valor)) {
			alert("La dirección de email " + valor + " es correcta.");
			return (true);
		} else {
			alert("La dirección de email es incorrecta.");
			return (false);
		}
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="./css/StylesFormularios.css">
<title>Registro de Comuniones</title>
</head>
<body>
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

	
 	//------------------------------------------------------------------------------
 
$(document).ready(function(){  
	  
    $("#represnt1").click(function() {  
        if($("#represnt1").is(':checked')) {  
            alert("Está activado");  
           // $ ( "represnt2" ). attr ( "disabled" ,  true ); 
           // $ ( "represnt2" ). Prop ( "disabled" ,  false );
            $("#represnt2 :checkbox").attr('checked', true);
            
           
            
            $("#nomb_repre").attr("disabled", "disabled");  // deshabilitar elemento textbox
    		$("#ape_repre").attr("disabled", "disabled");  // deshabilitar elemento textbox
    		$('#parent').attr('disabled', 'disabled');
    		
    		
        } else {  
        	alert("Está desactivado"); 
        	//$ ( "represnt2" ). attr ( "disabled" ,  false ); 
        	$ ( "represnt2" ). Prop ( "disabled" ,  false );
        	$("#represnt2 :checkbox").attr('checked', false);
        	
        	$("#nomb_repre").attr("disabled", "enable");  // deshabilitar elemento textbox
    		$("#ape_repre").attr("disabled", "enable");  // deshabilitar elemento textbox
    		$('#parent').attr('disabled', 'enable');
    		
        }  
    });  
  
});  
		
    //--------------------------------------------------------------------------
$(document).ready(function(){
		var ID_option;
		
		$("#catequist").on('change', function () {
			//idcoordinador = $("#coord :selected").text();
			idcatequista = $("#catequist :selected").val();
			//alert(idcatequista);
			// LIMPIADO DE ELEMENTOS POR CAMBIO POR SELECCION	
        	//$('#dias').val('');
        	$("#hora_fin").val("");
        	$('#dias').empty(); // elimina los duplicados
        	 $('hora_ini').empty();
			$.ajax({

		        type: "GET",
		        url: "http://localhost:8080/nuevo/rest/consultas/consult_horario_cateq",
		        data: "{}",
		        contentType: "application/json; charset=utf-8",
		        dataType: "json",
		        success: function (response) {
		      
		        	// CARGAMOS ESTE CAMPO INICIALMENTE PARA EN EL CASO DE SOLO TENER UN REGISTRO PUEDA EFECTUARSE LA FUNCION DEL CHANGE
		        	$("<option></option>")
					.attr("value", 0).text('disponibles')
					.appendTo('#dias');
		        	
		$.each(response, function (index, product) {
			
			
			
			if(response[index].persona_id==idcatequista){
				
				$("<option></option>")
				.attr("value", response[index].horario_id).text(response[index].horario_dia)
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
			capturaNombreHorario = $("#dias :selected").val();
			//alert(capturaNombreHorario);
			ID_option = $("#hora_ini").val(ID_option);

			// LIMPIADO DE ELEMENTOS POR CAMBIO POR SELECCION	
        	$("#hora_fin").val("");
        	//$("#hora_ini").val("");
        	$("#hora_ini").empty();
        	//$('#hora_ini').empty(); // elimina los duplicados
			$.ajax({

		        type: "GET",
		        url: "http://localhost:8080/nuevo/rest/consultas/consult_horario_cateq",
		        data: "{}",
		        contentType: "application/json; charset=utf-8",
		        dataType: "json",
		        success: function (response) {
		        	//alert(categoria_id);
		       $('hora_ini').empty();
		       
		    // CARGAMOS ESTE CAMPO INICIALMENTE PARA EN EL CASO DE SOLO TENER UN REGISTRO PUEDA EFECTUARSE LA FUNCION DEL CHANGE
	        	$("<option></option>")
				.attr("value", 0).text('disponibles')
				.appendTo('#hora_ini');   
		       
		$.each(response, function (index, product) {
				if(capturaNombreHorario ==  response[index].horario_id) {
				$("<option></option>")
				.attr("value", response[index].horario_id).text(response[index].hora_ini)
				.appendTo('#hora_ini'); 
				}//fin if
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
	        url: "http://localhost:8080/nuevo/rest/consultas/consult_horario_cateq",
		        data: "{}",
		        contentType: "application/json; charset=utf-8",
		        dataType: "json",
		        success: function (response) {
 	
		$.each(response, function (index, product) {
			
				$("<option></option>")
				.attr("value", response[index].horario_id).text(response[index].hora_ini)
				.appendTo('#hora_ini'); 
				$("#hora_fin").val(response[index].hora_fin);
			

		});
		//alert("Sus valores son los siguientes persona_id : "+ idcoordinador + " horario_id : " + capturaIdNombreHorario + " idcategoriaInscripcion " + idcategoriaInscripcion );
		        },
		        error: function (response) {
		       console.log("error");
		        	}
		    	});
			});
		});

//--------------------------------------------------------------------


</script>

	<form name="frmcomun" method="post"
		action="Insert_Inscripcion_comunion">
		<center>
			<h1>Inscripciones de Comunión</h1>
			<table>
				<tr>
					<th COLSPAN="4">Datos Personales</th>
				</tr>
				<tr>
					<td>Nivel</td>
					<td><select name="nivel">
							<option value="1">I NIVEL</option>
							<option value="2">II NIVEL</option>
					</select></td>
				</tr>
				<tr>
					<td>Fecha</td>
					<td><input type="date" name="fecha"></td>
					<td>N° Registro</td>
					<td><input type="text" name="num_regist" onkeypress="ValidaSoloNumeros()">
					</td>
				</tr>
				<tr>
					<td>Nombre</td>
					<td><input type="text" name="nombre" onkeypress="return validar(event)">
					</td>
					<td>Apellido</td>
					<td><input type="text" name="apellido" onkeypress="return validar(event)">
					</td>
				</tr>
				<tr>
					<td>Fecha de Nacimiento</td>
					<td><input type="date" name="fech_naci">
					</td>
					<td>Edad:</td>
					<td><input type="text" name="edad" onkeypress="ValidaSoloNumeros()"></td>
				</tr>
				<tr>
					<td>Dirección</td>
					<td><input type="text" name="direc"></td>
					</td>
					<td>Convencional/Celular</td>
					<td><input type="text" name="telefono" onkeypress="ValidaSoloNumeros()"></td>
				</tr>
				<tr>
					<td>Sexo</td>
					<td><select name="sex">
							<option value="femenino">Femenino</option>
							<option value="masculino">Masculino</option>
					</select></td>
				</tr>
				<tr>
					<th COLSPAN="4">Datos de Padres</th>
				</tr>
				<tr>
					<td>Nombre</td>
					<td><input type="text" name="nombre1" onkeypress="return validar(event)"></td>
					<td>Apellido</td>
					<td><input type="text" name="apellido1" onkeypress="return validar(event)"></td>
				</tr>
				<tr>
					<td>Celular</td>
					<td><input type="text" name="telefono1" onkeypress="ValidaSoloNumeros()"></td>
					<td>Parentesco</td>
					<td><select name="parent1">
							<option value="4">Madre</option>
							<option value="5">Padre</option>
					</select>
					Representante<input type="checkbox" name="represnt1" id= "represnt1"></td>
				</tr>
				<tr>
					<td>Nombre</td>
					<td><input type="text" name="nombre2" onkeypress="return validar(event)"></td>
					<td>Apellido</td>
					<td><input type="text" name="apellido2" onkeypress="return validar(event)"></td>
				</tr>
				<tr>
					<td>Celular</td>
					<td><input type="text" name="telefono2" onkeypress="ValidaSoloNumeros()"></td>
					<td>Paresntesco</td>
					<td><select name="parent2">
							<option value="4">Madre</option>
							<option value="5">Padre</option>
					</select>
					Representante<input type="checkbox" name="represnt2" id= "represnt2"></td>
				</tr>
				<tr>
					<th COLSPAN="4">Datos Representante</th>
				</tr>
				<tr>
					<td>Nombre</td>
					<td><input type="text" name="nomb_repre" id="nomb_repre" onkeypress="return validar(event)"></td>
					<td>Apellido</td>
					<td><input type="text" name="ape_repre" id="ape_repre" onkeypress="return validar(event)"></td>
				</tr>
				<tr>
					<td>Parentesco</td>
					<td><select name="parent" id="parent">
							<option value="4">Madre</option>
							<option value="5">Padre</option>
							<option value="6">Hermano</option>
							<option value="7">abuela</option>
							<option value="8">Ti@</option>
							<option value="9">Otros</option>
					</select></td>
				</tr>
				<tr>
					<th COLSPAN="4">Datos Adicionales</th>
				</tr>
				<tr>
					<td>Parroquia que fue Bautizmo</td>
					<td><input type="text" name="Pbautizo" onkeypress="return validar(event)"></td>
					<td>Fé de Bautizo</td>
					<td><select name="febaut">
							<option value="si">SI</option>
							<option value="no">NO</option>
					</select></td>
				</tr>
				<tr>
					<td>Catequista</td>
					<td><select name="catequist" id="catequist">
							<option>-select-</option>
					</select></td>
					<td>Dias</td>
					<td><select name="dias" id="dias">
							<option>-select-</option>
					</select></td>
				</tr>
				<tr>
					<td>Hora Inicio</td>
					<td><select name="hora_ini" id="hora_ini">
							<option>-select-</option>
					</select></td>
					<td>Hora Fin</td>
					<td><input name="hora_fin" id="hora_fin">
					</td>
				</tr>
				<tr>
					<td>Cancelado</td>
					<td><select name="pago">
							<option value="cancelado">CANCELADO</option>
							<option value="pendiente">PENDIENTE</option>
					</select></td>
				</tr>
			</table>
		</center>
		<button type="submit" name="ngresar" value="ingresar" class="ingresar">INGRESAR</button>
	</form>
</body>
</html>