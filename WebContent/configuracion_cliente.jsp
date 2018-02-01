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

		$.ajax({

	        type: "GET",
	        url: "http://chd-pc:8080/SAC/rest/consulta/parametros_cliente",
	        data: "{}",
	        contentType: "application/json; charset=utf-8",
	        dataType: "json",
	        success: function (response) {		    			
	        	
	$.each(response, function (index, product) {
		
			// PINTADO DE VALORES
			$("#cliente_nombre").val(response[index].cliente_nombre);
		    $("#cliente_direccion").val(response[index].cliente_direccion);
			$("#cliente_telefono").val(response[index].cliente_telefono);
			$("#cliente_web").val(response[index].cliente_web);
			
	});
	        },
	        error: function (response) {
	       console.log("error");
	        	}
	    	});

		
	}// FIN DE LA FINCION DE INICIO

	//EJECUCION DE LA FUNCION INICIO
	window.onload = inicio;
</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="./css/Styles_Formularios.css">

<title>PARAMETROS DE PARROQUIA</title>
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
    var nombre_horario1;

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
		        url: "http://chd-pc:8080/nuevo/rest/consultas/consultacategoria",
		        data: "{}",
		        contentType: "application/json; charset=utf-8",
		        dataType: "json",
		        success: function (response) {
		        
		        	// LIMPIADO DE ELEMENTOS POR CAMBIO POR SELECCION	
		        	$('#categoria').val('');
		        	$('#horario_dia1').val('');
		        	$('#hora_ini1').val('');
		        	$("#hora_fin1").val("");
		        	$('#horario_dia2').val('');
		        	$('#hora_ini2').val('');
		        	$("#hora_fin2").val("");
				  
		        	
		        	// CARGAMOS ESTE CAMPO INICIALMENTE PARA EN EL CASO DE SOLO TENER UN REGISTRO PUEDA EFECTUARSE LA FUNCION DEL CHANGE
		        	
				    $("<option></option>")
					.attr("value", 0).text('disponibles')
					.appendTo('#categoria');

				    
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
        	//$('#dias').val('');
        	$('#hora_ini1').val('');
        	$("#hora_fin1").val("");
        	$('#dia1').empty(); // elimina los duplicados
        	$('#hora_ini2').val('');
        	$("#hora_fin2").val("");
        	$('#dia2').empty(); // elimina los duplicados
        	
			$.ajax({

		        type: "GET",
		        url: "http://chd-pc:8080/nuevo/rest/consultas/consult_horario_grup2",
		        data: "{}",
		        contentType: "application/json; charset=utf-8",
		        dataType: "json",
		        success: function (response) {
		      var contador=0;
		      var contador2;
		      
		      //registro adicionañ
		      $("<option></option>")
				.attr("value", 0).text('disponibles')
				.appendTo('#dia1');
		      
		      
		$.each(response, function (index, product) {
			if(response[index].categoria_id == idcategoriaInscripcion){
				
				$("<option></option>")
				.attr("value", contador++).text(response[index].horario_dia1)
				.appendTo('#dia1'); 
			}
		});
		        },
		        error: function (response) {
		       console.log("error");
		        	}
		    	});
			});
		});
	
	
	
