<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript" src="./script/html5shiv.js"></script>
<script type="text/javascript" src="./script/modernizr-custom.js"></script>
<link rel="stylesheet" type="text/css" href="./css/reproductor.css">
<link rel="stylesheet" type="text/css" href="./css/fondo_reproductor.css">

<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">
</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SAC | REPRODUCTOR - 2</title>

<script>

window.onload = function playlist(){

//VAR SPLIT
var idsMultimedia;
var idsMultimedia2;
var playlistNombres=[30];
var cont=0;
var encontro=2;

//------------- FECHA DEL DIA --------------------	
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //ENERO ES 0!
	var hora = today.getHours();
	var minuto= today.getMinutes();
	var yyyy = today.getFullYear();
	var hora_actual;
	var hora_inicio_sac;
	var hora_fin_sac;
	var fecha_inicio_sac;
	var fecha_fin_sac;

	
	if(dd<10){
	    dd='0'+dd;
	} 
	if(mm<10){
	    mm='0'+mm;
	} 
	var hoy = yyyy+""+mm+""+dd;
	
	
	
	if(hora<10){
		hora='0'+hora;
	} 
	if(minuto<10){
		minuto='0'+minuto;
	}
	
	hora_actual=hora+""+minuto;
	
	//alert(hora_actual);
//------------------------------------------------

  	$.ajax({

		type : "GET",
		url : "http://chd-pc:8080/SAC/rest/consulta/ReproduccionInformacion",
		data : "{}",
		contentType : "application/json; charset=utf-8",
		async: false,  //EJECUTA TODO EL CPDIGO Y LUEGO PASA AL SIGUINETE BLOQUE FUERA DEL AJAX.
		dataType : "json",
		success : function(response) {
			
		//----------------------------------------------
		$.each(response, function(index, product) {
		if(response[index].link_nombre == 'LINK_URL_2' && hoy >= response[index].programacion_fecha_inicio && hoy <= response[index].programacion_fecha_fin)
			{   
			
			fecha_inicio_sac = response[index].programacion_fecha_inicio;
			fecha_fin_sac = response[index].programacion_fecha_fin;
			
				if(hora_actual>= response[index].programacion_hora_inicio && hora_actual<= response[index].programacion_hora_fin)
				{
				idsMultimedia = response[index].playlist_ids_media;			
				hora_inicio_sac = response[index].programacion_hora_inicio;
				hora_fin_sac = response[index].programacion_hora_fin;
				encontro=1;
				}
				else
				{
					encontro=0;	
				}
			}
			  
		});

		},
		error : function(response) {
			console.log("error");
		}
	});
	
  	
 // ------IF CONDICIONAL SI ENCONTRO O NO LA PROGRAMACION CORRESPONDIENTE --------
 if(encontro!=0)
{
	idsMultimedia2 = idsMultimedia.split(",");

   	 for (var i=1 in idsMultimedia2) 
	 { 

   		 $.ajax({

			type : "GET",
			url : "http://chd-pc:8080/SAC/rest/consulta/listaMediaReproductor",
			data : "{}",
			contentType : "application/json; charset=utf-8",
			async: false,  //EJECUTA TODO EL CPDIGO Y LUEGO PASA AL SIGUINETE BLOQUE FUERA DEL AJAX.
			dataType : "json",
			success : function(response) {
				
			//----------------------------------------------
			$.each(response, function(index, product) {
			
			if(response[index].lista_multimedia_id == idsMultimedia2[i])
			{//alert(response[index].lista_multimedia_id +"=="+ idsMultimedia2[i])
				
			playlistNombres[cont]=response[index].lista_multimedia_nombre; 
			cont=cont+1;
			
			}
			});

			},
			error : function(response) {
				console.log("error");
			}
		});

	 
//-------------------------------------------------------------------------	
   	//-------------------------------------------------------------------------	
   		var reproductor = document.getElementById("reproductor"),
   		videos = playlistNombres; 
   		info = document.getElementById("info");
   		info.innerHTML = "Vídeo: " + videos[0];
   		reproductor.src = videos[0];
   		reproductor.play();

   		reproductor.addEventListener("ended", function() {
   		//-------- CONSULTA DE HORA ACTUALIZADA ------------
   			var today1 = new Date();
   			var hora1 = today1.getHours();
   			var minuto1= today1.getMinutes();
   			var hora_actual1;
   			var stop=0;
   			if(hora1<10){
   				hora1='0'+hora1;
   			} 
   			if(minuto1<10){
   				minuto1='0'+minuto1;
   			}
   			
   			hora_actual1=hora1+""+minuto1;
   			
   			//----------------------------------------------------
   			

   		if(hoy >= fecha_inicio_sac && hoy <= fecha_fin_sac)
   			{
   				if(hora_actual1 >= hora_inicio_sac && hora_actual1 <= hora_fin_sac)
   				{
   					var nombreActual = info.innerHTML.split(": ")[1];
   			    	var actual = videos.indexOf(nombreActual);
   			    	this.src =(actual == videos.length - 1 ?videos[0] : videos[actual + 1]);
   			    	info.innerHTML = "Vídeo: " + videos[actual + 1];
   			    	this.play();	
   				}
   				else
   				{
   					stop=1;
   				}
   			}
   			
   			if(stop==1)
   				{
   				alert("ALERTA! - LA PROGRAMACION ACABA DE FINALIZAR VERIFIQUE LAS FECHAS Y HORAS DE REPRODUCCION DEL CONTENIDO MULTIMEDIA");
   				location.reload();
   				}
   			
   		}, false);

   			 }
   		   	 
   		}// FIN IF CONDICIONAL
   		else	
   		{
   			Alerta();
   		}
 
}//FIN FUNCION LOAD

</script>

<script>
function Alerta()
{
var x;
var r=confirm("NO EXISTE PLAYLIST ASOCIADO A ESTE LINK DE PROGRAMACION O EL PLAYLIST ASOCIADO HA TERMINADO SU PERIODO DE TRANSMISION DEFINIDO EN EL SISTEMA - SAC   --|ACEPTAR|-- PARA RECARGAR LA PAGINA");
if (r==true)
  {
	location.reload();
  }
}
</script>



 </head>


<body>


<div style="width: 485px">
<table width="100%"> 
<tr> 
<td>
  
<label id="info"></label>
<video id="reproductor" width="1279" height="799"></video> 

</td> 
</tr> 
</table> 
</div> 
    
</body>
</html>