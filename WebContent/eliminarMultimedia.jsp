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
			//$("#PlayListSeleccionado").prop('disabled', true);
		   
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
					
				    
					/* $.each(response, function(index, product) {
					
						//alert(response[index].lista_multimedia_tipo + '==' + webm);
						
						//if(response[index].lista_multimedia_tipo == webm || response[index].lista_multimedia_tipo == mp4)
						//{
						
						var table = document.getElementById("listaVideosImagenes");
						  {
							  var row = table.insertRow(0);
							  var cell1 = row.insertCell(0);
							  var cell2 = row.insertCell(1);
							  var cell3 = row.insertCell(2);
							
							//  var cont = 0;
					
						
					
							  cell1.innerHTML = cont--;
							  cell2.innerHTML = response[index].lista_multimedia_nombre;
							  cell3.innerHTML = response[index].lista_multimedia_tipo;
						  }
						
					//	}//fin if
					});
					 */
					
					
					},
					error : function(response) {
						console.log("error");
					}
				});
				}// FIN DE LA FINCION DE INICIO

								
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

var idSeleccionado;


$(document).ready(function(){
	
	
	var elem='';
	var elemSplit = [];
	var NombreEliminar;
	var usado=0;
	
	$("#listaVideosImagenes").change(function() {
		
		idSeleccionado = $("#listaVideosImagenes").val();
		NombreEliminar = ($("#listaVideosImagenes :selected").text());
		$("#PlayListSeleccionado").val(idSeleccionado);
		$("#NombreEliminar").val(NombreEliminar);
 	

 //------------COMPARAR CON ID MEDIAS ASOCIADAS--------------------
 $.ajax({

			type : "GET",
			url : "http://chd-pc:8080/SAC/rest/consulta/listaPlayListModificar",
			data : "{}",
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(response) {

				
			$.each(response, function(index, product) {
				
		    var temp_elem = response[index].playlist_ids_media;
			
		    if(elem==null || elem=='')
		    	{
		    	elem = elem + temp_elem;
		    	}
		    else
		    	{
		    	elem = elem +","+ temp_elem;
		    	}
		    
				
			});  //FIN EACH
			
			elemSplit = elem.split(',');
			elem='';
			
			for (var i in elemSplit) {
				
				if(idSeleccionado == elemSplit[i])
					{
					usado=1;
					}
			}
			
			if(usado==1)
			{
			alert("EL CONTENIDO QUE PRETENDE ELIMINAR SE ENCUENTRA ASOCIADO A UN PLAYLIST, QUITE ESTE CONTENIDO DEL PLAYLIST Y VUELVA A INTENTAR");
			location.reload();
			}

			
			},
			error : function(response) {
				console.log("error");
			}
		});  //FIN AJAX
		
		
		 
 //---------------------------------------------------------------------
 
	
	});

});
	
//--------------------------------------------------------------------
$(document).ready(function(){
	
	$("#nombrePlaylist").change(function() {
		var nombreList;
		nombreList =  $('#nombrePlaylist').val(); 
		
		$.ajax({

			type : "GET",
			url : "http://chd-pc:8080/SAC/rest/consulta/listaPlayList",
			data : "{}",
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(response) {

				
			$.each(response, function(index, product) {

				if(response[index].playlist_nombre==nombreList)
				{	
					alert("ALERTA! - NOMBRE DE PLAYLIST YA EXISTE, INTENTE INGRESANDO OTRO NOMBRE..")
					$('#nombrePlaylist').val("");
					$('#nombrePlaylist').focus(); 
				}
			});
			},
			error : function(response) {
				console.log("error");
			}
		});  //FIN AJAX
		
		
	
		});
	});
//--------------------------------------------------------------------

	
</script>


<script>

//BOTON GUARDAR
$(document).ready(function(){
	
$("#guardar").on('click', function () {
 
/* var temp_lista =$("#listaVideosImagenes").val();
$("#PlayListSeleccionado").val(temp_lista);
 */

	});
		});
	

