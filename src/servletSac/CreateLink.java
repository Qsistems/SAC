package servletSac;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.io.IOException;
import java.util.Date;
import java.util.Hashtable;
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import javazoom.upload.MultipartFormDataRequest;
import javazoom.upload.UploadBean;
import javazoom.upload.UploadException;
import javazoom.upload.UploadFile;
 

/**
 * Servlet implementation class ProcesoArchivo
 */
@WebServlet("/CreateLink")

public class CreateLink extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateLink() {
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
		String url = "jdbc:sqlserver://chd-pc:1433;databaseName=SAC";

		String PlayListconProgramacion = request.getParameter("PlayListconProgramacion");
		String linkoption = request.getParameter("linkoption");
		
		
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn = DriverManager.getConnection(url, login_user,
					login_password);
			System.out.println("connected");
			
			Date fecha = new Date();		
			DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
			String FechaActual = dateFormat.format(fecha);
			
					Statement st;
					st = conn.createStatement();
					st.executeUpdate("UPDATE links SET playlist_id_fk= " + PlayListconProgramacion + " WHERE link_id=" + linkoption);
					//"UPDATE links SET playlist_id_fk= '" + nombrePlaylist + "' WHERE link_id='" + nombrePlaylist + "'"
					response.sendRedirect("exito_links.jsp");
			
		} catch (Exception e) {
			response.sendRedirect("error.jsp");
			e.printStackTrace();
		}

		// TODO Auto-generated method stub
	}
	
}
