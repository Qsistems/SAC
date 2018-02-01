<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="servletSac.uploadContenidos"%> 

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="./css/Styles_Formularios.css">
<link rel="stylesheet" type="text/css" href="./css/stylestablaconsulta.css">
<link rel="stylesheet" type="text/css" href="./css/stylestablaconsulta2.css">
<link rel="stylesheet" type="text/css" href="./css/stylestablaconsulta3.css">

<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">
</script>

<script 
		type="text/javascript" src="./script/validaUpload.js">
		
		//http://chd-pc:8080/SAC/rest/consulta/listaMultimedia
		
</script>

<script language="javascript" type="text/javascript">
	//EJECUCION DE LA FUNCION INICIO
	window.onload = inicio;
	//FUNCION DENTRO DEL HEAD PARA LA EJECUCION CON EL CONTENIDO INICIAL DE LAPAGINA
	function inicio() {
		{
			//DESHABILITAR ELEMENTO	
			//$("#nombreProgramacion").prop('disabled', true);
		   
			//--------------------------------------
			
			
			var webm = "video/webm";
			var mp4 = "video/mp4";
			var cont = 0;		
			$.ajax({

					type : "GET",
					url : "http://chd-pc:8080/SAC/rest/consulta/listaMultimedia",
					data : "{}",
					contentType : "application/json; charset=utf-8",
					dataType : "json",
					success : function(response) {
						
						
					//----ID DE ORDEN PARA TABLA DE REPORTE -------
					$.each(response, function(index, product) {
					cont++;
					});
					
					//----------------------------------------------
					
				    					
					
					},
					error : function(response) {
						console.log("error");
					}
				});
				}// FIN DE LA FINCION DE INICIO
			//--------------------------------------------------------------------------------------------------------------

$.ajax({

		type : "GET",
		url : "http://chd-pc:8080/SAC/rest/consulta/listaProgramacion",
		data : "{}",
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(response) {

		$.each(response, function(index, product) {
			var cont;
			$("<option></option>").attr("value",response[index].programacion_id).text(response[index].programacion_nombre)
			.appendTo('#cbProgramacion');

		});
		},
		error : function(response) {
			console.log("error");
		}
	});

				//-----------------------------------------------------------------------------------------------------
				
				
	// LLENAR TABLA DE IMAGENES
	
		$.ajax({

			type : "GET",
			url : "http://chd-pc:8080/SAC/rest/consulta/listaUltimasProgramacion",
			data : "{}",
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(response) {
				
				
			//----ID DE ORDEN PARA TABLA DE REPORTE -------
			$.each(response, function(index, product) {
			cont++;
			});
			
			//----------------------------------------------
			
		    
			$.each(response, function(index, product) {
			
				//alert(response[index].lista_multimedia_tipo + '==' + webm);
				
				//if(response[index].lista_multimedia_tipo == webm || response[index].lista_multimedia_tipo == mp4)
				//{
				
				var table = document.getElementById("listaProgramacion");
				  {
					  var row = table.insertRow(0);
					  var cell1 = row.insertCell(0);
					  var cell2 = row.insertCell(1);
					  var cell3 = row.insertCell(2);
					  var cell4 = row.insertCell(3);
						
					//  var cont = 0;
			
				
			
					  cell1.innerHTML = response[index].programacion_nombre;
					  cell2.innerHTML = response[index].playlist_nombre;
					  cell3.innerHTML = response[index].programacion_fecha_inicio;
					  cell4.innerHTML = response[index].programacion_fecha_fin
				  }
				
			//	}//fin if
			});
			
			
			
			},
			error : function(response) {
				console.log("error");
			}
		});
				
				
		//Llenado Lista de Videos

		$.ajax({

				type : "GET",
				url : "http://chd-pc:8080/SAC/rest/consulta/listaMultimedia",
				data : "{}",
				contentType : "application/json; charset=utf-8",
				dataType : "json",
				success : function(response) {

				$.each(response, function(index, product) {
					var cont;
					$("<option></option>").attr("value",response[index].lista_multimedia_id).text(response[index].lista_multimedia_nombre)
					.appendTo('#listaVideosImagenes');

				});
				},
				error : function(response) {
					console.log("error");
				}
			});
			
			
		
		}// FIN DE LA FINCION DE INICIO

		
				
		//}
				
	window.onload = inicio;
	
</script>



<script>

