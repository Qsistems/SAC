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
			
			$.ajax({

				type : "GET",
				url : "http://chd-pc:8080/SAC/rest/consulta/listaPlayList",
				data : "{}",
				contentType : "application/json; charset=utf-8",
				dataType : "json",
				success : function(response) {

				$.each(response, function(index, product) {
					var cont;
					$("<option></option>").attr("value",response[index].playlist_id).text(response[index].playlist_nombre)
					.appendTo('#cbPlayList');

				});
				},
				error : function(response) {
					console.log("error");
				}
			});

			
			
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
										
					},
					error : function(response) {
						console.log("error");
					}
				});
				}// FIN DE LA FINCION DE INICIO

				
				
	// LLENAR TABLA DE IMAGENES
	
		$.ajax({

			type : "GET",
			url : "http://chd-pc:8080/SAC/rest/consulta/listaUltimosPlaylist",
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
				
				var table = document.getElementById("listaPlayList");
				  {
					  var row = table.insertRow(0);
					  var cell1 = row.insertCell(0);
					  var cell2 = row.insertCell(1);
					  var cell3 = row.insertCell(2);
					
					//  var cont = 0;
			
				
			
					  cell1.innerHTML = response[index].playlist_nombre;
					  cell2.innerHTML = response[index].playlist_descripcion;
					  cell3.innerHTML = response[index].playlist_fecha_creacion;
				  }
				
			//	}//fin if
			});
			
			
			
			},
			error : function(response) {
				console.log("error");
			}
		});
				
				
		//Llenado Lista de Videos

			
		
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
	
//SELECCIONAR CLICK

