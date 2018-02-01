package modelo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InsertUser
 */

public class ConsultUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 * @see HttpServlet#HttpServlet()
	 */
	public ConsultUser() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String botton1 = request.getParameter("formusuario");

		String login_user = "sa";
		String login_password = "123";
		String url = "jdbc:sqlserver://localhost:1433;databaseName=sistNSR";
		PrintWriter out = response.getWriter();

		String ced = request.getParameter("cedula");
		String nomb = request.getParameter("nombre");
		String ape = request.getParameter("apellido");
		String user = request.getParameter("usuario");
		String pss = request.getParameter("contraseña");
		String edad = request.getParameter("edad");
		String sexo = request.getParameter("sex");
		String estcivil = request.getParameter("estcivil");
		String cargo = request.getParameter("cargo");

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn = DriverManager.getConnection(url, login_user,
					login_password);
			System.out.println("connected");
			System.out.println(botton1);
			if (botton1.equals("ingresar")) {

				Statement stmt = conn.createStatement();
				ResultSet rs = stmt
						.executeQuery("SELECT login_ced FROM login_users WHERE login_ced='"
								+ ced + "'");
				if (rs.next()) {
					out.println("USUARIO YA EXISTE");
				} else {
					Statement st;
					st = conn.createStatement();
					st.executeUpdate("INSERT INTO login_users "
							+ "(login_ced,login_nombre,login_apellido,login_user,login_password,login_edad,login_sexo,login_ecivil,login_cargo)"
							+ "VALUES ('" + ced + "','" + nomb + "','" + ape
							+ "','" + user + "','" + pss + "','" + edad + "','"
							+ sexo + "','" + estcivil + "','" + cargo + "')");

					out.println("USUARIO REGISTRADO");

				}

			}
			
		} catch (Exception e) {
			response.sendRedirect("error.jsp");
			e.printStackTrace();
		}

		// TODO Auto-generated method stub
	}
}