$(document).ready(function(){
	
	$("#listaVideosImagenes").change(function() {
		 alert("Han cambiado mi valor"); 
		});
	
	//$("#listaVideosImagenes").on('click', function () {

//		var temp_lista =$("#listaVideosImagenes").val();

		//alert("paso!!");

		//ASOCIACION DE ID DE RECURSOS SELECCIONADOS.
		//$("#PlayListSeleccionado").val(temp_lista);

		
	//});
		});
	

$(document).ready(function(){
	
	$("#cbPlayList").change(function() {
			
		$("#nombreProgramacion").val($("#cbPlayList :selected").text());
		
		
	});
			});


		$(document).ready(function(){

				$("#listaVideosImagenes").on('change', function () {
						alert("change");		
				});
		});

	
</script>


<script>

//BOTON GUARDAR
$(document).ready(function(){
	
$("#guardar").on('click', function () {

	/* if(nombrePlaylist==null || nombrePlaylist == 'undefined' )
	{
		Alert("Por favor Escriba un nombre valido para el Playlist");
	}
 */
 
var temp_lista =$("#listaVideosImagenes").val();
$("#PlayListSeleccionado").val(temp_lista);
//alert($("#listaVideosImagenes").val());

//ASOCIACION DE ID DE RECURSOS SELECCIONADOS.



	});
		});
	

</script>

<script>

//FUNCION PARA LA SELECCION DE MULTIPLES ELEMENTOS SIN DAR CLICK


window . onmousedown =  function  ( e )  { 
    
	var el = e . target ; 
    if  ( el . tagName . toLowerCase ()  ==  'option'  && el . parentNode . hasAttribute ( 'multiple' ))  { 
        e . preventDefault ();

        // alternar selection 
        if  ( el . hasAttribute ( 'selected' )) el . removeAttribute ( 'selected' ); 
        else el . setAttribute ( 'selected' ,  '' );

        // Piratear para corregir con errores behavior 
        var select = el . parentNode . cloneNode ( true ); 
        el . parentNode . parentNode . replaceChild ( select , el . parentNode ); 
    } 
    var temp_lista =$("#listaVideosImagenes").val();
    $("#PlayListSeleccionado").val(temp_lista);

}


//------------------------------------

//SELECCIONAR CLICK

$(document).ready(function(){
	
$("#cbProgramacion").on('change', function () {
 
 var id_seleccionado;
 
	 id_seleccionado=$("#cbProgramacion :selected").val();
	 $('#nombreProgramacion').val("");
     $('#descripcionProgramacion').val("");
     $('#fechaInicio').val("");
     $('#fechaFin').val("");
     $('#horaInicio').val("");
     $('#horaFin').val("");
     
     //----------------
     $.ajax({

			type : "GET",
			url : "http://chd-pc:8080/SAC/rest/consulta/listaProgramacion",
			data : "{}",
			contentType : "application/json; charset=utf-8",
			async: false,  //EJECUTA TODO EL CPDIGO Y LUEGO PASA AL SIGUINETE BLOQUE FUERA DEL AJAX.
			dataType : "json",
			success : function(response) {

			$.each(response, function(index, product) {
				
				if(id_seleccionado == response[index].programacion_id)
					{
				     $('#nombreProgramacion').val(response[index].programacion_nombre);
				     $('#descripcionProgramacion').val(response[index].programacion_descripcion);
				     $('#fechaInicio').val(response[index].programacion_fecha_inicio);
				     $('#fechaFin').val(response[index].programacion_fecha_fin);
				     $('#horaInicio').val(response[index].programacion_hora_inicio);
				     $('#horaFin').val(response[index].programacion_hora_fin);
				     $('#idProgramacion').val(id_seleccionado);
				     $('#Activo_Pasivo > option[value='+response[index].programacion_estado+']').attr('selected', 'selected');
					}

			});
			},
			error : function(response) {
				console.log("error");
			}
		});
		});
		}); // FIN BLOQUE CODIGO


		//------------------------------------------------------------------------------------		
		// CAPTURA DE FECHA  --- DESDE-HASTA
		$(document).ready(function(){
			
			$("#fechaFin").on('change', function () {
				var desde;
				var hasta;
				desde =  $('#fechaInicio').val(); 
				hasta = $('#fechaFin').val();
				 
				 //Split para convertir la fecha 
				    var elem = [];
				    elem = hasta.split('-');
					var hasta_temp = elem[0] + elem[1] + elem[2];
					hasta=hasta_temp;
					
					var elem2 = [];
				    elem2 = desde.split('-');
					var desde_temp = elem2[0] + elem2[1] + elem2[2];
					desde=desde_temp;
				
					if(desde > hasta)
						{
						
						alert("!ALERTA! - LA FECHA INICIO CON REFERENCIA A LA FECHA DE FIN DE LA PROGRAMACIÓN ESTAN MAL DEFINIDAS, INTENTE NUEVAMENTE");
					     $('#fechaInicio').val("");
					     $('#fechaFin').val("");
						
						}
					
			});
			
		});