</script>

<!-- <script>

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
 -->




<title>SAC | ELIMINAR MULTIMEDIA</title>
</head>
<BODY>

<center>
<br><b></b><b></b><b></b><b></b><b></b>	
    <div style="text-shadow:1px 1px 1px rgba(0,0,0,1);font-weight:normal;color:#FFFFFF;letter-spacing:1pt;word-spacing:12pt;font-size:24px;text-align:center;font-family:palatino linotype, palatino, serif;line-height:2;">SISTEMA ADMINISTRADOR DE CONTENIDOS</div>

<div style="left: 100px; top: 20px; width: 50px; height: 50px; text-align:left"> 
 <a href="uploadContenidos.jsp"><IMG src="images/icons/home.png"></a>
 </div>
<b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; 
   </b>
            
<table border="1">
<tr>
        <td colspan="2" style="text-shadow:1px 1px 1px rgba(0,0,0,1);BACKGROUND-COLOR: #457598;font-weight:normal;color:#ffffff;letter-spacing:1pt;word-spacing:12pt;font-size:18px;text-align:center;font-family:palatino linotype, palatino, serif;line-height:2;">ELIMINAR CONTENIDO</td>

</tr>




<tr>
<td>

<form name="EliminarMultimedia" method="post" action="EliminarMultimedia">

<table id="interno">

    <tr>
        
        <td WIDTH="80" HEIGHT="80">
            <input type=image  name="eliminar" id="eliminar">    
   	    </td>
   	    
   	    
    </tr>
    
    <tr>
    <td>SELECIONE Y ELIMINE 1 A 1 EL CONTENIDO MULTIMEDIA, QUE YA NO REQUIERE MANTENER EN EL SISTEMA</td>
    </tr>
    

        <tr>

      <!--  <td  style="vertical-align:middle;"> <label id="dis"></label><br> <span id="spanuser"><strong>SELECCIONADO</strong></span> </td> --> 
	    <td>  <input type="hidden" name="PlayListSeleccionado" id="PlayListSeleccionado" /><br /> </td>
	    <td>  <input type="hidden" name="NombreEliminar" id="NombreEliminar" /><br /> </td>
	    
	    
    </tr>
    
        <tr VALIGN="top"  height="20">
        <td> <b></b> </td> <td> </td> <td> </td> <td> </td> <td> </td>       
    </tr>
    
    
    <td>
        
        <center class="CSSTableGenerator3">
		<table id = "ultimosVideos" >
			<tr>
				<td colspan="3">SELECCIONE EL CONTENIDO MULTIMEDIA: </td>
				
				
			</tr>
		
		</table>
		
        </center>
        
        	<center>
        	
    				<select multiple name="listaVideosImagenes" id="listaVideosImagenes" size='20'></select>
			
			</center>
    
			
        </td>
        
    
</table>

</form> 

<iframe name="backgroundExecute" style="display: none;"></iframe>

</td>

      <td VALIGN="top">
      				
        <center> 
        <table id="interno">
		<tr>
        	<td>
        	<string>! IMPORTANTE !</string> 
       		</td>
       		
        </tr>
        <tr>
        
        	<td>
        		<br>
       			PARA ELIMINAR CONTENIDO MULTIMEDIA ASEGURATE QUE NO ESTÁ SIENDO USADO EN ALGUNA LISTA DE REPRODUCCIÓN EN ESTE CASO EL SISTEMA NO TE PERMITIRÁ ELIMINAR EL ARCHIVO.
       			<br>
       		</td>
        </tr>
        <tr>	
         	<td colspan="4">
        	<IMG src="images/publicidad1.jpg" WIDTH=350 HEIGHT=300>
        	</td>
        </tr>
        
        </table>
        </center>
      </td>

</tr>

</table>


</center>
</BODY>

</html>