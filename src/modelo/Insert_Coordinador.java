package modelo;

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

/**
 * Servlet implementation class Insert_Coordinador
 */
@WebServlet("/Insert_Coordinador")
public class Insert_Coordinador extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Insert_Coordinador() {
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
		String botton1 = request.getParameter("coordinsert");

		String login_user = "sa";
		String login_password = "123";
		String url = "jdbc:sqlserver://localhost:1433;databaseName=sistNSR";
		PrintWriter out = response.getWriter();

		String fech = request.getParameter("fech");
		String reg= request.getParameter("registro");
		String ced = request.getParameter("cedula");
		String nomb = request.getParameter("nombre");
		String ape = request.getParameter("apellido");
		String edad = request.getParameter("edad");
		String sexo = request.getParameter("sex");
		String telef = request.getParameter("telef");
		String email = request.getParameter("email");
		String direc = request.getParameter("direc");
		String estado="A";
		String cargo="2";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn = DriverManager.getConnection(url, login_user,
					login_password);
			System.out.println("connected");
			System.out.println(botton1);
			if (botton1.equals("ingresar")) {
				

				Statement stmt = conn.createStatement();
				ResultSet rs = stmt
						.executeQuery("SELECT persona_cedula FROM personas WHERE persona_cedula='"
								+ ced + "'");
				if (rs.next()) {
					response.sendRedirect("usuario_existe.jsp");
				} else {
					Statement st;
					st = conn.createStatement();
					st.executeUpdate("INSERT INTO personas(cargo_id_fk,persona_fecha,persona_num_registro,persona_cedula,persona_nombre,persona_apellido," +
							"persona_edad,persona_sexo,persona_telefono,persona_email,persona_direcc_domic,persona_estado)" +
							"VALUES ('"+cargo+"','" + fech + "','" + reg + "','" + ced+ "','" + nomb + "','" + ape+ "','" + edad + "'," +
									"'" + sexo + "','" + telef + "','"+ email + "','" + direc + "','" + estado + "')");

					response.sendRedirect("exito.jsp");

				}

			}
			
		} catch (Exception e) {
			response.sendRedirect("error.jsp");
			e.printStackTrace();
		}

		// TODO Auto-generated method stub
	}
}

