package modelo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Insert_Horario
 */
@WebServlet("/Insert_Horario")
public class Insert_Horario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Insert_Horario() {
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
		
		String login_user = "sa";
		String login_password = "123";
		String url = "jdbc:sqlserver://localhost:1433;databaseName=sistNSR";
		PrintWriter out = response.getWriter();
		
		String fech = request.getParameter("fech");
		String dias = request.getParameter("dias");
		String hora_ini = request.getParameter("hora_ini");
		String hora_fin = request.getParameter("hora_fin");
		
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn = DriverManager.getConnection(url, login_user,
					login_password);
			System.out.println("connected");

				Statement stmt = conn.createStatement();	
					Statement st;
					st = conn.createStatement();
					st.executeUpdate("INSERT INTO registro_horario " +
							"(horario_fecha,horario_dia,horario_hora_inicio,horario_hora_fin)" +
							" VALUES ('" + fech + "','" + dias + "','" + hora_ini + "','" + hora_fin + "')");

					response.sendRedirect("exito.jsp");
	
			
		} catch (Exception e) {
			response.sendRedirect("error.jsp");
			e.printStackTrace();
		}

	}

}