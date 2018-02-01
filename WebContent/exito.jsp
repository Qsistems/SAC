<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Correcto</title>
<style type="text/css">
body {
background-image: url("images/registro.jpeg");
	background-size:100%;
	 background-repeat: no-repeat;	 
}

</style>

<script type="text/javascript">
var cont = 0;
function contador(){
	alert("paso");
	 //window.locationf="playList.jsp";
	 setTimeout("location.href='index.jsp'", 500);
	 //window.history.back();
	var contador = document.getElementById("contador");
	contador.value = cont;
	cont++;
}
</script>

</head>
<body onLoad="setInterval('contador()',2000);">
<a href="javascript:window.history.back();">&laquo; REGRESAR</a>
<div style="text-shadow:1px 1px 1px rgba(0,0,0,1);font-weight:normal;color:#B83A0D;letter-spacing:1pt;word-spacing:12pt;font-size:32px;text-align:center;
font-family:palatino linotype, palatino, serif;line-height:1;">SU TRANSACCIÓN SE REALIZO CON ÉXITO</div>
</body>
</html>