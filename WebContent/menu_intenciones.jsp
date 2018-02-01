 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" href="usuario.ico" />
<link rel="stylesheet" type="text/css" href="css/menu_opciones.css">
<script src="script/jquery.min.js"></script>
<title>Intenciones</title>
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
			<li class="item1"><a href="#">REGISTRO DE INTENCIONES</a>
				<ul>
					<li class="subitem1"><a href="intenciones_registro.jsp" target="principal">Registro de Intenciones</a></li>
				</ul></li>
			<li class="item2"><a href="#">CONSULTAS</a>
				<ul>
					<li class="subitem1"><a href="intenciones_consultas.jsp"target="principal">Consultas</a></li>
				</ul></li>			
			<li class="item5"><a href="menu.jsp" target="_parent">MENU PRINCIPAL</a></li>
		</ul>
	</div>
</body>
</html>