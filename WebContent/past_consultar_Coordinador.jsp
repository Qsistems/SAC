<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
    			.attr("value", response[index].id_coord).text(response[index].nomb_grup)
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
<link rel="stylesheet" type="text/css" href="./css/Styles_Formularios.css">
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
            
			if(ID_option == (response[index].nomb_grup	)){
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
	<CENTER>
		<h1>REGISTRO DE COORDINADOR</h1>
	</CENTER>
	<form name="inscoord" method="post" action="Insert_Coordinador">
		<center>
			<table>
				<tr>
					<th COLSPAN="4">Datos Personales</th>
				</tr>
				<tr>
					<td>Fecha:</td>
					<td><input type="date" name="fecha"></td>
				</tr>
				<tr>
					<td>N° Registro</td>
					<td><input type="text" name="registro" maxlength="50">
					</td>
				</tr>
				<tr>
					<td>Cedula</td>
					<td><input type="text" id="textocedula"
						onchange="validarcedula()" name="cedula"></td>
				</tr>
				<tr>
					<td>Nombre</td>
					<td><input type="text" name="nombre" maxlength="50" required></td>
				</tr>
				<tr>
					<td>Apellido</td>
					<td><input type="text" name="apellido" maxlength="50" required>
					</td>
				</tr>
				<tr>
					<td>Edad</td>
					<td><input type="text" name="edad" maxlength="2" required>
					</td></tr>
					<tr>
					<td>Sexo:</td>
					<td><select name="sex">
							<option value="femenino">Femenino</option>
							<option value="masculino">Masculino</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>Teléfono:</td>
					<td><input type="text" name="telef" maxlength="10" required>
					</td></tr>
					<tr>
					<td>E-mail:</td>
					<td><input type="text" name="email" required></td>
				</tr>
				<tr>
					<td>Dirección:</td>
					<td><input type="text" name="direc"></td>
				</tr>

			</table>
			<br>
			<button type="submit" name="coordinsert" value="ingresar"
				class="ingresar">INGRESAR</button>
		</center>
	</form>
</body>
</html>