package modelo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InsertGrupo
 */
@WebServlet("/InsertGrupo")
public class Insert_Grupo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Insert_Grupo() {
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

		String grupo = request.getParameter("grupo");
		String integr = request.getParameter("integrantes");
		String fecha = request.getParameter("fecha");
		String persona_id_fk = request.getParameter("coord");
		String hora_ini = request.getParameter("hora_ini");
		//String Date = "2015-02-02";
		System.out.println(persona_id_fk);

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn = DriverManager.getConnection(url, login_user,
					login_password);
			System.out.println("connected");
					Statement st;
					st = conn.createStatement();
					st.executeUpdate("INSERT INTO registro_grupo "
							+ "(horario_id_fk,persona_id_fk,grupo_fecha_creacion,grupo_nombre_grupo,grupo_num_integrantes)VALUES ('" + hora_ini + "','" + persona_id_fk + "','" + fecha +"','" + grupo +"','" + integr +"')");

					response.sendRedirect("exito.jsp");
			
		} catch (Exception e) {
			response.sendRedirect("error.jsp");
			e.printStackTrace();
		}

		// TODO Auto-generated method stub
	}
}
