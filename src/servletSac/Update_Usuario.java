package servletSac;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * Servlet implementation class Insert_Usuario
 */
@WebServlet("/Update_Usuario")
public class Update_Usuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update_Usuario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String botton1 = request.getParameter("formusuario");

		String login_user = "sa";
		String login_password = "123";
		String url = "jdbc:sqlserver://chd-pc:1433;databaseName=SAC";
		
		String ced = request.getParameter("cedula");
		String nomb = request.getParameter("nombre");
		String ape = request.getParameter("apellido");
		String user = request.getParameter("usuario");
		String pss = request.getParameter("contrasena");
		String sexo = request.getParameter("sex");
		String cargo = request.getParameter("cargo");
		String estado = request.getParameter("estado");
		String idUsuario =request.getParameter("idUsuario");
		//String estado="A";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn = DriverManager.getConnection(url, login_user,
					login_password);
			System.out.println("connected");
			System.out.println(botton1);
			
				
					Statement st;
					st = conn.createStatement();
					//st.executeUpdate("INSERT INTO login (login_cedula,login_nombres,login_apellidos,login_user,login_password,login_sexo,cargo_id_fk,login_estado) VALUES ('" + ced + "','" + nomb + "','" + ape + "','" + user + "','" + pss +"','" + sexo + "','" + cargo + "','"+estado+"')");
					st.executeUpdate("UPDATE LOGIN SET login_user ='" + user + "' ,login_password = '" + pss + "',login_nombres = '" + nomb + "' ,login_apellidos = '" + ape + "' ,login_cedula = '" + ced + "' ,login_sexo = '" + sexo + "' ,login_estado = '" + estado + "' WHERE login_id = '" + idUsuario+ "'");

					response.sendRedirect("exito_UpdateUsuario.jsp");

				
			
		} catch (Exception e) {
			response.sendRedirect("error.jsp");
			e.printStackTrace();
		}

		// TODO Auto-generated method stub
	}
}

