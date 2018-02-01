<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="./css/Styles_Formularios.css">
<title>Correcto</title>
<style type="text/css">
body {
background-image: url("images/usuarioExiste.jpg");
	background-size:100%;
	 background-repeat: no-repeat;	 
}


</style>

<script type="text/javascript">
var cont = 0;
function contador(){
	 setTimeout("location.href='usuario_registrar.jsp'", 500);
	 var contador = document.getElementById("contador");
	contador.value = cont;
	cont++;
}
</script>

</head>
<body>
<body onLoad="setInterval('contador()',2000);">

</body>
</html>