<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="modelo.Qp_calificador"%> 

<html>
<head>

<script language="javascript" type="text/javascript">
   
//FUNCION DENTRO DEL HEAD PARA LA EJECUCION CON EL CONTENIDO INICIAL DE LAPAGINA
function inicio() {
     
    	$.ajax({

    		        type: "GET",
    		        url: "http://localhost:8080/nuevo/rest/consultas/consultcoord",
    		        data: "{}",
    		        contentType: "application/json; charset=utf-8",
    		        dataType: "json",
    		        success: function (response) {

    		        	//$('#state_ref').remove();
    		        	
    		$.each(response, function (index, product) {

    			$("<option></option>")
    			.attr("value", response[index].id_coord).text(response[index].nombre)
    			.appendTo('#state_ref'); 
    			
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
<link rel="stylesheet" type="text/css" href="">
<title>Registros</title>

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
		$("#state_ref").on('change', function () {
			ID_option = $("#state_ref :selected").text();
			//alert(ID_option);
			//ID_option = ID_option-1;
			
			
			$("#nombre_quemado").val(ID_option);
		
			$.ajax({

		        type: "GET",
		        url: "http://localhost:8080/nuevo/rest/consultas/consultcoord",
		        data: "{}",
		        contentType: "application/json; charset=utf-8",
		        dataType: "json",
		        success: function (response) {

		        	//$('#state_ref').remove();
		        	
		$.each(response, function (index, product) {
            
			if(ID_option == (response[index].nombre)){
		    $("#nombre").val(response[index].nombre);
			$("#apellido").val(response[index].apellido);
			$("#curso").val(response[index].nomb_grup);
			$("#horario").val(response[index].dia);
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
<!-- 	<div class="span2 clear">
		<select name="country_id" id="country_id">
			<option>-select-</option>


			<option id="blabbb">america</option>
			<option id="blabbb">UK</option>
			<option id="blabbb">Africa</option>

		</select>
	</div>
 -->
	<div class="span2 clear">
		<select name="state_ref" id="state_ref">
			<option></option>
		</select>
	</div>
	
	<div class="span2 clear">
		
	<p>	<input type="text" name="nombre_quemado" id="nombre_quemado"> </p>
	<p>	<input type="text" name="segundoselect" id="segundoselect"> </p>
	<p>	<input type="text" name="nombre" id="nombre"> </p>
	<p>	<input type="text" name="apellido" id="apellido"> </p>
	<p>	<input type="text" name="curso" id="curso">  </p>
	<p>	<input type="text" name="horario" id="horario"> </p>
		
	</div>
	
	
</body>
</html>