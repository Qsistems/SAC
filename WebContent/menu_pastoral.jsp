<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language="javascript" type="text/javascript">
	
	//FUNCION DE VALIDACION LOGIN 
	function login() {
		
		alert(sesion.getAttribute("user"));
		
	}// FIN DE LA FINCION DE INICIO

	//EJECUCION DE LA FUNCION INICIO
	window.onload = login;
</script>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="shortcut icon" href="pastoral.ico" />
<link rel="stylesheet" type="text/css" href="css/menu_opciones.css">
<script src="script/jquery.min.js"></script>
<title>Pastoral</title>
<script type="text/javascript">
	$(function() {

		var menu_ul = $('.menu > li > ul'), menu_a = $('.menu > li > a');

		menu_ul.hide();

		menu_a.click(function(e) {
			//e.preventDefault();
			if (!$(this).hasClass('active')) {
				menu_a.removeClass('active');
				menu_ul.filter(':visible').slideUp('normal');
				$(this).addClass('active').next().stop(true, true).slideDown(
						'normal');
			} else {
				$(this).removeClass('active');
				$(this).next().stop(true, true).slideUp('normal');
			}
		});

	});
</script>
</head>
<body>
	<div id="wrapper">
		<ul class="menu">
			<li class="item1"><a href="#">INSCRIPCIONES</a>
				<ul>
					<li class="subitem1"><a href="past_inscripcion_ninos.jsp" target="principal">Pastoral Niños</a></li>
					<li class="subitem2"><a href="past_inscripcion_jovenes.jsp" target="principal">Pastoral Jovenes</a></li>
					<li class="subitem3"><a href="past_inscripcion_adultos.jsp" target="principal">Pastoral Adultos </a></li>
				</ul></li>
			<li class="item2"><a href="#">CONSULTAS</a>
				<ul>
					<li class="subitem1"><a href="past_consultas.jsp"target="principal">Consultas</a></li>
				</ul></li>			
			<li class="item3"><a href="#">REGISTRO COORDINADORES</a>
				<ul>
					<li class="subitem1"><a href="past_registro_coordinador.jsp"target="principal">Ingresar</a></li>
					<li class="subitem2"><a href="past_modificar_Coordinador.jsp" target="principal">Modificar</a></li>
					<li class="subitem3"><a href="past_consultar_Coordinador.jsp" target="principal">Consultar</a></li>
					<li class="subitem4"><a href="past_elimar_Coordinador.jsp" target="principal">Eliminar</a></li>
				</ul></li>
			<li class="item4"><a href="#">REGISTRO ADICIONALES</a>
				<ul>
					<li class="subitem1"><a href="past_horario.jsp" target="principal">Horario</a></li>
					<li class="subitem2"><a href="past_grupo.jsp" target="principal">Grupo</a></li>

				</ul></li>
			<li class="item5"><a href="menu.jsp" target="_parent">MENU PRINCIPAL</a></li>
		</ul>
	</div>
</body>
</html>