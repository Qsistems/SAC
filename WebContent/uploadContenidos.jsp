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
<link rel="stylesheet" type="text/css" href="css/estilo.css" />
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
			$('#cargando').hide();
			$("#SUBIR").attr("disabled", true);
			
			var webm = "video/webm";
			var mp4 = "video/mp4";
			var cont = 0;		
			$.ajax({

					type : "GET",
					url : "http://chd-pc:8080/SAC/rest/consulta/listaUltimosVideos",
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
						
						var table = document.getElementById("listaVideos");
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
					
					
					
					},
					error : function(response) {
						console.log("error");
					}
				});
				}// FIN DE LA FINCION DE INICIO

				
				
	// LLENAR TABLA DE IMAGENES
	
		$.ajax({

			type : "GET",
			url : "http://chd-pc:8080/SAC/rest/consulta/listaUltimasImagenes",
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
				
				var table = document.getElementById("listaImagenes");
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
	
 	$("#uploadfile").on('change', function () {
		
 	 var media = $('#uploadfile').val().replace(/C:\\fakepath\\/i, '');
 	$("#SUBIR").attr("disabled", false);
 
		$.ajax({

			type : "GET",
			url : "http://chd-pc:8080/SAC/rest/consulta/listaMultimedia",
			data : "{}",
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(response) {

			$.each(response, function(index, product) {
			if(response[index].lista_multimedia_nombre == media)	
				{
				alert("EL NOMBRE DE ARCHIVO CONCUERDA CON UNO YA SUBIDO EN EL SISTEMA - CAMBIE EL NOMBRE O CONFIRME SI EL ARCHIVO LO SUBIO CON ANTERIORIDAD");
			    //location.reload()
				$fileupload = $('#uploadfile');
				$fileupload.replaceWith($fileupload.clone(true));
				}
			});
			
			},
			error : function(response) {
				console.log("error");
			}
		});
  		
			
		document.subirContenido.target = "backgroundExecute";

		});
});

</script>


<script>

//BOTON SUBIR
$(document).ready(function(){
	
$("#SUBIR").on('click', function () {
	
 var datoFile=$('#uploadfile').val().replace(/C:\\fakepath\\/i, '');
	  		if(datoFile==null || datoFile =='undefined' || datoFile =='')
	  			{
	  			 alert("ALERT! - SELECCIONE CONTENIDO MULTIMEDIA DE SU EQUIPO ANTES DE PRESIONAR EL BOTON DE SUBIR!!...");
	  			 location.reload();
	  			}
	  		else
	  			{
	  			$('#cargando').show();			      
		  		 setTimeout(function(){amague()},8000); // 8000ms = 8s
	  			}
			
	});
		});
	
function amague(){
  	 
	 $('#cargando').hide();
	 $("#SUBIR").attr("disabled", true);
	 alert("CONTENIDO MULTIMEDIA CARGADO CON EXITO!!...");
	 location.reload();
}

</script>

<title>SAC | SUBIR CONTENIDO</title>
</head>
<BODY id="content">

<center>
<br><b></b><b></b><b></b><b></b><b></b>	
    <div style="text-shadow:1px 1px 1px rgba(0,0,0,1);font-weight:normal;color:#FFFFFF;letter-spacing:1pt;word-spacing:12pt;font-size:24px;text-align:center;font-family:palatino linotype, palatino, serif;line-height:2;">SISTEMA ADMINISTRADOR DE CONTENIDOS</div>

<div style="left: 100px; top: 20px; width: 50px; height: 50px; text-align:left"> 
 <a href="menu.jsp"><IMG src="images/icons/home.png"></a>
 </div>
<b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; 
   </b>
            
<table border = "1">
<tr>
        <td colspan="2" style="text-shadow:1px 1px 1px rgba(0,0,0,1);BACKGROUND-COLOR: #457598;font-weight:normal;color:#ffffff;letter-spacing:1pt;word-spacing:12pt;font-size:18px;text-align:center;font-family:palatino linotype, palatino, serif;line-height:2;">UPLOAD DE CONTENIDOS MULTIMEDIAS</td>

</tr>




