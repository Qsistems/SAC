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
//--------------------------------------------------------------------

//CAMBIAR FORMA DE SELECCION.
/* $().ready(function() 
	{
		$('.pasar').click(function() { return !$('#origen option:selected').remove().appendTo('#destino'); });  
		$('.quitar').click(function() { return !$('#destino option:selected').remove().appendTo('#origen'); });
		$('.pasartodos').click(function() { $('#origen option').each(function() { $(this).remove().appendTo('#destino'); }); });
		$('.quitartodos').click(function() { $('#destino option').each(function() { $(this).remove().appendTo('#origen'); }); });
	
	});
 */	
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
</script>





<title>SAC | PLAYLIST</title>
</head>
<BODY>

<center>
<br><b></b><b></b><b></b><b></b><b></b>	
    <div style="text-shadow:1px 1px 1px rgba(0,0,0,1);font-weight:normal;color:#FFFFFF;letter-spacing:1pt;word-spacing:12pt;font-size:24px;text-align:center;font-family:palatino linotype, palatino, serif;line-height:2;">SISTEMA ADMINISTRADOR DE CONTENIDOS</div>

<div style="left: 100px; top: 20px; width: 50px; height: 50px; text-align:left"> 
 <a href="menu.jsp"><IMG src="images/icons/home.png"></a>
 </div>
<b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; 
   </b>
            
<table border="1">
<tr>
        <td colspan="2" style="text-shadow:1px 1px 1px rgba(0,0,0,1);BACKGROUND-COLOR: #457598;font-weight:normal;color:#ffffff;letter-spacing:1pt;word-spacing:12pt;font-size:18px;text-align:center;font-family:palatino linotype, palatino, serif;line-height:2;">CREACION DE PLAYLIST DE CONTENIDOS</td>

</tr>




<tr>
<td>

<form name="registro_PlayList" method="post" action="CreatePlayList">

<table id="interno">

    <tr>
        
        <td WIDTH="80" HEIGHT="80">
            <input type=image  name="guardar" id="guardar">    
   	    </td>
   	    <td>LLENE LA INFORMACION SOLICITADA PARA LA CORRECTA CREACION DE LA LISTA DE CONTENIDOS.</td>
   	    
    </tr>
    
    <tr>
        <td  style="vertical-align:middle;"> <label id="dis"></label><br> <span id="spanuser"><strong>NOMBRE PLAYLIST</strong></span> </td> 
	    <td >  <input type="text" maxlength="20" name="nombrePlaylist" id="nombrePlaylist" required/><br /> </td> 
	</tr>
    
    <tr>
    
       <td  style="vertical-align:middle;"> <label id="dis"></label><br> <span id="spanuser"><strong>DESCRIPCION PLAYLIST</strong></span> </td> 
	    <td>  <textarea rows="3" cols="35" maxlength="50" name="descripcionPlaylist" id="descripcionPlaylist" /></textarea> <br /> </td>
	    
    </tr>
    
        <tr>

      <!--  <td  style="vertical-align:middle;"> <label id="dis"></label><br> <span id="spanuser"><strong>SELECCIONADO</strong></span> </td> --> 
	    <td>  <input type="hidden" name="PlayListSeleccionado" id="PlayListSeleccionado" /><br /> </td>
	    
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
      				<center class="CSSTableGenerator3">
       	    		<table id = "editarplaylist" >
					<tr>
						<td colspan="3">EDITAR PLAYLIST`S: </td>
					</tr>
					</table>
					</center>
        <center> 
        <table id="interno">
		<tr>
		
        	<td>
        	<a href="modificarPlayList.jsp"><IMG SRC="images/button/modificarplaylist.png" WIDTH=50 HEIGHT=50 ALT="Consultar" onclick="index.jsp"></a>
        	</td>
        	
        </tr>
        <tr>
        	<td>
        	<string>! IMPORTANTE !</string> PUEDE EDITAR PLAYLIST, PARA AÑADIR/QUITAR MULTIMEDIA QUE YA NO REQUIERA, DE ESTA MANERA EVITA DUPLICAR LISTAS DE CONTENIDO.
       		</td>
        </tr>
        <tr>	
         	<td colspan="4">
        	<IMG src="images/publicidad1.jpg" WIDTH=350 HEIGHT=150>
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
				<td colspan="3">SELECCIONE EL CONTENIDO MULTIMEDIA: </td>
				
				
			</tr>
		
		</table>
		
        </center>
        
        <!-- 	<center>
         -->	
    				<select multiple name="listaVideosImagenes" id="listaVideosImagenes" size='17' required></select>
			
			<!-- </center>
     -->
			
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

<!-- 	<tr>

		<td>
		<div>
<select name="origen[]" id="origen" multiple="multiple" size="8">
<option value="1">Opción 1</option>
<option value="2">Opción 2</option>
<option value="3">Opción 3</option>
<option value="4">Opción 4</option>
<option value="5">Opción 5</option>
<option value="6">Opción 6</option>
<option value="7">Opción 7</option>
<option value="8">Opción 8</option>
</select>
</div>
<div>
<input type="button" class="pasar izq" value="Pasar »"><input type="button" class="quitar der" value="« Quitar"><br />
<input type="button" class="pasartodos izq" value="Todos »"><input type="button" class="quitartodos der" value="« Todos">
</div>
<div class="">
<select name="destino[]" id="destino" multiple="multiple" size="8"></select>
</div>

		</td>
	</tr>
 -->
</table>


</center>
</BODY>

</html>