//------------------------------------------------------------------------------------


//------------------------------------------------------------------------------------		
// CAPTURA DE HORA INICIO  --- HORA FIN
		$(document).ready(function(){
			
			$("#horaFin").on('change', function () {
				var desde;
				var hasta;
				desde =  $('#horaInicio').val(); 
				hasta = $('#horaFin').val();
				 
				 //Split para convertir la fecha 
				    var elem = [];
				    elem = hasta.split('-');
					var hasta_temp = elem[0] + elem[1] + elem[2];
					hasta=hasta_temp;
					
					var elem2 = [];
				    elem2 = desde.split('-');
					var desde_temp = elem2[0] + elem2[1] + elem2[2];
					desde=desde_temp;
				
					if(desde > hasta)
						{
						
						alert("!ALERTA! - LA HORA INICIO CON REFERENCIA A LA HORA DE FIN DE LA PROGRAMACIÓN ESTAN MAL DEFINIDAS, INTENTE NUEVAMENTE");
					     $('#horaInicio').val("");
					     $('#horaFin').val("");
						
						}
					
			});
			
		});
//------------------------------------------------------------------------------------
</script>





<title>SAC | MODIFICAR PROGRAMACION</title>
</head>
<BODY>

<center>
<br><b></b><b></b><b></b><b></b><b></b>	
    <div style="text-shadow:1px 1px 1px rgba(0,0,0,1);font-weight:normal;color:#FFFFFF;letter-spacing:1pt;word-spacing:12pt;font-size:24px;text-align:center;font-family:palatino linotype, palatino, serif;line-height:2;">SISTEMA ADMINISTRADOR DE CONTENIDOS</div>

<div style="left: 100px; top: 20px; width: 50px; height: 50px; text-align:left"> 
 <a href="programacionHoraria.jsp"><IMG src="images/icons/home.png"></a>
 </div>
<b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; 
   </b>
            
<table border="1">
<tr>
        <td colspan="2" style="text-shadow:1px 1px 1px rgba(0,0,0,1);BACKGROUND-COLOR: #457598;font-weight:normal;color:#ffffff;letter-spacing:1pt;word-spacing:12pt;font-size:18px;text-align:center;font-family:palatino linotype, palatino, serif;line-height:2;">MODIFICAR PROGRAMACION DE PLAYLIST</td>

</tr>
<tr>
<td>

<form name="update_Programacion" method="post" action="UpdateProgramacion">

<table VALIGN="top" id="interno">

    <tr >
        
        <td WIDTH="80" HEIGHT="80">
            <input type=image  name="modificarguardar" id="modificarguardar">    
   	    </td>
   	    
   	    <td>EN ESTA SECCION SE REALIZA LA ASOCIACION DE LOS PLAYLIST, CON EL HORARIO DE PROGRAMACION DE PUBLICACION DEL CONTENIDO.</td>
   	    
    </tr>
    
    <tr>
        <td> <label id="dis"></label><br> <span id="spanuser"><strong>SELECCIONE HORARIO:</strong></span> </td> 
		
		<td> <select name="cbProgramacion" id="cbProgramacion" >
		     <option>- Seleccione -</option>
		</td>
		
	</tr>
    
    <tr>
    	
		        <td  style="vertical-align:middle;"> <label id="dis"></label><br> <span id="spanuser"><strong>NOMBRE PROGRAMACION</strong></span> </td>
		<td >  <input type="text" maxlength="20" name="nombreProgramacion" id="nombreProgramacion" placeholder="NOMBRE PROGRAMACION" required/><br /> </td>
		
    </tr>
    
    <tr>
        
    <tr>
    
       <td  style="vertical-align:middle;"> <label id="dis"></label><br> <span id="spanuser"><strong>DESCRIPCION PROGRAMACION</strong></span> </td> 
	    <td>  <textarea rows="3" cols="35" maxlength="50" name="descripcionProgramacion" id="descripcionProgramacion" placeholder="DESCRIPCION DE PROGRAMACION"/></textarea> <br /> </td>
	    <td >  <input type="hidden" name="idProgramacion" id="idProgramacion" /><br /> </td> 
    </tr>
   
   <tr  style="vertical-align:middle;">
    
    	<td  style="vertical-align:middle;"> <label id="dis"></label><br> <span id="spanuser"><strong>ESTADO DE PLAYLIST</strong></span> </td>
    	
		<td  style="vertical-align:middle;"> 
    			<select name="Activo_Pasivo" id="Activo_Pasivo" >
				<option value="1">- HABILITADO -</option>
				<option value="0">- DESHABILITADO -</option>
		</td>
		
    </tr>
    