<tr>
<td VALIGN="top">
<br>
<form name="subirContenido" id="subirContenido" method="POST" enctype='multipart/form-data' action="<%=request.getContextPath()%>/uploadContenidos">
<table id="interno">
 
    <tr>
        <td colspan="6"><strong>S.A.C SOPORTA LOS SIGUIENTES FORMATOS.</strong></td>
    </tr>
    
    <tr VALIGN="top">
        <td> </td> <td> </td> <td> </td> <td> </td> <td> </td>       
    </tr>
        
    <tr VALIGN="top">
        <td colspan="6"><strong>IMAGENES FORMATO:</strong> jpeg, jpg, png.</td>
    </tr>
    
    <tr VALIGN="top">
        <td colspan="6"><strong>VIDEOS FORMATO:</strong> webm.</td>
    </tr>
    
    <tr VALIGN="top" height="20">
        <td> </td>
    <tr>
    <td ><input type="file" name="uploadfile" id="uploadfile" accept="video/webm,video/image/jpeg,image/x-png,application"/></td>
    </tr>
 
    <tr>
    
        <td><input type=image type="submit"  name="SUBIR" id="SUBIR"><div id="cargando"></div></td>
        
        <!-- <td></td> -->
    </tr>
    <tr>
    		<td><input type="hidden" name="todo" value="upload"></td>
    		<!-- <td><div id="cargando"></div></td> -->
    </tr>
    
    <tr VALIGN="top"  height="20">
        
        <td> <b></b> <b></b> </td> <td> </td> <td> </td> <td> </td> <td> </td>       
    </tr>
    
    <tr>
        <td colspan="6"><strong>RECUERDE:</strong> El contenido multimedia que suba al SISTEMA ADMINISTRADOR DE CONTENIDO, le permitirá con el mismo, crear listas de reproducciones, para el uso sobre los dispositivos tablets.</td>
    </tr>
    
    
    
</table>
</form> 
<iframe name="backgroundExecute" style="display: none;"></iframe>

</td>
        <center>
       <td> 
        	<!-- <IMG src="images/publicidad1.jpg" WIDTH=450 HEIGHT=250> -->
        	 <a href="eliminarMultimedia.jsp"><IMG SRC="images/button/eliminarmultimedia.png" WIDTH=320 HEIGHT=50 ALT="Consultar" onclick="index.jsp"></a>
        	<br><br> 
        	
       		 <font face="arial" color=black size="1"><strong>PREVISUALIZACION VIDEO SUBIDO RECIENTEMENTE.</strong></font>
        
       		 <video width="450" height="250" autoplay controls muted loop=true]>
       		    <IMG src="images/publicidad1.jpg" WIDTH=450 HEIGHT=250>
	 			<source src="ecuador.webm" type="video/webm; codecs=vp8,vorbis">
       		 </video>

        </td>
        </center>

</tr>

<tr VALIGN="top">
        <td>
        
        <center class="CSSTableGenerator3">
		<table id = "ultimosVideos" >
			<tr>
				<td colspan="3"><string>ÚLTIMOS VIDEOS SUBIDOS</string></td>
				
				
			</tr>
		
		</table>
		
        </center>
        
        
        <center class="CSSTableGenerator">
		<table id = "CabeceraListaVideos" >
			<tr>
				<td width="10%">No.</td>
				<td width="30%">NOMBRE ARCHIVO</td>
				<td width="30%">FORMATO</td>
				
			</tr>
		
		</table>
		
        </center>
        
        	<center class="CSSTableGenerator2">
			<table id = "listaVideos" >
				<tr>
					<td width=10%></td>
					<td width=30%></td>
					<td width=30%></td>
				
				</tr>
			
			</table>
			</center>
			
        </td>

        <td VALIGN="top">
        
        
        <center class="CSSTableGenerator3">
		<table id = "ultimosImagenes" >
			<tr>
				<td colspan="3"><string>ÚLTIMAS IMAGENES SUBIDAS</string></td>
				
				
			</tr>
		
		</table>
		
         </center>
         
        <center class="CSSTableGenerator">
		<table id = "CabeceraListaImagees" >
			<tr>
				<td width="10%">No.</td>
				<td width="30%">NOMBRE ARCHIVO</td>
				<td width="30%">FORMATO</td>
				
			</tr>
		
		</table>
		
        </center>
        
        	<center class="CSSTableGenerator2">
			<table id = "listaImagenes" >
				<tr>
					<td width=10%></td>
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