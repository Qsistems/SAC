package servletSac;

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

@Path("/consulta")
public class restSac {
	// variables de conexion
	Connection con = null;

	Statement s = null;
	Statement s2 = null;
	Statement s3 = null;
	Statement s4 = null;
	Statement s5 = null;
	Statement s6 = null;
	Statement s7 = null;
	Statement s8 = null;
	Statement s9 = null;
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
	
	static String dia_horario;
	String urlStat = "jdbc:sqlserver://chd-pc:1433;databaseName=sistNSR";

	String id = "sa";
	String pass = "123";

	List<String> results;
	String prueba = null;
	String[][] arregloMovil;
	
	
	//-----------------------------------------------------------------------------
	
	@GET
	@Path("/listaUltimosVideos")
	public String getPlain() {

		String login_user = "sa";
		String login_password = "123";
		String url = "jdbc:sqlserver://chd-pc:1433;databaseName=SAC";
		// PrintWriter out = response.getWriter();
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn = DriverManager.getConnection(url, login_user,
					login_password);
			System.out.println("connected");
			
			String lista_multimedia_nombre;
			String lista_multimedia_ruta;
			String lista_multimedia_tipo;
			
			Statement stmt = conn.createStatement();
			
			ResultSet rs = stmt.executeQuery("select top 3 lista_multimedia_nombre,lista_multimedia_ruta,lista_multimedia_tipo from lista_multimedia where lista_multimedia_tipo = 'video/mp4' or lista_multimedia_tipo = 'video/webm' order by lista_multimedia_id DESC");
			
			String result = "";
			
			
			result+= "[";
			while (rs.next()) {
			
				lista_multimedia_nombre = rs.getString(1);
				lista_multimedia_ruta = rs.getString(2);
				lista_multimedia_tipo= rs.getString(3);
	
				
				result += "{";
				
				result += "\"lista_multimedia_nombre\":";

				result += "\"" + lista_multimedia_nombre + "\",";

				result += "\"lista_multimedia_ruta\":";
				result += "\"" + lista_multimedia_ruta + "\",";
				
				result += "\"lista_multimedia_tipo\":";
				result += "\"" + lista_multimedia_tipo + "\"";
				
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
	
	//---------------------------------------------------------------------------------
	

	@GET
	@Path("/listaUltimasImagenes")
	public String getPlain1() {

		String login_user = "sa";
		String login_password = "123";
		String url = "jdbc:sqlserver://chd-pc:1433;databaseName=SAC";
		// PrintWriter out = response.getWriter();
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn = DriverManager.getConnection(url, login_user,
					login_password);
			System.out.println("connected");
			
			String lista_multimedia_nombre;
			String lista_multimedia_ruta;
			String lista_multimedia_tipo;
			
			Statement stmt = conn.createStatement();
			
			ResultSet rs = stmt.executeQuery("select top 3 lista_multimedia_nombre,lista_multimedia_ruta,lista_multimedia_tipo from lista_multimedia where lista_multimedia_tipo = 'image/png' or lista_multimedia_tipo = 'image/jpg' order by lista_multimedia_id DESC");
			
			String result = "";
			
			
			result+= "[";
			while (rs.next()) {
			
				lista_multimedia_nombre = rs.getString(1);
				lista_multimedia_ruta = rs.getString(2);
				lista_multimedia_tipo= rs.getString(3);
	
				
				result += "{";
				
				result += "\"lista_multimedia_nombre\":";

				result += "\"" + lista_multimedia_nombre + "\",";

				result += "\"lista_multimedia_ruta\":";
				result += "\"" + lista_multimedia_ruta + "\",";
				
				result += "\"lista_multimedia_tipo\":";
				result += "\"" + lista_multimedia_tipo + "\"";
				
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

//-----------------------USADO EN REPRODUCTOR JSP------------------------------------
	

	@GET
	@Path("/listaMediaReproductor")
	public String getPlain15() {

		String login_user = "sa";
		String login_password = "123";
		String url = "jdbc:sqlserver://chd-pc:1433;databaseName=SAC";
		// PrintWriter out = response.getWriter();
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn = DriverManager.getConnection(url, login_user,
					login_password);
			System.out.println("connected");
			
			String lista_multimedia_id;
			String lista_multimedia_nombre;
			
			Statement stmt = conn.createStatement();
			
			ResultSet rs = stmt.executeQuery("select lista_multimedia_id,lista_multimedia_nombre from lista_multimedia");
			
			String result = "";
			
			
			result+= "[";
			while (rs.next()) {
			
				lista_multimedia_id = rs.getString(1);
				lista_multimedia_nombre = rs.getString(2);
				
				
				result += "{";
				
				result += "\"lista_multimedia_id\":";
				result += "\"" + lista_multimedia_id + "\",";

				result += "\"lista_multimedia_nombre\":";
				result += "\"" + lista_multimedia_nombre + "\"";
				
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
//--------------------------------------------------------------------------------------------------
	
	//--------------------------------------------------------------------------------------------------
		
	@GET
	@Path("/listaMultimedia")
	public String getPlain2() {

		String login_user = "sa";
		String login_password = "123";
		String url = "jdbc:sqlserver://chd-pc:1433;databaseName=SAC";
		// PrintWriter out = response.getWriter();
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn = DriverManager.getConnection(url, login_user,
					login_password);
			System.out.println("connected");
			
			String lista_multimedia_id;
			String lista_multimedia_nombre;
			String lista_multimedia_ruta;
			String lista_multimedia_tipo;
			
			Statement stmt = conn.createStatement();
			
			ResultSet rs = stmt.executeQuery("select lista_multimedia_id,lista_multimedia_nombre,lista_multimedia_ruta,lista_multimedia_tipo from lista_multimedia where lista_multimedia_tipo = 'video/mp4' or lista_multimedia_tipo = 'video/webm'  or lista_multimedia_tipo = 'image/png'  or lista_multimedia_tipo = 'image/jpeg' order by lista_multimedia_id,lista_multimedia_tipo ASC");
			
			String result = "";
			
			
			result+= "[";
			while (rs.next()) {
			
				lista_multimedia_id = rs.getString(1);
				lista_multimedia_nombre = rs.getString(2);
				lista_multimedia_ruta = rs.getString(3);
				lista_multimedia_tipo= rs.getString(4);
	
				
				result += "{";
				
				result += "\"lista_multimedia_id\":";

				result += "\"" + lista_multimedia_id + "\",";
				
				result += "\"lista_multimedia_nombre\":";

				result += "\"" + lista_multimedia_nombre + "\",";

				result += "\"lista_multimedia_ruta\":";
				result += "\"" + lista_multimedia_ruta + "\",";
				
				result += "\"lista_multimedia_tipo\":";
				result += "\"" + lista_multimedia_tipo + "\"";
				
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

	//--------------------------------------------------------------------------------------------------------

	//--------------------------------------------------------------------------------------------------
	
		@GET
		@Path("/listaUltimosPlaylist")
		public String getPlain3() {

			String login_user = "sa";
			String login_password = "123";
			String url = "jdbc:sqlserver://chd-pc:1433;databaseName=SAC";
			// PrintWriter out = response.getWriter();
			try {
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
				Connection conn = DriverManager.getConnection(url, login_user,
						login_password);
				System.out.println("connected");
				
				String playlist_nombre;
				String playlist_descripcion;
				String playlist_fecha_creacion;
				
				Statement stmt = conn.createStatement();
				
				ResultSet rs = stmt.executeQuery("select TOP 7 playlist_nombre,playlist_descripcion,playlist_fecha_creacion from playlist ORDER BY playlist_id desc");
				
				String result = "";
				
				
				result+= "[";
				while (rs.next()) {
				
					playlist_nombre = rs.getString(1);
					playlist_descripcion = rs.getString(2);
					playlist_fecha_creacion = rs.getString(3);
					
					
					result += "{";
					
					result += "\"playlist_nombre\":";

					result += "\"" + playlist_nombre + "\",";
					
					result += "\"playlist_descripcion\":";

					result += "\"" + playlist_descripcion + "\",";

					result += "\"playlist_fecha_creacion\":";
					result += "\"" + playlist_fecha_creacion + "\"";
					
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

		//--------------------------------------------------------------------------------------------------------

		//--------------------------------------------------------------------------------------------------
		
			@GET
			@Path("/listaPlayList")
			public String getPlain4() {

				String login_user = "sa";
				String login_password = "123";
				String url = "jdbc:sqlserver://chd-pc:1433;databaseName=SAC";
				// PrintWriter out = response.getWriter();
				try {
					Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
					Connection conn = DriverManager.getConnection(url, login_user,
							login_password);
					System.out.println("connected");
					
					String playlist_id;
					String playlist_nombre;
					
					Statement stmt = conn.createStatement();
					
					ResultSet rs = stmt.executeQuery("select playlist_id,playlist_nombre from playlist");
					
					String result = "";
					
					
					result+= "[";
					while (rs.next()) {
					
						playlist_id = rs.getString(1);
						playlist_nombre = rs.getString(2);
						
						
						result += "{";
						
												
						result += "\"playlist_id\":";

						result += "\"" + playlist_id + "\",";

						result += "\"playlist_nombre\":";
						result += "\"" + playlist_nombre + "\"";
						
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
			
//-----------------PROGRAMACION FILTRADO LOS QUE ESTAN ACTIVO------------------------------------
			@GET
			@Path("/listaPlayList2")
			public String getPlain13() {

				String login_user = "sa";
				String login_password = "123";
				String url = "jdbc:sqlserver://chd-pc:1433;databaseName=SAC";
				// PrintWriter out = response.getWriter();
				try {
					Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
					Connection conn = DriverManager.getConnection(url, login_user,
							login_password);
					System.out.println("connected");
					
					String playlist_id;
					String playlist_nombre;
					
					Statement stmt = conn.createStatement();
					
					ResultSet rs = stmt.executeQuery("select playlist_id,playlist_nombre from playlist WHERE playlist_estado='1'");
					
					String result = "";
					
					
					result+= "[";
					while (rs.next()) {
					
						playlist_id = rs.getString(1);
						playlist_nombre = rs.getString(2);
						
						
						result += "{";
						
												
						result += "\"playlist_id\":";

						result += "\"" + playlist_id + "\",";

						result += "\"playlist_nombre\":";
						result += "\"" + playlist_nombre + "\"";
						
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
			
//--------------------------------------------------------------------------------------------------

			
			@GET
			@Path("/listaUltimasProgramacion")
			public String getPlain5() {

				String login_user = "sa";
				String login_password = "123";
				String url = "jdbc:sqlserver://chd-pc:1433;databaseName=SAC";
				// PrintWriter out = response.getWriter();
				try {
					Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
					Connection conn = DriverManager.getConnection(url, login_user,
							login_password);
					System.out.println("connected");
					
					String programacion_nombre;
					String playlist_nombre;
					String programacion_fecha_inicio;
					String programacion_fecha_fin;
					String programacion_fecha_creacion;
					
					Statement stmt = conn.createStatement();
					
					ResultSet rs = stmt.executeQuery("select top 5 pr.programacion_nombre,pl.playlist_nombre,pr.programacion_fecha_inicio,pr.programacion_fecha_fin,pr.programacion_fecha_creacion from programacion pr, playlist pl where pl.playlist_id = pr.playlist_id_fk order by pr.programacion_id desc");
					
					String result = "";
					
					
					result+= "[";
					while (rs.next()) {
					
						programacion_nombre = rs.getString(1);
						playlist_nombre = rs.getString(2);
						programacion_fecha_inicio = rs.getString(3);
						programacion_fecha_fin = rs.getString(4);
						programacion_fecha_creacion = rs.getString(5);
						
						result += "{";
						
												
						result += "\"programacion_nombre\":";

						result += "\"" + programacion_nombre + "\",";

						result += "\"playlist_nombre\":";

						result += "\"" + playlist_nombre + "\",";

						result += "\"programacion_fecha_inicio\":";

						result += "\"" + programacion_fecha_inicio + "\",";

						result += "\"programacion_fecha_fin\":";

						result += "\"" + programacion_fecha_fin + "\",";

						
						result += "\"programacion_fecha_creacion\":";
						result += "\"" + programacion_fecha_creacion + "\"";
						
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

///----------------------------------------------------------------------------------------

//-----------------------------MODIFICAR PROGRAMACION HORARIA.JSP---------------------------------------------------------------------
			
			@GET
			@Path("/listaProgramacion")
			public String getPlain12() {

				String login_user = "sa";
				String login_password = "123";
				String url = "jdbc:sqlserver://chd-pc:1433;databaseName=SAC";
				// PrintWriter out = response.getWriter();
				try {
					Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
					Connection conn = DriverManager.getConnection(url, login_user,
							login_password);
					System.out.println("connected");
					
					String programacion_id;
					String programacion_nombre;
					String programacion_descripcion;
					String programacion_fecha_inicio;
					String programacion_fecha_fin;
					String programacion_hora_inicio;
					String programacion_hora_fin;
					String playlist_nombre;
					String programacion_estado;
					
					Statement stmt = conn.createStatement();
					
					ResultSet rs = stmt.executeQuery("select  pr.programacion_id,programacion_nombre,pr.programacion_descripcion,pr.programacion_fecha_inicio,pr.programacion_fecha_fin,pr.programacion_hora_inicio,programacion_hora_fin,pl.playlist_nombre,programacion_estado from programacion pr, playlist pl where pl.playlist_id = pr.playlist_id_fk");
					
					String result = "";
					
					
					result+= "[";
					while (rs.next()) {
					
						programacion_id= rs.getString(1);
						programacion_nombre= rs.getString(2);
						programacion_descripcion= rs.getString(3);
						programacion_fecha_inicio= rs.getString(4);
						programacion_fecha_fin= rs.getString(5);
						programacion_hora_inicio= rs.getString(6);
						programacion_hora_fin= rs.getString(7);
						playlist_nombre= rs.getString(8);
						programacion_estado= rs.getString(9);
						
						result += "{";
						
												
						result += "\"programacion_id\":";
						result += "\"" + programacion_id + "\",";


						result += "\"programacion_nombre\":";
						result += "\"" + programacion_nombre + "\",";

						
						result += "\"programacion_descripcion\":";
						result += "\"" + programacion_descripcion + "\",";
						
						
						result += "\"programacion_fecha_inicio\":";
						result += "\"" + programacion_fecha_inicio + "\",";

						
						result += "\"programacion_fecha_fin\":";
						result += "\"" + programacion_fecha_fin + "\",";
						
						
						result += "\"programacion_hora_inicio\":";
						result += "\"" + programacion_hora_inicio + "\",";

						
						result += "\"programacion_hora_fin\":";
						result += "\"" + programacion_hora_fin + "\",";
						
						result += "\"playlist_nombre\":";
						result += "\"" + playlist_nombre + "\",";
						
						result += "\"programacion_estado\":";
						result += "\"" + programacion_estado + "\"";
						
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

///----------------------------------------------------------------------------------------
			
//-----------------------------MODIFICAR USUARIO.JSP---------------------------------------------------------------------
			
			@GET
			@Path("/consultarUser")
			public String getPlain11() {

				String login_user = "sa";
				String login_password = "123";
				String url = "jdbc:sqlserver://chd-pc:1433;databaseName=SAC";
				// PrintWriter out = response.getWriter();
				try {
					Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
					Connection conn = DriverManager.getConnection(url, login_user,
							login_password);
					System.out.println("connected");
					
					String login_id;
					String login_cedula;
					String login_nombres;
					String login_apellidos;
					String login_user1;
					String login_password1;
					String login_sexo;
					String login_estado;
					
					Statement stmt = conn.createStatement();
					
					ResultSet rs = stmt.executeQuery("select login_id,login_cedula,login_nombres,login_apellidos,login_user,login_password,login_sexo,login_estado from login");
					
					String result = "";
					
					
					result+= "[";
					while (rs.next()) {
					
						login_id= rs.getString(1);
						login_cedula= rs.getString(2);
						login_nombres= rs.getString(3);
						login_apellidos= rs.getString(4);
						login_user1= rs.getString(5);
						login_password1= rs.getString(6);
						login_sexo= rs.getString(7);
						login_estado= rs.getString(8);
						
						
						
						result += "{";
						
												
						result += "\"login_id\":";
						result += "\"" + login_id + "\",";

						result += "\"login_cedula\":";
						result += "\"" + login_cedula + "\",";

						result += "\"login_nombres\":";
						result += "\"" + login_nombres + "\",";

						
						result += "\"login_apellidos\":";
						result += "\"" + login_apellidos + "\",";
						
						
						result += "\"login_user1\":";
						result += "\"" + login_user1 + "\",";

						
						result += "\"login_password1\":";
						result += "\"" + login_password1 + "\",";
						
						result += "\"login_sexo\":";
						result += "\"" + login_sexo + "\",";
						
						result += "\"login_estado\":";
						result += "\"" + login_estado + "\"";
						
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

///----------------------------------------------------------------------------------------
			
//------------------USADO EN LINKS.JSP-------------------------------------------------------------			
//--------------------------------------------------------------------------------------------------
			
			@GET
			@Path("/listaLinkDisponibles")
			public String getPlain6() {

				String login_user = "sa";
				String login_password = "123";
				String url = "jdbc:sqlserver://chd-pc:1433;databaseName=SAC";
				// PrintWriter out = response.getWriter();
				try {
					Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
					Connection conn = DriverManager.getConnection(url, login_user,
							login_password);
					System.out.println("connected");
					
					String link_nombre;
					String link_url;
					String link_id;
					
					Statement stmt = conn.createStatement();
					
					ResultSet rs = stmt.executeQuery("SELECT link_nombre,link_url,link_id FROM LINKS");
					
					String result = "";
					
					
					result+= "[";
					while (rs.next()) {
					
						link_nombre = rs.getString(1);
						link_url = rs.getString(2);
						link_id = rs.getString(3);
						result += "{";
						
						
						result += "\"link_nombre\":";

						result += "\"" + link_nombre + "\",";

						
						result += "\"link_url\":";
						result += "\"" + link_url + "\",";
						
						result += "\"link_id\":";
						result += "\"" + link_id + "\"";
						
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

///----------------------------------------------------------------------------------------

			//------------------USADO EN LINKS.JSP-------------------------------------------------------------			
			//--------------------------------------------------------------------------------------------------
						
						@GET
						@Path("/listaLinkPublicados")
						public String getPlain8() {

							String login_user = "sa";
							String login_password = "123";
							String url = "jdbc:sqlserver://chd-pc:1433;databaseName=SAC";
							// PrintWriter out = response.getWriter();
							try {
								Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
								Connection conn = DriverManager.getConnection(url, login_user,
										login_password);
								System.out.println("connected");
								
								String link_nombre;
								String link_url;
								String playlist_nombre;
								
								Statement stmt = conn.createStatement();
								
								ResultSet rs = stmt.executeQuery("select li.link_nombre,li.link_url,pl.playlist_nombre from links li,playlist pl where li.playlist_id_fk = pl.playlist_id");
								
								String result = "";
								
								
								result+= "[";
								while (rs.next()) {
								
									link_nombre = rs.getString(1);
									link_url = rs.getString(2);
									playlist_nombre = rs.getString(3);
									result += "{";
									
									
									result += "\"link_nombre\":";
									
									result += "\"" + link_nombre + "\",";

									
									result += "\"link_url\":";
									
									result += "\"" + link_url + "\",";
									
									result += "\"playlist_nombre\":";
									
									result += "\"" + playlist_nombre + "\"";
									
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

			
			
			
//------------------USADO EN LINKS.JSP-------------------------------------------------------------			
//--------------------------------------------------------------------------------------------------
						
						@GET
						@Path("/listaPlayListConProgramacion")
						public String getPlain7() {

							String login_user = "sa";
							String login_password = "123";
							String url = "jdbc:sqlserver://chd-pc:1433;databaseName=SAC";
							// PrintWriter out = response.getWriter();
							try {
								Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
								Connection conn = DriverManager.getConnection(url, login_user,
										login_password);
								System.out.println("connected");
								
								String playlist_id;
								String playlist_nombre;
								
								Statement stmt = conn.createStatement();
								
								ResultSet rs = stmt.executeQuery("select pl.playlist_id,pl.playlist_nombre from playlist pl,programacion pr where pr.playlist_id_fk = pl.playlist_id and pr.programacion_estado ='1' AND pl.playlist_estado='1'");
								
								String result = "";
								
								
								result+= "[";
								while (rs.next()) {
								
									playlist_id = rs.getString(1);
									playlist_nombre = rs.getString(2);
									
									result += "{";
									
									
									result += "\"playlist_id\":";

									result += "\"" + playlist_id + "\",";

									
									result += "\"playlist_nombre\":";
									result += "\"" + playlist_nombre + "\"";
									
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

						
//------------------USADO EN MODIFICAR PLAYLIST.JSP-------------------------------------------------------------			
//--------------------------------------------------------------------------------------------------
												
												@GET
												@Path("/listaPlayListModificar")
												public String getPlain10() {

													String login_user = "sa";
													String login_password = "123";
													String url = "jdbc:sqlserver://chd-pc:1433;databaseName=SAC";
													// PrintWriter out = response.getWriter();
													try {
														Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
														Connection conn = DriverManager.getConnection(url, login_user,
																login_password);
														System.out.println("connected");
														
														String playlist_id;
														String playlist_nombre;
														String playlist_descripcion;
														String playlist_ids_media;
														String playlist_estado;
														
														Statement stmt = conn.createStatement();
														
														ResultSet rs = stmt.executeQuery("select pl.playlist_id,pl.playlist_nombre,pl.playlist_descripcion,pl.playlist_ids_media,pl.playlist_estado from playlist pl");
														
														String result = "";
														
														
														result+= "[";
														while (rs.next()) {
														
															playlist_id = rs.getString(1);
															playlist_nombre = rs.getString(2);
															playlist_descripcion = rs.getString(3);
														    playlist_ids_media = rs.getString(4);
														    playlist_estado = rs.getString(5);
															
															result += "{";
															
															
															result += "\"playlist_id\":";
															result += "\"" + playlist_id + "\",";

															
															result += "\"playlist_nombre\":";
															result += "\"" + playlist_nombre + "\",";

															result += "\"playlist_descripcion\":";
															result += "\"" + playlist_descripcion + "\",";

															
															result += "\"playlist_ids_media\":";
															result += "\"" + playlist_ids_media + "\",";

															result += "\"playlist_estado\":";
															result += "\"" + playlist_estado + "\"";

															
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
						
						
//------------------USADA EN CONFIGURACION_CLIENTE.JSP-------------------------------------------------------------			
//--------------------------------------------------------------------------------------------------
						
						
						@GET
						@Path("/parametros_cliente")
						public String getPlain21() {


							String login_user = "sa";
							String login_password = "123";
							String url = "jdbc:sqlserver://chd-pc:1433;databaseName=SAC";
							// PrintWriter out = response.getWriter();
							try {
								Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
								Connection conn = DriverManager.getConnection(url, login_user,
										login_password);
								System.out.println("connected");
								
								String cliente_nombre;
								String cliente_direccion;
								String cliente_telefono;
								String cliente_web;
								
								Statement stmt = conn.createStatement();
								ResultSet rs = stmt.executeQuery("select cliente_nombre,cliente_direccion,cliente_telefono,cliente_web from cliente");
							
								String result = "";
								
								
								result+= "[";
								while (rs.next()) {
									cliente_nombre = rs.getString(1);
									cliente_direccion = rs.getString(2);
									cliente_telefono = rs.getString(3); 
									cliente_web = rs.getString(4);
									
									
									result += "{";
									
									
									result += "\"cliente_nombre\":";
									result += "\"" + cliente_nombre + "\",";
									
									result += "\"cliente_direccion\":";
									result += "\"" + cliente_direccion + "\",";
									
									result += "\"cliente_telefono\":";
									result += "\"" + cliente_telefono + "\",";

									result += "\"cliente_web\":";
									result += "\"" + cliente_web + "\" ";
									
									
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

						

//------------------USADA EN REESTABLECER_CONTRASENA.JSP-------------------------------------------------------------			
//--------------------------------------------------------------------------------------------------
												
												
												@GET
												@Path("/loginUser")
												public String getPlain9() {


													String login_user = "sa";
													String login_password = "123";
													String url = "jdbc:sqlserver://chd-pc:1433;databaseName=SAC";
													// PrintWriter out = response.getWriter();
													try {
														Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
														Connection conn = DriverManager.getConnection(url, login_user,
																login_password);
														System.out.println("connected");
														
														String login_cedula;
														String login_users;
														String login_passwords;
											
														
														Statement stmt = conn.createStatement();
														ResultSet rs = stmt.executeQuery("select login_cedula,login_user,login_password from login");
													
														String result = "";
														
														
														result+= "[";
														while (rs.next()) {
															login_cedula = rs.getString(1);
															login_users = rs.getString(2);
															login_passwords = rs.getString(3); 
															
															
															
															result += "{";
															
															
															result += "\"login_cedula\":";
															result += "\"" + login_cedula + "\",";
															
															result += "\"login_users\":";
															result += "\"" + login_users + "\",";
															
															result += "\"login_passwords\":";
															result += "\"" + login_passwords + "\"";

															
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

												//------------------USADA EN REESTABLECER_CONTRASENA.JSP-------------------------------------------------------------			
												//--------------------------------------------------------------------------------------------------
																								
																								
																								@GET
																								@Path("/ReproduccionInformacion")
																								public String getPlain14() {


																									String login_user = "sa";
																									String login_password = "123";
																									String url = "jdbc:sqlserver://chd-pc:1433;databaseName=SAC";
																									// PrintWriter out = response.getWriter();
																									try {
																										Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
																										Connection conn = DriverManager.getConnection(url, login_user,
																												login_password);
																										System.out.println("connected");
																										
																										String link_nombre;
																										String playlist_ids_media;
																										String programacion_fecha_inicio;
																										String programacion_fecha_fin;
																										String programacion_hora_inicio;
																										String programacion_hora_fin;
																										
																										Statement stmt = conn.createStatement();
																										ResultSet rs = stmt.executeQuery("select li.link_nombre,pl.playlist_ids_media,convert(char(30),pr.programacion_fecha_inicio,112 ) as programacion_fecha_inicio,convert(char(30),pr.programacion_fecha_fin,112 ) as programacion_fecha_fin,replace(Convert (varchar(5),pr.programacion_hora_inicio, 108),':',''),replace(Convert (varchar(5),pr.programacion_hora_fin, 108),':','') from links li ,playlist pl,programacion pr where li.playlist_id_fk=pl.playlist_id");
																									
																										String result = "";
																										
																										
																										result+= "[";
																										while (rs.next()) {
																											link_nombre = rs.getString(1);
																											playlist_ids_media = rs.getString(2);
																											programacion_fecha_inicio = rs.getString(3); 
																											programacion_fecha_fin = rs.getString(4);
																											programacion_hora_inicio = rs.getString(5);
																											programacion_hora_fin = rs.getString(6); 
																											
																											
																											
																											result += "{";
																											
																											
																											result += "\"link_nombre\":";
																											result += "\"" + link_nombre + "\",";
																											
																											result += "\"playlist_ids_media\":";
																											result += "\"" + playlist_ids_media + "\",";
																											
																											result += "\"programacion_fecha_inicio\":";
																											result += "\"" + programacion_fecha_inicio + "\",";

																											result += "\"programacion_fecha_fin\":";
																											result += "\"" + programacion_fecha_fin + "\",";
																											
																											result += "\"programacion_hora_inicio\":";
																											result += "\"" + programacion_hora_inicio + "\",";
																											
																											result += "\"programacion_hora_fin\":";
																											result += "\"" + programacion_hora_fin + "\"";
																											
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

																		

}
