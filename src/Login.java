import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class Login extends HttpServlet {
	// cada que usas un form el form ejececuta un GET o POST (doPost)
	// aca es donde recoge los parametros...osea que en el otro archivo tambien
	// debe haber un doPost o doGet
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String login_user = "sa";
		String login_password = "123";
		String url = "jdbc:sqlserver://localhost:1433;databaseName=SAC";
		PrintWriter out = response.getWriter();

		//CAPTURA DE LOS DATOS
		
		String user = request.getParameter("user");
		String password = request.getParameter("password");
		
		HttpSession session = request.getSession();
		try {
			session.setAttribute("user",user);
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn = DriverManager.getConnection(url, login_user,
					login_password);
			System.out.println("connected");
			Statement statement = conn.createStatement();
			String queryString = "select * from login where login_user='"
					+ user + "' and login_password='" + password + "' and login_estado='A'";
			ResultSet rs = statement.executeQuery(queryString);
			if (rs.next()) {
				
				
				//session.setAttribute("user", userId);
				System.out.println(rs.getString(2));
				out.println("BIENVENIDO AL SISTEMA SAC : " + rs.getString(3));
				response.sendRedirect("menu.jsp");
				
				//response.sendRedirect("index.html?var1=a&var2=b");

			} else {
				//System.out.println("NO HAY NADA");
				out.println("USUARIO/CONTRASEÑA INCORRECTA O USUARIO DESACTIVADO");
			}

			conn.close();
			statement.close();

		} catch (Exception e) {
			out.println("ERROR DE CONECCION, INTENTE NUEVAMENTE O COMUNIQUESE CON SU ADMINISTRADOR DE SISTEMA");
			e.printStackTrace();

		}

	}
}