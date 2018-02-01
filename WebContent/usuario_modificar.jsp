<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="./css/Styles_Formularios.css">
<title>SAC | MODIFICAR USUARIO</title>

<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">
</script>

<script type="text/javascript">

function  consultar()
{
	
	var cedula = $("#cedula").val();
	if(cedula == null || cedula == 'undefined')
	{
	alert("INGRESE NUMERO DE CEDULA VALIDO PARA CONSULTAR..!!")	
	$("#cedula").val("");
	$("#cedula").focus();
	}
	else
   {
		
	var vf= 0;
	
	
	$.ajax({

		type : "GET",
		url : "http://chd-pc:8080/SAC/rest/consulta/consultarUser",
		data : "{}",
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(response) {
			
		//----------------------------------------------
		
		$.each(response, function(index, product) {
		
			if(response[index].login_cedula == cedula)
			{   $("#idUsuario").val(response[index].login_id);
				$("#nombre").val(response[index].login_nombres);
				$("#apellido").val(response[index].login_apellidos);
				$("#usuario").val(response[index].login_user1);
				$("#contrasena").val(response[index].login_password1);
				$('#sex > option[value='+response[index].login_sexo+']').attr('selected', 'selected');
				$('#cargo > option[value=1]').attr('selected', 'selected');
				$('#estado > option[value='+response[index].login_estado+']').attr('selected', 'selected');
				
			
				vf = 1;
			}//fin if
			
		}); // FIN EACH
		
		if(vf==0)
		{
			alert("CEDULA O USUARIO NO VALIDO, NO SE ENCUENTRA EN EL SISTEMA, VUELVA INTENTAR NUEVAMENTE.. O CONTACTE CON SU ADMINISTRADOR DE SISTEMas.");
			location.reload();
		}
		
		
		},
		error : function(response) {
			console.log("error");
		}
	});
	
   }// FIN ELSE
 
} //FIN FUNCION

</script>


</head>

<body>

<center>
<br><b></b><b></b><b></b><b></b><b></b>	
    <div style="text-shadow:1px 1px 1px rgba(0,0,0,1);font-weight:normal;color:#FFFFFF;letter-spacing:1pt;word-spacing:12pt;font-size:24px;text-align:center;font-family:palatino linotype, palatino, serif;line-height:2;">SISTEMA ADMINISTRADOR DE CONTENIDOS</div>

<div style="left: 100px; top: 20px; width: 50px; height: 50px; text-align:left"> 
 <a href="menu_setting.jsp"><IMG src="images/icons/home.png"></a>
 </div>
<b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; 
   </b>
   
    <br><b></b><b></b><br>
<div style="text-shadow:1px 1px 1px rgba(0,0,0,1);BACKGROUND-COLOR: #000000;font-weight:normal;color:#ffffff;letter-spacing:1pt;word-spacing:12pt;font-size:20px;text-align:center;font-family:palatino linotype, palatino, serif;line-height:2;">CONFIGURACIÓN: | MODIFICAR USUARIO</div>     
     <b></b><b></b><br><b></b>


	<div id="user">

		<form name="frmuser" method="post" action="Update_Usuario">
			<center>
			
				<table>
					
					<tr>
						<td>CÉDULA:</td>
						<td><input type="text" name="cedula" id="cedula" maxlength="10" placeholder="CÉDULA PARA CONSULTAR.." required>
						<input type="hidden" name="idUsuario" id="idUsuario">
						<td>
							<IMG SRC="images/consultar_contrasena.png" WIDTH=50 HEIGHT=50 ALT="Consultar" onclick="consultar()">
						</td>
					</tr>
					<tr>
						<td>NOMBRES:</td>
						<td><input type="text" name="nombre" id="nombre" maxlength="50" required>
						</td>
					</tr>
					<tr>
						<td>APELLIDOS:</td>
						<td><input type="text" name="apellido" id="apellido" maxlength="50"
							required></td>
					</tr>
					<tr>
						<td>USUARIO:</td>
						<td><input type="text" name="usuario" id="usuario" required></td>
					</tr>
					<tr>
						<td>CONTRASEÑA:</td>
						<td><input type="text" name="contrasena" id="contrasena" required>
						</td>
					</tr>
					
					<tr>
						<td>SEXO: </td> <td><select name="sex" id="sex">
								<option value="femenino">Femenino</option>
								<option value="masculino">Masculino</option>
						</select></td>
					</tr>
					<tr>	
						<td>CARGO:</td>
						<td> <select name="cargo" id="cargo">	<option value="1">Administrador</option>	</select>	</td>
					</tr>
					<tr>	
						<td>ESTADO:</td>
						<td> <select name="estado" id="estado">	<option value="A">Activo</option> <option value="I">Inactivo</option>	</select>	</td>
					</tr>					<tr>
						<td>
							<button type="submit" name="formusuario" id= guardar value="consultar">GUARDAR</button>
						</td>
					</tr>
				</table>
			</center>

		</form>
	</div>
</center>
</body>
</html>