// FUNCION DE LLAMADO CUANDO SELECCIONE LOS DIAS.
    
	$(document).ready(function(){
		$("#dia1").on('change', function () {
			var ID_option;
			
			capturaNombreHorario = $("#dia1 :selected").text();
			ID_option = $("#hora_ini").val(ID_option);
			
           

			// LIMPIADO DE ELEMENTOS POR CAMBIO POR SELECCION	
        	$("#hora_fin1").val("");
        	$("#hora_fin2").val("");
        	
        	$('#hora_ini1').empty(); // elimina los duplicados
        	$('#hora_ini2').val(""); // elimina los duplicados
        	$('#hora_ini1').empty(); // elimina los duplicados
        	
nombre_horario1 =$("#dia1 :selected").text();
			
			//alert(nombre_horario1);
        	
			$.ajax({

		        type: "GET",
		        url: "http://chd-pc:8080/nuevo/rest/consultas/consult_horario_grup2",
		        data: "{}",
		        contentType: "application/json; charset=utf-8",
		        dataType: "json",
		        success: function (response) {
		        
		        	  //registro adicionañ
				      $("<option></option>")
						.attr("value", 0).text('disponibles')
						.appendTo('#hora_ini1');
		    
		       $.each(response, function (index, product) {
			if(capturaNombreHorario == (response[index].horario_dia1) && response[index].categoria_id == idcategoriaInscripcion){
				
				$("<option></option>")
				.attr("value", response[index].horario_id).text(response[index].hora_ini1)
				.appendTo('#hora_ini1'); 
				
			}
			
 	});
		       //LLENADO EL DIA 2 EN EL HORARIO DISPONIBLE
		     
		       $('#dia2').val(""); // elimina los duplicados
        	$('#dia2').empty(); // elimina los duplicados
        	
		       $.each(response, function (index, product) {
		    	  // alert("response[index].horario_dia1 == nombre_horario1" + response[index].horario_dia1  +  horario_dia1);
		       
					if(response[index].horario_dia1 == nombre_horario1){
						    $("#dia2").val(response[index].horario_dia2);
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
	
		$("#hora_ini1").on('change', function () {
			capturaHorarioInicial = $("#hora_ini1 :selected").text();
			// LIMPIADO DE ELEMENTOS POR CAMBIO POR SELECCION	
        	$("#hora_fin1").val("");
        	$("#hora_ini2").val("");
        	$("#hora_fin2").val("");
        	$("#hora_ini1").val("");
        	$("#hora_ini1").empty(); // elimina los duplicados
        	
        	
        	
			$.ajax({

		        type: "GET",
		        url: "http://chd-pc:8080/nuevo/rest/consultas/consult_horario_grup2",
		        data: "{}",
		        contentType: "application/json; charset=utf-8",
		        dataType: "json",
		        success: function (response) {
	//alert(capturaHorarioInicial);
		        	// ESTE EACH BUSCA EL ID DE LA BASE DE DATOS Y LO ASIGNA A UNA VARIABLE PARA EL REGISTRO.
		        	$("#idhorario").val("");
		        	$.each(response, function (index, product) {
		        		if(capturaNombreHorario == (response[index].horario_dia1) && capturaHorarioInicial == (response[index].hora_ini1)){
		        			capturaIdNombreHorario = response[index].horario_id;
		        			$("#idhorario").val(capturaIdNombreHorario);
		        		}
		        	});
		    			
		        	
		$.each(response, function (index, product) {
			if(capturaNombreHorario == (response[index].horario_dia1) && capturaHorarioInicial == (response[index].hora_ini1)){
				$("<option></option>")
				.attr("value", response[index].horario_id1).text(response[index].hora_ini1)
				.appendTo('#hora_ini1'); 
				$("#hora_fin1").val(response[index].hora_fin1);
				$("#hora_ini2").val(response[index].hora_ini2);
				$("#hora_fin2").val(response[index].hora_fin2);
			
			}

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
$(document).ready(function(){		
	$( ".consultar" ).click(function() {
			//capturaid_grupo = $("#grupo :selected").text();
			// LIMPIADO DE ELEMENTOS POR CAMBIO POR SELECCION	
        	//$("#coord").val("");
        	 
			$.ajax({

		        type: "GET",
		        url: "http://chd-pc:8080/nuevo/rest/consultas/parametros",
		        data: "{}",
		        contentType: "application/json; charset=utf-8",
		        dataType: "json",
		        success: function (response) {		    			
		        	
		$.each(response, function (index, product) {
			alert($("#grupo").val());
			
				// PINTADO DE VALORES
				$("#nombre_parroquia").val(response[index].parroquia_nombre);
			    $("#direccion_parroquia").val(response[index].parroquia_direccion);
				$("#telefono_parroquia").val(response[index].parroquia_telefono);
				$("#ciudad_parroquia").val(response[index].parroquia_ciudad);
				$("#direccion_web_parroquia").val(response[index].parroquia_web);
				
		});
		        },
		        error: function (response) {
		       console.log("error");
		        	}
		    	});
			});
		});		

$(document).ready(function(){
	
	$( ".limpiar" ).click(function() {
		    
				// PINTADO DE VALORES
				$("#cedula").val(" ");
				$("#nombre").val(" ");
			    $("#apellido").val(" ");
				$("#telefono").val(" ");
				$("#edad").val(" ");
				$("#email").val(" ");
				$("#direc").val(" ");
				$("#num_regist").val(" ");
				
				
				// mostrado el sexo correspondiente.
				 $('#sex > option[value='+response[index].sexo+']').attr('selected', 'selected');
		});
	
});

</script>
	

<center>
<br><b></b><b></b><b></b><b></b><b></b>	
    <div style="text-shadow:1px 1px 1px rgba(0,0,0,1);font-weight:normal;color:#FFFFFF;letter-spacing:1pt;word-spacing:12pt;font-size:24px;text-align:center;font-family:palatino linotype, palatino, serif;line-height:2;">SISTEMA ADMINISTRADOR DE CONTENIDOS</div>

<div style="left: 100px; top: 20px; width: 50px; height: 50px; text-align:left"> 
 <a href="menu_setting.jsp"><IMG src="images/icons/home.png"></a>
 </div>
<b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; 
   </b>
   
    <br><b></b><b></b><br>
<div style="text-shadow:1px 1px 1px rgba(0,0,0,1);BACKGROUND-COLOR: #000000;font-weight:normal;color:#ffffff;letter-spacing:1pt;word-spacing:12pt;font-size:20px;text-align:center;font-family:palatino linotype, palatino, serif;line-height:2;">CONFIGURACIÓN: | INFORMACION CLIENTE</div>     
     <b></b><b></b><br><b></b>
     
	
	<form name="ini" method="post" action="update_cliente">
		<center>
			<table>
			    <!-- <tr>
					<td>CODIGO PARROQUIA:</td>
					<td><input type="text" name="codigo_parroquia" id="codigo_parroquia"></td>
				</tr> -->
				<tr>
					<td>CLIENTE:</td>
					<td><input type="text" name="cliente_nombre" id="cliente_nombre" required></td>
				</tr>
				<tr>
					<td>DIRECCIÓN:</td>
					<td><input type="text" name="cliente_direccion" id="cliente_direccion" required></td>
				</tr>
				<tr>
					<td>TELEFONO:</td>
					<td><input type="text" name="cliente_telefono" id="cliente_telefono" required></td>
				</tr>
				<tr>
					<td>DIRECCION WEB:</td>
					<td><input type="text" name="cliente_web" id="cliente_web" required></td>
				</tr>
				
				<tr>
				<center>
			<table id="interno">
				<tr>
					<td><imput  type="submit" name="guardar" id="guardar"
							class="ingresar"></td>
			  </tr>
			</table>
		</center>
				</tr>
				
			</table>
	</center>
		
	</form>
</center>
</body>
</html>