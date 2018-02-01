<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 
<script> 

</script>
 
 <link rel="shortcut icon" href="menu.ico" />
 <link  rel="stylesheet"  type="text/css" href="css/stylemenu.css" >
 
 <title>SAC|MENU CONFIGURACIÓN</title>   
         
 </head>
    <body>
    <center>
  <br><b></b><b></b><b></b><b></b><b></b>	
    <div style="text-shadow:1px 1px 1px rgba(0,0,0,1);font-weight:normal;color:#FFFFFF;letter-spacing:1pt;word-spacing:12pt;font-size:28px;text-align:center;font-family:palatino linotype, palatino, serif;line-height:2;">SISTEMA ADMINISTRADOR DE CONTENIDOS</div>
	
	
    <!-- <div style="left: 100px; top: 3px; width: 100%; height: 15px; text-align:right"> 
    <a href="index.jsp">|<strong>LOGOUT</strong>| </a>
    </div>
     -->

    <div style="left: 100px; top: 10px; width: 100%; height: 20px; text-align:right"> 
    <a href="menu_setting.jsp"><IMG src="images/icons/settings.png"></a>
    </div>
        
    <br><b></b><b></b><br><b></b><b></b><br>
<div style="text-shadow:1px 1px 1px rgba(0,0,0,1);BACKGROUND-COLOR: #000000;font-weight:normal;color:#ffffff;letter-spacing:1pt;word-spacing:12pt;font-size:20px;text-align:center;font-family:palatino linotype, palatino, serif;line-height:2;">MENÚ | SELECCIONE UNA OPCIÓN:</div>     
     <b></b><b></b><br><b></b>
     <div class="container" style="width:100%; height:auto;">
     
            <div class="content" style="width:100%; height:auto;">
                <ul class="ca-menu">
                   
                    <li id="uploadContenidos" class="uploadContenidos">
                        <a href="uploadContenidos.jsp">
                            <div class="ca-content">
                                <h2 class="ca-main">MULTIMEDIA</h2>
                            </div>
                        </a>
                    </li>
                   
                    <li id="playList">
                        <a href="playList.jsp">
                            <span class="icon2" ></span>
                            <div class="ca-content">
                                <h2 class="ca-main">PLAYLIST</h2>
                            </div>
                        </a>
                    </li>
                   
                    <li id="programacion">
                        <a href="programacionHoraria.jsp">
                            <div class="ca-content">
                                <h2 class="ca-main">PROGRAMACIÓN</h2>
                            </div>
                        </a>
                     </li>
                    
                    
                      <li id="links">
                        <a href="links.jsp">
                            <div class="ca-content">
                                <h2 class="ca-main">LINKS CONTENIDOS</h2>
                            </div>
                        </a>
                     </li> 
                 
                 </ul>
               </div>
               
         </div>
         
         </center>
         
         <!-- 
         <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
         <TABLE>
         <center>
         <tr>
         <a href="menu_setting.jsp"><IMG src="images/icons/settings.png"></a>
         </tr>
         <tr>
         <p>USERS</p>
         </tr>
         </center>
         </TABLE> -->
      </body>
</html>