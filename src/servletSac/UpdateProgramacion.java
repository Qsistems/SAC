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
@WebServlet("/UpdateProgramacion")

public class UpdateProgramacion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProgramacion() {
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

		String nombreProgramacion = request.getParameter("nombreProgramacion");
		String descripcionProgramacion = request.getParameter("descripcionProgramacion");
		String fechaInicio = request.getParameter("fechaInicio");
		String fechaFin = request.getParameter("fechaFin");
		String horaInicio = request.getParameter("horaInicio");
		String horaFin = request.getParameter("horaFin");
		String idProgramacion = request.getParameter("idProgramacion");
		String Activo_Pasivo = request.getParameter("Activo_Pasivo");
		
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn = DriverManager.getConnection(url, login_user,login_password);
			
//			Date fecha = new Date();		
//			DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
//			String FechaActual = dateFormat.format(fecha);
//			
					Statement st;
					st = conn.createStatement();
				//	st.executeUpdate("UPDATE playlist   SET playlist_nombre ='" + nombrePlaylist + "',playlist_descripcion = '" + descripcionPlaylist + "',playlist_estado = '" + Activo_Pasivo + "',playlist_ids_media ='" + PlayListSeleccionado + "' WHERE playlist_id = '" + IdPlayList+ "'");
					st.executeUpdate("UPDATE programacion  SET programacion_nombre ='" + nombreProgramacion + "',programacion_descripcion ='" + descripcionProgramacion+"',programacion_estado ='" + Activo_Pasivo + "',programacion_hora_inicio = '" + horaInicio + "',programacion_hora_fin ='" + horaFin + "',programacion_fecha_inicio ='" + fechaInicio + "',programacion_fecha_fin ='" + fechaFin + "'  WHERE programacion_id = '" + idProgramacion + "'"); 
					response.sendRedirect("exito_UpdateProgramacion.jsp");
			
		} catch (Exception e) {
			response.sendRedirect("error.jsp");
			e.printStackTrace();
		}

		// TODO Auto-generated method stub
	}
	
}
