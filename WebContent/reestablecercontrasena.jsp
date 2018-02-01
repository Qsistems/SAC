<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    	               "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="Lgp85-Magic-Christmas-My-Documents.ico" />
<link rel="stylesheet" type="text/css" href="css/stylelogin.css">
<script src="script/jquery.min.js"></script>
<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">
</script>
<title>SAC | RECUPERAR CONTRASEÑA </title>

<script type="text/javascript">

function  consultar()
{
	
	var cedula = $("#cedula").val();
	var user = $("#user").val();
	var vf= 0;
	
	
	$.ajax({

		type : "GET",
		url : "http://chd-pc:8080/SAC/rest/consulta/loginUser",
		data : "{}",
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(response) {
			
		//----------------------------------------------
		
	    
		$.each(response, function(index, product) {
		
			if(response[index].login_cedula == cedula && response[index].login_users == user)
			{
				
				$("#password").val(response[index].login_passwords);
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

 
} //FIN FUNCION

</script>
</head>

<body>

	<center>
	<br>
	
<div style="text-shadow:1px 1px 1px rgba(0,0,0,1);font-weight:normal;color:#ffffff;letter-spacing:1pt;word-spacing:12pt;font-size:32px;text-align:center;font-family:palatino linotype, palatino, serif;line-height:1;">|| SISTEMA ADMINISTRADOR DE CONTENIDOS ||</div>

<div style="text-shadow:1px 1px 1px rgba(0,0,0,1);font-weight:normal;color:#ffffff;letter-spacing:1pt;word-spacing:12pt;font-size:32px;text-align:center;font-family:palatino linotype, palatino, serif;line-height:1;"><strong>S.A.C.</strong></div>


			<br><br><br>
			
			<form method="post" action="login" name="ingresos">
			<center>
			<fieldset style="width: 500px;" >
			<br>
			<table>
		
				<tr>
				
				
				  <p> <strong> RECUPERACION DE CONTRASEÑA: </strong></p>  
				<br>
				</tr>
				
				
				<tr>
				
				
				  <input type="number" name="cedula" id="cedula" size="60" placeholder="Ingrese Cédula de identidad:" required/><br />  
				
				</tr>
				
				<tr>	
					
				
					<input type="text" name="user" id="user" size="60" placeholder="Ingrese nombre de usuario" required/><br /> <br /> 
				    
				    <IMG SRC="images/consultar_contrasena.png" WIDTH=50 HEIGHT=50 ALT="Consultar" onclick="consultar()">
				
				</tr>
				
				
				<tr>	
					
				
					<p>CONSULTAR.</p><br> 
				
				</tr>
				
				<tr>	
					
				
					<input type="text" name="password" id="password" size="60" placeholder="Contraseña..." required/><br /> <br /> 
				
				</tr>
				
				
					
			</table>
				<center>
					<input type="submit" onclick="login.jsp" value="Login">
				</center>
		</fieldset>
		
		</center>
			</form>

		
	</center>

</body>
</html>
