package servletSac;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/update_cliente")
public class update_cliente extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 * @see HttpServlet#HttpServlet()
	 */
	public update_cliente() {
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
	
		String login_user = "sa";
		String login_password = "123";
		String url = "jdbc:sqlserver://chd-pc:1433;databaseName=SAC";
		PrintWriter out = response.getWriter();
    
		
		String cliente_nombre= request.getParameter("cliente_nombre");
		String cliente_direccion = request.getParameter("cliente_direccion");
		String cliente_telefono = request.getParameter("cliente_telefono");
		String cliente_web = request.getParameter("cliente_web");
		
		
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn = DriverManager.getConnection(url, login_user,login_password);
			
			//CODIGO DE ACTUALIZACION DE PARAMETROS INICIAL DEL SISTEMA.
					Statement st;
					st = conn.createStatement();
					st.executeUpdate("UPDATE  [dbo].[cliente]  SET cliente_nombre ='" + cliente_nombre + "',cliente_direccion ='" + cliente_direccion + "',cliente_telefono ='" + cliente_telefono + "',cliente_web ='" + cliente_web + "' WHERE cliente_id = 1");
					

				    response.sendRedirect("exito_UpdateParametros.jsp");

			
			
		} catch (Exception e) {
			response.sendRedirect("error.jsp");
			e.printStackTrace();
		}

		// TODO Auto-generated method stub
	}
} 