</table>

 

<iframe name="backgroundExecute" style="display: none;"></iframe>

</td>

        <td VALIGN="top"> 
              				<center class="CSSTableGenerator3">
       	    		<table id = "editarplaylist" >
					<tr>
						<td colspan="3">EDITAR PROGRAMACION PLAYLIST`S: </td>
					</tr>
					</table>
					</center>
        <center> 
        <table id="interno">
		<tr>	
         	<td colspan="4">
        	<IMG src="images/publicidad1.jpg" WIDTH=450 HEIGHT=250>
        	</td>
        </tr>
        
        </table>
        </center>
        
        </td>

</tr>

<tr HEIGHT="200" VALIGN="top">
        <td>
        
        <center class="CSSTableGenerator3">
		<table id = "ultimosVideos" >
			<tr>
				<td colspan="3"><strong>REALICE LA SELECCION HORARIA DEL PLAYLIST:</strong></td>
				
				
			</tr>
		
		</table>
		
        </center>
        
        
        <table id="interno">
        <tr>
        	 <td  style="vertical-align:middle;"> <label id="dis"></label><br> <span id="spanuser"><strong>SELECCIONE FECHA DE INICIO DE PROGRAMACION:</strong></span> </td> 
	  		<td  style="vertical-align:middle;"> <label id="dis"></label><br> <span id="spanuser"><strong>SELECCIONE FECHA DE FIN DE PROGRAMACION:</strong></span> </td> 
	  		
        </tr>
        
        <tr>
        	 <td> <input type="date"  name="fechaInicio" id="fechaInicio" required/></td>
        	 <td> <input type="date" name="fechaFin" id="fechaFin" required/></td>
        </tr>
        
        <tr>
        	 <td  style="vertical-align:middle;"> <label id="dis"></label><br> <span id="spanuser"><strong>SELECCIONE HORA DE INICIO DE PROGRAMACION:</strong></span> </td> 
	  		<td  style="vertical-align:middle;"> <label id="dis"></label><br> <span id="spanuser"><strong>SELECCIONE HORA DE FIN DE PROGRAMACION:</strong></span> </td> 
	  		
        </tr>
        
        <tr>
        	 <td> <input type="time"  name="horaInicio" id="horaInicio" required/></td>
        	 <td> <input type="time" name="horaFin" id="horaFin" required/></td>
        </tr>
        
        
        </table>
</form>        
     </td>

        
        <td VALIGN="top">
        
                <!-- <IMG src="images/publicidad1.jpg" WIDTH=450 HEIGHT=250>
        
        <font face="arial" color="c9c9c9" size="2">Se debe crear las lista de reproduccion, para en lo posterior darle uso en la publicacion de contenido web.</font>
         -->
         
         <center class="CSSTableGenerator3">
		<table id = "ultimosImagenes" >
			<tr>
				<td colspan="3"><strong>ULTIMAS PAQUETES DE PROGRAMACION CREADOS</strong></td>
				
				
			</tr>
		
				</table>
		
         </center>
         
        <center class="CSSTableGenerator">
		<table id = "CabeceraListaImagees" >
			<tr>
				<td width="25%">PROGRAM.</td>
				<td width="25%">PLAYLIST</td>
				<td width="30%">INICIO</td>
				<td width="30%">FIN</td>
				
			</tr>
		
		</table>
		
        </center>
        
        	<center class="CSSTableGenerator2">
			<table id = "listaProgramacion" >
				<tr>
					<td width=25%></td>
					<td width=25%></td>
					<td width=30%></td>
				    <td width=30%></td>
				</tr>
			
			</table>
			</center>
        			
        </td>
</tr>

</table>


</center>
</BODY>

</html>