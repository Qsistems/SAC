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

				
				
	// LLENAR TABLA DE IMAGENES
	
		$.ajax({

			type : "GET",
			url : "http://chd-pc:8080/SAC/rest/consulta/listaLinkPublicados",
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
				
				var table = document.getElementById("listaLinksPiblicados");
				  {
					  var row = table.insertRow(0);
					  var cell1 = row.insertCell(0);
					  var cell2 = row.insertCell(1);
					  var cell3 = row.insertCell(2);
					
					//  var cont = 0;
			
				
			
					  cell1.innerHTML = response[index].link_nombre;
					  cell2.innerHTML = response[index].playlist_nombre;
					  cell3.innerHTML = "<a href='"+ response[index].link_url +"'  target='_blank'>" + response[index].link_url +  "</a>"; 
					  
				  }
				
			//	}//fin if
			});
			
			
			
			},
			error : function(response) {
				console.log("error");
			}
		});
				
				
		//LLENADO DE PLAYLIST ASOCIADO A UNA PROGRAMACION----------------------------------------------------------

		$.ajax({

				type : "GET",
				url : "http://chd-pc:8080/SAC/rest/consulta/listaPlayListConProgramacion",
				data : "{}",
				contentType : "application/json; charset=utf-8",
				dataType : "json",
				success : function(response) {

				$.each(response, function(index, product) {
					var cont;
					$("<option></option>").attr("value",response[index].playlist_id).text(response[index].playlist_nombre)
					.appendTo('#PlayListconProgramacion');

				});
				},
				error : function(response) {
					console.log("error");
				}
			});
		//------------------------------------------------------------------------------------------------
		
		//LLENADO DE OPCIONES NUMEROS DE LINKS ----------------------------------------------------------

		$.ajax({

				type : "GET",
				url : "http://chd-pc:8080/SAC/rest/consulta/listaLinkDisponibles",
				data : "{}",
				contentType : "application/json; charset=utf-8",
				dataType : "json",
				success : function(response) {

				$.each(response, function(index, product) {
					var cont;
					$("<option></option>").attr("value",response[index].link_id).text(response[index].link_nombre)
					.appendTo('#linkoption');

				});
				},
				error : function(response) {
					console.log("error");
				}
			});
		//------------------------------------------------------------------------------------------------

			
		
		}// FINCION INICIO FIN
	
	
		
				
		//}
				
	window.onload = inicio;
	
</script>



<script>

$(document).ready(function(){
	
	$("#listaVideosImagenes").change(function() {
		 alert("Han cambiado mi valor"); 
		});
	
		});
	
	
		$(document).ready(function(){

				$("#listaVideosImagenes").on('change', function () {
						alert("change");		
				});
		});

	
</script>


<script>

//VALIDACION PREVIA - BOTON GUARDAR
$(document).ready(function(){
	
$("#guardar").on('click', function () {

var temp_lista =$("#listaVideosImagenes").val();
$("#PlayListSeleccionado").val(temp_lista);

	});
		});
	

</script>

<script>


//FUNCION DE PINTADO DE DATO SELECCIONADO EN IMPUT---------------

$(document).ready(function(){
	
	$("#PlayListconProgramacion").on('change', function () {
		
	 $('#playListSeleccionado').val($("#PlayListconProgramacion :selected").text());

	});
});

//----------------------------------------------------------------


//FUNCION PARA LA SELECCION DE MULTIPLES ELEMENTOS SIN DAR CLICK


/* window . onmousedown =  function  ( e )  { 
    
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

} */
</script>





<title>SAC | LINKS</title>
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
            
<table border="1" >
<tr>
        <td colspan="2" style="text-shadow:1px 1px 1px rgba(0,0,0,1);BACKGROUND-COLOR: #457598;font-weight:normal;color:#ffffff;letter-spacing:1pt;word-spacing:12pt;font-size:18px;text-align:center;font-family:palatino linotype, palatino, serif;line-height:2;">CREACION DE LINKS DE CONTENIDO</td>

</tr>




<tr>
<td>

<form name="registro_PlayList" method="post" action="CreateLink">

<table id="interno">

    <tr VALIGN="top">
        
        <td WIDTH="100" HEIGHT="40">
            <input type=image src="images/button/saveIconOn.png" width="10" height="10" name="guardar" id="guardar">    
   	    </td>
   	    <td>LLENE LA INFORMACION SOLICITADA PARA LA CORRECTA CREACION DE LA LISTA DE CONTENIDOS, LA MISMA QUE LE PERMITE SELECCINAR IMAGENES Y VIDEOS PREVIO AL GUARDADO DE ESTA SECCION</td>
   	    
    </tr>
    
    <tr VALIGN="top">
        <td  style="vertical-align:middle;"> <label id="dis"></label><br> <span id="spanuser"><strong>SELECCIONE PLAYLIST:</strong></span> </td> 
	</tr>
    
    <tr VALIGN="top">

    	    	<td >
    						<select name="PlayListconProgramacion" id="PlayListconProgramacion"> <option>- SELECCIONE -</option></select>

							<input type="text" maxlength="20" name="playListSeleccionado" id="playListSeleccionado"  placeholder="Playlist" required/><br />
				
				<br><br>
				
			<strong>SELECCIONE LINKS.</strong>	
				<select name="linkoption" id="linkoption">
						
								<option>- SELECCIONE -</option>
							
				</select>
			</td >	
	
	 		<td>  
        			<IMG src="images/publicidad1.jpg" WIDTH=450 HEIGHT=250>
	 			 
	 		</td>	
 
    </tr>
    
    <tr VALIGN="top">
    		<td colspan="6">UNA VEZ ASOCIDO EL PLAYLIST CON EL LINK EN LA PARTE INFERIOR SE ENCUENTRA LOS LINKS DE ACCESO A CADA UNA DE LOS LINKS PUBLICADOS</td>
    </tr>
    
    
</table>

</form> 

<iframe name="backgroundExecute" style="display: none;"></iframe>

</td>

        <!-- <td VALIGN="top"> 
        <IMG src="images/publicidad1.jpg" WIDTH=450 HEIGHT=250>
        
        <font face="arial" color="c9c9c9" size="2">Se debe crear las lista de reproduccion, para en lo posterior darle uso en la publicacion de contenido web.</font></td>
 -->
</tr>
       <td VALIGN="top">
        
        <center class="CSSTableGenerator3">
		<table id = "ultimosImagenes" >
			<tr>
				<td colspan="3"><strong>LINKS PUBLICADOS</strong></td>
				
				
			</tr>
		
				</table>
		
         </center>
         
        <center class="CSSTableGenerator">
		<table id = "CabeceraListaImagees" >
			<tr>
				<td width="25%">NOMBRE LINK</td>
				<td width="25%">PLAYLIST</td>
				<td width="50%">URL</td>
				
			</tr>
		
		</table>
		
        </center>
        
        	<center class="CSSTableGenerator2">
			<table id = "listaLinksPiblicados" >
				<tr>
					<td width=25%></td>
					<td width=25%></td>
					<td width=50%></td>
				
				</tr>
			
			</table>
			</center>
			
        </td>
        	
        	</tr>
			
        </td>

        
        </table>


</center>
</BODY>

</html>