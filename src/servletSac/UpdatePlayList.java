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
@WebServlet("/UpdatePlayList")

public class UpdatePlayList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePlayList() {
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

		String nombrePlaylist = request.getParameter("nombrePlaylist");
		String descripcionPlaylist = request.getParameter("descripcionPlaylist");
		String PlayListSeleccionado = request.getParameter("PlayListSeleccionado");
		String Activo_Pasivo = request.getParameter("Activo_Pasivo");
		String IdPlayList = request.getParameter("IdPlayList");
		
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn = DriverManager.getConnection(url, login_user,login_password);
			
//			Date fecha = new Date();		
//			DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
//			String FechaActual = dateFormat.format(fecha);
//			
					Statement st;
					st = conn.createStatement();
				//	st.executeUpdate("INSERT INTO playlist (playlist_nombre,playlist_descripcion,playlist_ids_media,playlist_fecha_creacion) VALUES ('" + nombrePlaylist + "','" + descripcionPlaylist +"','" + PlayListSeleccionado +"','" + FechaActual +"')");
					st.executeUpdate("UPDATE playlist   SET playlist_nombre ='" + nombrePlaylist + "',playlist_descripcion = '" + descripcionPlaylist + "',playlist_estado = '" + Activo_Pasivo + "',playlist_ids_media ='" + PlayListSeleccionado + "' WHERE playlist_id = '" + IdPlayList+ "'");
					
					response.sendRedirect("exito_UpdateplayList.jsp");
			
		} catch (Exception e) {
			response.sendRedirect("error.jsp");
			e.printStackTrace();
		}

		// TODO Auto-generated method stub
	}
	
}
