package modelo;

import java.awt.PageAttributes.MediaType;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.xml.ws.Response;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

@Path("/consultas")
public class Qp_calificador {
	// variables de conexion
	Connection con = null;

	Statement s = null;// insert statement
	Statement s2 = null;// select IDuser
	Statement s3 = null;// select serviceKey
	Statement s4 = null;// select branchID
	Statement s5 = null;// select servicePointKey
	Statement s6 = null;// select markkey
	Statement s7 = null;// select queueType
	Statement s8 = null;// select queueType
	Statement s9 = null;// select queueType
	PreparedStatement pst = null;
	ResultSet rs = null;
	ResultSet rs2 = null;
	ResultSet rs3 = null;
	ResultSet rs4 = null;
	ResultSet rs5 = null;
	ResultSet rs6 = null;
	ResultSet rs7 = null;
	ResultSet rs8 = null;
	ResultSet rs9 = null;
	String linea = null;
	String cadena = null;
	String decryptedPassword = null;
	// String url = "jdbc:sqlserver://localhost:1433;databaseName=qp_central";
//parametro horario
	static String dia_horario;
	String urlStat = "jdbc:sqlserver://localhost:1433;databaseName=sistNSR";

	String id = "sa";
	String pass = "123";

	List<String> results;
	String prueba = null;
	String[][] arregloMovil;
	
	
	 public static void captura(HttpServletRequest request) 
	    { 
	        if(request.getParameter("dias") != null) 
	        { 
	        	
	        	dia_horario = request.getParameter("dias");
	        }
	        
	    }

