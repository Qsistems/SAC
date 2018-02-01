<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="./css/Styles_Formularios.css">

<title>SAC|REGISTRO DE USUARIO</title>


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
<div style="text-shadow:1px 1px 1px rgba(0,0,0,1);BACKGROUND-COLOR: #000000;font-weight:normal;color:#ffffff;letter-spacing:1pt;word-spacing:12pt;font-size:20px;text-align:center;font-family:palatino linotype, palatino, serif;line-height:2;">CONFIGURACIÓN: | REGISTRO USUARIO</div>     
     <b></b><b></b><br><b></b>

	<div id="user">

		<form name="frmuser" method="post" action="Insert_Usuario">
			<center>
				<table>
					 <tr>
						<td>CÉDULA:</td>
						<td><input type="text" name="cedula"  id="cedula" maxlength="10" required>
						</td>
					</tr> 
					<tr>
						<td>NOMBRES:</td>
						<td><input type="text" name="nombre" id="nombre" maxlength="50"required>
						</td>
					</tr>
					<tr>
						<td>APELLIDOS:</td>
						<td><input type="text" name="apellido" id="apellido" maxlength="50"required>
						</td>
					</tr>
					<tr>
						<td>USUARIO:</td>
						<td><input type="text" name="usuario" id="usuario" required>
						</td>
					</tr>
					<tr>
						<td>CONTRASEÑA:</td>
						<td><input type="password" name="contrasena" id="contrasena" required></td>
					</tr>
					<tr>
						<td>SEXO: </td> <td><select name="sex" id="sex">
								<option>- Seleccione -</option>
								<option value="femenino">Femenino</option>
								<option value="masculino">Masculino</option>
						</select></td>
					</tr>
					<tr>	
						<td>CARGO:</td>
						<td> <select name="cargo"  id="cargo"> <option>- Seleccione -</option>	<option value="1">Administrador</option>	</select>	</td>
					</tr>
					<tr>
						<td>
							<button type="submit" name="formusuario" id=guardar ></button>
						</td>
					</tr>
				</table>
			</center>

		</form>

	</div>
</center>
</body>
</html>