$(document).ready(function(){
	
$("#cbPlayList").on('change', function () {
 
 var id_seleccionado;
 var idsMultimedia;
 var idsMultimedia2;

 //--- CONSULTA LISTA MULTIMEDIA
 		$('#listaVideosImagenes').empty();
 		$.ajax({

				type : "GET",
				url : "http://chd-pc:8080/SAC/rest/consulta/listaMultimedia",
				data : "{}",
				contentType : "application/json; charset=utf-8",
				async: false,  //EJECUTA TODO EL CPDIGO Y LUEGO PASA AL SIGUINETE BLOQUE FUERA DEL AJAX.
				dataType : "json",
				success : function(response) {

				$.each(response, function(index, product) {
					$("<option></option>").attr("value",response[index].lista_multimedia_id).text(response[index].lista_multimedia_nombre)
					.appendTo('#listaVideosImagenes');

				});
				},
				error : function(response) {
					console.log("error");
				}
			});

 //---
 
	 $('#nombrePlaylist').val($("#cbPlayList :selected").text());
     id_seleccionado=$("#cbPlayList :selected").val();
     $('#descripcionPlaylist').val("");
     $('#PlayListSeleccionado').val("");
     $('#IdPlayList').val("");
     
     //----------------
     $.ajax({

			type : "GET",
			url : "http://chd-pc:8080/SAC/rest/consulta/listaPlayListModificar",
			data : "{}",
			contentType : "application/json; charset=utf-8",
			async: false,  //EJECUTA TODO EL CPDIGO Y LUEGO PASA AL SIGUINETE BLOQUE FUERA DEL AJAX.
			dataType : "json",
			success : function(response) {

			$.each(response, function(index, product) {
				if(id_seleccionado == response[index].playlist_id)
					{
					$('#descripcionPlaylist').val(response[index].playlist_descripcion);
					$('#PlayListSeleccionado').val(response[index].playlist_ids_media);
					$('#Activo_Pasivo > option[value='+ response[index].playlist_estado +']').attr('selected', 'selected');
					idsMultimedia = response[index].playlist_ids_media;
					}

			});
			},
			error : function(response) {
				console.log("error");
			}
		});
	
   	//----------------
    idsMultimedia2 = idsMultimedia.split(",")
    
    	 for (var i in idsMultimedia2) 
    	 {
  			  
    		 //----------------
    	     $.ajax({

    				type : "GET",
    				url : "http://chd-pc:8080/SAC/rest/consulta/listaMultimedia",
    				data : "{}",
    				contentType : "application/json; charset=utf-8",
    				async: false,  //EJECUTA TODO EL CPDIGO Y LUEGO PASA AL SIGUINETE BLOQUE FUERA DEL AJAX.
    				dataType : "json",
    				success : function(response) {

    				$.each(response, function(index, product) {
    					
    					if(idsMultimedia2[i] == response[index].lista_multimedia_id)
    						{
    						$('#listaVideosImagenes > option[value='+response[index].lista_multimedia_id+']').attr('selected', 'selected');
    						}

    				});
    				},
    				error : function(response) {
    					console.log("error");
    				}
    			});
    		
    	   	//----------------

    	   	
		 }// FIN FOR
  			  $('#IdPlayList').val(id_seleccionado);
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
</script>





<title>SAC | MODIFICAR PLAYLIST</title>
</head>
<BODY>

<center>
<br><b></b><b></b><b></b><b></b><b></b>	
    <div style="text-shadow:1px 1px 1px rgba(0,0,0,1);font-weight:normal;color:#FFFFFF;letter-spacing:1pt;word-spacing:12pt;font-size:24px;text-align:center;font-family:palatino linotype, palatino, serif;line-height:2;">SISTEMA ADMINISTRADOR DE CONTENIDOS</div>

<div style="left: 100px; top: 20px; width: 50px; height: 50px; text-align:left"> 
 <a href="playList.jsp"><IMG src="images/icons/home.png"></a>
 </div>
<b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; 
   </b>
            
<table border="1">
<tr>
        <td colspan="2" style="text-shadow:1px 1px 1px rgba(0,0,0,1);BACKGROUND-COLOR: #457598;font-weight:normal;color:#ffffff;letter-spacing:1pt;word-spacing:12pt;font-size:18px;text-align:center;font-family:palatino linotype, palatino, serif;line-height:2;">MODIFICACIÓN DE PLAYLIST DE CONTENIDOS</td>

</tr>




<tr>
<td>

<form name="Update_PlayList" method="post" action="UpdatePlayList">

<table id="interno">

    <tr>
        
        <td WIDTH="80" HEIGHT="80">
            <input type=image  name="modificarguardar" id="modificarguardar">    
   	    </td>
   	    <td>LLENE LA INFORMACION SOLICITADA PARA LA CORRECTA CREACION DE LA LISTA DE CONTENIDOS.</td>
   	    
    </tr>
    
    <tr>
    	        <td  style="vertical-align:middle;"> <label id="dis"></label><br> <span id="spanuser"><strong>PLAYLIST</strong></span> </td> 
    	<td> 
    			<select name="cbPlayList" id="cbPlayList" required>
				<option>- Select -</option>
		</td>
    </tr>
    
    <tr>
        <td  style="vertical-align:middle;"> <label id="dis"></label><br> <span id="spanuser"><strong>NOMBRE PLAYLIST</strong></span> </td> 
	    <td >  <input type="text" maxlength="20" name="nombrePlaylist" id="nombrePlaylist" required/><br /> </td> 
	</tr>
	    	
    <tr>
    
       <td  style="vertical-align:middle;"> <label id="dis"></label><br> <span id="spanuser"><strong>DESCRIPCION PLAYLIST</strong></span> </td> 
	    <td>  <textarea rows="3" cols="35" maxlength="50" name="descripcionPlaylist" id="descripcionPlaylist" /></textarea> <br /> </td>
	    
    </tr>
    
    <tr  style="vertical-align:middle;">
    
    	<td  style="vertical-align:middle;"> <label id="dis"></label><br> <span id="spanuser"><strong>ESTADO DE PLAYLIST</strong></span> </td>
    	
		<td  style="vertical-align:middle;"> 
    			<select name="Activo_Pasivo" id="Activo_Pasivo" >
				<option value=1>- HABILITADO -</option>
				<option value=0>- DESHABILITADO -</option>
		</td>
		
    </tr>
        <tr>

      <!--  <td  style="vertical-align:middle;"> <label id="dis"></label><br> <span id="spanuser"><strong>SELECCIONADO</strong></span> </td> --> 
	    <td>  <input type="hidden" name="PlayListSeleccionado" id="PlayListSeleccionado" /><br /> </td>
	    <td>  <input type="hidden" name="IdPlayList" id="IdPlayList" /><br /> </td>
	    
    </tr>
    
        <tr VALIGN="top"  height="20">
        <td> <b></b> </td> <td> </td> <td> </td> <td> </td> <td> </td>       
    </tr>
    
    <tr>
        <td colspan="6"><strong>RECUERDE:</strong> Una vez llenada la información, seleccione el contenido multimedia y guarde.</td>
    </tr>
    
    
</table>

</form> 

<iframe name="backgroundExecute" style="display: none;"></iframe>

</td>

        <td VALIGN="top"> 
        <IMG src="images/publicidad1.jpg" WIDTH=450 HEIGHT=250>
        </td>

</tr>

<tr HEIGHT="200" VALIGN="top">
        <td>
        
        <center class="CSSTableGenerator3">
		<table id = "ultimosVideos" >
			<tr>
				<td colspan="3">SELECCIONE EL CONTENIDO MULTIMEDIA: </td>
				
				
			</tr>
		
		</table>
		
        </center>
        
        	<center>
        	
    				<select multiple name="listaVideosImagenes" id="listaVideosImagenes" size='17'></select>
			
			</center>
    
			
        </td>

        
        <td VALIGN="top">
        
        <center class="CSSTableGenerator3">
		<table id = "ultimosImagenes" >
			<tr>
				<td colspan="3"><strong>ULTIMAS PAQUETES PLAYLIST CARGADAS</strong></td>
				
				
			</tr>
		
				</table>
		
         </center>
         
        <center class="CSSTableGenerator">
		<table id = "CabeceraListaImagees" >
			<tr>
				<td width="30%">NOMBRE</td>
				<td width="40%">DESCRIPCION</td>
				<td width="30%">FECHA CREACION</td>
				
			</tr>
		
		</table>
		
        </center>
        
        	<center class="CSSTableGenerator2">
			<table id = "listaPlayList" >
				<tr>
					<td width=30%></td>
					<td width=40%></td>
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