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



public class SacraInscBaut extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 * @see HttpServlet#HttpServlet()
	 */
	public SacraInscBaut() {
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

		//String botton1 = request.getParameter("inscringresar");

		String login_user = "sa";
		String login_password = "123";
		String url = "jdbc:sqlserver://localhost:1433;databaseName=sistNSR";
		PrintWriter out = response.getWriter();

		String ced = request.getParameter("cedula");
		String nomb = request.getParameter("nombre");
		String ape = request.getParameter("apellido");
		String edad = request.getParameter("edad");
		String telf = request.getParameter("telefono");
		String email = request.getParameter("email");
		String direc = request.getParameter("direc");
		String sexo = request.getParameter("sex");
		String grupo = request.getParameter("group");
		String horario = request.getParameter("horario");
		String coord = "coord";//request.getParameter("coordinador");

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn = DriverManager.getConnection(url, login_user,
					login_password);
			System.out.println("connected");

				Statement stmt = conn.createStatement();	
					Statement st;
					st = conn.createStatement();
					st.executeUpdate("INSERT INTO pincr_ninos "
							+ "(incni_ced,incni_nombre,incni_apellido,incni_edad,incni_telf,incni_email,incni_direc,incni_sex,incni_group,incni_horario,inicni_coord)"
							+ "VALUES ('" + ced + "','" + nomb + "','" + ape
							+ "','" + edad + "','" + telf + "','" + email + "','"
							+ direc + "','" + sexo + "','" + grupo + "','" + horario + "','" + coord + "')");

					response.sendRedirect("index.jsp");

	
			
		} catch (Exception e) {
			response.sendRedirect("error.jsp");
			e.printStackTrace();
		}

		// TODO Auto-generated method stub
	}
}