	@GET
	@Path("/consultusuario")
	public String getPlain() {

		String login_user = "sa";
		String login_password = "123";
		String url = "jdbc:sqlserver://localhost:1433;databaseName=sistNSR";
		// PrintWriter out = response.getWriter();
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn = DriverManager.getConnection(url, login_user,
					login_password);
			System.out.println("connected");
			String state_id;
			String state;
			String nombreUser;
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM login_users where login_estado='A'");
			//JsonObject obj = new JsonObject();
			// out.println("[");
			int contador = 0;
			String result = "";
			
			
			result+= "[";
			while (rs.next()) {
				state_id = rs.getString(1);
				state = rs.getString(2);
				nombreUser= rs.getString(3);
			//	contador++;
				result += "{";
				
				result += "\"id_usuario\":";

				result += "\"" + state_id + "\",";

				result += "\"Cedula\":";
				result += "\"" + state + "\",";
				
				result += "\"NombreUsuario\":";
				result += "\"" + nombreUser + "\"";
				
				result += "}";

				result += ",";
			}
			result = result.substring(0, result.length() - 1);
			result += "]";
			
			
			return result;
			// out.println(obj);
			// out.println("]");

		} catch (Exception e) {
			// response.sendRedirect("error.jsp");
			e.printStackTrace();
		}
		return null;

	}

	
	
	@GET
	@Path("/consultacategoria")
	public String getPlain2() {

		String login_user = "sa";
		String login_password = "123";
		String url = "jdbc:sqlserver://localhost:1433;databaseName=sistNSR";
		// PrintWriter out = response.getWriter();
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn = DriverManager.getConnection(url, login_user,
					login_password);
			System.out.println("connected");
			String cat_inscr_id;
			String cat_inscr_tipo;
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM categoria_inscripcion where cat_inscrip_tipo = 'niños' or cat_inscrip_tipo = 'jovenes' or cat_inscrip_tipo = 'adulto' ");
			
			String result = "";
			
			
			result+= "[";
			while (rs.next()) {
				cat_inscr_id = rs.getString(1);
				cat_inscr_tipo = rs.getString(2);
				
				result += "{";
				
				result += "\"cat_inscr_id\":";

				result += "\"" + cat_inscr_id + "\",";

				result += "\"cat_inscr_tipo\":";
				result += "\"" + cat_inscr_tipo + "\"";
				
								
				result += "}";

				result += ",";
			}
			result = result.substring(0, result.length() - 1);
			result += "]";
			
			
			return result;
			// out.println(obj);
			// out.println("]");

		} catch (Exception e) {
			// response.sendRedirect("error.jsp");
			e.printStackTrace();
		}
		return null;

	}
	
	@GET
	@Path("/consultas")
	public String getPlain3() {

		String login_user = "sa";
		String login_password = "123";
		String url = "jdbc:sqlserver://localhost:1433;databaseName=sistNSR";
		// PrintWriter out = response.getWriter();
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn = DriverManager.getConnection(url, login_user,
					login_password);
			System.out.println("connected");
			String nombre;
			String apellido;
			String nomb_grup;
			String dia;
			String hora_ini;
			String hora_fin;
			String grupo_id;
			
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT rg.grupo_id_pk, rg.grupo_nombre_grupo,p.persona_nombre,p.persona_apellido,rh.horario_dia,rh.horario_hora_inicio,rh.horario_hora_fin FROM cargo c,categoria_inscripcion ci,inscripciones_pastoral ip,personas p,registro_grupo rg,registro_horario rh WHERE  ip.persona_id_fk=p.persona_id AND ip.cat_grupo_id_fk = ci.cat_inscr_id AND ip.grupo_id_fk=rg.grupo_id_pk AND p.persona_id=rg.persona_id_fk AND c.cargo_id=p.cargo_id_fk AND rg.horario_id_fk = rh.horario_id_pk ");


			String result = "";
			
			
			result+= "[";
			while (rs.next()) {
				grupo_id = rs.getString(1); //inscripciones_id
				nomb_grup=rs.getString(2);//nombre_grupo
				nombre = rs.getString(3);//persona_nombre_coord
				apellido= rs.getString(4); // persona_apellido_coord
				dia=rs.getString(5); // 
				hora_ini=rs.getString(6);
				hora_fin=rs.getString(7);
				result += "{";
				
				result += "\"grupo_id\":";
				result += "\"" + grupo_id + "\",";

				result += "\"nomb_grup\":";
				result += "\"" + nomb_grup + "\",";

				result += "\"nombre\":";
				result += "\"" + nombre + "\",";
				
				result += "\"apellido\":";
				result += "\"" + apellido + "\",";

				result += "\"dia\":";
				result += "\"" + dia + "\",";
				
				result += "\"hora_ini\":";
				result += "\"" + hora_ini + "\",";
				
				result += "\"hora_fin\":";
				result += "\"" + hora_fin + "\"";
				
				result += "}";

				result += ",";
			}
			
			result = result.substring(0, result.length() - 1);
			result += "]";
			
			
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}
	
	
	///consultas para mostrar datos en Formularios de Inscripciones 
	@GET
	@Path("/consultcoord")
	public String getcoord() {

		String login_user = "sa";
		String login_password = "123";
		String url = "jdbc:sqlserver://localhost:1433;databaseName=sistNSR";
		// PrintWriter out = response.getWriter();
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn = DriverManager.getConnection(url, login_user,
					login_password);
			System.out.println("connected");
			String coord_id;
			String nombre;
			String apellido;
			String nomb_grup;
			String dia;
			//String anio;
			String hora_ini;
			String hora_fin;
			
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT ip.inscripciones_id, p.persona_nombre , p.persona_apellido , rh.horario_dia , rh.horario_hora_inicio, rh.horario_hora_fin, rg.grupo_nombre_grupo " +
					" FROM cargo c,categoria_inscripcion ci,inscripciones_pastoral ip,personas p,registro_grupo rg,registro_horario rh" +
					" WHERE ip.persona_id_fk=p.persona_id AND ip.cat_grupo_id_fk = ci.cat_inscr_id AND ip.grupo_id_fk=rg.grupo_id_pk" +
					" AND p.persona_id=rg.persona_id_fk AND c.cargo_id=p.cargo_id_fk AND rg.horario_id_fk = rh.horario_id_pk -- AND C.cargo_tipo_cargo = '2'");
			
			
			//JsonObject obj = new JsonObject();
			// out.println("[");
			int contador = 0;
			String result = "";
			
			
			result+= "[";
			while (rs.next()) {
				coord_id = rs.getString(1); //inscripciones_id
				nombre = rs.getString(2);//persona_nombre
				apellido= rs.getString(3); // persona_apellido
				dia=rs.getString(4); // 
			    //anio=rs.getString(32);//
				hora_ini=rs.getString(5);
				hora_fin=rs.getString(6);
				nomb_grup=rs.getString(7);
			//	contador++;
				result += "{";
				
				result += "\"id_coord\":";

				result += "\"" + coord_id + "\",";

				result += "\"nombre\":";
				result += "\"" + nombre + "\",";
				
				result += "\"apellido\":";
				result += "\"" + apellido + "\",";
				
				result += "\"nomb_grup\":";
				result += "\"" + nomb_grup + "\",";

				result += "\"dia\":";
				result += "\"" + dia + "\",";
				
				result += "\"hora_ini\":";
				result += "\"" + hora_ini + "\",";
				
				result += "\"hora_fin\":";
				result += "\"" + hora_fin + "\"";
				
				result += "}";

				result += ",";
			}
			result = result.substring(0, result.length() - 1);
			result += "]";
			
			
			return result;
	

		} catch (Exception e) {
			// response.sendRedirect("error.jsp");
			e.printStackTrace();
		}
		return null;

	}
	///consultas para mostrar datos en Formularios de Registro de Grupo Coordinador
	@GET
	@Path("/consult_coord_grup")
	public String getgrupo() {

		String login_user = "sa";
		String login_password = "123";
		String url = "jdbc:sqlserver://localhost:1433;databaseName=sistNSR";
		// PrintWriter out = response.getWriter();
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn = DriverManager.getConnection(url, login_user,
					login_password);
			System.out.println("connected");
			String coord_id;
			String nombre;
			String apellido;
			
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT persona_id, persona_nombre, persona_apellido FROM personas WHERE cargo_id_fk='2' ");
		
			//JsonObject obj = new JsonObject();
			// out.println("[");
			int contador = 0;
			String result = "";
			
			
			result+= "[";
			while (rs.next()) {
				coord_id = rs.getString(1); //inscripciones_id
				nombre = rs.getString(2);//persona_nombre
				apellido= rs.getString(3); // persona_apellido
			//	contador++;
				result += "{";
				
				result += "\"id_coord\":";
				result += "\"" + coord_id + "\",";

				result += "\"nombre\":";
				result += "\"" + nombre + "\",";
				
				result += "\"apellido\":";
				result += "\"" + apellido + "\"";
				
				
				result += "}";

				result += ",";
			}
			result = result.substring(0, result.length() - 1);
			result += "]";
			
			
			return result;
	

		} catch (Exception e) {
			// response.sendRedirect("error.jsp");
			e.printStackTrace();
		}
		return null;

	}
	///consultas para mostrar datos en Formularios de Registro de Grupo
	@GET
	@Path("/consult_horario_grup")
	public String getgrupo2() {

		String login_user = "sa";
		String login_password = "123";
		String url = "jdbc:sqlserver://localhost:1433;databaseName=sistNSR";
		// PrintWriter out = response.getWriter();
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn = DriverManager.getConnection(url, login_user,
					login_password);
			System.out.println("connected");
			String horario_id;
			String dia;
			String hora_ini;
			String hora_fin;
			
			Statement stmt = conn.createStatement();
			//ResultSet rs = stmt.executeQuery("SELECT DISTINCT horario_dia FROM registro_horario");
			ResultSet rs = stmt.executeQuery("SELECT distinct(horario_dia) FROM [sistNSR].[dbo].[registro_horario] WHERE cat_inscr_id_fk between 1 and 3");
			
			
			//JsonObject obj = new JsonObject();
			// out.println("[");
			int contador = 0;
			String result = "";
			
			
			result+= "[";
			while (rs.next()) {
				horario_id = rs.getString(1); //
				//dia = rs.getString(2);//
				
			//	contador++;
				result += "{";
				
				result += "\"dia\":";
				result += "\"" + horario_id + "\"";
				
				//result += "\"dia\":";
				//result += "\"" + dia + "\"";
				
				
				
				result += "}";

				result += ",";
			}
			result = result.substring(0, result.length() - 1);
			result += "]";
			
			
			return result;
	

		} catch (Exception e) {
			// response.sendRedirect("error.jsp");
			e.printStackTrace();
		}
		return null;

	}
	
	

	///consultas para mostrar datos en Formularios de Registro de Grupo
	@GET
	@Path("/consult_horario_grup2")
	public String getgrupo3() {
		
		String login_user = "sa";
		String login_password = "123";
		String url = "jdbc:sqlserver://localhost:1433;databaseName=sistNSR";
		// PrintWriter out = response.getWriter();
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn = DriverManager.getConnection(url, login_user,
					login_password);
			System.out.println("connected");
			String horario_id;
			String hora_ini;
			String horario_dia;
			String hora_fin;
			String categoria_id;
			
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT horario_dia, horario_id_pk, horario_hora_inicio,horario_hora_fin,cat_inscr_id_fk FROM registro_horario WHERE cat_inscr_id_fk between 1 and 3");
			String result = "";
			
			
			result+= "[";
			while (rs.next()) {
				horario_dia = rs.getString(1);
				horario_id = rs.getString(2); //
				hora_ini= rs.getString(3);
				hora_fin= rs.getString(4);//
				categoria_id = rs.getString(5);
			//	contador++;
				result += "{";
				
				result += "\"horario_dia\":";
				result += "\"" + horario_dia + "\",";
				
				result += "\"horario_id\":";
				result += "\"" + horario_id + "\",";
				
				result += "\"hora_ini\":";
				result += "\"" + hora_ini + "\",";
				
				result += "\"hora_fin\":";
				result += "\"" + hora_fin + "\",";
				
				result += "\"categoria_id\":";
				result += "\"" + categoria_id + "\"";
				
				result += "}";

				result += ",";
			}
			result = result.substring(0, result.length() - 1);
			result += "]";
			
			
			return result;
	

		} catch (Exception e) {
			// response.sendRedirect("error.jsp");
			e.printStackTrace();
		}
		return null;

	}
	//------------------------------------------
	@SuppressWarnings("null")
	@GET
	@Path("/addCalificacion")
	// @Produces(MediaType.TEXT_PLAIN)
	public String getSaludoHTML(
			@QueryParam("id_calificacion") int calificaciontKey,
			@QueryParam("cedula") int cedulaKey,
			@QueryParam("id_pregunta") int preguntaKey,
			@QueryParam("id_subpregunta") int subpreguntatKey

	) throws SQLException {
		// parametros que recibe para realizar las diferentes busquedas
		// de valores que se encesitaran para guardar

		// String result = "hello world";

		try {

			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			try {
				con = java.sql.DriverManager.getConnection(urlStat, id, pass);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} catch (ClassNotFoundException cnfex) {
			cnfex.printStackTrace();

		}
		String sqlIdGrupo = "select grupo_marca as gm_cc from qp_calificador.dbo.calificacion_calificador cc where id='"
				+ calificaciontKey
				+ "' and grupo_marca in(select id as id_gc from qp_calificador.dbo.grupo_calificador  gc)";

		String sqlIdGrupo_original = null;
		// String servicekeyOriginal = null;

		try {
			s2 = con.createStatement();
			rs2 = s2.executeQuery(sqlIdGrupo);
			while (rs2.next()) {
				sqlIdGrupo_original = rs2.getString("gm_cc");

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			if (rs2 != null)
				rs2.close();

			if (s2 != null)
				s2.close();

		}

		/*
		 * Gson gson = new Gson(); String json = gson.toJson(arregloMovil);
		 * 
		 * 
		 * return json ;
		 */
		// retornio de todos los valores correctos para el guardado de las
		// marcas usando el CFU.
		// de Orchestra.
		return "" + calificaciontKey + "," + cedulaKey + ", " + preguntaKey
				+ ", " + subpreguntatKey;
	}

	@GET
	@Path("/verify")
	// @Produces(MediaType.TEXT_PLAIN)
	public String verifyRESTService(InputStream incomingData) {
		String result = "CrunchifyRESTService Successfully started..";

		// return HTTP response 200 in case of success
		return "Hola ";
	}

}
