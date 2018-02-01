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



public class SacraInscomu extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 * @see HttpServlet#HttpServlet()
	 */
	public SacraInscomu() {
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
		
		String nivl = request.getParameter("nivel");
		String ced = request.getParameter("cedula");
		String nomb = request.getParameter("nombre");
		String ape = request.getParameter("apellido");
		String fchnac = request.getParameter("fnac");
		String edad = request.getParameter("edad");
		String npadr = request.getParameter("padre");
		String cel = request.getParameter("num");
		String nmadr = request.getParameter("madre");
		String cel2 = request.getParameter("num");
		String represt= request.getParameter("represent");
		String cel3 = request.getParameter("celu");
		String direc = request.getParameter("direc");
		String telf = request.getParameter("convencional");
		String email = request.getParameter("email");
		String Pbautizo = request.getParameter("Pbautizo");
		String catq = request.getParameter("grupo");
		String canc = request.getParameter("cancelado");
		

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn = DriverManager.getConnection(url, login_user,
					login_password);
			System.out.println("connected");

				Statement stmt = conn.createStatement();	
					Statement st;
					st = conn.createStatement();
					st.executeUpdate("INSERT INTO sincr_comnion "
							+ "(nivel,num,fecha,nomb,ape,fnacimt,edad,nombp,telfp,nombm,telfm,represt,telfre,direc,covnec,parrbaut,febaut,nmbgrup,nombcatq,estado)"
							+ "VALUES ('" + nivl + "','" + ced + "','" + nomb + "','" + ape
							+ "','" + fchnac + "','" + edad + "','" + npadr + "','"
							+ cel + "','" + nmadr + "','" + cel2 + "','" + represt + "','" + cel3 + "','" + direc
							+ "','" + telf + "','" + email + "','" + Pbautizo + "','"
							+ catq + "','" + canc + "')");

					response.sendRedirect("index.jsp");

	
			
		} catch (Exception e) {
			response.sendRedirect("error.jsp");
			e.printStackTrace();
		}

		// TODO Auto-generated method stub
	}
}
