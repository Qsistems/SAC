<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    	               "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="Lgp85-Magic-Christmas-My-Documents.ico" />
<link rel="stylesheet" type="text/css" href="css/stylelogin.css">
<script src="script/jquery.min.js"></script>
<title>SAC</title>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('#submit')
								.click(
										function() {
											var username = $('#user').val();
											var password = $('#password').val();
											if (username == "") {
												$('#dis')
														.slideDown()
														.html(
																"<span>Usuario Obligatorio</span>");
												return false;
											}
											if (password == "") {
												$('#dis')
														.slideDown()
														.html(
																'<span id="error">contraseña es necesario.</span>');
												return false;
											}
										});
					});
</script>
</head>

<body>

	<center>
	<br>
	
<div style="text-shadow:1px 1px 1px rgba(0,0,0,1);font-weight:normal;color:#ffffff;letter-spacing:1pt;word-spacing:12pt;font-size:32px;text-align:center;font-family:palatino linotype, palatino, serif;line-height:1;">| SISTEMA ADMINISTRADOR DE CONTENIDOS |</div>

<div style="text-shadow:1px 1px 1px rgba(0,0,0,1);font-weight:normal;color:#ffffff;letter-spacing:1pt;word-spacing:12pt;font-size:32px;text-align:center;font-family:palatino linotype, palatino, serif;line-height:1;"><strong>S.A.C.</strong></div>


			<br><br><br>
			
			<form method="post" action="login" name="ingresos">
			<center>
			<fieldset style="width: 500px;" >
			<br>
			<table>
		
				<tr>
				
				
				  <input type="text" name="user" id="user" size="60" placeholder="Usuario:" required/><br />  
				
				</tr>
				
				<tr>	
					
				
					<input type="password" name="password" id="password" size="60" placeholder="Clave:" required/><br /> <br /> 
				
				</tr>
				
				
					
			</table>
				<center>
					<input type="submit" name="Ingresar" value = "INGRESAR" id="submit" />
				</center>
		</fieldset>
		
		</center>
	<a href="reestablecercontrasena.jsp"><p style="font-size:12px"><font face="Comic Sans MS,arial,verdana">¿olvidaste tu contraseña?</font></p></a>
			</form>

		
	</center>

</body>
</html>
