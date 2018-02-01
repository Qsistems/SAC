<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
			<li class="item1"><a href="#">INSCRIPCIONES </a>
		            <ul>
		                <li class="subitem1"><a href="sacra_inscripcion_bautizo.jsp" target="principal">Bautizo</a></li>
		                <li class="subitem2"><a href="sacra_inscripcion_comunion.jsp" target="principal">Comunion </a></li>
		                <li class="subitem3"><a href="sacra_inscripcion_confirmacion.jsp" target="principal">Confirmacion</a></li>
		                <li class="subitem4"><a href="sacra_inscripcion_matrimonio.jsp" target="principal">Matrimonio</a></li>
		            </ul>
		        </li>
		        <li class="item2"><a href="#">APROBACIONES</a>
		            <ul>
		                <li class="subitem1"><a href="sacra_aprobaciones_bautizo.jsp" target="principal">Bautizo</a></li>
		                <li class="subitem2"><a href="sacra_aprobacion_comunion.jsp"target="principal">Comunion</a></li>
		                <li class="subitem3"><a href="#"target="principal">Confirmacion</a></li>
		                <li class="subitem4"><a href="#"target="principal">Matrimonio</a></li>
		            </ul>
		        </li>
		        <li class="item3"><a href="#">CONSULTAS</a>
		            <ul>
		                <li class="subitem1"><a href="#" target="principal">Bautizo</a></li>
		                <li class="subitem2"><a href="#" target="principal">Comunion</a></li>
		                <li class="subitem3"><a href="#" target="principal">Confirmacion</a></li>
		                <li class="subitem3"><a href="#" target="principal">Matrimonio</a></li>
		            </ul>
		        </li>
		        <li class="item4"><a href="#">REGISTRO CATEQUISTAS</a>
		            <ul>
		                <li class="subitem1"><a href="sacra_registro_catequista.jsp" target="principal">Ingresar</a></li>
		                <li class="subitem2"><a href="sacra_modificar_catequista.jsp" target="principal">Modificar</a></li>
		            </ul>		        </li>
			<li class="item5"><a href="menu.jsp" target="_parent">MENU PRINCIPAL</a></li>
		</ul>
	</div>
</body>
</html>